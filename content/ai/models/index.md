title=AI Models
tags=ai, model
summary=An overview of AI models.
~~~~~~

#### What is the best open-source LLM now?

The “best” open-source LLM always depends on your use case, compute budget, and priorities.That said, if you really want some names, here are commonly recommended open-source LLMs for different use cases.

* Reasoning: [DeepSeek](/ai/models/deepseek)-V3.2-Speciale
* Coding assistants: [GLM](/ai/models/glm)-4.7, [MiniMax](/ai/models/minimax)-M2.1
* Agentic workflows: [MiMo](/ai/models/mimo)-V2-Flash, [Kimi](/ai/models/kimi)-K2.5
* General chat: [Qwen3](/ai/models/qwen)-235B-A22B-Instruct-2507, [DeepSeek](/ai/models/deepseek)-V3.2
* Story writing & creative tasks: [Qwen3](/ai/models/qwen)-235B-A22B-Instruct-2507, [Llama](/ai/models/llama) 4 Maverick
* OCR: [OCRFlux](/ai/models/olmOCR), [PaddleOCR](/ai/models/paddleocr), [MiniCPM-V](/ai/models/minicpm-v)

The “best” model is the one that fits your product requirements, works within your compute constraints, and can be optimized for your specific tasks.

## Model types

* Source models ("text" or "base"): predictive-text models trained on a large corpus of text
* Fine Tuned models ("chat", "instruct", "code"): receive input in a specific format and respond accordingly
* Embedding models (special case): smaller, specifically for creating embedding vectors
* Multi modal: accepts text and some other modality (image, audio, video, ....)

## Reading

### Articles

- [The Best Open-Source LLMs in 2026](https://www.bentoml.com/blog/navigating-the-world-of-open-source-large-language-models)
- [The Best Open-Source SLMs in 2026](https://www.bentoml.com/blog/the-best-open-source-small-language-models)
- [The Best Open-Source Vision Language Models in 2026](https://www.bentoml.com/blog/multimodal-ai-a-guide-to-open-source-vision-language-models)
- [The Best Open-Source Image Generation Models in 2026](https://bentoml.com/blog/a-guide-to-open-source-image-generation-models)
- [Top 7 Open Source OCR Models](https://www.kdnuggets.com/top-7-open-source-ocr-models)

## Videos

### The Ollama Course

* [Introduction to the Ollama Course](https://www.youtube.com/watch?v=9KEUFe4KQAI)
* [What are the different types of models](https://www.youtube.com/watch?v=f4tXwCNP1Ac)
* [Upgrade Your AI Using WebSearch](https://www.youtube.com/watch?v=GMlSFIp1na0): SearXNG
* [GitHub projects](https://github.com/technovangelist/videoprojects)

---

## To File

* [InternVL2.5-4B](https://huggingface.co/OpenGVLab/InternVL2_5-4B) is a compact multimodal large language model from the InternVL 2.5 series, combining a 300 million parameter InternViT vision encoder with a 3 billion parameter Qwen2.5 language model.

    -   **Dynamic High Resolution Processing:** Handles single images, multiple images, and video frames by dividing them into adaptive 448 by 448 pixel tiles with intelligent token reduction through pixel unshuffle operations
    -   **Efficient Three Stage Training:** Features a carefully designed pipeline with MLP warmup, optional vision encoder incremental learning for specialized domains, and full model instruction tuning with strict data quality controls
    -   **Progressive Scaling Strategy:** Trains the vision encoder with smaller language models first before transferring to larger ones, using less than one tenth of the tokens required by comparable models
    -   **Advanced Data Quality Filtering:** Employs a comprehensive pipeline with LLM based quality scoring, repetition detection, and heuristic rule based filtering to remove low quality samples and prevent model degradation
    -   **Strong Multimodal Performance:** Delivers competitive results on OCR, document parsing, chart understanding, multi image comprehension, and video analysis while preserving pure language capabilities through improved data curation

* [Granite Vision 3.3 2b](https://huggingface.co/ibm-granite/granite-vision-3.3-2b) is a compact and efficient vision-language model released on June 11th, 2025, designed specifically for visual document understanding tasks.

    -   **Superior Document Understanding Performance:** Achieves improved scores across key benchmarks including ChartQA, DocVQA, TextVQA, and OCRBench, outperforming previous granite-vision versions
    -   **Enhanced Safety Alignment:** Features improved safety scores on RTVLM and VLGuard datasets, with better handling of political, racial, jailbreak, and misleading content
    -   **Experimental Multipage Support:** Trained to handle question answering tasks using up to 8 consecutive pages from a document, enabling long context processing
    -   **Advanced Document Processing Features:** Introduces novel capabilities including image segmentation and doctags generation for parsing documents into structured text formats
    -   **Efficient Enterprise-Focused Design:** Compact 2 billion parameter architecture optimized for visual document understanding tasks while maintaining 128 thousand token context length

* The [TrOCR](https://huggingface.co/microsoft/trocr-large-printed) large-sized model fine-tuned on SROIE is a specialized transformer-based optical character recognition system designed for extracting text from single-line images.

    -   **Transformer Based Architecture**: Encoder-decoder design with image Transformer encoder and text Transformer decoder for end-to-end optical character recognition
    -   **Pretrained Component Initialization**: Leverages BEiT weights for image encoder and RoBERTa weights for text decoder for better performance
    -   **Patch Based Image Processing**: Processes images as fixed-size 16 by 16 patches with linear embedding and position embeddings
    -   **Autoregressive Text Generation**: Decoder generates text tokens sequentially for accurate character recognition
    -   **SROIE Dataset Specialization**: Fine-tuned on the SROIE dataset for enhanced performance on printed text recognition tasks



