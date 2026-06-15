title=Vera
tags=language, ai, verification, orchestration, web assembly
summary=Programming language optimized for AI.
~~~~~~

[Website](https://veralang.dev) | [Source](https://github.com/aallan/vera) | [Workbench](https://github.com/aallan/vera-bench)

> Mandatory contracts on every function. Z3 SMT verification. Typed slot references replace variable names. LLM inference is a first-class typed effect.

**Author:** Alasdair Allan
**Implementation language:** Python
**Compilation target:** WebAssembly
**Licence:** MIT
**First seen:** February 2026
**Maturity:** working compiler

**Agent tooling:**
- SKILL.md
- AGENTS.md
- CLAUDE.md
- LLM-oriented diagnostics
- stable error codes (E001–E702)
- JSON diagnostic output

## Key idea

Mandatory requires/ensures/effects contracts on every function. Three-tier Z3 SMT verification. Typed De Bruijn slot references (@T.n) instead of variable names — the only language in the space that drops names. LLM inference is a first-class typed effect. The thesis: the model doesn't need to be right, it needs to be checkable.

## Thesis

Vera takes the verification camp's diagnosis literally. If LLMs make semantic errors faster than humans can catch them by reading code, the compiler has to do the catching. Every function declares preconditions and postconditions; the compiler discharges them via the Z3 SMT solver in a three-tier scheme (compile-time, runtime guard, runtime check) before any code runs.

The distinctive move is replacing variable names with typed slot references. A function `safe_divide(@Int, @Int -> @Int)` has no parameter names — its arguments are referred to as `@Int.0` (most recent) and `@Int.1` (next most recent) using De Bruijn indexing. The empirical literature shows models are particularly vulnerable to naming-related errors: choosing misleading names, reusing names incorrectly, losing track of which name refers to which value. Vera's answer is to remove names from the language entirely.

## What it looks like.

<div class="code-sample">
  <div class="code">
<pre><span class="kw">public</span> <span class="kw">fn</span> safe_divide(<span class="sl">@Int</span>, <span class="sl">@Int</span> -&gt; <span class="sl">@Int</span>)
  <span class="ct">requires</span>(<span class="sl">@Int.1</span> != <span class="num">0</span>)
  <span class="ct">ensures</span>(<span class="sl">@Int.result</span> == <span class="sl">@Int.0</span> / <span class="sl">@Int.1</span>)
  <span class="ct">effects</span>(pure)
{
  <span class="sl">@Int.0</span> / <span class="sl">@Int.1</span>
}</pre>
  </div>
  <p class="caption">Division by zero is not a runtime error — it is a type error. A caller that can't prove the denominator is non-zero won't compile. <code>@Int.1</code> is the first parameter (next-most-recent binding); <code>@Int.0</code> is the second (most-recent).</p>
</div>

## Distinctive moves

- **Mandatory contracts.** Every function carries requires/ensures/effects clauses. There's no opt-out; the grammar rejects functions without them.
- **De Bruijn slot references.** No variable names at the parameter level. `@T.n` denotes the *n*-th-most-recent binding of type `T`.
- **Typed effects, including inference.** LLM calls are an `<Inference>` effect. A function that doesn't declare it can't make model calls. The effect system tracks model usage up the call graph.
- **Three-tier verification.** Some contracts discharge at compile time via Z3; some become runtime guards; some become runtime checks. The tier is determined by which fragment of arithmetic the clause lives in.
- **LLM-oriented diagnostics.** Every error code is stable (E001–E702); every diagnostic carries a fix hint and a spec reference. The CLI emits JSON for tooling.

## Maturity

Vera is at v0.0.157+ with 300+ stars, 3,400+ tests at 96% coverage, 76 conformance programs validating every language feature, and a 13-chapter specification. The reference compiler is Python; programs compile to WebAssembly via wasmtime and run in the browser. Published VeraBench results report 93% flagship correctness on zero training data, matching Python.

Current focus is standard-library breadth. Open questions remain in monomorphisation reindexing and GC-rooting around inference calls. The language is usable but the surrounding ecosystem (LSP, package registry, IDE plug-ins) is still building.

## Agent tooling

Three documents in the repo target agent authors directly: `SKILL.md` (complete language reference for agents writing Vera), `AGENTS.md` (setup for any agent system), and `CLAUDE.md` (project orientation for Claude Code specifically). All three are rendered into `llms.txt` and `llms-full.txt` for ingestion by agent frameworks. The diagnostics output JSON when asked, with stable error codes that can be referenced from agent prompts.

## Design DNA

- **[Aver](https://agentlanguages.dev/languages/aver.md)** *(Verification)* — Closest design relative. Co-located verify blocks, Lean 4 proof export, decision blocks. Different syntax for the same diagnosis. Now integrated into VeraBench.
- **[Prove](https://agentlanguages.dev/languages/prove.md)** *(Verification)* — Same verification diagnosis, opposite politics. Licence explicitly prohibits AI training use. Refinement types, verb-based IO tracking.
- **[AILANG](https://agentlanguages.dev/languages/ailang.md)** *(Verification)* — Capability-based effects with row polymorphism. Where Vera tracks <code>&lt;Inference&gt;</code> as one effect, AILANG carves it into IO/FS/Net/Clock/AI.
- **[Magpie](https://agentlanguages.dev/languages/magpie.md)** *(Syntactic)* — Cross-camp foil. Magpie strips ambiguity at the surface (SSA form); Vera adds a layer of mechanical checks. Different bets on where the error budget should be spent.

## Timeline

- **Feb 2026** — First public release (v0.0.4). Grammar, parser, and type checker. No verifier yet.
- **Mar 2026** — Z3 verifier lands. Three-tier verification scheme published. First externally-contributed example merges.
- **Apr 2026** — VeraBench published with 93% flagship correctness vs Python baseline on zero training data.
- **Apr 2026** — <code>&lt;Inference&gt;</code> effect added as first-class typed effect. Aver becomes first external language integrated into VeraBench.
- **May 2026** — v0.0.157 releases. 300+ stars, 76 conformance programs, 13-chapter spec.
