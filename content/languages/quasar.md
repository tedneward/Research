title=Quasar
tags=language, ai, orchestration, verification
summary=AI-first language proposal.
~~~~~~

[Paper](https://arxiv.org/abs/2506.12202)

> Penn group's LLM-agent language with automatic parallelisation, conformal-prediction reliability bounds, and approval-gated security; LLMs write a Python subset that transpiles to Quasar.

**Camp:** Orchestration
**Also spans:** Verification
**Author:** Stephen Mell et al. (Penn)
**Implementation language:** N/A (paper-only)
**Compilation target:** N/A (paper-only)
**Licence:** N/A (academic paper)
**First seen:** June 2025
**Maturity:** research paper


## Key idea

Quasar (a backronym for QUick And Secure And Reliable) accepts code actions in a Python subset that is transpiled to a custom language with three built-in properties: automatic parallelisation of independent external calls, compositional conformal prediction for uncertainty quantification, and explicit user-approval gates around sensitive tool invocations. The bet is that the LLM keeps writing the Python it knows while the runtime supplies the guarantees Python lacks.

## Thesis

Quasar starts from the observation that LLM agents increasingly act by writing code, and that Python is the default not because it is well suited but because LLMs are fluent in it. The paper enumerates Python's weaknesses for this role &mdash; limited built-in support for performance, security, and reliability &mdash; and proposes a purpose-built language that addresses all three at once. Performance comes from automatic parallelisation of independent external calls, drawing on Mell, Kallas, Zdancewic and Bastani's "Opportunistically Parallel Lambda Calculus" (arXiv:2405.11361, published as Proc. ACM Program. Lang. 9, OOPSLA2, October 2025). Reliability comes from compositional conformal prediction (Ramalingam, Park and Bastani, "Uncertainty Quantification for Neurosymbolic Programs via Compositional Conformal Prediction", arXiv:2405.15912), which converts model outputs into prediction sets with a user-chosen target error rate. Security comes from user-validated action gates that surface only when the static analysis cannot rule out a sensitive effect. To avoid asking LLMs to learn a new language, the model writes a constrained subset of Python that is transpiled to Quasar.

## Published results

The arXiv v1 (13 Jun 2025) reports an evaluation on the ViperGPT visual question answering agent over the GQA dataset, where LLMs emitting Quasar code instead of Python retain task performance while reducing execution time when possible by 42% and reducing user-approval interactions when possible by 52%, with conformal prediction achieving a chosen target coverage. The OpenReview revision (id TvpaeQVTGQ) extends the evaluation to the CaMeL agent on the AgentDojo prompt-injection benchmark and revises the headline numbers upward to "up to 56%" execution-time reduction and "up to 53%" fewer user approvals.

## Status

No public implementation, repository, or release has been published; the OpenReview submission is under review at the time of cataloguing, and conference acceptance has not been announced. Independent evaluation would require either the transpiler and runtime from the authors or a reimplementation against the published semantics; the ViperGPT/GQA and CaMeL/AgentDojo baselines are public and reproducible. Full author list: Stephen Mell, Botong Zhang, David Mell, Shuo Li, Ramya Ramalingam, Nathan Yu, Steve Zdancewic, Osbert Bastani.

## Design DNA

- **[Boruna](https://agentlanguages.dev/languages/boruna.md)** *(Orchestration)* — Both lift approval gates into a first-class language primitive. Quasar reports a 52% reduction in user-approval interactions by inferring when approval is unnecessary; Boruna routes the same primitive through a deterministic VM that chains every approval into a tamper-evident evidence bundle.
- **[Pel](https://agentlanguages.dev/languages/pel.md)** *(Orchestration)* — The other 2025 academic orchestration paper. Pel replaces the surface language with a Lisp-shaped grammar designed for constrained generation; Quasar keeps a Python subset and inserts the guarantees underneath.
- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Cross-camp foil on what 'make it checkable' means. Vera discharges contracts via Z3 at compile time; Quasar layers conformal prediction over LLM outputs to get a target coverage probability at runtime.
