title=Google Gemma 3
tags=ai, model, slm, vision
summary=AI model.
~~~~~~

[Website](https://blog.google/technology/developers/gemma-3/) | [Hugging Face](https://huggingface.co/google/)

A family of lightweight, state-of-the-art open models developed by Google, built on the same research behind Gemini 2.0. It supports advanced text, image, and short video understanding, with strong reasoning capabilities across tasks and languages.

Available in 1B, 4B, 12B, and 27B sizes, Gemma 3 offers flexibility for a range of hardware, from laptops to cloud clusters. With a 128K-token context window (32K for 1B), it can handle long-form input for more complex tasks.

Key features:

-   **Multilingual support:** Pretrained on data spanning over 140 languages, Gemma 3 offers out-of-the-box support for 35+ widely used languages.
-   **Portable and efficient**: The small sizes make Gemma 3 ideal for deployment in constrained environments such as laptops, desktops, and edge devices. It also comes with official quantized versions that reduce resource demands while maintaining strong performance.
-   **Agentic workflows:** Gemma 3 supports function calling and structured output, enabling automation and integration into complex application pipelines.

Points to be cautious about:

-   **Limited video comprehension**: While some visual reasoning is supported (especially short videos/images), Gemma 3 does not appear to support long-form or audio-visual video analysis.
-   **Image input only normalized**: Images are resized to 896×896 and encoded into 256 tokens. This may limit fine-grained image understanding or work with non-standard resolutions/aspect ratios.

## Model instances

### Gemma-3n-E2B-IT (SLM)

[Hugging Face](https://huggingface.co/google/gemma-3n-E2B-it)

An instruction-tuned multimodal small model from Google DeepMind, built for on-device and other low-resource deployments. It accepts text, image, audio, and video inputs and generates text outputs. While the raw parameter count is around 5B, it uses selective parameter activation, so it can run with a memory footprint closer to a traditional 2B model in many deployments. The Gemma 3n family is trained on data spanning 140+ languages, which is a big deal if you need multilingual support without jumping to much larger models.

Why should you use Gemma-3n-E2B-IT:

-   **Multimodal by design (text, image, audio, video).** If you need one model that can transcribe speech, describe an image, analyze a short clip, and still handle normal chat, Gemma 3n is built for that from the ground up.
-   **Mobile-first architecture.** Gemma 3n pairs the language model with efficient encoders, including a mobile-optimized vision encoder and an integrated audio encoder. This makes it a good fit for real-time or near-real-time on-device experiences.
-   **Solid baseline quality**. For many product features (e.g., captioning, transcription, translation, lightweight Q&A), the quality is good enough without the cost and latency of larger models. If you need better performance, consider the E4B variant, which achieves an LMArena score over 1300, surpassing models like Llama 4 Maverick 17B 128E and GPT 4.1-nano.

Points to be cautious about:

-   **Context is shared across modalities**. The model has a total input context of 32K tokens across text, image, audio, and video. Multimodal tokens can consume context quickly; for long multimodal sessions, you need careful prompt budgeting and chunking.
-   **Production needs modality-specific evaluation.** The performance of the model in use cases like speech-to-text and speech translation can vary by language, accent, noise, and domain. You should always benchmark the model in these aspects before production rollout.

### Gemma 2 9B
Google’s Gemma 2 9B pushes the boundary of what qualifies as “small.” At 9B parameters, it’s the heaviest model on this list, but it is competitive with 13B-class models on many benchmarks. Use this when you need the best quality your laptop can handle.

Safety and instruction-following. Gemma 2 was trained with extensive safety filtering and alignment work. It refuses harmful requests more reliably than other models and follows complex, multi-step instructions accurately.

Best for: Complex instruction-following · Tasks requiring careful safety handling · General knowledge Q&A · Content moderation

Hardware: Quantized (4-bit) requires 12GB RAM · Full precision (16-bit) requires 24GB RAM · Recommended: 16GB+ RAM for production use

Download / Run locally: Available on Hugging Face under the google org (Gemma 2 9B IT). You’ll need to accept Google’s license terms (and may need authentication depending on your tooling). For Ollama: ollama pull gemma2:9b-instruct-*. Ollama provides both base and instruct tags. Pick the one that matches your use case.

### ## Gemma-4-E2B-it

-   **Release Date:** April 2, 2026
-   **Developer:** Google DeepMind
-   **Location:** [google/gemma-4-E2B-it](https://huggingface.co/google/gemma-4-E2B-it)

| Technical Aspect | Details |
| --- | --- |
| Effective Parameters | 2.3B (5.1B total with embeddings) |
| Architecture | Dense, hybrid attention (sliding window + global) + PLE |
| Layers | 35  |
| Sliding Window | 512 tokens |
| Context Length | 128K tokens |
| Vocabulary Size | 262K |
| Modalities | Text, Image, Audio (≤30 sec), Video (as frames) |
| Multilingual | 35+ native, trained on 140+ languages |
| Tool Calling | Yes: native function calling |
| License | Apache 2.0 |

**[Gemma-4-E2B](https://huggingface.co/google/gemma-4-E2B-it)** is part of Google DeepMind's Gemma 4 family, which features a hybrid attention mechanism, local sliding window attention with full global attention. This design delivers the processing speed and low memory footprint of a lightweight model without sacrificing the deep awareness required for complex, long-context tasks. The "E" in E2B stands for "effective" parameters, enabled by a key architectural innovation called [Per-Layer Embeddings](https://huggingface.co/blog/rishiraj/matformer-in-gemma-3n) (PLE), which adds a dedicated conditioning vector at every decoder layer. This is the mechanism which allows the E2B to run in under 1.5 GB of memory with quantization and still produce valuable outputs. The model supports native function calling, enabling agentic workflows, and is optimized for on-device deployment on mobile and IoT devices, capable of handling text, image, audio, and video inputs. Released under Apache 2.0 (a change from earlier Gemma generations' more restrictive custom license), Gemma 4 E2B is an attractive option for developers building multimodal agentic applications running entirely at the edge.

## Reading

### Articles

- [The Best Open-Source SLMs in 2026](https://www.bentoml.com/blog/the-best-open-source-small-language-models)
- [The Best Open-Source Vision Language Models in 2026](https://www.bentoml.com/blog/multimodal-ai-a-guide-to-open-source-vision-language-models)
