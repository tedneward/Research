title=opendataloader-pdf
tags=tool, ai, document, markdown
summary=Extract Markdown, JSON (with bounding boxes), and HTML from any PDF.
~~~~~~

[Website](https://opendataloader.org/) | [Source](https://github.com/opendataloader-project/opendataloader-pdf)

🔍 **PDF parser for AI data extraction** — Extract Markdown, JSON (with bounding boxes), and HTML from any PDF. #1 in benchmarks (0.907 overall). Deterministic local mode + AI hybrid mode for complex pages.

-   **How accurate is it?** — #1 in benchmarks: 0.907 overall, 0.928 table accuracy across 200 real-world PDFs including multi-column and scientific papers. Deterministic local mode + AI hybrid mode for complex pages ([benchmarks](https://github.com/opendataloader-project/opendataloader-pdf#extraction-benchmarks))
-   **Scanned PDFs and OCR?** — Yes. Built-in OCR (80+ languages) in hybrid mode. Works with poor-quality scans at 300 DPI+ ([hybrid mode](https://github.com/opendataloader-project/opendataloader-pdf#hybrid-mode-1-accuracy-for-complex-pdfs))
-   **Tables, formulas, images, charts?** — Yes. Complex/borderless tables, LaTeX formulas, and AI-generated picture/chart descriptions all via hybrid mode ([hybrid mode](https://github.com/opendataloader-project/opendataloader-pdf#hybrid-mode-1-accuracy-for-complex-pdfs))
-   **How do I use this for RAG?** — `pip install opendataloader-pdf`, convert in 3 lines. Outputs structured Markdown for chunking, JSON with bounding boxes for source citations, and HTML. LangChain integration available. Python, Node.js, Java SDKs ([quick start](https://github.com/opendataloader-project/opendataloader-pdf#get-started-in-30-seconds) | [LangChain](https://github.com/opendataloader-project/opendataloader-pdf#langchain-integration))

♿ **PDF accessibility automation** — The same layout analysis engine also powers auto-tagging. First open-source tool to generate Tagged PDFs end-to-end (coming Q2 2026).

-   **What's the problem?** — Accessibility regulations are now enforced worldwide. Manual PDF remediation costs $50–200 per document and doesn't scale ([regulations](https://github.com/opendataloader-project/opendataloader-pdf#pdf-accessibility--pdfua-conversion))
-   **What's free?** — Layout analysis + auto-tagging (Q2 2026, Apache 2.0). Untagged PDF in → Tagged PDF out. No proprietary SDK dependency ([auto-tagging preview](https://github.com/opendataloader-project/opendataloader-pdf#auto-tagging-preview-coming-q2-2026))
-   **What about PDF/UA compliance?** — Converting Tagged PDF to PDF/UA-1 or PDF/UA-2 is an enterprise add-on. Auto-tagging generates the Tagged PDF; PDF/UA export is the final step ([pipeline](https://github.com/opendataloader-project/opendataloader-pdf#accessibility-pipeline))
-   **Why trust this?** — Built in collaboration with [Dual Lab](https://duallab.com/) ([veraPDF](https://verapdf.org/) developers) based on [PDF Association](https://pdfa.org/) specifications, best practice guides and expertise of the [PDF Community](https://pdfa.org/community/). Auto-tagging follows the [Well-Tagged PDF specification](https://pdfa.org/wtpdf/), validated with veraPDF ([collaboration](https://opendataloader.org/docs/tagged-pdf-collaboration))

