title=HuggingFace Smol
tags=ai, model, slm
summary=AI model.
~~~~~~

## Model instances

### Smol-3B (SLM)

[HuggingFace](https://huggingface.co/HuggingFaceTB/SmolLM3-3B)

A fully open instruct and reasoning model. At the 3B scale, it outperforms Llama-3.2-3B and Qwen2.5-3B, while staying competitive with many 4B-class alternatives (including Qwen3 and Gemma 3) across 12 popular LLM benchmarks.

What also sets SmolLM3 apart is the level of transparency. Hugging Face published the full engineering blueprint of it, including architecture decisions, data mixture, and post-training methodology. If you’re building internal variants or want to understand what actually drives quality at 3B, that matters.

Why should you use SmolLM3-3B:

-   **Dual-mode reasoning.** It supports `/think` and `/no_think`, so you can default to fast responses and only pay the reasoning cost when a request is genuinely hard.
-   **Long context window.** The model is trained to 64K and can stretch to 128K tokens with YaRN extrapolation, making it a strong fit for use cases like long-running agent sessions.
-   **Fully open recipe**. The model is released under the Apache 2 license plus detailed training notes, public data mixture, and configs. These reduce guesswork if you want to fine-tune or build a derivative.

Points to be cautious about:

-   **Multilingual coverage is narrower than some peers**. SmolLM3 works best in six main European languages. If you need broader global coverage, benchmark carefully and consider alternatives.

## Reading

### Articles

- [The Best Open-Source SLMs in 2026](https://www.bentoml.com/blog/the-best-open-source-small-language-models)

