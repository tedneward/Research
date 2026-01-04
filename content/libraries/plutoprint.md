title=PlutoPrint
tags=library, printing, python
summary=A Python Library for Generating PDFs and Images from HTML, powered by PlutoBook.
~~~~~~

[Source](https://github.com/plutoprint/plutoprint) | [Docs](https://plutoprint.readthedocs.io/) | [Samples](https://github.com/plutoprint/plutoprint-samples)

## Examples

Generate PDF with Python
```
import plutoprint

book = plutoprint.Book(plutoprint.PAGE_SIZE_A4)
book.load_url("hello.html")

# Export the entire document to PDF
book.write_to_pdf("hello.pdf")

# Export pages 2 to 15 (inclusive) in order
book.write_to_pdf("hello-range.pdf", 2, 15, 1)

# Export pages 15 to 2 (inclusive) in reverse order
book.write_to_pdf("hello-reverse.pdf", 15, 2, -1)

# Render pages manually with PDFCanvas (in reverse order)
with plutoprint.PDFCanvas("hello-canvas.pdf", book.get_page_size()) as canvas:
   canvas.scale(plutoprint.UNITS_PX, plutoprint.UNITS_PX)
   for page_index in range(book.get_page_count() - 1, -1, -1):
      canvas.set_size(book.get_page_size_at(page_index))
      book.render_page(canvas, page_index)
      canvas.show_page()
```

Generate PNG with Python
```
import plutoprint
import math

book = plutoprint.Book(media=plutoprint.MEDIA_TYPE_SCREEN)
book.load_html("<b>Hello World</b>", user_style="body { text-align: center }")

# Outputs an image at the document’s natural size
book.write_to_png("hello.png")

# Outputs a 320px wide image with auto-scaled height
book.write_to_png("hello-width.png", width=320)

# Outputs a 240px tall image with auto-scaled width
book.write_to_png("hello-height.png", height=240)

# Outputs an 800×200 pixels image (may stretch/squish content)
book.write_to_png("hello-fixed.png", 800, 200)

# Get the natural document size
width = math.ceil(book.get_document_width())
height = math.ceil(book.get_document_height())

# Outputs a high-resolution 5x scaled image
book.write_to_png("hello-scaled.png", width * 5, height * 5)

# Render manually on a canvas with white background
with plutoprint.ImageCanvas(width, height) as canvas:
   canvas.clear_surface(1, 1, 1)
   book.render_document(canvas)
   canvas.write_to_png("hello-canvas.png")
```

Generate QR codes
```
import plutoprint

HTML_CONTENT = """
<table>
  <tr>
    <th class="email">Email</th>
    <th class="tel">Tel</th>
  </tr>
  <tr>
    <th class="website">Website</th>
    <th class="github">GitHub</th>
  </tr>
</table>
"""

USER_STYLE = """
body {
  margin: 0;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #f7f7f7;
  font: 16px Arial;
}

table {
  border-spacing: 2rem;
  background: #fff;
  padding: 2rem;
  border: 1px solid #ccc;
  border-radius: 16px;
}

th::before {
  display: block;
  width: 130px;
  height: 130px;
  margin: 0 auto 0.8rem;
}

.email::before   { content: -pluto-qrcode('mailto:contact@example.com', #16a34a); }
.tel::before     { content: -pluto-qrcode('tel:+1234567890', #2563eb); }
.website::before { content: -pluto-qrcode('https://example.com', #ef4444); }
.github::before  { content: -pluto-qrcode('https://github.com/plutoprint', #f59e0b); }
"""

book = plutoprint.Book(plutoprint.PAGE_SIZE_LETTER.landscape())
book.load_html(HTML_CONTENT, USER_STYLE)
book.write_to_png("qrcard.png")
book.write_to_pdf("qrcard.pdf")
```

