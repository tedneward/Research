title=Inclusion AI Ling
tags=ai, model, llm
summary=AI model.
~~~~~~

[HuggingFace](https://huggingface.co/inclusionAI/)

## Model instances

### [Ling-1T](https://huggingface.co/inclusionAI/Ling-1T)

With 1 trillion total parameters and ≈ 50 billion active per token, Ling-1T uses a MoE design optimized through the [Ling Scaling Law](https://arxiv.org/abs/2507.17702) for trillion-scale stability. The model was trained on more than 20 trillion high-quality, reasoning-dense tokens, supporting up to 128K context length.

Why should you use Ling-1T:

-   **Efficient reasoning**. Ling-1T expands the Pareto frontier between reasoning accuracy and length on tasks like AIME 25. It demonstrates advanced reasoning compression, maintaining high accuracy with fewer generated tokens. Across major math, reasoning and code benchmarks, it outperforms or matches top models like DeepSeek-V3.1-Terminus, GPT-5-main, and Gemini-2.5-Pro.
-   **Emergent intelligence at trillion-scale**. The model exhibits strong emergent reasoning and transfer capabilities. Without extensive trajectory fine-tuning, Ling-1T achieves around 70 % tool-call accuracy (BFCL V3). It can Interpret complex natural-language instructions and transform abstract logic into functional visual components. However, the current release still has room for improvement in multi-turn interaction, long-term memory, and tool use.
-   **Aesthetic and front-end generation strength**. With its hybrid Syntax–Function–Aesthetics reward mechanism, Ling-1T produces not only functional code but also visually refined front-end layouts. It currently ranks first among open-source models on ArtifactsBench. This is especially useful for building applications that combine reasoning and UI generation.

## Reading

### Articles

- [The Best Open-Source LLMs in 2026](https://www.bentoml.com/blog/navigating-the-world-of-open-source-large-language-models)
