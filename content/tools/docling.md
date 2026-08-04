title=Docling
tags=tool, ai, document
summary=Converts messy documents into structured data and simplifies downstream document and AI processing by detecting tables, formulas, reading order, OCR, and much more.
~~~~~~

[Website](https://docling.ai/) | [Source](https://github.com/docling-project/docling)

## Getting Started

**Install** Docling as a [Python library](https://pypi.org/project/docling) with your favorite package manager:

```undefined
pip install docling
```

**Run** the CLI directly from your terminal:

```bash
docling https://arxiv.org/pdf/2206.01062
```

**Code** a document conversion as part of a Python application:

```python
from docling.document_converter import DocumentConverter
                        
source = "https://arxiv.org/pdf/2408.09869"
converter = DocumentConverter()
doc = converter.convert(source).document
print(doc.export_to_markdown())
```

