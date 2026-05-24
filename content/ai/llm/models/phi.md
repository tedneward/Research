title=Microsoft Phi
tags=ai, model, slm
summary=AI model.
~~~~~~

## Model instances

### Phi-3.5 Mini (3.8B Parameters)
Microsoft’s Phi-3.5 Mini is a top choice for developers building retrieval-augmented generation (RAG) systems on local hardware. Released in August 2024, it is widely used for applications that need to process long documents without cloud API calls.

Long-context capability in a small footprint. Phi-3.5 Mini handles very long inputs (book-length prompts depending on the variant/runtime), which makes it a strong fit for RAG and document-heavy workflows. Many 7B models max out at much shorter default contexts. Some packaged variants (including the default phi3.5 tags in Ollama’s library) use shorter context by default — verify the specific variant/settings before relying on maximum context.

Best for: Long-context reasoning (reading PDFs, technical documentation) · Code generation and debugging · RAG applications where you need to reference large amounts of text · Multilingual tasks

Hardware: Quantized (4-bit) requires 6-10GB RAM for typical prompts (more for very long context) · Full precision (16-bit) requires 16GB RAM · Recommended: Any modern laptop with 16GB RAM

Download / Run locally: Get the official Phi-3.5 Mini Instruct weights from Hugging Face (microsoft/Phi-3.5-mini-instruct) and follow the model card for the recommended runtime. If you use Ollama, pull the Phi 3.5 family model and verify the variant/settings on the Ollama model page before relying on maximum context. (ollama pull phi3.5)

### ## Phi-3-mini-4k-instruct

-   **Release Date:** April 2024
-   **Developer:** Microsoft
-   **Location:** [microsoft/Phi-3-mini-4k-instruct](https://huggingface.co/microsoft/Phi-3-mini-4k-instruct)

| Technical Aspect | Details |
| --- | --- |
| Parameters | 3.8B |
| Architecture | Decoder-only transformer |
| Context Length | 4K tokens |
| Vocabulary Size | 32,064 tokens |
| Training Data | Synthetic + filtered public web data |
| Post-training | SFT + DPO |
| Tool Calling | Yes: via [chat template](https://huggingface.co/docs/transformers/en/chat_templating) (requiring HF's transformers ≥ 4.41.2) |
| License | MIT |

**[Phi-3-Mini-4K-Instruct](https://huggingface.co/microsoft/Phi-3-mini-4k-instruct)** is a 3.8B parameter, lightweight, state-of-the-art open model trained with the Phi-3 datasets that include both synthetic data and filtered publicly available web data, with a focus on high-quality and reasoning-dense properties. The model underwent a post-training process incorporating both Supervised Fine-Tuning (SFT) and [Direct Preference Optimization](https://arxiv.org/abs/2305.18290) (DPO) for instruction following and safety. Microsoft's flagship "small but smart" model, Phi-3-mini was notable at launch for its ability to run on-device, including smartphones, while rivaling GPT-3.5 in capability benchmarks. The model is primarily intended for memory- and compute-constrained environments, latency-bound scenarios, and tasks requiring strong reasoning, especially math and logic. While older than the other models in this list and limited to a 4K context window, the MIT license makes it one of the most permissively licensed options available, and its strong general reasoning has made it a popular base for fine-tuning in commercial applications.

### Phi-4-mini-instruct (SLM)

[HuggingFace](https://huggingface.co/microsoft/Phi-4-mini-instruct)

A lightweight, instruction-tuned model from Microsoft’s Phi-4 family. It is trained on a mix of high-quality synthetic data and carefully filtered public datasets, with a strong emphasis on reasoning-dense content. With only 3.8B parameters, Phi-4-mini-instruct shows reasoning and multilingual performance comparable to much larger models in the 7B–9B range, such as Llama-3.1-8B-Instruct. It’s a solid choice for teams that want strong instruction following and reasoning without the operational overhead of larger models.

Why should you use Phi-4-mini-instruct:

* **Multilingual support out of the box.** Phi-4-mini-instruct supports over 20 languages, making it suitable for global products that requires lightweight multilingual capability.
* **Long context window.** Native support for 128K tokens means you can use it in scenarios like document analysis, RAG, and agent traces.
* **Production-friendly licensing.** Released under the MIT license, it can be freely used, fine-tuned, and deployed in commercial systems without restrictive terms.

Points to be cautious about:

* **Limited factual knowledge.** Phi-4-mini-instruct doesn’t store large amounts of world knowledge. It may produce inaccurate or outdated facts, especially for knowledge-heavy or long-tail queries. I suggest you pair it with RAG or external tools for production use.

* **Language performance varies.** Although it supports multiple languages, performance outside English can be uneven. Non-English or low-resource languages should be carefully benchmarked before deployment.

* **Sensitive to prompt format.** Phi-4-mini-instruct performs best with its recommended chat and function-calling formats. Otherwise, it can negatively impact instruction adherence and output quality. For example, you should use the following format for general conversation and instructions:

    `<|system|>Insert System Message<|end|><|user|>Insert User Message<|end|><|assistant|>`


## Reading

### Articles

- [The Best Open-Source SLMs in 2026](https://www.bentoml.com/blog/the-best-open-source-small-language-models)
