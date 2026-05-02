title=AI Models
tags=ai, model
summary=An overview of AI models.
~~~~~~

- [nanochat](https://github.com/karpathy/nanochat) - a full-stack implementation of an LLM like ChatGPT in a single, clean, minimal, hackable, dependency-lite codebase, designed to run on a single 8XH100 node via scripts like speedrun.sh, that run the entire pipeline start to end
- [Knowledge Distillation: How LLMs train each other](https://www.youtube.com/watch?v=jrJKRYAdh7I)
- [gguf-docs](https://github.com/iuliaturc/gguf-docs) - Docs for GGUF quantization (unofficial)
- [Embarrassingly Simple Self-Distillation Improves Code Generation](https://arxiv.org/pdf/2604.01193)

#### What is the best open-source LLM now?

The “best” open-source LLM always depends on your use case, compute budget, and priorities.That said, if you really want some names, here are commonly recommended open-source LLMs for different use cases.

* Reasoning: [DeepSeek](/ai/models/deepseek)-V3.2-Speciale
* Coding assistants: [GLM](/ai/models/glm)-4.7, [MiniMax](/ai/models/minimax)-M2.1
* Agentic workflows: [MiMo](/ai/models/mimo)-V2-Flash, [Kimi](/ai/models/kimi)-K2.5
* General chat: [Qwen3](/ai/models/qwen)-235B-A22B-Instruct-2507, [DeepSeek](/ai/models/deepseek)-V3.2
* Story writing & creative tasks: [Qwen3](/ai/models/qwen)-235B-A22B-Instruct-2507, [Llama](/ai/models/llama) 4 Maverick
* OCR: [OCRFlux](/ai/models/olmOCR), [PaddleOCR](/ai/models/paddleocr), [MiniCPM-V](/ai/models/minicpm-v)

The “best” model is the one that fits your product requirements, works within your compute constraints, and can be optimized for your specific tasks.

## Model types

* Source models ("text" or "base"): predictive-text models trained on a large corpus of text
* Fine Tuned models ("chat", "instruct", "code"): receive input in a specific format and respond accordingly
* Embedding models (special case): smaller, specifically for creating embedding vectors
* Multi modal: accepts text and some other modality (image, audio, video, ....)

## Explorers, Benchmarks, Leaderboards

- [Arena](https://arena.ai/) - benchmark & compare the best AI models
- [AI Models & API Providers Analysis](https://artificialanalysis.ai/) - understand the AI landscape to choose the best model and provider for your use case
- [BullshitBench](https://github.com/petergpt/bullshit-benchmark) - measure whether AI models challenge nonsensical prompts instead of confidently answering them
- [CyberGym](https://www.cybergym.io/) - evaluating AI agents' real-world cybersecurity capabilities at scale
- [Dubesor LLM Benchmark table](https://dubesor.de/benchtable) - small-scale manual performance comparison benchmark
- [LLM Explorer](https://llm-explorer.com/) - explore list of the open-source LLM models
- [oobabooga benchmark](https://oobabooga.github.io/benchmark.html) - a list sorted by size (on disk) for each score
- [SWE-rebench](https://swe-rebench.com/) - a continuously evolving and decontaminated benchmark for software engineering LLMs
- [vakra](https://github.com/IBM/vakra) -  a benchmark for evaluating multi-hop, multi-source tool-calling in AI agents

## Providers

- [bartowski](https://huggingface.co/bartowski) - providing GGUF versions of popular LLMs
- [Open Thoughts](https://huggingface.co/open-thoughts) - a team of researchers and engineers curating the best open reasoning datasets
- [Tencent](https://huggingface.co/tencent) - a profile of a Chinese multinational technology conglomerate and holding company
- [Unsloth AI](https://huggingface.co/unsloth) - focusing on making AI more accessible to everyone (GGUFs etc.)

## Related tools

- [llmfit](https://github.com/AlexsJones/llmfit) - hundreds of models & providers, one command to find what runs on your hardware
- [outlines](https://github.com/dottxt-ai/outlines) - structured outputs for LLMs
- [llama-swap](https://github.com/mostlygeek/llama-swap) - reliable model swapping for any local OpenAI compatible server - llama.cpp, vllm, etc.

## Specific (uncategorized) list of models

* wizard-math: Your logic partner. "This model is a specialized version of the WizardLM family. It is trained to excel in complex mathematical problems, logical reasoning, and solving puzzles. There are three different sizes available for wizard-math – 7B, 13B, and 70B. With my little experience exploring wizard-math with 7B, I found it fantastic. It helps me test my solutions and explore new ways to approach difficult problems. The model's ability to handle these subjects with precision and clarity makes it my go-to partner for all things logic and numbers."
* reader-lm: Web to markdown, instantly. "The model is super practical for my needs. Instead of manually creating .md files from the web content, I can feed them to reader-lm to get a perfectly structured markdown file. In my experience, while reader-lm does an amazing job for most of my needs, it sometimes struggles with really large or messy HTML code. But, it works well enough most of the time."
* llma-guard3: An LLM for safe prompts. "When working with LLMs, it’s crucial that our interactions are safe and responsible. While we can’t control an LLM’s response, we can ensure our prompts are appropriate. That’s exactly why I self-hosted llama-guard 3. This powerful model acts as a dedicated content moderation tool for all my other local LLMs. The llama-guard 3's job is to classify every interaction against a set of safety categories. It checks our prompts for 13 different categories. When we give a prompt to this LLM, it will respond with a message stating whether the prompt message was safe or unsafe. If it is unsafe, it flags it with a specific reason, such as S1 (Hate Speech) or S2 (Sexual Content), etc."
* [InternVL2.5-4B](https://huggingface.co/OpenGVLab/InternVL2_5-4B) is a compact multimodal large language model from the InternVL 2.5 series, combining a 300 million parameter InternViT vision encoder with a 3 billion parameter Qwen2.5 language model.

    -   **Dynamic High Resolution Processing:** Handles single images, multiple images, and video frames by dividing them into adaptive 448 by 448 pixel tiles with intelligent token reduction through pixel unshuffle operations
    -   **Efficient Three Stage Training:** Features a carefully designed pipeline with MLP warmup, optional vision encoder incremental learning for specialized domains, and full model instruction tuning with strict data quality controls
    -   **Progressive Scaling Strategy:** Trains the vision encoder with smaller language models first before transferring to larger ones, using less than one tenth of the tokens required by comparable models
    -   **Advanced Data Quality Filtering:** Employs a comprehensive pipeline with LLM based quality scoring, repetition detection, and heuristic rule based filtering to remove low quality samples and prevent model degradation
    -   **Strong Multimodal Performance:** Delivers competitive results on OCR, document parsing, chart understanding, multi image comprehension, and video analysis while preserving pure language capabilities through improved data curation

* [Granite Vision 3.3 2b](https://huggingface.co/ibm-granite/granite-vision-3.3-2b) is a compact and efficient vision-language model released on June 11th, 2025, designed specifically for visual document understanding tasks.

    -   **Superior Document Understanding Performance:** Achieves improved scores across key benchmarks including ChartQA, DocVQA, TextVQA, and OCRBench, outperforming previous granite-vision versions
    -   **Enhanced Safety Alignment:** Features improved safety scores on RTVLM and VLGuard datasets, with better handling of political, racial, jailbreak, and misleading content
    -   **Experimental Multipage Support:** Trained to handle question answering tasks using up to 8 consecutive pages from a document, enabling long context processing
    -   **Advanced Document Processing Features:** Introduces novel capabilities including image segmentation and doctags generation for parsing documents into structured text formats
    -   **Efficient Enterprise-Focused Design:** Compact 2 billion parameter architecture optimized for visual document understanding tasks while maintaining 128 thousand token context length

* The [TrOCR](https://huggingface.co/microsoft/trocr-large-printed) large-sized model fine-tuned on SROIE is a specialized transformer-based optical character recognition system designed for extracting text from single-line images.

    -   **Transformer Based Architecture**: Encoder-decoder design with image Transformer encoder and text Transformer decoder for end-to-end optical character recognition
    -   **Pretrained Component Initialization**: Leverages BEiT weights for image encoder and RoBERTa weights for text decoder for better performance
    -   **Patch Based Image Processing**: Processes images as fixed-size 16 by 16 patches with linear embedding and position embeddings
    -   **Autoregressive Text Generation**: Decoder generates text tokens sequentially for accurate character recognition
    -   **SROIE Dataset Specialization**: Fine-tuned on the SROIE dataset for enhanced performance on printed text recognition tasks

#### General purpose

- [Qwen3.6](https://huggingface.co/collections/Qwen/qwen36) - a collection of the latest generation Qwen LLMs
- [NVIDIA Nemotron v3](https://huggingface.co/collections/nvidia/nvidia-nemotron-v3) - a family of open models from NVIDIA with open weights, training data and recipes, delivering leading efficiency and accuracy for building specialized AI agents
- [Gemma 4](https://huggingface.co/collections/google/gemma-4) - a family of open models built by Google DeepMind, that are multimodal, handling text and image input (with audio supported on small models) and generating text output
- [Mistral Small 4](https://huggingface.co/collections/mistralai/mistral-small-4) - A state-of-the-art model from Mistral, open-weight, with a granular Mixture-of-Experts architecture that fuses instruct, reasoning and agentic skills
- [gpt-oss](https://huggingface.co/collections/openai/gpt-oss-68911959590a1634ba11c7a4) - a collection of open-weight models from OpenAI, designed for powerful reasoning, agentic tasks, and versatile developer use cases
- [gpt-oss-puzzle-88B](https://huggingface.co/nvidia/gpt-oss-puzzle-88B) - a deployment-optimized large language model developed by NVIDIA, derived from OpenAI's gpt-oss-120b
- [Hunyuan](https://huggingface.co/collections/tencent/hunyuan-dense-model-6890632cda26b19119c9c5e7) - a collection of Tencent's open-source efficient LLMs designed for versatile deployment across diverse computational environments
- [Phi-4](https://huggingface.co/collections/microsoft/phi-4) - a family of small language, multi-modal and reasoning models from Microsoft
- [OpenReasoning-Nemotron](https://huggingface.co/collections/nvidia/openreasoning-nemotron-687730dae0170059860f1f01) - a collection of models from NVIDIA, trained on 5M reasoning traces for math, code and science
- [GLM-5](https://huggingface.co/zai-org/GLM-5) - a model targeting complex systems engineering and long-horizon agentic tasks
- [Granite 4.0](https://huggingface.co/collections/ibm-granite/granite-40-language-models-6811a18b820ef362d9e5a82c) - a collection of lightweight, state-of-the-art open foundation models from IBM that natively support multilingual capabilities, a wide range of coding tasks—including fill-in-the-middle (FIM) code completion—retrieval-augmented generation (RAG), tool usage and structured JSON output
- [EXAONE-4.0](https://huggingface.co/collections/LGAI-EXAONE/exaone-40-686b2e0069800c835ed48375) - a collection of LLMs from LG AI Research, integrating non-reasoning and reasoning modes
- [ERNIE 4.5](https://huggingface.co/collections/baidu/ernie-45-6861cd4c9be84540645f35c9) - a collection of large-scale multimodal models from Baidu
- [Seed-OSS](https://huggingface.co/collections/ByteDance-Seed/seed-oss-68a609f4201e788db05b5dcd) - a collection of LLMs developed by ByteDance's Seed Team, designed for powerful long-context, reasoning, agent and general capabilities, and versatile developer-friendly features
- [Step-3.5-Flash](https://huggingface.co/stepfun-ai/Step-3.5-Flash) - most capable open-source foundation model, engineered to deliver frontier reasoning and agentic capabilities with exceptional efficiency

#### Coding

- [Qwen3-Coder-Next](https://huggingface.co/collections/Qwen/qwen3-coder-next) - a collection of Qwen's open-weight language models designed specifically for coding agents and local development
- [Devstral 2](https://huggingface.co/collections/mistralai/devstral-2) - a couple of agentic LLMs for software engineering tasks, excelling at using tools to explore codebases, edit multiple files, and power SWE Agents
- [GLM-4.7](https://huggingface.co/collections/zai-org/glm-47) - a collection of agentic, reasoning and coding (ARC) foundation models
- [MiniMax-M2](https://huggingface.co/collections/MiniMaxAI/minimax-m2) - a collection of SOTA models for real-world dev & agents
- [OmniCoder-9B](https://huggingface.co/Tesslate/OmniCoder-9B) - a 9-billion parameter coding agent model built by Tesslate, fine-tuned on top of Qwen3.5-9B's hybrid architecture
- [NousCoder-14B](https://huggingface.co/NousResearch/NousCoder-14B) - a competitive programming model post-trained on Qwen3-14B via reinforcement learning
- [FrogBoss-32B-2510](https://huggingface.co/microsoft/FrogBoss-32B-2510) & [FrogMini-14B-2510](https://huggingface.co/microsoft/FrogMini-14B-2510) - coding agents specialized in fixing bugs in code obtained by fine‑tuning a Qwen3‑32B and Qwen3‑14B language model, respectively, on debugging trajectories generated by Claude Sonnet 4 within the BugPilot framework
- [Jan-code](https://huggingface.co/collections/janhq/jan-code) - a small code-tuned model focuses on handling well-scoped subtasks reliably while keeping latency and compute requirements small
- [Mellum-4b-base](https://huggingface.co/JetBrains/Mellum-4b-base) - an LLM from JetBrains, optimized for code-related tasks
- [Stable-DiffCoder](https://huggingface.co/collections/ByteDance-Seed/stable-diffcoder) - a strong code diffusion large language model

#### Multimodal

- [Qwen3-Omni](https://huggingface.co/collections/Qwen/qwen3-omni-68d100a86cd0906843ceccbe) - a collection of the natively end-to-end multilingual omni-modal foundation models from Qwen
- [GLM-4.6V](https://huggingface.co/collections/zai-org/glm-46v) - a collection of open source multimodal models with native tool use from Zhipu AI

#### Image

- [Qwen-Image](https://huggingface.co/collections/Qwen/qwen-image) - a collection of models for image generation, edit and decomposition from Qwen
- [Qwen3-VL](https://huggingface.co/collections/Qwen/qwen3-vl-68d2a7c1b8a8afce4ebd2dbe) - a collection of the most powerful vision-language models in the Qwen series to date
- [GLM-Image](https://huggingface.co/zai-org/GLM-Image) - an image generation model
- [HunyuanImage](https://huggingface.co/collections/tencent/hunyuanimage) - a collection of image generation models from Tencent
- [HunyuanVideo](https://huggingface.co/collections/tencent/hunyuanvideo) - a collection of video generation models from Tencent 
- [Vidi](https://huggingface.co/collections/bytedance-research/vidi) - a collection of models for multimodal video understanding and creation
- [FastVLM](https://huggingface.co/collections/apple/fastvlm-68ac97b9cd5cacefdd04872e) - a collection of VLMs with efficient vision encoding from Apple
- [MiniCPM-V-4_5](https://huggingface.co/openbmb/MiniCPM-V-4_5) - a GPT-4o Level MLLM for single image, multi image and high-FPS video understanding on your phone
- [LFM2-VL](https://huggingface.co/collections/LiquidAI/lfm2-vl-68963bbc84a610f7638d5ffa) - a colection of vision-language models, designed for on-device deployment
- [ClipTagger-12b](https://huggingface.co/inference-net/ClipTagger-12b) -  a vision-language model (VLM) designed for video understanding at massive scale

#### Audio

- [whisper-large-v3](https://huggingface.co/openai/whisper-large-v3) - a state-of-the-art model for automatic speech recognition (ASR) and speech translation from OpenAI
- [Nemotron Speech](https://huggingface.co/collections/nvidia/nemotron-speech) - a collection of open, state-of-the-art, production‑ready enterprise speech models from the NVIDIA Speech research team for ASR, TTS, Speaker Diarization and S2S
- [Qwen3-ASR](https://huggingface.co/collections/Qwen/qwen3-asr) - a collection of models that support language identification and ASR for 52 languages and dialects
- [Qwen3-TTS](https://huggingface.co/collections/Qwen/qwen3-tts) - a collection of TTS models that cover 10 major languages as well as multiple dialectal voice profiles to meet global application needs
- [Granite Speech](https://huggingface.co/collections/ibm-granite/granite-speech) - a collection of compact and efficient speech-language models from IBM, specifically designed for multilingual automatic speech recognition (ASR) and bidirectional automatic speech translation (AST)
- [Voxtral-Small-24B-2507](https://huggingface.co/mistralai/Voxtral-Small-24B-2507) - an enhancement of Mistral Small 3, incorporating state-of-the-art audio input capabilities while retaining best-in-class text performance
- [Voxtral-Mini-4B-Realtime-2602](https://huggingface.co/mistralai/Voxtral-Mini-4B-Realtime-2602) - a multilingual, realtime speech-transcription model and among the first open-source solutions to achieve accuracy comparable to offline systems with a delay of <500ms
- [Voxtral-4B-TTS-2603](https://huggingface.co/mistralai/Voxtral-4B-TTS-2603) - frontier, open-weights text-to-speech model that’s fast, instantly adaptable, and produces lifelike speech for voice agents
- [chatterbox](https://huggingface.co/ResembleAI/chatterbox) - first production-grade open-source TTS model
- [VibeVoice](https://huggingface.co/collections/microsoft/vibevoice-68a2ef24a875c44be47b034f) - a collection of frontier text-to-speech models from Microsoft
- [Kitten TTS](https://huggingface.co/KittenML/models) - a collection of open-source realistic text-to-speech models designed for lightweight deployment and high-quality voice synthesis
- [Streaming Sortformer Diarizer 4spk v2.1](https://huggingface.co/nvidia/diar_streaming_sortformer_4spk-v2.1) - a streaming version of a novel end-to-end neural model for speaker diarization from NVIDIA

#### Retrieval-Augmented Generation

- [Nemotron RAG](https://huggingface.co/collections/nvidia/nemotron-rag) - a set of tools to build retrieval-augmented generation (RAG) systems, improve search and ranking accuracy, and extract structured data from complex docs
- [Qwen3-Embedding](https://huggingface.co/collections/Qwen/qwen3-embedding) - a collection of the latest proprietary Qwen models, specifically designed for text embedding and ranking tasks
- [Qwen3-VL-Embedding](https://huggingface.co/collections/Qwen/qwen3-vl-embedding) - an addition to the Qwen embedding models, specifically designed for multimodal information retrieval and cross-modal understanding
- [Qwen3-Reranker](https://huggingface.co/collections/Qwen/qwen3-vl-reranker) - a collection of the latest proprietary Qwen models, engineered to refine embedding results
- [Qwen3-VL-Reranker](https://huggingface.co/collections/Qwen/qwen3-vl-reranker) - an addition to the Qwen embedding models, specifically designed for multimodal information retrieval and cross-modal understanding

#### Safeguards

- [gpt-oss-safeguard](https://huggingface.co/collections/openai/gpt-oss-safeguard) - a collection of safety reasoning models built-upon gpt-oss
- [Granite Guardian Models](https://huggingface.co/collections/ibm-granite/granite-guardian-models) - a collection of models created by IBM for safeguarding language models
- [Qwen3Guard](https://huggingface.co/collections/Qwen/qwen3guard-68d2729abbfae4716f3343a1) - a collection of safety moderation models built upon Qwen3
- [NemoGuard](https://huggingface.co/collections/nvidia/nemoguard) - a collection of models from NVIDIA for content safety, topic-following and security guardrails
- [Nemotron-3-Content-Safety](https://huggingface.co/nvidia/Nemotron-3-Content-Safety) - a content-safety moderator from NVIDIA for both inputs to and responses from LLMs and VLMs
- [privacy-filter](https://huggingface.co/openai/privacy-filter) - a bidirectional token-classification model from OpenAI for personally identifiable information (PII) detection and masking in text
- [AprielGuard](https://huggingface.co/ServiceNow-AI/AprielGuard) - a safeguard model designed to detect and mitigate both safety risks and security threats in LLM interactions

#### Miscellaneous

- [Marco-MoE](https://huggingface.co/collections/AIDC-AI/marco-moe) - a suit of multilingual MoE models with highly-sparse architectures
- [Jan-v3](https://huggingface.co/collections/janhq/jan-v3) - a 4B baseline model for fine-tuning, designed for downstream work: improved instruction following out of the box, strong starting point for fine-tuning and effective lightweight coding assistance
- [Jan-v2-VL](https://huggingface.co/collections/janhq/jan-v2-vl) - a family of VLM focused on reliable, many-step task execution
- [Nemotron-Orchestrator-8B](https://huggingface.co/nvidia/Nemotron-Orchestrator-8B) - a state-of-the-art 8B orchestration model designed to solve complex, multi-turn agentic tasks by coordinating a diverse set of expert models and tools
- [Arch-Router-1.5B](https://huggingface.co/katanemo/Arch-Router-1.5B) - the fastest LLM router model that aligns to subjective usage preferences
- [Waypoint](https://huggingface.co/collections/Overworld/waypoint) - a collection of real-time interactive video world models
- [Hunyuan3D](https://huggingface.co/collections/tencent/hunyuan3d) - a collection of everything related (models, datasets etc.) to 3D assets generation from Tencent
- [Hunyuan-GameCraft-1.0](https://huggingface.co/tencent/Hunyuan-GameCraft-1.0) - a novel framework for high-dynamic interactive video generation in game environments
- [void-model](https://huggingface.co/netflix/void-model) - a model from Netflix that removes objects from videos along with all interactions they induce on the scene — not just secondary effects like shadows and reflections, but physical interactions like objects falling when a person is removed

## Reading

### Articles

- [How to Choose the Best Open Source LLM for Your Project in 2025](https://huggingface.co/blog/dvilasuero/choosing-best-open-source-ai-models)
- [The Best Open-Source LLMs in 2026](https://www.bentoml.com/blog/navigating-the-world-of-open-source-large-language-models)
- [The Best Open-Source SLMs in 2026](https://www.bentoml.com/blog/the-best-open-source-small-language-models)
- [The Best Open-Source Vision Language Models in 2026](https://www.bentoml.com/blog/multimodal-ai-a-guide-to-open-source-vision-language-models)
- [The Best Open-Source Image Generation Models in 2026](https://bentoml.com/blog/a-guide-to-open-source-image-generation-models)
- [Top 7 Open Source OCR Models](https://www.kdnuggets.com/top-7-open-source-ocr-models)



