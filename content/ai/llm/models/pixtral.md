title=Mistral Pixtral
tags=ai, model, vision
summary=AI model.
~~~~~~

## Model instances

### [Pixtral](https://arxiv.org/pdf/2410.07073)

A 12 billion parameter open-source model developed by Mistral, marking [the company's first foray into multimodal capabilities](https://mistral.ai/news/pixtral-12b/). Pixtral is designed to understand both images and text, released with open weights under the Apache 2.0 license.

As an instruction-tuned model, Pixtral is pre-trained on a large-scale dataset of interleaved image and text documents. Therefore, it is capable of multi-turn, multi-image conversations. Unlike previous open-source models, Pixtral maintains excellent text benchmark performance while excelling in multimodal tasks.

Key features:

-   **Outstanding instruction following capability**: Benchmark results indicate that Pixtral 12B significantly outperforms other open-source multimodal models like Qwen2-VL 7B, LLaVa-OneVision 7B, and Phi-3.5 Vision in instruction following tasks. Mistral has created new benchmarks, _MM-IF-Eval_ and _MM-MT-Bench_, to further assess performance in multimodal contexts, where Pixtral also excels. These benchmarks are expected to be open-sourced for the community in the near future.
    
-   **Multi-image processing:** Pixtral can handle multiple images in a single input, processing them at their native resolution. The model supports a context window of 128,000 tokens and can ingest images with varied sizes and aspect ratios.

Points to be cautious about:

-   **Lack of moderation mechanisms**: Currently, Pixtral does not include any built-in moderation features. This means it may not be applicable to cases that require controlled outputs.

To deploy Pixtral 12B, you can run `openllm serve pixtral:12b` with [OpenLLM](https://github.com/bentoml/OpenLLM).

## Reading

### Articles

- [The Best Open-Source Vision Language Models in 2026](https://www.bentoml.com/blog/multimodal-ai-a-guide-to-open-source-vision-language-models)

