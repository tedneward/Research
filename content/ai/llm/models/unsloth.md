title=Unsloth
tags=ai, tool, engine, llm, model, fine-tune
summary=A fine-tuning framework designed to make training LLMs faster, lighter, and more accessible, especially on limited hardware (e.g., free Google Colab GPUs).
~~~~~~

[Website](https://unsloth.ai/) | [Docs](https://unsloth.ai/docs) | [Source](https://github.com/unslothai/unsloth)

- 🧬[Fine-tuning Guide](https://unsloth.ai/docs/get-started/fine-tuning-llms-guide)
- ❓[What Model Should I Use?](https://unsloth.ai/docs/get-started/fine-tuning-llms-guide/what-model-should-i-use)
- 🚀[Complete LLM Directory](https://unsloth.ai/docs/models/tutorials)
- 🤔[FAQ + Is Fine-tuning Right For Me?](https://unsloth.ai/docs/get-started/fine-tuning-for-beginners/faq-+-is-fine-tuning-right-for-me)
- 📥[Installation](https://unsloth.ai/docs/get-started/install)
- 📈[Datasets Guide](https://unsloth.ai/docs/get-started/fine-tuning-llms-guide/datasets-guide)
- 🛠️[Unsloth Requirements](https://unsloth.ai/docs/get-started/fine-tuning-for-beginners/unsloth-requirements)
- 🖥️[Inference & Deployment](https://unsloth.ai/docs/basics/inference-and-deployment)
- 🧠[Hyperparameters Guide](https://unsloth.ai/docs/get-started/fine-tuning-llms-guide/lora-hyperparameters-guide)

Unsloth is deeply optimized at the kernel level. Built with a custom attention implementation in [Triton](https://openai.com/index/triton), it enables 2× faster training with up to 80% less memory usage. The Unsloth team has collaborated directly with developers behind models like Llama 4, Mistral, Qwen, Gemma, and Phi, often contributing bug fixes and updates that improve prompt handling, accuracy, and overall stability.

Key features:

-   Supports fine-tuning open-weight models like Llama, Mistral, Phi, Gemma, and more.
-   Supports LoRA, QLoRA, full fine-tuning, and even reinforcement learning (DPO, ORPO).
-   Highly customizable: edit chat templates, dataset formats, and training configs as needed.
-   Compatible with inference tools like Ollama, llama.cpp, and vLLM.
-   Runs easily on platforms like Google Colab, Kaggle, and even older consumer GPUs.

If you're trying to fine-tune a model on resource-constrained setups, Unsloth is a top choice. It’s built to maximize what you can do with minimal resources.

## Install

`docker run -d -e JUPYTER_PASSWORD="mypassword" -p 8888:8888 -p 8000:8000 -p 2222:22 -v $(pwd)/work:/workspace/work --gpus all unsloth/unsloth`

