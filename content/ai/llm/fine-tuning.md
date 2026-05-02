title=Fine-tuning LLMs
tags=ai, llm, model, fine-tune
summary=Notes and links on the "follow-up" training one can apply to an LLM to customize it for a particular purpose.
~~~~~~

## Tools

- [heretic](https://github.com/p-e-w/heretic) - fully automatic censorship removal for language models
- [sentence-transformers](https://github.com/huggingface/sentence-transformers) - a Python library for using and training embedding and reranker models for applications like retrieval augmented generation, semantic search, and more
- [trl](https://github.com/huggingface/trl) - train transformer language models with reinforcement learning
- [OpenRLHF](https://github.com/OpenRLHF/OpenRLHF) - an easy-to-use, high-performance open-source RLHF framework built on Ray, vLLM, ZeRO-3 and HuggingFace Transformers, designed to make RLHF training simple and accessible
- [Kiln](https://github.com/kiln-ai/kiln) - the easiest tool for fine-tuning LLM models, synthetic data generation, and collaborating on datasets
- [augmentoolkit](https://github.com/e-p-armstrong/augmentoolkit) - train an open-source LLM on new facts
- [altk-evolve](https://github.com/AgentToolkit/altk-evolve) - a system designed to help agents improve over time by learning from their trajectories

## Reading

[Getting Started (BentoML)](https://www.bentoml.com/llm/getting-started/llm-fine-tuning): Fine-tuning is one of the most effective ways to adapt an LLM for a specific use case. It continues the training process on a pre-trained model using new, task-specific data. This can involve updating the entire model or just specific layers.

A key driver behind fine-tuning is efficiency. Instead of training a model from scratch (which is extremely resource-intensive), it's far easier and more cost-effective to build on top of a base model that has already learned general language patterns from massive datasets. Fine-tuning sharpens those broad capabilities for your particular task.

For example, fine-tuning can significantly improve a model’s:

-   **Domain expertise**: Adapting a model for legal, medical, or programming-related tasks.
-   **Instruction following**: Ensuring the model adheres to specific formats, tones, or styles in its responses.
-   **Safety and alignment**: Reinforcing how the model handles sensitive or high-risk prompts.

[Learn how to fine-tune LLMs in 12 hours](https://www.freecodecamp.org/news/learn-how-to-fine-tune-llms-in-12-hours/)

### Common frameworks

Fine-tuning LLMs doesn’t have to mean building everything from the ground up. Several open-source frameworks are designed to streamline the process. These tools provide out-of-the-box support for training open-weight models on custom datasets. They make it easier to apply modern optimization techniques without having to write complex training code yourself. Many of these frameworks are also built with efficiency in mind, helping users reduce memory usage and speed up training, even on limited hardware.

- [Axolotl](/ai/llm/models/axolotl)
- [LLaMA Factory](/ai/llm/models/llama-factory)
- [Torchtune](/ai/llm/models/torchtune)
- [Unsloth](/ai/llm/models/unsloth)

