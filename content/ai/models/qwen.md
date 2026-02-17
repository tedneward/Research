title=Alibaba Qwen
tags=ai, model, llm, slm, vision
summary=AI model.
~~~~~~

[Hugging Face](https://huggingface.co/Qwen/)

## Model instances

### Qwen3-Coder

The code version of Qwen3, the large language model series developed by Qwen team, Alibaba Cloud.

[Website](https://chat.qwenlm.ai/) | [Source](https://github.com/QwenLM/Qwen3-Coder)

### Qwen3-235B-A22B-Instruct-2507

[Hugging Face](https://huggingface.co/Qwen/Qwen3-235B-A22B-Instruct-2507)

This model has 235B parameters, with 22B active per token, powered by 128 experts (8 active). Note that it only supports non-thinking mode and does not generate <think></think> blocks. You can try Qwen3-235B-A22B-Thinking-2507 for more complex reasoning tasks.

### Qwen3-235B-A22B-Thinking-2507

[Hugging Face](https://huggingface.co/Qwen/Qwen3-235B-A22B-Thinking-2507)

### Qwen3-0.6B (SLM)

[HuggingFace](https://huggingface.co/Qwen/Qwen3-0.6B)

The smallest dense model in Alibaba’s Qwen3 family, released under the Apache 2.0 license. Despite its tiny size, it inherits much of what makes Qwen3 notable: strong reasoning, improved agent and tool-use capabilities, and broad multilingual support. Architecturally, Qwen3-0.6B is a 0.6B parameter causal LM with 32K context length. Like the rest of the Qwen3 line, it supports a hybrid behavior pattern that can switch between deeper reasoning and faster responses depending on your use case. By December 2025, Qwen3-0.6B is among [the most downloaded text generation models](https://huggingface.co/models?pipeline_tag=text-generation&sort=downloads) on Hugging Face.

Why should you use Qwen3-0.6B:

-   **Strong capability for a sub-1B model.** If you want something meaningfully stronger than “toy” small models, but still lightweight enough for low-cost deployments, Qwen3-0.6B is a solid baseline. In some evaluations, it’s competitive even against much larger models like DeepSeek-R1-Distill-Llama-8B.
-   **Multilingual out of the box.** Qwen3 supports 100+ languages and dialects, and Qwen3-0.6B benefits from that training focus. It is an ideal choice for on-device global products that can’t afford larger multilingual models.
-   **Agent and tool-use friendly ecosystem.** Qwen3 is designed with agent workflows in mind, and the tooling around it (templates, parsers, Qwen-Agent) reduces integration friction.

Points to be cautious about:

-   **Small model limits still apply.** At 0.6B, it’s less reliable for deep reasoning, long-horizon planning, and complex coding than 3B+ models, even if it’s strong for its class.
-   **Repetition can show up with the wrong configurations**. Qwen3-0.6B can get stuck in repetitive loops in some cases. Use [recommended sampling settings and consider adding a presence penalty](https://huggingface.co/Qwen/Qwen3-0.6B#best-practices) to solve this problem.

If you can afford a bit more compute, I also recommend [Qwen3-1.7B](https://huggingface.co/Qwen/Qwen3-1.7B) and [Qwen3-4B](https://huggingface.co/Qwen/Qwen3-4B). They keep the same hybrid reasoning and agent-friendly design, but offer better performance for more complex tasks than the 0.6B model.

### Qwen3-VL

Qwen3-VL is the latest and most capable VLM in Alibaba’s Qwen series, which represents a major leap over its predecessor Qwen2.5-VL. It delivers stronger multimodal reasoning, agentic capabilities, and long-context comprehension.

Two main editions are currently available: Qwen3-VL-235B-A22B and Qwen3-VL-30B-A3B. Both provide Instruct and Thinking variants and official FP8 versions for efficient inference.

The flagship [Qwen3-VL-235B-A22B-Instruct](https://huggingface.co/Qwen/Qwen3-VL-235B-A22B-Instruct) rivals top-tier proprietary models such as Gemini-2.5-Pro and GPT-5 across multimodal benchmarks covering general Q&A, 2D/3D grounding, video understanding, OCR, and document comprehension. In text-only tasks, it performs on par with or surpasses frontier models like DeepSeek-V3-0324 and Claude-Opus-4 on leading benchmarks like MMLU, AIME25, and LiveBench1125.

Key features:

-   **Visual agent abilities**: Qwen3-VL can operate graphical interfaces (PC/mobile), recognizes UI elements, understands functions, and performs real-world tasks through tool invocation. This means you can use it for repetitive tasks like CRM updates, report generation, and software configuration through a single visual interface.
-   **Enhanced multilingual OCR**: The model supports OCR in 32 languages, including Greek, Hebrew, Hindi, Romanian, and Thai. It is able to read text in low-light, blurred, or tilted images and accurately parses complex documents, forms, and layouts.
-   **Advanced video understanding**: With a 256K-token native context window (expandable to 1M), Qwen3-VL can process entire books or hours-long videos with second-level indexing. It maintains precise recall across long sequences, capable of describing visual content frame-by-frame and answering detailed questions.

For more practical examples and use cases, explore the [official Qwen3-VL cookbooks](https://github.com/QwenLM/Qwen3-VL/tree/main/cookbooks).

## Reading

### Articles

- [The Best Open-Source LLMs in 2026](https://www.bentoml.com/blog/navigating-the-world-of-open-source-large-language-models)
- [The Best Open-Source SLMs in 2026](https://www.bentoml.com/blog/the-best-open-source-small-language-models)
- [The Best Open-Source Vision Language Models in 2026](https://www.bentoml.com/blog/multimodal-ai-a-guide-to-open-source-vision-language-models)
