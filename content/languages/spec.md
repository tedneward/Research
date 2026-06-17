title=Spec
tags=language, ai, orchestration
summary=AI-first language that arranges specialized agents collaborating to produce a set of artifacts describing what the system should do.
~~~~~~

[Source](https://github.com/mronus/spec)

> v0.2 design proposal for a language-agnostic IR for agent-driven development. Six specialised agents (Product, Architect, Scrum, Developer, Tester, DevOps) collaborate on shared .spec.ir artefacts; language-specific code generation is downstream.

**Camp:** Unclassified
**Also spans:** Orchestration
**Author:** M. Abdullah Onus
**Implementation language:** TypeScript (React POC)
**Compilation target:** Not applicable — IR artefacts (.spec.ir files), not executable
**Licence:** MIT
**First seen:** April 2026
**Maturity:** thought experiment

**Agent tooling:**
- Browser-based React/TypeScript POC at mronus.github.io/spec orchestrating six specialised agents end-to-end
- Multi-agent pipeline with feedback loops, state persistence, and resume support
- Support for Claude and GPT models; API keys remain in the browser

## Key idea

Spec separates concerns into two domains. The Spec Domain is language-agnostic: six specialised agents (Product, Architect, Scrum, Developer, Tester, DevOps) collaborate to produce a set of .spec.ir artefacts — contract, module, infrastructure, data, types, interfaces, functions, events, tests, pipeline — that describe what the system should do. The External Agents Domain is language-specific: separate language agents (Java, Go, Terraform, etc.) consume the IR and produce code. The bet is that this separation lets one specification target multiple languages and enables incremental modification with the proposal's claimed 200 tokens of context instead of the 1,500 a comparable Java change requires.

## What it is

Spec is a draft language design proposal at v0.2, not a working compiler. The repository ships a design document (`spec-language-design-proposal-v0.2.md`), a browser-based React/TypeScript proof-of-concept that orchestrates the agent pipeline against Claude or GPT, and a README that explicitly labels the project as a draft for discussion. The IR format defines ten artefact types &mdash; contract.spec.ir, module.spec.ir, infrastructure.spec.ir, data.spec.ir, types.spec.ir, interfaces/*.spec.ir, functions/*.spec.ir, events.spec.ir, tests.spec.ir, pipeline.spec.ir &mdash; each owned by a specific agent role (Product, Architect, Scrum, Developer, Tester, DevOps). The external language agents that would translate IR to running code in Java, Go, Rust, Terraform, or other targets are listed in the future-work section as not yet implemented.

## Why it's here

The catalogue includes Spec as a marker of an architectural position that spans into orchestration. Where the syntactic and verification camps argue about what an agent should write, Spec argues about who should write what, and in what order &mdash; Product before Architect before Developer, with explicit IR handoffs between roles. The distinctive move is to treat the multi-agent pipeline as the primary artefact and language-specific code generation as a downstream concern that can be deferred. The catalogue does not rate Spec against working compilers. It marks it as a different kind of evidence: a structured argument that "language for agents to write" might be the wrong unit of analysis, and that "IR for agents to coordinate over" is the unit that matters.

## Design DNA

- **[Boruna](https://agentlanguages.dev/languages/boruna.md)** *(Orchestration)* — Cross-camp neighbour. Boruna runs DAG workflows with policy-gated effects and hash-chained evidence; Spec coordinates specialist agents producing shared IR artefacts. Both treat the language as one layer in a larger orchestration story.
- **[Pel](https://agentlanguages.dev/languages/pel.md)** *(Orchestration)* — Academic-leaning kin. Both propose architectures for agent collaboration that have not yet shipped a usable language — Pel as a CMU paper, Spec as a draft proposal with a browser-based POC.
