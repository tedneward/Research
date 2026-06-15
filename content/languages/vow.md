title=Vow
tags=ai, language, verification
summary=AI-first language whose stated audience is not human readers.
~~~~~~

[Website](https://vow-lang.com) | [Source](https://github.com/vow-lang/vow)

> Every function carries machine-checked vows. ESBMC bounded model checking discharges them at compile time. The compiler binary ships its own Claude Code skill, generated from the same source as the toolchain.

**Camp:** Verification
**Author:** Paulo Matos
**Implementation language:** Rust (stage 0); self-hosted in Vow
**Compilation target:** Native (via Cranelift); C (for the ESBMC verification pipeline only)
**Licence:** MIT
**First seen:** February 2026
**Maturity:** working compiler

**Agent tooling:**
- CLAUDE.md
- compiler-bundled Claude Code skill (auto-installed to .claude/skills/vow/)
- vowc skill print --bundle (self-contained markdown for non-Claude harnesses)
- structured JSON diagnostics with counterexamples and blame

## Key idea

Every function declares a `vow` block of `requires`/`ensures`; loops carry `invariant`. The compiler lowers these to obligations for the ESBMC bounded model checker before any code ships. Diagnostics emit JSON in parallel with human text, with explicit Caller/Callee blame on every violation. The compiler binary embeds and auto-installs a Claude Code skill generated from the same compiler version &mdash; "the source of truth for any harness writing Vow code; cannot drift from the toolchain you are running."

## Thesis

Vow is a verification-camp project whose stated audience is not human readers. The homepage announces it directly: "The syntax is not for you. The semantics is not for you. The language is not for you. Yours is only the product." Every module makes vows &mdash; preconditions, postconditions, and loop invariants &mdash; that the compiler lowers to obligations for the [ESBMC](https://esbmc.org) bounded model checker. The CLI emits JSON in parallel with human text on every invocation; counterexamples come back as structured records the agent can read. The intended workflow is CEGIS: write, compile, verify, read counterexamples, fix, iterate.

<p class="pullquote">The syntax is not for you. The semantics is not for you. The language is not for you. Yours is only the product.</p>

The distinctive move is the choice of checker. Vera and Intent dispatch contracts to Z3 SMT; Aver exports them as Lean 4 theorems or Dafny lemmas; NanoLang proves the core type system in Coq from below. Vow chooses ESBMC, a bounded model checker, and accepts the trade that comes with it &mdash; counterexamples are concrete inputs the agent can re-run against, but soundness holds only up to the unwinding bound chosen for each verification call. The repository's `CLAUDE.md` is explicit about the consequence: "Bounds like `n <= 10` (to fit within `--unwind 10`) or `a <= 100` (to help the SMT solver) are verification artefacts. They do not belong in `requires`/`ensures` clauses... If ESBMC can't prove a correct contract, that's ESBMC's problem."

## What it looks like.

<div class="code-sample">
  <div class="code">
<pre><span class="kw">module</span> <span class="ty">Bisect</span>

<span class="kw">fn</span> bisect(lo: <span class="ty">i64</span>, hi: <span class="ty">i64</span>) -&gt; <span class="ty">i64</span> <span class="kw">vow</span> {
  <span class="ct">requires</span>: hi &gt;= lo
} {
  <span class="kw">let mut</span> lo: <span class="ty">i64</span> = lo;
  <span class="kw">let mut</span> hi: <span class="ty">i64</span> = hi;
  <span class="kw">while</span> lo + <span class="num">1</span> &lt; hi <span class="kw">vow</span> {
    <span class="ct">invariant</span>: hi - lo &gt;= <span class="num">0</span>
  } {
    <span class="kw">let</span> mid: <span class="ty">i64</span> = lo + (hi - lo) / <span class="num">2</span>;
    lo = mid;
  }
  lo
}

<span class="kw">fn</span> main() -&gt; <span class="ty">i32</span> [<span class="ct">io</span>] {
  <span class="kw">let</span> r: <span class="ty">i64</span> = bisect(<span class="num">0</span>, <span class="num">64</span>);
  print_i64(r);
  <span class="num">0</span>
}</pre>
  </div>
  <p class="caption">A <code>vow</code> block follows the function signature; loop vows carry <code>invariant</code> clauses. The <code>[io]</code> effect set on <code>main</code> declares the only impurity in the program &mdash; pure functions carry no annotation, and calling an effectful function from a pure one is a type error.</p>
</div>

## Distinctive moves.

- **ESBMC over SMT or theorem provers.** Contracts lower to verification obligations the bounded model checker discharges before codegen. The C emitter exists only to feed that pipeline; native code comes from Cranelift directly.
- **Blame is structured.** `requires` violations fault the Caller; `ensures` and `invariant` violations fault the Callee. The JSON violation record carries the verdict explicitly (`{"error":"VowViolation","vow_id":N,"blame":"Caller"|"Callee",...}`).
- **Compiler-bundled agent skill.** Running `vowc build` in a project that already has a `.claude/` directory writes the skill to `.claude/skills/vow/` the first time, sourced from the running compiler binary. The repository describes the bundle as "the source of truth for any harness writing Vow code... it cannot drift from the toolchain you are running." Non-Claude harnesses get the same bundle via `vowc skill print --bundle`.
- **Canonical form as a compiler pass.** The printer is a stage, not a formatter; `parse → print → parse` is enforced to be idempotent by tests. There is one preferred way to write each construct.
- **Linear types and checked arithmetic at the grammar level.** `linear struct` values must be consumed exactly once; the type checker tracks the obligation. `+!`, `-!` and the rest are distinct token kinds from `+`, `-` &mdash; checked and wrapping arithmetic are not library functions but grammar productions.
- **What is deliberately absent.** No generics, no traits, no closures, no higher-order functions, no macros, no garbage collector. The `CLAUDE.md` design rule rejects any feature that "introduces a new type-system axis."

## Maturity.

`v0.2.0` released 20 May 2026 on a repository created 25 February 2026, MIT-licensed under the `vow-lang` GitHub organisation. The Rust workspace splits across nine crates (`vow-syntax`, `vow-types`, `vow-ir`, `vow-codegen`, `vow-verify`, `vow-runtime`, `vow-diag`, `vow-clif-shim`, `vow`) feeding a Pizlo-style SSA IR and a Cranelift backend. The self-hosted compiler in `compiler/` (13 modules) compiles itself to a byte-identical binary under the project's bootstrap triple test &mdash; stage 0 produces compiler A, compiler A produces compiler B, compiler B produces compiler C, and `sha256sum` of B and C must match. Mutation testing ships as a `vowc mutants` subcommand with a tiered oracle and structured JSON output.

Three substantial programs ship in `examples/` alongside the small contract demonstrations: a deterministic CDCL SAT solver (watched literals, first-UIP learning, non-chronological backtracking, Luby restarts), a UCI-compatible chess engine, and a Lean 4 kernel checker (`vow-lean-kernel`) targeting the Lean Kernel Arena. The author's announcement names the standing gap explicitly: "ESBMC integration is in place and discharges contracts for the example programs, but the corners are still being found... The compiler is written in Vow but its own vows are not all verified end-to-end. Closing that loop is the single most important piece of work ahead." The `benchmarks/` directory holds Vow's implementation of vericoding ([arXiv:2509.22908](https://arxiv.org/abs/2509.22908)) &mdash; 40 problems across 15 Easy, 15 Medium, and 10 Hard tiers, with a Python harness in `bench/` that runs frontier models against paper baselines (Dafny 82%, Verus/Rust 44%, Lean 27%). Published numbers for Vow itself sit on the roadmap rather than in a release.

## Agent tooling.

`CLAUDE.md` runs to ~20 KB and addresses the language design rules to Claude directly; `AGENTS.md` is a nine-byte placeholder. The substantive agent surface is the compiler-emitted skill: `vowc skill install --local` writes `SKILL.md` plus `reference/`, `examples/`, and `schemas/` to `.claude/skills/vow/`; `vowc build` auto-installs the same payload the first time it runs in a project that already has `.claude/`; `vowc skill print --bundle` emits a single self-contained markdown document for raw-API harnesses. Diagnostics from every crate flow through `vow-diag`, which always emits JSON and human text in parallel &mdash; "this is by design, not a flag." `vowc --help` returns a structured JSON capability description by default and human text under `--human`.

## Design DNA

- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Closest design relative. Both ship mandatory contracts on every function and treat the agent as the primary author. Vera dispatches to Z3 SMT and drops parameter names via typed DeBruijn slots; Vow dispatches to the ESBMC bounded model checker, keeps names, and adds linear types plus distinct checked/wrapping arithmetic tokens at the grammar level.
- **[Intent](https://agentlanguages.dev/languages/intent.md)** *(Verification)* — Same camp, same era, different checker. Intent commits to Z3 SMT with runtime enforcement on three backends (Rust, JavaScript, WebAssembly); Vow commits to ESBMC bounded model checking with a single Cranelift native backend and a C emitter that exists only because the verification pipeline needs it.
- **[Aver](https://agentlanguages.dev/languages/aver.md)** *(Verification)* — Same diagnosis, different upper-bound check. Aver exports <code>verify</code> blocks as Lean 4 theorems or Dafny lemmas via Oracle, lifting effectful code into proof artefacts; Vow discharges contracts in-process with ESBMC and emits structured counterexamples for the agent to fix against.
- **[NanoLang](https://agentlanguages.dev/languages/nanolang.md)** *(Verification)* — Different proof tool, different layer. NanoLang ships 193 Coq theorems with zero axioms proving the language's core type system from below; Vow ships ESBMC obligations on every function from above. Both pair the proof discipline with a self-hosted compiler.

## Timeline

- **Feb 2026** — First commit lands (25 February). Rust stage 0 compiler, ESBMC integration, vow block grammar.
- **May 2026** — <code>v0.2.0</code> released (20 May). Self-hosted compiler (13 modules in <code>compiler/</code>) achieves byte-identical binary fixed point under the bootstrap triple test.
- **May 2026** — Public announcement. Author publishes <em>What's in a Vow</em> and ships CDCL SAT solver, UCI chess engine, and a Lean 4 kernel checker (<code>vow-lean-kernel</code>) targeting the Lean Kernel Arena, all written in Vow.
