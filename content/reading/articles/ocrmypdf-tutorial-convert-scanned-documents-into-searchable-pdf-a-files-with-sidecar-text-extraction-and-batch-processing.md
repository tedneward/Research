title=Article: OCRmyPDF Tutorial: Convert Scanned Documents into Searchable PDF/A Files with Sidecar Text Extraction and Batch Processing
tags=reading, article, ocr, pdf, llm
summary=We build an advanced, self-contained OCRmyPDF workflow
~~~~~~

[Article](https://www.marktechpost.com/2026/06/28/ocrmypdf-tutorial-convert-scanned-documents-into-searchable-pdf-a-files-with-sidecar-text-extraction-and-batch-processing/)

```
import io
import os
import re
import sys
import time
import shutil
import logging
import textwrap
import subprocess
from pathlib import Path

INSTALL_JBIG2 = True

def sh(cmd: str, check: bool = True) -> int:
   """Run a shell command, echo it, and show the tail of its output."""
   print(f"  $ {cmd}")
   r = subprocess.run(cmd, shell=True, text=True,
                      stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
   if r.stdout and r.stdout.strip():
       for ln in r.stdout.strip().splitlines()[-12:]:
           print("    " + ln)
   if check and r.returncode != 0:
       raise RuntimeError(f"Command failed ({r.returncode}): {cmd}")
   return r.returncode

def install_dependencies() -> None:
   """Install OCRmyPDF's system + Python dependencies for Colab/Ubuntu."""
   apt_pkgs = (
       "tesseract-ocr tesseract-ocr-eng tesseract-ocr-osd "
       "tesseract-ocr-deu tesseract-ocr-fra "
       "ghostscript unpaper pngquant poppler-utils qpdf"
   )
   sh("apt-get update -qq", check=False)
   sh(f"DEBIAN_FRONTEND=noninteractive apt-get install -y -qq {apt_pkgs}")
   sh(f'"{sys.executable}" -m pip install -q --upgrade ocrmypdf img2pdf "pillow<12"')
   if INSTALL_JBIG2 and shutil.which("jbig2") is None:
       try:
           build_pkgs = ("autoconf automake libtool pkg-config "
                         "libleptonica-dev zlib1g-dev build-essential git")
           sh(f"DEBIAN_FRONTEND=noninteractive apt-get install -y -qq {build_pkgs}")
           sh("rm -rf /tmp/jbig2enc && "
              "git clone -q https://github.com/agl/jbig2enc.git /tmp/jbig2enc")
           sh("cd /tmp/jbig2enc && ./autogen.sh >/dev/null 2>&1 && "
              "./configure >/dev/null 2>&1 && make -j2 >/dev/null 2>&1 && "
              "make install >/dev/null 2>&1 && ldconfig")
           print("  jbig2enc:",
                 "installed" if shutil.which("jbig2") else "built, but binary not on PATH")
       except Exception as e:
           print("  jbig2enc build skipped (optional):", e)

def ensure_installed() -> None:
   have_tools = bool(shutil.which("tesseract") and shutil.which("gs"))
   try:
       import ocrmypdf
       import img2pdf
       from PIL import Image
       have_py = True
   except Exception:
       have_py = False
   if have_tools and have_py:
       print("Dependencies already present — skipping installation.")
   else:
       print("Installing dependencies (first run can take a few minutes)...")
       install_dependencies()

ensure_installed()

def _purge(*prefixes):
   for name in [m for m in list(sys.modules)
                if any(m == p or m.startswith(p + ".") for p in prefixes)]:
       del sys.modules[name]

def _load_ocrmypdf():
   _purge("PIL", "ocrmypdf")
   import ocrmypdf
   return ocrmypdf

try:
   ocrmypdf = _load_ocrmypdf()
except ImportError as e:
   if "_Ink" in str(e) or "PIL" in str(e):
       print("Repairing an incompatible Pillow (reinstalling pillow<12)...")
       sh(f'"{sys.executable}" -m pip install -q --force-reinstall "pillow<12"')
       try:
           ocrmypdf = _load_ocrmypdf()
           print("Pillow repaired — continuing without a restart.")
       except Exception:
           raise RuntimeError(
               "Pillow is still incompatible in this session. Use the Colab menu: "
               "Runtime > Restart session, then run this cell again."
           )
   else:
       raise

from ocrmypdf.exceptions import (
   ExitCode,
   PriorOcrFoundError,
   EncryptedPdfError,
   MissingDependencyError,
   TaggedPDFError,
   DigitalSignatureError,
   DpiError,
   InputFileError,
   UnsupportedImageFormatError,
)

from ocrmypdf.helpers import check_pdf
from ocrmypdf.pdfa import file_claims_pdfa
import img2pdf
from PIL import Image, ImageDraw, ImageFont, ImageFilter

logging.basicConfig(level=logging.WARNING, format="%(levelname)s: %(message)s")
logging.getLogger("ocrmypdf").setLevel(logging.WARNING)
logging.getLogger("pdfminer").setLevel(logging.ERROR)
logging.getLogger("PIL").setLevel(logging.WARNING)

SAMPLE_TEXT_PAGES = [
   "Optical Character Recognition, commonly abbreviated as OCR, is the "
   "process of converting images of typed or printed text into machine "
   "encoded text. This page was generated as a synthetic scan so that the "
   "OCRmyPDF pipeline has something realistic to recognize and search.",
   "On 14 March 2026 the archive contained 1,482 pages across 37 folders. "
   "Roughly 92 percent of those pages were scanned at 200 to 300 dots per "
   "inch. The remaining 8 percent were skewed and required deskewing before "
   "any reliable recognition was possible.",
   "After OCRmyPDF finishes, the output is a searchable PDF/A file. You can "
   "select text, copy it, and run full text search across thousands of "
   "documents. The original image resolution is preserved while a hidden "
   "text layer is placed accurately underneath the page image.",
]

def _find_font():
   for cand in (
       "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
       "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",
   ):
       if os.path.exists(cand):
           return cand
   return None

_FONT_PATH = _find_font()
FONT = ImageFont.truetype(_FONT_PATH, 40) if _FONT_PATH else ImageFont.load_default()

def _add_speckle(img, n=6000, dark=60):
   """Sprinkle light dark specks to imitate scanner noise (motivates --clean)."""
   import random
   px = img.load()
   w, h = img.size
   for _ in range(n):
       px[random.randint(0, w - 1), random.randint(0, h - 1)] = random.randint(0, dark)
   return img

def render_page(text, skew=False):
   """Render one A4 page (1654x2339 px ≈ 200 DPI) of dark text on white."""
   W, H = 1654, 2339
   img = Image.new("L", (W, H), 255)
   draw = ImageDraw.Draw(img)
   draw.multiline_text((150, 180), textwrap.fill(text, width=58),
                       fill=25, font=FONT, spacing=18)
   if skew:
       img = img.rotate(6, resample=Image.BICUBIC, expand=False, fillcolor=255)
       img = img.filter(ImageFilter.GaussianBlur(0.6))
       img = _add_speckle(img)
   return img

def build_scanned_pdf(pdf_path: Path, pages_text, skew_index=1):
   """Render pages to PNGs and wrap them losslessly into an image-only PDF."""
   pngs = []
   for i, text in enumerate(pages_text):
       img = render_page(text, skew=(i == skew_index))
       p = pdf_path.parent / f"_pg_{pdf_path.stem}_{i}.png"
       img.save(p, format="PNG", dpi=(200, 200))
       pngs.append(str(p))
   with open(pdf_path, "wb") as f:
       f.write(img2pdf.convert(pngs))
   for p in pngs:
       os.remove(p)
   return pdf_path

def do_ocr(input_file, output_file, **kw):
   """Wrapper around ocrmypdf.ocr() that disables the progress bar and times it."""
   kw.setdefault("progress_bar", False)
   t0 = time.perf_counter()
   rc = ocrmypdf.ocr(input_file, output_file, **kw)
   return rc, time.perf_counter() - t0

def tokens(s: str):
   return re.findall(r"[a-z0-9]+", s.lower())

def kb(path) -> str:
   return f"{Path(path).stat().st_size / 1024:,.1f} KB"

def banner(title: str):
   line = "─" * 74
   print(f"\n{line}\n  {title}\n{line}")

banner("0 ·  Environment")
print("Python  :", sys.version.split()[0])
print("ocrmypdf:", ocrmypdf.__version__)
sh("tesseract --version", check=False)
sh("gs --version", check=False)
sh("tesseract --list-langs", check=False)
print("unpaper :", shutil.which("unpaper"))
print("pngquant:", shutil.which("pngquant"))
print("jbig2   :", shutil.which("jbig2"), "(optional encoder)")

WORK = Path("/content/ocrmypdf_demo")
try:
   WORK.mkdir(parents=True, exist_ok=True)
except Exception:
   WORK = Path.cwd() / "ocrmypdf_demo"
   WORK.mkdir(parents=True, exist_ok=True)

print("Workdir :", WORK)

banner("1 ·  Build a synthetic image-only 'scanned' PDF")
input_pdf = WORK / "scanned_input.pdf"
build_scanned_pdf(input_pdf, SAMPLE_TEXT_PAGES, skew_index=1)
print(f"Created {input_pdf.name}  ({kb(input_pdf)}, 3 pages; page 2 is skewed + speckled)")
print("This PDF has NO text layer yet — selecting/searching it returns nothing.")

banner("2 ·  Basic OCR  (deskew + auto-rotate)")
out_basic = WORK / "out_basic.pdf"
rc, dt = do_ocr(
   input_pdf, out_basic,
   language=["eng"],
   deskew=True,
   rotate_pages=True,
)
print(f"Exit code: {rc.name} ({int(rc)}) in {dt:.1f}s  ->  {out_basic.name} ({kb(out_basic)})")

banner("3 ·  Advanced OCR  (PDF/A-2, --optimize 3, sidecar, metadata)")
out_adv = WORK / "out_advanced.pdf"
sidecar = WORK / "ocr_text.txt"
rc, dt = do_ocr(
   input_pdf, out_adv,
   language=["eng"],
   deskew=True,
   rotate_pages=True,
   optimize=3,
   jpg_quality=80,
   png_quality=80,
   output_type="pdfa-2",
   sidecar=sidecar,
   title="OCRmyPDF Colab Tutorial",
   author="Tutorial",
   subject="Demonstration of OCRmyPDF",
   keywords="ocr, pdf, tesseract, ocrmypdf",
)
print(f"Exit code: {rc.name} ({int(rc)}) in {dt:.1f}s  ->  {out_adv.name} ({kb(out_adv)})")
sh(f'pdfinfo "{out_adv}" | grep -E "Title|Author|Subject|Keywords|Pages"', check=False)

banner("4 ·  Prove searchability + measure OCR word-recall")
ocr_text = sidecar.read_text(errors="ignore")
print("Sidecar text (first 300 chars):\n" + ocr_text[:300].strip())
embedded = WORK / "embedded_text.txt"
sh(f'pdftotext "{out_adv}" "{embedded}"', check=False)
print(f"\npdftotext extracted {len(embedded.read_text(errors='ignore').split())} "
     f"words from the OUTPUT PDF (the input had 0).")
src = tokens(" ".join(SAMPLE_TEXT_PAGES))
found = set(tokens(ocr_text))
recall = sum(1 for w in src if w in found) / max(1, len(src))
print(f"OCR word-recall vs. source: {recall * 100:.1f}%  ({len(src)} source words)")

banner("5 ·  Validate output + size comparison")
print("check_pdf (valid PDF structure):", check_pdf(out_adv))
print("file_claims_pdfa (PDF/A marker):", file_claims_pdfa(out_adv))
print(f"input    : {kb(input_pdf)}")
print(f"basic    : {kb(out_basic)}")
print(f"advanced : {kb(out_adv)}   (PDF/A-2 + image optimisation)")

banner("6 ·  Modes & exceptions: skip-text / redo-ocr / force-ocr")
try:
   do_ocr(out_adv, WORK / "should_fail.pdf", language=["eng"])
   print("Unexpected: no exception was raised.")
except PriorOcrFoundError as e:
   print(f"Caught PriorOcrFoundError (exit code {e.exit_code}): the PDF already "
         f"has text. Choose a mode to override:")
rc, _ = do_ocr(out_adv, WORK / "out_skiptext.pdf", language=["eng"], skip_text=True)
print(f"  --skip-text -> {rc.name}")
rc, _ = do_ocr(out_adv, WORK / "out_redo.pdf", language=["eng"], redo_ocr=True)
print(f"  --redo-ocr  -> {rc.name}")
rc, _ = do_ocr(out_adv, WORK / "out_force.pdf", language=["eng"], force_ocr=True)
print(f"  --force-ocr -> {rc.name}")

banner("7 ·  Tesseract engine tuning  (--oem / --psm)")
rc, dt = do_ocr(
   input_pdf, WORK / "out_tuned.pdf",
   language=["eng"],
   tesseract_oem=1,
   tesseract_pagesegmode=3,
   output_type="pdf",
)
print(f"Tuned run -> {rc.name} in {dt:.1f}s")

banner("8 ·  Image cleaning with unpaper  (--clean / --clean-final)")
try:
   rc, dt = do_ocr(
       input_pdf, WORK / "out_cleaned.pdf",
       language=["eng"], deskew=True,
       clean=True, clean_final=True, output_type="pdf",
   )
   print(f"Cleaned run -> {rc.name} in {dt:.1f}s")
except Exception as e:
   print("Cleaning step skipped (unpaper issue):", type(e).__name__, e)

banner("9 ·  Auto-orientation (OSD) on a 90°-rotated page  (--rotate-pages)")
try:
   rot_png = WORK / "_rot.png"
   render_page(SAMPLE_TEXT_PAGES[0]).rotate(90, expand=True, fillcolor=255) \
       .save(rot_png, format="PNG", dpi=(200, 200))
   rot_pdf = WORK / "rotated_input.pdf"
   with open(rot_pdf, "wb") as f:
       f.write(img2pdf.convert([str(rot_png)]))
   os.remove(rot_png)
   rot_side = WORK / "rotated_text.txt"
   rc, dt = do_ocr(
       rot_pdf, WORK / "out_rotated_fixed.pdf",
       language=["eng"], rotate_pages=True, sidecar=rot_side, output_type="pdf",
   )
   n = len(rot_side.read_text(errors="ignore").split())
   print(f"OSD corrected the page; recovered {n} words -> {rc.name} in {dt:.1f}s")
except Exception as e:
   print("Auto-orientation demo skipped:", type(e).__name__, e)

banner("10 ·  OCR a single image (image_dpi hint)")
single_png = WORK / "single_scan.png"
render_page(SAMPLE_TEXT_PAGES[2]).save(single_png, format="PNG")
rc, dt = do_ocr(
   single_png, WORK / "out_from_image.pdf",
   language=["eng"],
   image_dpi=200,
   output_type="pdf",
)
print(f"Image -> searchable PDF: {rc.name} in {dt:.1f}s")

banner("11 ·  In-memory OCR with BytesIO streams")
in_io = io.BytesIO(input_pdf.read_bytes())
out_io = io.BytesIO()
ocrmypdf.ocr(in_io, out_io, language=["eng"], output_type="pdf", progress_bar=False)
out_bytes = out_io.getvalue()
(WORK / "out_in_memory.pdf").write_bytes(out_bytes)
print(f"OCR'd entirely in RAM -> {len(out_bytes):,} bytes written to out_in_memory.pdf")

banner("12 ·  Batch-process a folder of PDFs")
batch_in = WORK / "batch_in"
batch_out = WORK / "batch_out"
batch_in.mkdir(exist_ok=True)
batch_out.mkdir(exist_ok=True)
build_scanned_pdf(batch_in / "invoice_001.pdf",
                 [SAMPLE_TEXT_PAGES[0], SAMPLE_TEXT_PAGES[1]], skew_index=1)
build_scanned_pdf(batch_in / "memo_002.pdf",
                 [SAMPLE_TEXT_PAGES[2]], skew_index=-1)
print(f"{'file':<20}{'result':<14}{'time':<8}size")
for src_pdf in sorted(batch_in.glob("*.pdf")):
   dst = batch_out / src_pdf.name
   try:
       rc, dt = do_ocr(src_pdf, dst, language=["eng"],
                       deskew=True, output_type="pdfa")
       print(f"{src_pdf.name:<20}{rc.name:<14}{dt:<8.1f}{kb(dst)}")
   except Exception as e:
       print(f"{src_pdf.name:<20}{type(e).__name__:<14}{'-':<8}-")

banner("13 ·  New-style typed OcrOptions API (v17+)")
try:
   from ocrmypdf._options import OcrOptions
   opts = OcrOptions(
       input_file=str(input_pdf),
       output_file=str(WORK / "out_options.pdf"),
       languages=["eng"],
       deskew=True,
       rotate_pages=True,
       output_type="pdfa",
       progress_bar=False,
   )
   rc = ocrmypdf.ocr(opts)
   print(f"OcrOptions run -> {rc.name} ({int(rc)})")
except Exception as e:
   print("OcrOptions API not available in this version:", type(e).__name__, e)

banner("14 ·  Results")
produced = sorted(p for p in WORK.glob("*.pdf"))
for p in produced:
   print(f"  {p.name:<26}{kb(p)}")
for p in sorted(batch_out.glob("*.pdf")):
   print(f"  batch_out/{p.name:<16}{kb(p)}")
print(f"\nAll files are in: {WORK}")
try:
   from google.colab import files
   for p in [out_adv, out_basic, sidecar, embedded]:
       if Path(p).exists():
           files.download(str(p))
except Exception as e:
   print("(Colab download unavailable — open the files from the panel instead.)", e)
print("\nDone. ")
```

