title=FLUX
tags=ai, model, image
summary=AI model.
~~~~~~

## Model instances

### FLUX.2

[Released in November 2025 by Black Forest Labs](https://flux2.io/flux-2-0-is-finally-here/), FLUX.2 marks a major leap from experimental image generation toward true production-grade visual creation.

Currently, FLUX.2 is available through both managed APIs and open-weight checkpoints, covering both enterprise and developer use cases. It provides four variants:

-   **FLUX.2 \[pro\]**: Delivers state-of-the-art image quality on par with top proprietary models, with exceptional prompt fidelity and visual accuracy.
-   **FLUX.2 \[flex\]**: Designed for developers who want fine-grained control over generation parameters such as step count and guidance scale.
-   **FLUX.2 \[dev\]**: [A 32B open-weight model](https://huggingface.co/black-forest-labs/FLUX.2-dev) based on the FLUX.2 core architecture. It supports both image generation and editing. You can run it locally with consumer GPUs. For commercial use, you need [separate licensing through Black Forest Labs](https://bfl.ai/licensing).
-   **FLUX.2 \[klein\]**: A compact FLUX.2 family (distilled 9B & 4B) for real-time generation and editing. It unifies text-to-image, image editing, and multi-reference generation in a single architecture, with end-to-end inference as low as sub-second. The [4B variant](https://huggingface.co/black-forest-labs/FLUX.2-klein-4B) can run on consumer GPUs with ~13GB VRAM, and it is a great choice for low-latency, local, and edge deployments.

Note that \[pro\] and \[flex\] can only be accessed through their playgrounds, APIs and launch partners.

Why should you use FLUX.2:

-   **State-of-the-art performance**: FLUX.2 delivers frontier-level image quality that rivals top proprietary models. It is able to generate highly realistic textures, stable lighting, and coherent compositions. You can apply it for professional use cases such as product visuals, marketing assets, and design mockups rather than just experimental demos.
-   **Multi-reference consistency**: FLUX.2 supports up to 10 reference images in a single generation, with strong preservation of character identity, product appearance, and visual style. It’s especially useful for branded content, recurring characters, and multi-scene creative workflows where consistency is important.
-   **Strong prompt obedience**: The model follows complex, structured, and multi-section prompts with high accuracy. You can specify layout, composition rules, typography, lighting, and scene constraints more reliably than with earlier diffusion models. This gives creators and developers much finer control over the final output.

## Reading

### Articles

- [The Best Open-Source Image Generation Models in 2026](https://bentoml.com/blog/a-guide-to-open-source-image-generation-models)
