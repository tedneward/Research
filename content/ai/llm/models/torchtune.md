title=Torchtune
tags=ai, llm, model, fine-tune
summary=A PyTorch-native library for fine-tuning LLMs.
~~~~~~
[Website](https://github.com/pytorch/torchtune)

It's built for users who want full control over the training pipeline without relying on high-level abstractions or opaque training frameworks. Torchtune follows PyTorch’s core principles: usability over everything else. It avoids unnecessary abstractions and emphasizes:

-   Native PyTorch components
-   Composition over inheritance
-   Clear training logic instead of hidden framework mechanics
-   Test-driven development and correctness at every level

Key features:

-   Modular LLM implementations written in pure PyTorch.
-   Training recipes for a variety of fine-tuning techniques like full fine-tuning, LoRA, and QLoRA.
-   Easy configuration with YAML files to manage datasets, models, hyperparameters, and hardware settings.
-   Interoperability with model zoos through checkpoint conversion tools.

Torchtune is ideal if you prefer working directly in PyTorch and want to customize everything, from data preprocessing to training logic. It’s especially useful for researchers, developers, and engineers who value transparent code, reproducibility, and direct access to model internals.

