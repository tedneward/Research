title=Pel
tags=language, ai,
summary=
~~~~~~

[Paper](https://arxiv.org/abs/2505.13453)

> Lisp-flavoured language for orchestrating LLM agents, with capability control enforced at the grammar level and a REPeL self-healing loop modelled on Common Lisp restarts.

**Camp:** Orchestration
**Author:** Behnam Mohammadi (CMU)
**Implementation language:** N/A (paper-only)
**Compilation target:** N/A (paper-only)
**Licence:** N/A (academic paper)
**First seen:** April 2025
**Maturity:** research paper

## Key idea

Pel argues that orchestrating LLM agents should not rely on Python plus a sandbox. Instead, the grammar itself is the capability surface: an LLM emits Pel under constrained generation, and an action the grammar cannot express is an action the agent cannot take. The runtime adds piping, first-class closures, natural language conditions evaluated by an LLM, automatic parallelisation via static dependency analysis, and a REPeL (Read-Eval-Print-Loop) with Common Lisp-style restarts and helper agents for automated error correction.

## Thesis

Pel's diagnosis is that function/tool calling and free-form Python code generation each fail the orchestration problem from opposite directions: tool calling cannot express control flow, and Python is too expressive to safely run without a sandbox. The paper introduces Pel as a Lisp-inspired, homoiconic, minimal-grammar language whose syntactic surface is the capability surface. Because the grammar is small enough to be used as a constrained-decoding target, an LLM cannot emit an action the grammar cannot express; capability control becomes a property of generation, not a property of runtime sandboxing. The design takes additional cues from Elixir (piping for linear composition), Gleam (typing discipline), and Haskell (first-class closures and partial application). A REPeL &mdash; Read-Eval-Print-Loop with Common Lisp-style restarts &mdash; couples an evaluator to LLM-powered helper agents that propose restart choices when an error is signalled, so error recovery is a language feature rather than an application concern.

## Published results

The paper is a design and rationale document rather than a benchmark study. It specifies the grammar, data types, closure semantics, piping operators, list operations, control flow, the natural-language condition form, and automatic asynchronicity via static dependency analysis. Pel is the implementation substrate for BEACON (Business Enhancement through Adaptive COordinated Networks), Mohammadi's separate SSRN paper (abstract 5191583), which describes a hierarchical multi-agent framework distributing specialised knowledge across marketing, finance, HR, and strategic-planning agents for small and family-owned businesses; BEACON reports advantages over single-model generative AI on information retrieval accuracy, cost-efficiency, and interpretability, with Pel cited as the orchestration substrate.

## Status

Pel exists as an arXiv preprint (v1 3 Apr 2025; v2 9 Jun 2025) by a single author who completed a PhD at CMU Tepper in 2025 (thesis "Human-AI Interaction in the Era of Large Language Models (LLMs)" posted to KiltHub on 9 Jul 2025) and joined UT Dallas's Naveen Jindal School of Management as tenure-track faculty in Quantitative Marketing. The paper reports that Pel is used inside BEACON, which is supported by a BNY Foundation of Southwestern Pennsylvania fellowship via the Center for Intelligent Business at Tepper. No public implementation, package, or repository has been released; independent evaluation would require either a reference compiler or access to the BEACON codebase.

## Design DNA

- **[Boruna](https://agentlanguages.dev/languages/boruna.md)** *(Orchestration)* — Same camp, different layer. Pel argues for grammar-level capability control; Boruna gates the same effects at the bytecode VM. Pel is a paper; Boruna ships a 9-crate Rust workspace.
- **[Quasar](https://agentlanguages.dev/languages/quasar.md)** *(Orchestration)* — The other 2025 academic orchestration paper. Quasar transpiles a Python subset and instruments it with conformal prediction and approval gates; Pel replaces the surface language entirely and constrains generation against its grammar.
- **[Marsha](https://agentlanguages.dev/languages/marsha.md)** *(Orchestration)* — Two-year-earlier predecessor on the same axis. Marsha treats the LLM as a compiler back-end producing Python; Pel treats the LLM as a code emitter constrained by a grammar designed for it.
