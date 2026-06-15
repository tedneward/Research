title=Boruna
tags=language, ai, orchestration, verification, vm
summary=AI-first language that focuses on being able to prove what executed (rather than on what code to generate).
~~~~~~

[Source](https://github.com/escapeboy/boruna)

> Deterministic, capability-safe workflow execution. Every effect declared, policy-gated. Hash-chained tamper-evident evidence bundles.

**Camp:** Orchestration
**Also spans:** Verification
**Author:** escapeboy
**Implementation language:** Rust
**Compilation target:** Bytecode (custom VM)
**Licence:** MIT
**First seen:** April 2026
**Maturity:** working compiler

**Agent tooling:**
- MCP server with 10 tools
- AGENTS.md
- CLAUDE.md
- diagnostics and auto-repair commands

## Key idea

Deterministic, capability-safe workflow execution for auditable AI systems. DAG workflows where steps are `.ax` source files. Every side effect — LLM calls, HTTP, database, filesystem — is declared and policy-gated at the VM level. Hash-chained tamper-evident evidence bundles. Deterministic replay. Approval gates for human-in-the-loop. The pitch: when a regulator asks what exactly ran and what the model returned, you can prove it.

## Thesis

Boruna doesn't think the problem with LLM code is the code. It thinks the problem is that when an agent system does something consequential — sends an email, transfers money, modifies a database — you need to be able to prove what ran, what the model said, and who approved it. That's not a language problem. That's a runtime problem. So Boruna builds the runtime.

<p class="pullquote">When a regulator asks what exactly ran, you can prove it.</p>

The unit of computation is a DAG workflow. Each step is an `.ax` source file. Every side effect — LLM call, HTTP request, database write, filesystem mutation — is declared in the source and policy-gated at the VM level. The VM refuses to execute a step that would perform an undeclared effect; the policy layer lets administrators forbid specific declared effects per workflow or per role. Every executed step writes to a hash-chained evidence bundle that's tamper-evident; the bundle is sufficient to replay the workflow deterministically (same inputs, same model responses recorded, same outputs).

## Distinctive moves.

- **Capability-safe by construction.** A step can't reach for an effect it didn't declare. The VM is the enforcement point, not a linter.
- **Hash-chained evidence bundles.** Every step's inputs, outputs, model responses, and approvals chain into a Merkle structure. Tampering breaks the chain.
- **Deterministic replay.** Re-running a workflow against its evidence bundle produces bit-identical results. No "it worked on my machine" for LLM-driven workflows.
- **Approval gates.** Human-in-the-loop steps are a first-class workflow primitive, not bolted on. The approval becomes part of the evidence.
- **MCP server with 10 tools.** Boruna's agent-facing surface lets a coding agent author, validate, and run workflows without leaving the protocol.

## Maturity.

v0.2.0 with 34 commits and 1 release. 557+ tests passing across a 9-crate Rust workspace covering the compiler (lexer, parser, type checker, code generator), the bytecode VM, the orchestrator, and the MCP server. Single-author project; zero stars at the time of cataloguing, which dramatically understates the engineering depth here. The architecture is more carefully thought through than several entries with two orders of magnitude more attention.

The bet is that the regulated-industries angle (financial services, healthcare, government) will discover Boruna before the broader market does. The agent-system gold rush will eventually hit regulators, and when it does, "I can prove what ran" stops being a feature and starts being a requirement.

## Agent tooling.

`AGENTS.md` and `CLAUDE.md` orient agents working in the repository. The MCP server exposes ten tools an agent can call to draft workflows, run them in dry-run mode, validate effect declarations against policy, inspect evidence bundles, and trigger approvals. Diagnostics ship with auto-repair commands — when the type checker rejects a workflow, the diagnostic suggests the specific edit that would satisfy it.

## Design DNA

- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Cross-camp cousin. Both treat agent code as untrusted by default; Vera builds the trust at the type level (contracts), Boruna builds it at the runtime level (policy-gated effects + evidence bundles). Vera's <code>&lt;Inference&gt;</code> effect is conceptually close to Boruna's declared LLM call.
- **[Pel](https://agentlanguages.dev/languages/pel.md)** *(Orchestration)* — Same camp, different stack. Pel argues for grammar-level capability control; Boruna implements bytecode-level capability gating. Pel exists as an academic paper; Boruna ships as a 9-crate Rust workspace.
- **[Quasar](https://agentlanguages.dev/languages/quasar.md)** *(Orchestration)* — Shares the approval-gate intuition. Quasar measured 52% fewer user-approval interactions by lifting approval into the language; Boruna lifts it into the runtime with deterministic replay so the approval can be audited after the fact.
- **[Plumbing](https://agentlanguages.dev/languages/plumbing.md)** *(Adjacent)* — Plumbing defines the wiring between agents at the type level (typed channels, structural morphisms); Boruna defines what runs inside one agent and how it's audited. Complementary rather than competing.

## Timeline

- **Apr 2026** — v0.2.0 published. 9-crate Rust workspace: compiler (lexer, parser, type checker, code generator), bytecode VM, orchestrator, MCP server.
- **Apr 2026** — 557+ tests passing. Hash-chained evidence bundle format stabilises.
- **May 2026** — Catalogued. Still 0 stars; the engineering depth runs ahead of the public profile.
