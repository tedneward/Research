title=Meta Llama
tags=ai, model, llm
summary=AI model.
~~~~~~

[HuggingFace](https://huggingface.co/meta-llama/)

## Model instances

### [Llama 4 Scout](https://huggingface.co/meta-llama/Llama-4-Scout-17B-16E-Instruct)

109B total parameters (17B active), 16 experts.

### [Llama 4 Maverick](https://huggingface.co/meta-llama/Llama-4-Maverick-17B-128E-Instruct)

400B total parameters (17B active), 128 experts.

### Llama 4 Behemoth (preview)

2T total parameters (288B active), 16 experts. Still in training, Behemoth already outperforms GPT-4.5, Claude Sonnet 3.7, and Gemini 2.0 Pro on several STEM benchmarks.

### Llama 3.2 3B
Meta’s Llama 3.2 3B is the all-rounder. It handles general instruction-following well, fine-tunes easily, and runs fast enough for interactive applications. If you’re unsure which model to start with, start here.

Balance. It’s not the best at any single task, but it’s good enough at everything. Meta supports 8 languages (English, German, French, Italian, Portuguese, Hindi, Spanish, Thai), with training data covering more. Strong instruction-following makes it versatile.

Best for: General chat and Q&A · Document summarization · Text classification · Customer support automation

Hardware: Quantized (4-bit) requires 6GB RAM · Full precision (16-bit) requires 12GB RAM · Recommended: 8GB RAM minimum for smooth performance

Download / Run locally: Available on Hugging Face under the meta-llama org (Llama 3.2 3B Instruct). You’ll need to accept Meta’s license terms (and may need authentication depending on your tooling). For Ollama, pull the 3B tag: ollama pull llama3.2:3b.


### Llama 3.2 1B
The 1B version trades some capability for extreme efficiency. This is the model you deploy when you need AI on mobile devices, edge servers, or any environment where resources are tight.

It can run on phones. A quantized 1B model fits in 2-3GB of memory, making it practical for on-device inference where privacy or network connectivity matters. Real-world performance depends on your runtime and device thermals, but high-end smartphones can handle it.

Best for: Simple classification tasks · Basic Q&A on narrow domains · Log analysis and data extraction · Mobile and IoT deployment

Hardware: Quantized (4-bit) requires 2-4GB RAM · Full precision (16-bit) requires 4-6GB RAM · Recommended: Can run on high-end smartphones

Download / Run locally: Available on Hugging Face under the meta-llama org (Llama 3.2 1B Instruct). License acceptance/authentication may be required for download. For Ollama: ollama pull llama3.2:1b.

## Reading

### Articles

- [The Best Open-Source LLMs in 2026](https://www.bentoml.com/blog/navigating-the-world-of-open-source-large-language-models)
