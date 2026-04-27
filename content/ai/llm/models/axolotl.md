title=Axolotl.ai
tags=ai, llm, model, fine-tune
summary=A user-friendly fine-tuning framework to simplify post-training for LLMs.
~~~~~~

[Website](https://axolotl.ai/)

Whether you’re doing full fine-tuning, instruction tuning, LoRA/QLoRA, or alignment work, Axolotl makes it easy to get started, without diving deep into training internals. It’s built on top of Hugging Face’s Transformers library but wraps much of the complexity in a clean, YAML-based configuration system. You define your training setup like datasets, models, and training strategy in a single config file. Axolotl takes care of the rest.

Key features:

-   Supports popular open-weight models like Llama, Pythia, Falcon, and MPT.
-   Flexible training options: full fine-tuning, LoRA, QLoRA, ReLoRA, and GPTQ.
-   Compatible with advanced techniques like xFormers, [FlashAttention](https://www.bentoml.com/llm/inference-optimization/flashattention), ROPE scaling, Liger kernel, and sample packing.
-   Scales from single GPU setups to multi-GPU training using FSDP or DeepSpeed.
-   Easy to run locally with Docker or on cloud infrastructure.

Axolotl is great for users who want to focus on their data and tasks instead of the details of deep learning internals. With sensible defaults, strong community support, and various integrations, it's a go-to choice for practical fine-tuning of open models.

