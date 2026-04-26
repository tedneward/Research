title=PaddleOCR VL
tags=ai, model, vision, ocr
summary=An ultra-compact vision-language model specifically designed for efficient multilingual document parsing.
~~~~~~

[HuggingFace](https://huggingface.co/PaddlePaddle/PaddleOCR-VL) is 

-   **Ultra-Compact 0.9B Architecture**: Combines a NaViT-style dynamic resolution visual encoder with ERNIE-4.5-0.3B language model for resource-efficient inference while maintaining high accuracy
-   **State-of-the-Art Document Parsing**: Achieves leading performance on OmniDocBench v1.5 and v1.0 for overall document parsing, text recognition, formula extraction, table understanding, and reading order detection
-   **Extensive Multilingual Support**: Recognizes 109 languages covering major global languages and diverse scripts including Cyrillic, Arabic, Devanagari, and Thai for truly global document processing
-   **Comprehensive Element Recognition**: Excels at identifying and extracting text, tables, mathematical formulas, and charts including complex layouts and challenging content like handwritten text and historical documents
-   **Flexible Deployment Options**: Supports multiple inference backends including native PaddleOCR toolkit, transformers library, and vLLM server for optimized performance across different deployment scenarios
