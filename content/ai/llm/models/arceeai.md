title=Arcee
tags=ai, place, model
summary=A US-based Open Intelligence Lab.
~~~~~~

[Website](https://www.arcee.ai/)

## Models

### Trinity Nano〔6B, 1B active〕

Edge, embedded, and privacy-critical

Runs fully local on consumer GPUs, edge servers, and mobile-class devices. Tuned for offline operation and latency-sensitive voice or UI loops.

Deploy on: on-device, edge servers, mobile, kiosks

Active parameters: **1B per token**

Context window: **128K tokens**

[Download](https://huggingface.co/arcee-ai/Trinity-Nano-Preview)

### Trinity Mini〔26B, 3B active〕

Cloud and on-prem production

Serve customer-facing apps, agent backends, and high-throughput services in your cloud or VPC.

Deploy on: AWS, GCP, Azure, on-prem (vLLM, SGLang, llama.cpp)

Active parameters: **3B per token**

Context window: **128K tokens**

[Try Mini](https://chat.arcee.ai/) [Download](https://huggingface.co/arcee-ai/Trinity-Mini) [API Docs](https://docs.arcee.ai/language-models/trinity-mini-26b)

### Trinity Large Preview〔400B, 13B active〕

Cloud deployment

Production-oriented instruct model trained to navigate well in agent harnesses, handle complex toolchains, and excel in creative scenarios.  

Deploy on: Preview API (currently served at 128k context) using 8-bit quantization

Active parameters: **13B per token**

Context window: **512K tokens**

[Try Large Preview](https://chat.arcee.ai/) [Download](https://huggingface.co/arcee-ai/Trinity-Large-Preview) [API Docs](https://docs.arcee.ai/language-models/trinity-large-400b)

### Trinity Large Thinking〔400B, 13B active〕

Cloud deployment

Trinity-Large-Thinking is a reasoning-optimized variant of Arcee AI's Trinity-Large family. Built on Trinity-Large-Base and post-trained with extended chain-of-thought reasoning and agentic RL, it delivers state-of-the-art performance on agentic benchmarks while maintaining strong general capabilities.  

Deploy on: Arcee API - served at 256k at BF16

Active parameters: **13B per token**

Context window: **512K tokens**

[Try Large Thinking](https://chat.arcee.ai/) [Download](https://huggingface.co/arcee-ai/Trinity-Large-Thinking) [API Docs](https://docs.arcee.ai/language-models/trinity-large-thinking)

## Articles

* [Overview and discussion](https://www.unremarkable.ai/slim-smart-and-specialized-the-future-of-ai-with-arcee-cloud-small-language-models/)

