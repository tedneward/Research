title=HuggingFace
tags=ai, place
summary=The platform where the machine learning community collaborates on models, datasets, and applications.
~~~~~~

[Website](https://huggingface.co/)

## Resources

### Papers

- [Embarrassingly Simple Self-Distillation Improves Code Generation](https://huggingface.co/papers/2604.01193): "Can a large language model (LLM) improve at code generation using only its own raw outputs, without a verifier, a teacher model, or reinforcement learning? We answer in the affirmative with simple self-distillation (SSD): sample solutions from the model with certain temperature and truncation configurations, then fine-tune on those samples with standard supervised fine-tuning. SSD improves Qwen3-30B-Instruct from 42.4% to 55.3% pass@1 on LiveCodeBench v6, with gains concentrating on harder problems, and it generalizes across Qwen and Llama models at 4B, 8B, and 30B scale, including both instruct and thinking variants. To understand why such a simple method can work, we trace these gains to a precision-exploration conflict in LLM decoding and show that SSD reshapes token distributions in a context-dependent way, suppressing distractor tails where precision matters while preserving useful diversity where exploration matters. Taken together, SSD offers a complementary post-training direction for improving LLM code generation."
- [How Well Do Agentic Skills Work in the Wild: Benchmarking LLM Skill Usage in Realistic Settings](https://huggingface.co/papers/2604.04323)
- [Qualixar OS: A Universal Operating System for AI Agent Orchestration](https://huggingface.co/papers/2604.06392)
- [Self-Execution Simulation Improves Coding Models](https://huggingface.co/papers/2604.03253): "A promising research direction in enabling LLMs to generate consistently correct code involves addressing their inability to properly estimate program execution, particularly for code they generate. In this work, we demonstrate that Code LLMs can be trained to simulate program execution in a step-by-step manner and that this capability can be leveraged to improve competitive programming performance. Our approach combines supervised fine-tuning on natural language execution traces, textual explanations grounded in true execution, with reinforcement learning using verifiable rewards. We introduce two complementary objectives: output prediction given code and inputs, and solving competitive programming tasks with either ground-truth or self-predicted execution feedback. These objectives enable models to perform self-verification over multiple candidate solutions, and iterative self-fixing by simulating test execution. Across multiple competitive programming benchmarks, our method yields consistent improvements over standard reasoning approaches. We further present ablations and analysis to elucidate the role of execution simulation and its limitations."

