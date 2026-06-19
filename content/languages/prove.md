title=Prove
tags=language, ai, verification, native
summary=Ai-first intent-first language with verb-based IO, refinement types, and contracts. 
~~~~~~

[Website](https://prove.botwork.se)

**Camp:** Verification
**Author:** Magnus Knutas
**Implementation language:** Python (bootstrap)
**Compilation target:** C (then native via gcc/clang)
**Licence:** Prove Source License v1.0 (language & .prv source) / Apache-2.0 (tooling)
**First seen:** February 2026
**Maturity:** working compiler

## Key idea

Verbs (transforms, validates, derives, creates, matches; inputs, outputs, dispatches; attached, detached, listens, renders) encode intent and IO category in the function declaration. The compiler enforces verb semantics, refinement-type constraints, and ensures/requires/explain contracts. The Prove Source License v1.0 covers all .prv source and prohibits AI training use, dataset inclusion, embedding, and synthetic data generation.

## Thesis

Prove diagnoses the same problem the rest of the verification camp diagnoses &mdash; AI-generated code is cheap to produce and expensive to trust &mdash; and adopts the same general moves: intent-first declarations, hard postconditions (`ensures`), refinement types, no `if`/`else`, errors-as-values, no nulls. Every function carries a verb (`transforms`, `validates`, `derives`, `creates`, `matches` for pure code; `inputs`, `outputs`, `dispatches`, `streams` for IO; `attached`, `detached`, `listens`, `renders` for structured concurrency). The verb is enforced: a `transforms` function cannot call IO functions (diagnostics E361&ndash;E363); `explain` blocks document the chain of operations in controlled natural language, parsed and verified against called functions' contracts.

<p class="pullquote">Source code is covered by an anti-training licence.</p>

Where Prove diverges from Vera and Aver is on the politics rather than the mechanics. Vera publishes a benchmark and invites models to compete. Aver exports proofs and ships an `llms.txt`. Prove ships an *anti-training* licence &mdash; the Prove Source License v1.0, applied automatically by `proof new` to every project &mdash; that prohibits use of `.prv` source code as training data, in dataset inclusion, vector stores, RAG indices, embedding databases, synthetic data generation, sublicensing for AI use, and downstream propagation. AILANG sits closest on effect typing (both ship typed effects), but Prove encodes effect category in the verb itself rather than in a row-polymorphic effect list. The project frames its own stance as "AI resistance" and states that generating semantically correct Prove code "requires genuine understanding, not pattern matching."

## What it looks like.

<div class="code-sample">
  <div class="code">
<pre><span class="kw">matches</span> apply_discount(discount <span class="ty">Discount</span>, amount <span class="ty">Price</span>) <span class="ty">Price</span>
  <span class="ct">ensures</span> result &gt;= <span class="num">0</span>
  <span class="ct">ensures</span> result &lt;= amount
  <span class="ct">requires</span> amount &gt;= <span class="num">0</span>
<span class="kw">from</span>
    <span class="ct">FlatOff</span>(off) =&gt; max(<span class="num">0</span>, amount - off)
    <span class="ct">PercentOff</span>(rate) =&gt; amount * (<span class="num">1</span> - rate)</pre>
  </div>
  <p class="caption">A pure verb (matches), hard postconditions, and a precondition &mdash; all enforced at compile time.</p>
</div>

## Distinctive moves.

- **Verbs as intent, enforced.** Each function declares its purpose with a verb. Pure verbs cannot perform IO. The same name can have multiple verbs and the compiler resolves which to call from context.
- **Anti-training licence.** The Prove Source License v1.0 covers the language, its specification, and all `.prv` source. The compiler tooling (Python bootstrap, docs, editor integrations) is separately Apache-2.0; the project publishes its reasoning for the split under "AI Transparency."
- **Refinement types.** `type Port is Integer:[16 Unsigned] where 1..65535`. Constraints are part of the type, validated at compile time, and used to drive auto-generated edge cases.
- **`explain` against contracts.** Controlled natural language documents the implementation; the compiler parses each row, checks that operations match called functions' behaviours, and rejects explanations whose references aren't real identifiers.
- **Refutation challenges.** `proof check` runs by default and generates plausible-but-wrong mutations of the function body, requiring the author to address each with a `why_not` annotation.
- **Functional iteration only.** `map`, `filter`, `reduce` &mdash; no loops. Errors propagate with `!`.

## Maturity.

v1.3.1 (April 2026), tracked through a clear release history: v1.0.0 (first stable, 22-module standard library, C codegen, region-based memory, 13-pass optimiser, ML-powered LSP), v1.1.0 (March 2026, structured concurrency + GUI + `proof` CLI), v1.2.0 (March 2026, verb consistency overhaul across 22 stdlib modules), v1.3.0/v1.3.1 (April 2026, tree-sitter as sole parser, `dispatches` verb). Source is hosted on a self-hosted Gitea instance at code.botwork.se rather than GitHub. Author: Magnus Knutas. Bootstrap compiler is Python 3.11+; output language is C. The roadmap names v2.0 as a self-hosted compiler. The bet is that the same intent-first mechanism that resists external AI generation is also the substrate for the project's "local, self-contained" generation model &mdash; a deterministic toolchain that produces code from the project's own declarations.

## Agent tooling.

None of the catalogue's usual surface: no `SKILL.md`, no `AGENTS.md`, no `llms.txt`, no MCP server. The licence actively prohibits the dominant tooling pattern. The project ships editor integrations instead &mdash; `tree-sitter-prove` for syntax highlighting, `pygments-prove` for MkDocs/Sphinx, `chroma-lexer-prove` for Gitea/Hugo &mdash; and a single-file installer (`curl -sSf install.sh | sh`) that places a `proof` binary in `~/.local/bin/`. The roadmap lists binary AST format, semantic normalisation, fragmented source, and identity-bound compilation as post-1.0 anti-training features.

## Design DNA

- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Same diagnosis, opposite politics. Both ship mandatory contracts and explicit effects; Vera publishes a benchmark and invites models to compete, Prove ships an anti-training licence that prohibits training use of source.
- **[Aver](https://agentlanguages.dev/languages/aver.md)** *(Verification)* — Camp neighbour with proof export. Both ship intent-first design and contract-style verification; Aver exports to Lean 4 / Dafny and ships llms.txt, Prove ships the anti-training licence and self-hosted Gitea.
- **[AILANG](https://agentlanguages.dev/languages/ailang.md)** *(Verification)* — Both ship effect-typed designs. AILANG carves effects via row polymorphism (IO/FS/Net/Clock/AI); Prove encodes IO category in the verb itself (inputs/outputs/dispatches vs transforms/validates/derives/creates/matches).

## Timeline

- **Feb 2026** — v1.0.0 first stable release. 22-module standard library, intent-driven compiler (verb enforcement, contracts, refinement types), C code generation with region-based memory and a 13-pass optimiser, ML-powered LSP.
- **Mar 2026** — v1.1.0 ships structured concurrency (<code>attached</code>, <code>detached</code>, <code>listens</code>, <code>renders</code> backed by stackful coroutines), terminal UI, GUI via SDL2 + Nuklear, and the <code>proof</code> CLI wrapper.
- **Mar 2026** — v1.2.0 enforces verb semantic guarantees across 22 stdlib modules (~105 corrections); recursive variant types and Value&lt;T&gt; phantom types land.
- **Apr 2026** — v1.3.0 makes tree-sitter the sole parser, renames <code>reads</code> to <code>derives</code>, adds the <code>dispatches</code> verb, integrates linting into the check pipeline. v1.3.1 is a bugfix release.
