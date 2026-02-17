title=Deepseek
tags=ai, model, llm, vision
summary=AI model and company.
~~~~~~

[Website](https://www.deepseek.com/) | [HuggingFace](https://huggingface.co/deepseek-ai)

DeepSeek came to the spotlight during the “DeepSeek moment” in early 2025, when its R1 model demonstrated ChatGPT-level reasoning at significantly lower training costs.

## Model instances

### DeepSeek-3.2

At the core are three main ideas:

* **DeepSeek Sparse Attention (DSA).** A sparse attention mechanism that significantly reduces compute for long-context inputs while preserving model quality.
* **Scaled reinforcement learning.** A high-compute RL pipeline that pushes reasoning performance into GPT-5 territory. The DeepSeek-V3.2-Speciale variant surpasses GPT-5 and reaches Gemini-3.0-Pro-level reasoning on benchmarks such as AIME and HMMT 2025.
* **Large-scale agentic task synthesis.** A data pipeline that blends reasoning with tool use. DeepSeek built 1,800+ distinct environments and 85,000+ agent tasks across search, coding, and multi-step tool-use to drive the RL process.

If you’re building LLM agents or reasoning-heavy applications, DeepSeek-V3.2 is one of the first models you should evaluate. For deployment, you can pair it with high-performance runtimes like vLLM to get efficient serving out of the box.

### DeepSeek-OCR

[DeepSeek-OCR](https://www.bentoml.com/blog/deepseek-ocr-contexts-optical-compression-explained) is DeepSeek’s latest open-source VLM that redefines optical character recognition through a concept called [Contexts Optical Compression](https://github.com/deepseek-ai/DeepSeek-OCR/blob/main/DeepSeek_OCR_paper.pdf). The core idea works like this:

-   Encode images into compact, high-density vision tokens.
-   Decode those tokens back into text using a language model.

Why is this important? LLMs face compute limitations when processing long text sequences. A single image containing dense document text can represent the same information using far fewer tokens than raw digital text. By transforming words into images, DeepSeek-OCR leverages visual encoding to dramatically reduce token counts and computation costs.

In practice, the model can compress visual contexts by up to 20× while maintaining 97% OCR accuracy at compression ratios below 10×. On benchmarks like OmniDocBench, it outperforms GOT-OCR2.0 and MinerU2.0 while using significantly fewer vision tokens. It also delivers exceptional speed, reaching nearly 2,500 tokens per second on a single A100-40G GPU using vLLM.

Key features:

-   **Dual-component architecture**: The model combines a lightweight DeepEncoder for high-resolution image input and a DeepSeek-3B-MoE-A570M decoder. The encoder minimizes activations under heavy input while keeping the number of vision tokens manageable.
-   **Deep parsing**: DeepSeek-OCR goes far beyond traditional OCR. It is capable of layout analysis, table extraction, chart parsing, chemical formula recognition, and even geometry reconstruction. For example, in deep parsing mode, it can identify chemical structures in research papers and convert them to SMILES format, or reproduce planar geometric figures from textbooks.
-   **Multilingual recognition**: DeepSeek-OCR supports nearly 100 languages, with both layout and non-layout output modes. It is an ideal choice for large-scale PDF and multilingual document processing.
-   **General vision understanding**: DeepSeek-OCR retains image description, grounding, and object detection abilities. However, since the researchers did not use supervised fine-tuning (SFT), DeepSeek-OCR isn’t a chatbot. Some of its advanced vision abilities require explicit completion prompts to activate.

Learn more about [DeepSeek-OCR and Contexts Optical Compression](https://www.bentoml.com/blog/deepseek-ocr-contexts-optical-compression-explained).

## Reading

### Articles

- [The Best Open-Source LLMs in 2026](https://www.bentoml.com/blog/navigating-the-world-of-open-source-large-language-models)
- [The Best Open-Source Vision Language Models in 2026](https://www.bentoml.com/blog/multimodal-ai-a-guide-to-open-source-vision-language-models)
