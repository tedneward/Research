title=Mistral Ministral
tags=ai, model, vision
summary=AI model.
~~~~~~

## Model instances

### Ministral-3-3B-Instruct-2512

[HuggingFace](https://huggingface.co/mistralai/Ministral-3-3B-Instruct-2512)

A multimodal SLM developed by Mistral AI. It’s the smallest instruct model in the Ministral 3 family, designed specifically for edge and resource-constrained deployments. Architecturally, it combines a 3.4B language model with a 0.4B vision encoder, supporting basic visual understanding alongside chat and instruction following. In practice, it can run on a single GPU and fit into roughly 8 GB of VRAM in FP8, or even less with further quantization.

Why should you use Ministral-3-3B-Instruct-2512:

-   **Vision + text in one small model**. It is a practical choice for lightweight image tasks like screenshot understanding, image captioning, and simple visual Q&A, without moving to a large [VLM](https://www.bentoml.com/blog/multimodal-ai-a-guide-to-open-source-vision-language-models).
-   **Agent-ready.** Designed with function calling and structured (JSON-style) outputs in mind, it can be easily integrated into tool-using and agentic workflows.
-   **Large context for its size.** It supports up to 256k tokens, which is useful for document-heavy prompts, long logs, or multi-file inputs.

Points to be cautious about:

-   **Vision is functional, not deep**. While it supports image inputs, the visual reasoning capability is limited. I suggest you use it for simple descriptions and basic Q&A rather than detailed image analysis or complex visual reasoning. If you need stronger multimodal reasoning, consider [Ministral-3-3B-Reasoning-2512](https://huggingface.co/mistralai/Ministral-3-3B-Reasoning-2512) instead.

### Ministral 3 8B
Mistral AI released Ministral 3 8B as their edge model, designed for deployments where you need maximum performance in minimal space. It is competitive with larger 13B-class models on practical tasks while staying efficient enough for laptops.

Strong efficiency for edge deployments. The Ministral line is tuned to deliver high quality at low latency on consumer hardware, making it a practical “production small model” option when you want more capability than 3B-class models. It uses grouped-query attention and other optimizations to deliver strong performance at 8B parameter count.

Best for: Complex reasoning tasks · Multi-turn conversations · Code generation · Tasks requiring nuanced understanding

Hardware: Quantized (4-bit) requires 10GB RAM · Full precision (16-bit) requires 20GB RAM · Recommended: 16GB RAM for comfortable use

Download / Run locally: The “Ministral” family has multiple releases with different licenses. The older Ministral-8B-Instruct-2410 weights are under the Mistral Research License. Newer Ministral 3 releases are Apache 2.0 and are preferred for commercial projects. For the most straightforward local run, use the official Ollama tag: ollama pull ministral-3:8b (may require a recent Ollama version) and consult the Ollama model page for the exact variant/license details.

## Reading

### Articles

- [The Best Open-Source SLMs in 2026](https://www.bentoml.com/blog/the-best-open-source-small-language-models)
