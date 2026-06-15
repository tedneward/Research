title=Large Language Model (LLM)
tags=ai
summary=Collection of links, notes, and models.
~~~~~~

## Places

* [AI Agent Local LLM Inference Device Deployment Guide](https://llmdev.guide/)

## Reading

### General

* Sebastian Raschka: author of "How to Build a Large Language Model (from Scratch)" and "How to Build a Reasoning Model (from Scratch)"

    * [Website](https://sebastianraschka.com/)
    * [GitHub](https://github.com/rasbt?tab=repositories)
    * [LLMs-from-scratch](https://github.com/rasbt/LLMs-from-scratch)
    * [reasoning-from-scratch](https://github.com/rasbt/reasoning-from-scratch)
    * [mini-coding-agent](https://github.com/rasbt/mini-coding-agent)
    * [RAGs](https://github.com/rasbt/RAGs): Simple implementations of Retrieval Augmented Generation (RAG) Systems
    * [LLM-workshop-2024](https://github.com/rasbt/LLM-workshop-2024)
    * [LLM-finetuning-scripts](https://github.com/rasbt/LLM-finetuning-scripts)
    * [Understanding Reasoning LLMs](https://magazine.sebastianraschka.com/p/understanding-reasoning-llms)
    * [The Big LLM Architecture Comparison](https://magazine.sebastianraschka.com/p/the-big-llm-architecture-comparison)
    * [Understanding Multimodal LLMs](https://magazine.sebastianraschka.com/p/understanding-multimodal-llms)
    * [Understanding the 4 Main Approaches to LLM Evaluation (From Scratch)](https://magazine.sebastianraschka.com/p/llm-evaluation-4-approaches): Multiple-Choice Benchmarks, Verifiers, Leaderboards, and LLM Judges
    * [Coding LLMs from Scratch: The Complete Course](https://magazine.sebastianraschka.com/p/coding-llms-from-the-ground-up) [Source](https://github.com/rasbt/LLMs-from-scratch)
    * [The State Of LLMs 2025: Progress, Problems, and Predictions](https://magazine.sebastianraschka.com/p/state-of-llms-2025)

* [Are language models a commodity?](https://www.kdnuggets.com/are-language-models-a-commodity)
* [A Beginner's Reading list for LLMs for 2026](https://machinelearningmastery.com/a-beginners-reading-list-for-large-language-models-for-2026/)
* [100+ LLM interview questions with answers](https://github.com/KalyanKS-NLP/LLM-Interview-Questions-and-Answers-Hub)
* [7 things I wish I knew when I started self-hosting LLMs](https://www.xda-developers.com/things-wish-knew-started-self-host-llms/)
* ["Boost your AI Apps with DSLs"](https://www.typefox.io/blog/boost-your-ai-apps-with-dsls/)
* "Why LLMs get called “stochastic parrots”: That label (from Bender et al., 2021) was meant as a caution: Mimicry over meaning: LLMs are trained to predict the next word, not to “understand.”; Surface fluency: They can generate convincing text that looks like knowledge without grounding in truth.; Bias and error risks: Because they remix training data, they can reinforce biases or produce confident nonsense.
    So the “parrot” critique points to the danger of mistaking correlation for comprehension. Today’s LLMs do much more than repeat phrases: Cross-domain synthesis: They can connect physics, philosophy, and finance in ways that no single expert can, because their training corpus spans millions of sources.; Speed and breadth: A human expert might master a domain over decades, but an LLM can retrieve and correlate patterns across thousands of domains instantly.; Interactive reasoning: With Gen-AI, you can push through Socratic dialogues—testing assumptions, iterating on drafts, exploring alternatives. That’s not “parroting”; it’s a kind of statistical exploration of human knowledge.
    Where the gap remains: Grounding: LLMs still lack intentionality or teleonomy (a sense of purpose). They don’t know why something matters.; Validation: Their statistical generalizations can mislead without external grounding (e.g., real data, experiments, or trusted sources).; Knowledge vs. Wisdom: They provide access to structured correlations; the human role is to discern meaning, relevance, and ethical direction. 
    So: the “parrot” label misses the true capability. LLMs are more like global pattern synthesizers—statistical telescopes that let us see across domains of human knowledge. But until they are coupled with grounding mechanisms (like digital genomes, cognizing oracles, or real-world data feedback), their outputs remain knowledge access tools rather than autonomous knowers." --https://www.linkedin.com/posts/raomikkilineni_why-llms-get-called-stochastic-parrots-activity-7366446664368201729-doqb
* [How to Enrich LLM Context to Significantly Enhance Capabilities](https://towardsdatascience.com/how-to-enrich-llm-context-to-significantly-enhance-capabilities/)
* [MIT researchers propose a new model for legible, modular software](https://news.mit.edu/2025/mit-researchers-propose-new-model-for-legible-modular-software-1106): "The coding framework uses modular concepts and simple synchronization rules to make software clearer, safer, and easier for LLMs to generate. Coding with large language models (LLMs) holds huge promise, but it also exposes some long-standing flaws in software: code that’s messy, hard to change safely, and often opaque about what’s really happening under the hood. Researchers at MIT’s Computer Science and Artificial Intelligence Laboratory (CSAIL) are charting a more “modular” path ahead. Their new approach breaks systems into “concepts,” separate pieces of a system, each designed to do one job well, and “synchronizations,” explicit rules that describe exactly how those pieces fit together. The result is software that’s more modular, transparent, and easier to understand. A small domain-specific language (DSL) makes it possible to express synchronizations simply, in a form that LLMs can reliably generate. In a real-world case study, the team showed how this method can bring together features that would otherwise be scattered across multiple services."
* [What You See Is What It Does: A Structural Pattern for Legible Software](https://arxiv.org/html/2508.14511v2): "The opportunities offered by LLM coders (and their current limitations) demand a reevaluation of how software is structured. Software today is often “illegible”—lacking a direct correspondence between code and observed behavior—and insufficiently modular, leading to a failure of three key requirements of robust coding: incrementality (the ability to deliver small increments by making localized changes), integrity (avoiding breaking prior increments) and transparency (making clear what has changed at build time, and what actions have happened at runtime). A new structural pattern offers improved legibility and modularity. Its elements are concepts and synchronizations: fully independent services and event-based rules that mediate between them. A domain-specific language for synchronizations allows behavioral features to be expressed in a granular and declarative way (and thus readily generated by an LLM). A case study of the RealWorld benchmark is used to illustrate and evaluate the approach."
* [How AI fixed my procrastination](https://devblogs.microsoft.com/visualstudio/how-ai-fixed-my-procrastination/)
* [10 LLM Engineering Concepts Explained in 10 Minutes](https://www.kdnuggets.com/10-llm-engineering-concepts-explained-in-10-minutes):

    1. Understanding Context Engineering
    2. Implementing Tool Calling
    3. Adopting the Model Context Protocol
    4. Enabling Agent-to-Agent Communication
    5. Leveraging Semantic Caching
    6. Utilizing Contextual Compression
    7. Applying Reranking
    8. Implementing Hybrid Retrieval
    9. Designing Agent Memory Architectures
    10. Managing Inference Gateways and Intelligent Routing

* [LLM Inference: Inside a Fast LLM Inference Server](https://pub.towardsai.net/llm-inference-inside-a-fast-llm-inference-server-d551f7bfcc97)
* [You can (and should) run a tiny LLM on your Android phone](https://www.makeuseof.com/you-can-and-should-run-a-tiny-llm-on-your-android-phone/): Using [MNN](https://github.com/alibaba/MNN) ([Play Store](https://play.google.com/store/apps/details?id=com.alibaba.mnnllm.android.release))
* [Self-Hosted LLMs in the Real World: Limits, Workarounds, and Hard Lessons](https://www.kdnuggets.com/self-hosted-llms-in-the-real-world-limits-workarounds-and-hard-lessons)

### Using LLMs

* [How NotebookLM made self-hosting an LLM easier than I ever expected](https://www.xda-developers.com/learn-how-to-self-host-llm-with-notebooklm/)
* [Run an LLM on your Android](https://www.makeuseof.com/you-can-and-should-run-a-tiny-llm-on-your-android-phone/)
* [Deploy an AI Analyst in Minutes: Connect Any LLM to Any Data Source with Bag of Words](https://www.kdnuggets.com/deploy-an-ai-analyst-in-minutes-connect-any-llm-to-any-data-source-with-bag-of-words)
* [Designing an open-source LLM interface and social platforms for collectively driven LLM evaluation and auditing](https://openwebui.com/assets/files/whitepaper.pdf): "In the emerging landscape of large language models (LLMs), the imperative for robust evaluation and auditing mechanisms is paramount to ensure their ethical deployment and alignment with user needs. This workshop paper proposes a novel framework for the human-centered evaluation and auditing of LLMs, centered around an open-source chat user interface (UI) that facilitates direct interaction with a wide range of models. This approach allows for a collection of rich datasets critical for nuanced evaluation from a diverse spectrum of user interactions. Building on this foundation, we propose a social platform designed to leverage the collective intelligence of its users through crowdsourcing, enabling the evaluation and auditing of LLMs across various domains. This platform supports a dual-layered evaluation pipeline: an automated preliminary assessment based on user feedback and a deeper, community-driven analysis within domain-specific subcommunities. The culmination of this process informs the development of tailored model configurations and curated datasets, ensuring that LLMs serve the specific needs of different user groups. By combining an open-source UI with a socially-driven evaluation platform, our approach fosters a community-centric ecosystem for continuous LLM improvement, emphasizing transparency, inclusivity, and alignment with human values."
* [Developing LLM-Based Text Adventure Games](https://stal.blogspot.com/2025/09/developing-llm-based-text-adventure.html)
* [How to Run an LLM Locally to Interact with Your Documents](https://www.freecodecamp.org/news/run-an-llm-locally-to-interact-with-your-documents/)
* [How to Build a Secure AI PR Reviewer with Claude, GitHub Actions, and JavaScript](https://www.freecodecamp.org/news/how-to-build-a-secure-ai-pr-reviewer-with-claude-github-actions-and-javascript/)
* [How to Build Reliable AI Systems](https://www.freecodecamp.org/news/how-to-build-reliable-ai-systems/)
* LLMOps (paid access): 

    * [Part 1: Foundations of AI Engineering and LLMs](https://www.dailydoseofds.com/llmops-crash-course-part-1/)
    * [Part 2: Building Blocks of LLMs: Tokenization and Embeddings](https://www.dailydoseofds.com/llmops-crash-course-part-2/)

* [7 Steps to Mastering Language Model Deployment](https://www.kdnuggets.com/7-steps-to-mastering-language-model-deployment)
* [The Complete Guide to Inference Caching in LLMs](https://machinelearningmastery.com/the-complete-guide-to-inference-caching-in-llms/)
* [AI Concepts Software Engineers Need in 2026](https://www.geeky-gadgets.com/ai-concepts-2026/): LLMs, Tokens and Context Windows, AI Agents, MCP, RAG, Fine-tuning, context engineering, multimodal AI, MOE (mixture-of-experts)
* [Guardrails for LLMs: Measuring AI ‘Hallucination’ and Verbosity](https://www.kdnuggets.com/guardrails-for-llms-measuring-ai-hallucination-and-verbosity)

### Performance

* [Can You Run LLMs Locally Without a GPU? I Tested 8 Models on Linux](https://itsfoss.com/testing-local-llms-without-gpu/): "I tested 8 LLMs on a CPU-only machine to find out what works and what doesn’t." Results:

    Model | Eval Rate | Disk Size
    ----- | --------- | ---------
    Qwen 3 0.6B | ~34–36 tok/s | ~500 MB
    TinyLlama 1.1B | ~25–28 tok/s | ~638 MB
    Gemma 3 1B | ~18.6 tok/s | ~815 MB
    Gemma 4 E2B | ~9.9 tok/s | ~7 GB
    Granite 4 3B | ~8.5–9 tok/s | ~2 GB
    Phi 4 Mini 3.8B | ~6.90 tok/s | ~2.5 GB
    OpenHermes 7B | ~4.1–4.3 tok/s | ~4.1 GB
    Ministral 3 8B | ~3.16 tok/s | ~6 GB

### Implementation

* [Hackaday: An LLM from "Scratch"](https://hackaday.com/2026/05/07/an-llm-from-scratch/)
* [Train LLM from Scratch](https://fareedkhan-dev.github.io/train-llm-from-scratch/): A straightforward method for training your LLM, from downloading data to generating text. [Source](https://github.com/FareedKhan-dev/train-llm-from-scratch)
* [Train an LLM from Scratch](https://github.com/angelos-p/llm-from-scratch): A hands-on workshop where you write every piece of a GPT training pipeline yourself, understanding what each component does and why.
* [Simple-LLM](https://github.com/naklecha/simple-llm): ~950 line, minimal, extensible LLM inference engine built from scratch.
* [BUILDING AN INTELLIGENT ARCHITECTURE AGENT: LEVERAGING LLMS FOR AUTOMATED DIAGRAM GENERATION AND DOCUMENTATION](https://stal.blogspot.com/2025/09/building-intelligent-architecture-agent.html?m=1)
* ["How to Build a Large Language Model from Scratch Using Python"](https://www.freecodecamp.org/news/how-to-build-a-large-language-model-from-scratch-using-python/)
* ["How to build knowledge graphs using LLMs"](https://www.geeky-gadgets.com/building-knowledge-graphs-using-llms/)
* ["Language Models are Few-Shot Learners"](https://dl.acm.org/doi/pdf/10.5555/3495724.3495883): "We demonstrate that scaling up language models greatly improves task-agnostic, few-shot performance, sometimes even becoming competitive with prior state-ofthe-art fine-tuning approaches. Specifically, we train GPT-3, an autoregressive language model with 175 billion parameters, 10x more than any previous nonsparse language model, and test its performance in the few-shot setting. For all tasks, GPT-3 is applied without any gradient updates or fine-tuning, with tasks and few-shot demonstrations specified purely via text interaction with the model. GPT-3 achieves strong performance on many NLP datasets, including translation, question-answering, and cloze tasks. We also identify some datasets where GPT3’s few-shot learning still struggles, as well as some datasets where GPT-3 faces methodological issues related to training on large web corpora."
* [The Large Language Model Course](https://huggingface.co/blog/mlabonne/llm-course)
* [Let's reproduce GPT-2 (124M)](https://www.youtube.com/watch?v=l8pRSuU81PU)
* ["Researchers from Virginia Tech and Microsoft Introduce Algorithm of Thoughts: An AI Approach That Enhances Exploration of Ideas And Power of Reasoning In Large Language Models (LLMs)"](https://www.marktechpost.com/2023/08/31/researchers-from-virginia-tech-and-microsoft-introduce-algorithm-of-thoughts-an-ai-approach-that-enhances-exploration-of-ideas-and-power-of-reasoning-in-large-language-models-llms/)
* [A Survey of Reinforcement Learning for Large Reasoning Models](https://huggingface.co/papers/2509.08827): "In this paper, we survey recent advances in Reinforcement Learning (RL) for reasoning with Large Language Models (LLMs). RL has achieved remarkable success in advancing the frontier of LLM capabilities, particularly in addressing complex logical tasks such as mathematics and coding. As a result, RL has emerged as a foundational methodology for transforming LLMs into LRMs. With the rapid progress of the field, further scaling of RL for LRMs now faces foundational challenges not only in computational resources but also in algorithm design, training data, and infrastructure. To this end, it is timely to revisit the development of this domain, reassess its trajectory, and explore strategies to enhance the scalability of RL toward Artificial SuperIntelligence (ASI). In particular, we examine research applying RL to LLMs and LRMs for reasoning abilities, especially since the release of DeepSeek-R1, including foundational components, core problems, training resources, and downstream applications, to identify future opportunities and directions for this rapidly evolving area. We hope this review will promote future research on RL for broader reasoning models. Github: https://github.com/TsinghuaC3I/Awesome-RL-for-LRMs"
* WebLLM: High-Performance In-Browser LLM Inference Engine [Website](https://webllm.mlc.ai/) | [Source](https://github.com/mlc-ai/web-llm)

### Context Engineering

- [Context-Engineering](https://github.com/davidkimai/Context-Engineering) - a frontier, first-principles handbook inspired by Karpathy and 3Blue1Brown for moving beyond prompt engineering to the wider discipline of context design, orchestration, and optimization
- [Awesome-Context-Engineering](https://github.com/Meirtz/Awesome-Context-Engineering) - a comprehensive survey on Context Engineering: from prompt engineering to production-grade AI systems

### Design Patterns

* [Choosing the Right Agentic Design Pattern: A Decision-Tree Approach](https://machinelearningmastery.com/choosing-the-right-agentic-design-pattern-a-decision-tree-approach/)


### Verification

* [BEAVER](https://huggingface.co/papers/2512.05439): As large language models (LLMs) transition from research prototypes to production systems, practitioners often need reliable methods to verify that model outputs satisfy required constraints. While sampling-based estimates provide an intuition of model behavior, they offer no sound guarantees. We present BEAVER, the first practical framework for computing deterministic, sound probability bounds on LLM constraint satisfaction. Given any prefix-closed semantic constraint, BEAVER systematically explores the generation space using novel token trie and frontier data structures, maintaining provably sound bounds at every iteration. We formalize the verification problem, prove soundness of our approach, and evaluate BEAVER on correctness verification, privacy verification and secure code generation tasks across multiple state of the art LLMs. BEAVER achieves 6 to 8 times tighter probability bounds and identifies 3 to 4 times more high risk instances compared to baseline methods under identical computational budgets, enabling precise characterization and risk assessment that loose bounds or empirical evaluation cannot provide.
* [The FACTS Leaderboard: A Comprehensive Benchmark for Large Language Model Factuality](https://huggingface.co/papers/2512.10791): "We introduce The FACTS Leaderboard, an online leaderboard suite and associated set of benchmarks that comprehensively evaluates the ability of language models to generate factually accurate text across diverse scenarios. The suite provides a holistic measure of factuality by aggregating the performance of models on four distinct sub-leaderboards: (1) FACTS Multimodal, which measures the factuality of responses to image-based questions; (2) FACTS Parametric, which assesses models' world knowledge by answering closed-book factoid questions from internal parameters; (3) FACTS Search, which evaluates factuality in information-seeking scenarios, where the model must use a search API; and (4) FACTS Grounding (v2), which evaluates whether long-form responses are grounded in provided documents, featuring significantly improved judge models. Each sub-leaderboard employs automated judge models to score model responses, and the final suite score is an average of the four components, designed to provide a robust and balanced assessment of a model's overall factuality. The FACTS Leaderboard Suite will be actively maintained, containing both public and private splits to allow for external participation while guarding its integrity. It can be found at https://www.kaggle.com/benchmarks/google/facts ."


### Wow

* [Can LLMs be Computers?](https://www.percepta.ai/blog/can-llms-be-computers): Executing programs inside transformers with exponentially faster inference. ... To achieve [execution inside the LLM], we implemented a WebAssembly interpreter inside the transformer weights.
* [7 Advanced Feature Engineering Tricks Using LLM Embeddings](https://machinelearningmastery.com/7-advanced-feature-engineering-tricks-using-llm-embeddings/)

### Python

* https://www.infoq.com/news/2025/08/google-langextract-python/

---

[awesome-local-llm](https://github.com/rafska/awesome-local-llm) - Crack these apart into pages, eliminate dupes

## Inference engines

- [BitNet](https://github.com/microsoft/BitNet) - official inference framework for 1-bit LLMs
- [distributed-llama](https://github.com/b4rtaz/distributed-llama) - connect home devices into a powerful cluster to accelerate LLM inference
- [dynamo](https://github.com/ai-dynamo/dynamo) - a datacenter scale distributed inference serving framework
- [exo](https://github.com/exo-explore/exo) - run your own AI cluster at home with everyday devices
- [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM) - run LLMs on AMD Ryzen™ AI NPUs
- [flashinfer](https://github.com/flashinfer-ai/flashinfer) - kernel library for LLM serving
- [gpustack](https://github.com/gpustack/gpustack) - simple, scalable AI model deployment on GPU clusters
- [LiteRT](https://github.com/google-ai-edge/litert) - Google's on-device framework for high-performance ML & GenAI deployment on edge platforms, via efficient conversion, runtime, and optimization
- [LiteRT-LM](https://github.com/google-ai-edge/LiteRT-LM) - Google's production-ready, high-performance, open-source inference framework for deploying Large Language Models 
- [krasis](https://github.com/brontoguana/krasis) - a Hybrid LLM runtime which focuses on efficient running of larger models on consumer grade VRAM limited hardware
- [llm-scaler](https://github.com/intel/llm-scaler) - run LLMs on Intel Arc™ Pro B60 GPUs
- [mistral.rs](https://github.com/EricLBuehler/mistral.rs) - fast, flexible LLM inference
- [mlx-lm](https://github.com/ml-explore/mlx-lm) - generate text and fine-tune large language models on Apple silicon with MLX
- [mlx-vlm](https://github.com/Blaizzy/mlx-vlm) - a package for inference and fine-tuning of Vision Language Models (VLMs) on your Mac using MLX
- [Nano-vLLM](https://github.com/GeeeekExplorer/nano-vllm) - a lightweight vLLM implementation built from scratch
- [omlx](https://github.com/jundot/omlx) - LLM inference server with continuous batching & SSD caching for Apple Silicon — managed from the macOS menu bar
- [TensorRT-LLM](https://github.com/NVIDIA/TensorRT-LLM) - provides users with an easy-to-use Python API to define Large Language Models (LLMs) and supports state-of-the-art optimizations to perform inference efficiently on NVIDIA GPUs

## Tools

### Computer Use

- [open-interpreter](https://github.com/OpenInterpreter/open-interpreter) - a natural language interface for computers
- [OmniParser](https://github.com/microsoft/OmniParser) - a simple screen parsing tool towards pure vision based GUI agent
- [openwork](https://github.com/different-ai/openwork) - an open-source alternative to Claude Cowork, powered by OpenCode
- [cua](https://github.com/trycua/cua) - the Docker Container for Computer-Use AI Agents
- [Agent-S](https://github.com/simular-ai/Agent-S) - an open agentic framework that uses computers like a human
- [self-operating-computer](https://github.com/OthersideAI/self-operating-computer) - a framework to enable multimodal models to operate a computer
- [OpenRoom](https://github.com/MiniMax-AI/OpenRoom) - a browser-based desktop where AI Agent operates every app through natural language, from MiniMaxAI

### Browser Automation

- [puppeteer](https://github.com/puppeteer/puppeteer) - a JavaScript API for Chrome and Firefox
- [playwright](https://github.com/microsoft/playwright) - a framework for Web Testing and Automation
- [browser-use](https://github.com/browser-use/browser-use) - make websites accessible for AI agents
- [firecrawl](https://github.com/mendableai/firecrawl) - turn entire websites into LLM-ready markdown or structured data
- [stagehand](https://github.com/browserbase/stagehand) -  the AI Browser Automation Framework
- [nanobrowser](https://github.com/nanobrowser/nanobrowser) -  open-source Chrome extension for AI-powered web automation

### Memory Management

- [mem0](https://github.com/mem0ai/mem0) - universal memory layer for AI Agents
- [mempalace](https://github.com/milla-jovovich/mempalace) - the highest-scoring AI memory system ever benchmarked
- [letta](https://github.com/letta-ai/letta) - the stateful agents framework with memory, reasoning, and context management
- [supermemory](https://github.com/supermemoryai/supermemory) - memory engine and app that is extremely fast, scalable
- [cognee](https://github.com/topoteretes/cognee) - memory for AI Agents in 5 lines of code
- [LMCache](https://github.com/LMCache/LMCache) - supercharge your LLM with the fastest KV Cache Layer
- [memU](https://github.com/NevaMind-AI/memU) - an open-source memory framework for AI companions
- [reasoning-bank](https://github.com/google-research/reasoning-bank) - a memory mechanism for agents that learns from both successful and failed trajectories, with reasoning stored as memory content

### Testing, Evaluation and Observability

- [langfuse](https://github.com/langfuse/langfuse) - an open-source LLM engineering platform: LLM Observability, metrics, evals, prompt management, playground, datasets. Integrates with OpenTelemetry, Langchain, OpenAI SDK, LiteLLM, and more
- [opik](https://github.com/comet-ml/opik) - debug, evaluate, and monitor your LLM applications, RAG systems, and agentic workflows with comprehensive tracing, automated evaluations, and production-ready dashboards
- [openllmetry](https://github.com/traceloop/openllmetry) - an open-source observability for your LLM application, based on OpenTelemetry
- [garak](https://github.com/NVIDIA/garak) - the LLM vulnerability scanner from NVIDIA
- [giskard](https://github.com/Giskard-AI/giskard) - an open-source evaluation & testing for AI & LLM systems
- [agenta](https://github.com/Agenta-AI/agenta) - an open-source LLMOps platform: prompt playground, prompt management, LLM evaluation, and LLM observability all in one place

### Research

- [Perplexica](https://github.com/ItzCrazyKns/Perplexica) -  an open-source alternative to Perplexity AI, the AI-powered search engine
- [gpt-researcher](https://github.com/assafelovic/gpt-researcher) - an LLM based autonomous agent that conducts deep local and web research on any topic and generates a long report with citations
- [SurfSense](https://github.com/MODSetter/SurfSense) - an open-source alternative to NotebookLM / Perplexity / Glean
- [open-notebook](https://github.com/lfnovo/open-notebook) - an open-source implementation of Notebook LM with more flexibility and features
- [RD-Agent](https://github.com/microsoft/RD-Agent) - automate the most critical and valuable aspects of the industrial R&D process
- [local-deep-researcher](https://github.com/langchain-ai/local-deep-researcher) - fully local web research and report writing assistant
- [local-deep-research](https://github.com/LearningCircuit/local-deep-research) - an AI-powered research assistant for deep, iterative research
- [maestro](https://github.com/murtaza-nasir/maestro) - an AI-powered research application designed to streamline complex research tasks

### Security and Sandboxing

- [Guardrails](https://github.com/NVIDIA-NeMo/Guardrails) - an open-source toolkit from NVIDIA for easily adding programmable guardrails to LLM-based conversational systems
- [OpenShell](https://github.com/NVIDIA/OpenShell) - the safe, private runtime for autonomous AI agents from NVIDIA
- [CubeSandbox](https://github.com/TencentCloud/CubeSandbox) - instant, concurrent, secure & lightweight sandbox for AI agents
- [cai](https://github.com/aliasrobotics/cai) - Cybersecurity AI (CAI), the framework for AI Security

### Miscellaneous

- [speakr](https://github.com/murtaza-nasir/speakr) - a personal, self-hosted web application designed for transcribing audio recordings
- [presenton](https://github.com/presenton/presenton) - an open-source AI presentation generator and API
- [OmniGen2](https://github.com/VectorSpaceLab/OmniGen2) - exploration to advanced multimodal generation
- [4o-ghibli-at-home](https://github.com/TheAhmadOsman/4o-ghibli-at-home) - a powerful, self-hosted AI photo stylizer built for performance and privacy
- [Observer](https://github.com/Roy3838/Observer) - local open-source micro-agents that observe, log and react, all while keeping your data private and secure
- [mobile-use](https://github.com/minitap-ai/mobile-use) - a powerful, open-source AI agent that controls your Android or IOS device using natural language
- [gabber](https://github.com/gabber-dev/gabber) - build AI applications that can see, hear, and speak using your screens, microphones, and cameras as inputs
- [promptcat](https://github.com/sevenreasons/promptcat) - a zero-dependency prompt manager/catalog/library in a single HTML file
