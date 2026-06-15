title=Magpie
tags=language, ai, syntactic, llvm, web assembly
summary=Language designed for AI use by setting SSA as the surface syntax.
~~~~~~

[Website](https://magpie-lang.com) | [Source](https://github.com/magpie-lang/magpie)

> Every value %-prefixed and typed at definition; one canonical way to express each operation; compiles to native via LLVM.

**Camp:** Syntactic
**Author:** Magpie Language Developers
**Implementation language:** Rust
**Compilation target:** LLVM IR / native, also WebAssembly
**Licence:** MIT
**First seen:** April 2026
**Maturity:** early implementation

**Agent tooling:**
- SKILL.md
- AGENTS.md

## Key idea

The textual program is already in SSA form. Every binding is %-prefixed and typed at definition, basic blocks are explicit, branches and ownership transitions are first-class operations. The bet is that removing surface ambiguity reduces LLM error rates more than added verification does.

## Thesis

Magpie is a syntactic-camp project that takes the camp's premise to its logical end: don't add verification, remove ambiguity. The site states the goal directly &mdash; "Magpie eliminates ambiguity so LLMs can write perfect code on the first try" &mdash; and the language realises it by making the textual program identical to the compiler's intermediate representation. Every value is named at the point of definition with a `%`-prefixed identifier, typed inline, and assigned exactly once. Basic blocks are explicit (`bb0:`). Branches are explicit (`cbr`, `br`). Ownership transitions (`borrow`, `mutborrow`, `share`) are first-class operations. The premise is that the hidden semantics of conventional syntax &mdash; operator overloading, implicit conversions, invisible lifetime rules &mdash; are exactly the places LLMs hallucinate.

<p class="pullquote">~2.3× more tokens per operation, but eliminates the hidden rules that cause AI retries and borrow checker failures.</p>

The distinctive move shows up in the cross-camp comparison with [Vera](/languages/vera). Vera adds verification on top of conventional surface syntax (mandatory contracts, Z3 discharge, the `<Inference>` effect). Magpie strips the surface itself. Vera says "let the compiler catch what the model gets wrong." Magpie says "don't give the model anywhere to be wrong in the first place." [NERD](/languages/nerd) takes a similar diagnosis on the syntactic side but bets on minimal English-like tokens; Magpie bets on machine-style explicit SSA.

## What it looks like.

<div class="code-sample">
  <div class="code">
<pre><span class="kw">module</span> demo.main
<span class="kw">exports</span> { <span class="sl">@main</span> }
<span class="kw">imports</span> { }
<span class="kw">digest</span> <span class="str">"0000000000000000"</span>

<span class="kw">fn</span> <span class="sl">@add_two</span>(a: <span class="ty">i64</span>, b: <span class="ty">i64</span>) -&gt; <span class="ty">i64</span> {
<span class="sl">bb0</span>:
  <span class="sl">%sum</span>: <span class="ty">i64</span> = i.add { lhs=<span class="sl">%a</span>, rhs=<span class="sl">%b</span> }
  <span class="kw">ret</span> <span class="sl">%sum</span>
}</pre>
  </div>
  <p class="caption">Every value is %-prefixed, typed at definition, and computed by a named operation with named operands.</p>
</div>

## Distinctive moves

- **SSA as the surface.** The textual program is already in SSA: every binding is `%`-prefixed, typed, assigned exactly once. The parser doesn't construct an IR &mdash; the source is the IR.
- **Operations as records.** `i.add { lhs=%a, rhs=%b }` instead of `a + b`. Overflow behaviour, type coercion, and operand order are explicit in the syntax.
- **Explicit ownership operations.** `borrow.shared`, `mutborrow`, `share` are statements, not inferences. The borrow checker has nowhere to hide.
- **One way per concept.** Branching is `cbr` and `br`, full stop. The site reports a vocabulary-complexity ratio of 0.107 against Rust's 0.225 and TypeScript's 0.231.
- **Token cost made explicit.** The project publishes the trade: ~2.3× more tokens per operation, against fewer retry loops and borrow-checker failures.

## Maturity

A Rust workspace at v0.1: 44 commits, 3 stars, 1 fork, no releases, MIT-licensed, attributed in the homepage footer to "© 2026 Magpie Language Developers." The crate set covers lexer, parser, semantic analysis, type checking, ownership checking, an MPIR lowering with a verifier, ARC insertion, and codegen paths for LLVM-text and WASM. Benchmarks published on the site report a 155&nbsp;ms compile time for the sample program against Rust's 234&nbsp;ms and TypeScript's 268&nbsp;ms, with execution speed matching Rust at 32&nbsp;ms and peak memory at 1.6&nbsp;MB against Rust's 1.4&nbsp;MB and TypeScript's 69.2&nbsp;MB. Diagnostics ship stable codes (`magpie explain MPT2014`) and JSON output (`--output json`/`jsonl`). The standard library is small; the surrounding ecosystem (LSP, registry, IDE plug-ins) doesn't exist yet. The bet is that a small, machine-shaped surface plus structured diagnostics will outperform conventional surface plus verification for first-try generation.

## Agent tooling

The repository ships `SKILL.md` (a coding-and-diagnostic guide written for agents) and `AGENTS.md` alongside `DOCUMENTATION.md` and `DOCUMENTATION_QUICKSTART.md`. The CLI exposes `magpie mcp serve`, `magpie memory build`/`query`, and `magpie ctx pack` for agent workflows; `--output json` and `--output jsonl` modes emit structured diagnostics with stable codes. Token-efficiency claims live in `BENCHMARK.md`.

## Design DNA

- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Cross-camp foil. Vera adds a verification layer on top of conventional surface syntax; Magpie strips the surface itself. Vera bets on mechanical checks; Magpie bets on no place to be wrong.
- **[NERD](https://agentlanguages.dev/languages/nerd.md)** *(Syntactic)* — Same syntactic camp, opposite tactic. NERD strips down to minimal English-like tokens; Magpie expands to explicit SSA. Both bet that one canonical shape beats many.
- **[X07](https://agentlanguages.dev/languages/x07.md)** *(Syntactic)* — Adjacent syntactic move. X07 ships canonical JSON x07AST and JSON Patch quickfixes; Magpie ships textual SSA. Different bets on what the canonical form should look like.
