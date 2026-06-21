title=LLM and Related (Agent, etc) Research
tags=ai, llm, research
summary=A collection of papers and projects that explore the world of LLM usage and implications.
~~~~~~

## Prompts (Prompt Engineering, etc)

* [instruction-budget](https://github.com/Arize-ai/instruction-budget): "This is a self-contained briefing for an engineer (human or Claude Code) building a replication of the IFScale benchmark from Jaroslawicz et al., ["How Many Instructions Can LLMs Follow at Once?" (arXiv:2507.11538v1, July 2025)](https://arxiv.org/abs/2507.11538) against the May 2026 frontier model lineup." which in turn reads "Production-grade LLM systems require robust adherence to dozens or even hundreds of instructions simultaneously. However, the instruction-following capabilities of LLMs at high instruction densities have not yet been characterized, as existing benchmarks only evaluate models on tasks with a single or few instructions. We introduce IFScale, a simple benchmark of 500 keyword-inclusion instructions for a business report writing task to measure how instruction-following performance degrades as instruction density increases. We evaluate 20 state-of-the-art models across seven major providers and find that even the best frontier models only achieve 68% accuracy at the max density of 500 instructions. Our analysis reveals model size and reasoning capability to correlate with 3 distinct performance degradation patterns, bias towards earlier instructions, and distinct categories of instruction-following errors. Our insights can help inform design of instruction-dense prompts in real-world applications and highlight important performancelatency tradeoffs. We open-source the benchmark and all results for further analysis at https://distylai.github.io/IFScale."



