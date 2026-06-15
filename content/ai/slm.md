title=Small Language Models (SLM)
tags=ai
summary=Collection of links and notes.
~~~~~~

#### What is a small language model?

Small language models are AI that use machine learning (ML) algorithms trained on much smaller, usually domain-specific datasets.

Because the training dataset is smaller, the [data quality is often better and more accurate](https://www.ataccama.com/blog/what-is-data-quality-why-is-it-important). Small language models have fewer parameters (i.e., configurations) and a simpler architecture. **Typically, anything below 30B parameters is considered a small language model.**

#### What is an SLM vs LLM?

The main difference between an SLM vs LLM is the cost, complexity, and relevance.

An SLM is a type of AI model that uses natural language processing and is designed for specific tasks within a targeted domain. Trained on domain-specific data, SLMs are more computationally efficient, cost-effective, and accurate, reducing the risk of generating inaccurate outputs. Their smaller size allows for easier fine-tuning, making them highly adaptable. Unlike LLMs, SLMs are not one-size-fits-all models; they are intended exclusively for the domain they were created for.

SLMs and LLMs are similar in architecture design, training, data generation, and model evaluation. But there are some significant differences between an SML vs LLM:

### 1\. Size and model complexity

LLMs such as Meta’s Llama 3.1 contain [405B model parameters](https://codingscape.com/blog/most-powerful-llms-large-language-models#:~:text=Nvidia%20LLMs&text=This%20model%20has%20340%20billion,languages%20and%2040%2B%20coding%20languages.), while SLMs such as Mistral’s Mixtral 8x22B contain [8B model parameters](https://codingscape.com/blog/most-powerful-llms-large-language-models#:~:text=Nvidia%20LLMs&text=This%20model%20has%20340%20billion,languages%20and%2040%2B%20coding%20languages.) — significantly less.

SLMs are smaller, so they typically have lower latency than LLMs when used for the same use case or task.

### 2\. Contextual understanding and being domain-specific

SLMs are trained only on data from specific domains, making them excel in their domain (the domain they were developed for) as opposed to LLMs with vast knowledge of different domains.

SLMs lack this; they lack general knowledge, making LLMs more versatile. They can be adapted, improved, and engineered for a wider variety of downstream tasks.

### 3\. Resource utilization

Training LLMs is much more resource-intensive, making it prohibitive for most companies to train their own. They require many GPUs and highly powerful and scalable infrastructure.

Training ChatGPT from scratch would require several thousand GPUs, whereas the Mistral SLM can be run on your local machines. Resource utilization is also about time. For all the reasons already mentioned, training an LLM takes much longer, typically months, whereas SLMs can be trained in weeks.

This leads to a much larger resource demand from LLMs, while SLMs’ limited resource needs make them more sustainable. Inevitably, all this affects costs—bigger model size = higher token cost.

### 4\. Bias

Because LLMs are trained on large data sets, often from different domain areas and scraped from the open internet, they are less likely to be adequately fine-tuned. Working with a lot of raw, public data from different domain areas makes them more likely to produce biased outputs (e.g., it may underrepresent or misinterpret different groups and/or ideas).

SLMs pose a lower risk of bias because they are only trained on smaller, domain-specific, carefully curated data sets.

### 5\. Use case

Given the context above, LLMs are typically better for complex, sophisticated general tasks, while SLMs are for more specialized, domain-focused tasks only.

### 6\. Inference

LLMs require a lot of hardware, GPUs, and cloud services, so they must run on the Internet.

SLMs can be so small they can run locally without an internet connection.

### 7\. Control

If a company wants to use an LLM, it will need to buy it (purchase licenses) from an existing provider. If the provider decides to change the model parameters, the companies cannot do anything about it, and they are exposed to potential risks of model drift or catastrophic forgetting.

Because SLMs can be run locally and are easier and cheaper to develop, companies can do it themselves. They have greater control over the data that goes into the model, the changes, and everything else. However, for this, companies need to have good-quality, governed data first.

## Resources

### Articles, Blogs, Essays

* [Introduction to Small Language Models: The Complete Guide for 2026](https://machinelearningmastery.com/introduction-to-small-language-models-the-complete-guide-for-2026/)
* [Small Language Models: A Beginner’s Guide](https://www.ataccama.com/blog/small-language-models)
* [The Optimal Architecture for Small Language Models](https://huggingface.co/blog/codelion/optimal-model-architecture)
* [Unleashing the Power of Self-Learning Machines Running SLMs on your Browser](https://codezen.medium.com/unleashing-the-power-of-self-learning-machines-running-slms-on-your-browser-2ed3f3a3496e) ([Source](https://tarun047.github.io/slm-demo/))
* [Introducing: Local Browser AI](https://blog.alexewerlof.com/p/local-browser-ai)
* [Small Language Models: A Beginner’s Guide](https://www.ataccama.com/blog/small-language-models)
* [Small Language Models: A Guide with Examples](https://www.datacamp.com/blog/small-language-models)
* [Small Language Models: A Comprehensive Overview](https://huggingface.co/blog/jjokah/small-language-model)
* [Building AI Agents with Local Small Language Models](https://machinelearningmastery.com/building-ai-agents-with-local-small-language-models/)
* [Enabling small language models to solve complex reasoning tasks](https://news.mit.edu/2025/enabling-small-language-models-solve-complex-reasoning-tasks-1212)

### Model lists

* [Top 7 Small Language Models You Can Run on a Laptop](https://machinelearningmastery.com/top-7-small-language-models-you-can-run-on-a-laptop/): Phi-3.5 Mini (3.8B Parameters), Llama 3.2 3B, Llama 3.2 1B, Ministral 3 8B, Qwen 2.5 7B, Gemma 2 9B, SmolLM2 1.7B
* [Top 7 SLMs You Can Run in the Browser](https://medium.com/@hadiyolworld007/top-7-slms-you-can-run-in-the-browser-fa67d921e669): 

    1. Llama 3.2 1B Instruct (Meta): A tiny Llama that actually chats. Great as a default “it just works” browser model; widely packaged for WebLLM. If you want the Meta feel without the Meta footprint, start here. Best for: lightweight assistants, UI copilots, form-fill helpers.
    2. Phi-3.5 Mini (Microsoft): Phi keeps surprising. The 3/3.5 “mini” variants punch above their size and appear in ready-to-use MLC builds (multiple quantizations). A strong default for reasoning-heavy prompts under tight budgets. Best for: structured responses, JSON mode, quick reasoning.
    3. Qwen 2.5 1.5B Instruct (Alibaba): Lean, multilingual, and chatty. The 1.5B Instruct variant is small enough for browsers yet capable enough for everyday tasks; plenty of WebLLM demos use it with WebGPU.

* [What are small language models and how do they differ from large ones?](https://theconversation.com/what-are-small-language-models-and-how-do-they-differ-from-large-ones-269103)
* [Small Language Models](https://www.ataccama.com/blog/small-language-models)

### Tutorials

* [Building a Small Language Model(SLM) from Scratch](https://github.com/ChaitanyaK77/Building-a-Small-Language-Model-SLM-)
* [Build a Small Language Model (SLM) From Scratch](https://medium.com/@shravankoninti/build-a-small-language-model-slm-from-scratch-3ddd13fa6470)
* [Train a SLM from scratch (not fine tune)](https://www.reddit.com/r/LocalLLaMA/comments/1nv5ppk/train_a_slm_from_scratch_not_fine_tune/)
* [Train an SLM from scratch with early-stopping grid search over hyperparameters](https://modal.com/docs/examples/hp_sweep_gpt)
* [Build a Production-Ready LLM API](https://amanxai.com/2026/02/11/build-a-production-ready-llm-api/): We’ll build a fast, well-tested API to serve TinyLlama, a powerful open-source small language model, using FastAPI. The best part is that it’s completely free, runs on your own machine, and doesn’t require an OpenAI API key.
* [Building a Small Language Model(SLM) from Scratch](https://github.com/ChaitanyaK77/Building-a-Small-Language-Model-SLM-)
