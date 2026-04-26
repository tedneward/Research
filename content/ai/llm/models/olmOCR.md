title=olmOCR
tags=ai, model, vision, ocr
summary=A vision-language model optimized for optical character recognition on documents.
~~~~~~

[Allen AI](/ai/allenai) | [Website](https://allenai.org/) | [HuggingFace: olmOCR-2-7B-1025](https://huggingface.co/allenai/olmOCR-2-7B-1025)

-   **Adaptive Content-Aware Processing**: Automatically classifies document content types including tables, diagrams, and mathematical equations to apply specialized OCR strategies for enhanced accuracy
-   **Reinforcement Learning Optimization**: GRPO RL training specifically enhances accuracy on mathematical equations, tables, and other difficult OCR cases
-   **Excellent Benchmark Performance**: Scores 82.4 overall on olmOCR-bench with strong results across arXiv documents, old scans, headers, footers, and multi-column layouts
-   **Specialized Document Processing**: Optimized for document images with longest dimension of 1288 pixels and requires specific metadata prompts for best results
-   **Scalable Toolkit Support**: Designed to work with the olmOCR toolkit for efficient VLLM-based inference capable of processing millions of documents

