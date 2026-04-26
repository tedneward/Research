title=OCRFlux
tags=ai, model, vision, ocr
summary=A multimodal large language model fine-tuned from Qwen2.5-VL-3B-Instruct for converting PDFs and images into clean, readable Markdown text.
~~~~~~

[OCRFlux-3B: HuggingFace](https://huggingface.co/ChatDOC/OCRFlux-3B) is 

-   **Exceptional Single-Page Parsing Accuracy**: Achieves an Edit Distance Similarity of 0.967 on OCRFlux-bench-single, significantly outperforming olmOCR-7B-0225-preview, Nanonets-OCR-s, and MonkeyOCR
-   **Native Cross-Page Structure Merging**: First open-source project to natively support detecting and merging tables and paragraphs that span multiple pages, achieving 0.986 F1 score on cross-page detection
-   **Efficient 3B Parameter Architecture**: Compact model design enables deployment on GTX 3090 GPUs while maintaining high performance through vLLM-optimized inference for processing millions of documents
-   **Comprehensive Benchmarking Suite**: Provides extensive evaluation frameworks including OCRFlux-bench-single and cross-page benchmarks with manually labeled ground truth for reliable performance measurement
-   **Scalable Production-Ready Toolkit**: Includes Docker support, Python API, and a complete pipeline for batch processing with configurable workers, retries, and error handling for enterprise deployment
