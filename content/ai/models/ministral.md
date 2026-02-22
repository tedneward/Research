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

## Reading

### Articles

- [The Best Open-Source SLMs in 2026](https://www.bentoml.com/blog/the-best-open-source-small-language-models)
