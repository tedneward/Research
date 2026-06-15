title=Aver
tags=language, ai, verification, rust, web assembly, vm
summary=AI-first language that focuses its intent on the code reviewer, not the author/generator.
~~~~~~

[Website](https://averlang.dev) | [Source](https://github.com/jasisz/aver)

> Every function carries intent, declared effects, and a colocated verify block. Pure verify blocks export to Lean 4 theorems and Dafny lemmas; effectful ones lift through the Oracle proof export.

**Camp:** Verification
**Author:** jasisz
**Implementation language:** Rust
**Compilation target:** bytecode VM, Rust, WebAssembly GC + wasip2 (Lean 4 / Dafny via proof export)
**Licence:** MIT
**First seen:** February 2026
**Maturity:** working compiler

**Agent tooling:**
- CLAUDE.md
- llms.txt

## Key idea

Co-locate intent, effects, and verification with the function body. Every function carries a prose intent (?), an effect declaration (!), and a colocated verify block. Pure verify blocks export as Lean 4 theorems and Dafny lemmas; effectful ones lift through Oracle, which quantifies over bounded effect parameters in the exported theorem.

## Thesis

Aver is a verification-camp project that names its target audience explicitly: the reviewer, not the generator. Every function carries a prose intent (`? "..."`), an effect declaration (`! [Console.print]`), and a colocated `verify` block of `expression => expected` cases. Pure verify blocks export as Lean 4 theorems or Dafny lemmas through `aver proof --backend lean|dafny`; effectful functions get the same treatment via Oracle, which lifts classified effects (`Random`, `Http`, `Disk`, `Time`, `Console.readLine`, ...) into proof artefacts as explicit function parameters typed with bounded subtypes (`RandomFloatInUnit`). The exported theorem quantifies over every possible such function, not just the one the test stub provided. Architectural choices are first-class syntax: `decision UseResultNotExceptions { chosen = "Result", rejected = ["Exceptions"], ... }`.

<p class="pullquote">Code is cheap to generate. Expensive to trust.</p>

The distinctive move shows up in the comparison with Vera. The two share design DNA &mdash; mandatory verification artefacts, explicit effects, no `if`/`else`, no closures, no exceptions, no nulls, no loops &mdash; but disagree on what to drop. Vera drops names entirely via De Bruijn slot references (`@Int.0`). Aver keeps names and makes the surrounding metadata mandatory. Vera's bet is that names are the failure mode; Aver's is that absence of intent is.

## What it looks like.

<div class="code-sample">
  <div class="code">
<pre><span class="kw">fn</span> safeDivide(a: <span class="ty">Int</span>, b: <span class="ty">Int</span>) -&gt; <span class="ty">Result</span>&lt;<span class="ty">Int</span>, <span class="ty">String</span>&gt;
    <span class="cm">? "Safe integer division. Returns Err on zero."</span>
    <span class="kw">match</span> b
        <span class="num">0</span> -&gt; <span class="ct">Result.Err</span>(<span class="str">"Division by zero"</span>)
        _ -&gt; <span class="ct">Result.Ok</span>(a / b)

<span class="kw">verify</span> safeDivide
    safeDivide(<span class="num">10</span>, <span class="num">2</span>) =&gt; <span class="ct">Result.Ok</span>(<span class="num">5</span>)
    safeDivide(<span class="num">7</span>, <span class="num">0</span>)  =&gt; <span class="ct">Result.Err</span>(<span class="str">"Division by zero"</span>)</pre>
  </div>
  <p class="caption">Prose intent (?), no if/else, and a colocated verify block. The function ships its specification.</p>
</div>

## Distinctive moves.

- **Mandatory intent.** Every function carries a `?` prose description directly after the signature. Functions with effects but no description warn.
- **Effects as type signatures.** `! [Http.get]` declares a specific capability; `! [Http]` covers the namespace. Violations are type errors, with `aver.toml` constraining which hosts and paths are reachable.
- **Verify, then prove.** The same `verify` block runs as sampled cases (`aver verify`), adversarial-profile checks (`aver verify --hostile`), or as a Lean 4 / Dafny export (`aver proof`). The four readings can disagree on identical source &mdash; the Oracle page walks one through.
- **Oracle for effectful code.** Classified effects are lifted into proof artefacts via `BranchPath` and per-branch counters; the theorem quantifies over them universally.
- **`aver context` for agents.** Token-budgeted export of types, effects, and intents (`--budget 10kb`), designed to fit an LLM window.
- **Decisions as syntax.** `decision` blocks make ADRs queryable from the codebase, not from a wiki.

## Maturity.

v0.21 on crates.io (`cargo install aver-lang`), MIT-licensed, written in Rust, primary author `jasisz`. Three backends: a bytecode VM, native Rust codegen, and a standalone WASM-GC target (additionally lowered to wasip2 / WASI 0.2 Component Model for server-side deployment) &mdash; the site demonstrates the latter with seven games compiled directly to WebAssembly GC, including Snake at 4.3&nbsp;KiB and a roguelike at 25.6&nbsp;KiB on Chrome 119+/Firefox 120+/Safari 18.2+. Proof export targets Lean 4 (via `lake build`) and Dafny. The toolchain surface is wide and functional. The bet is that the same source can serve as implementation and reviewable specification, with proof export as the upper-bound check.

## Agent tooling.

The site publishes `llms.txt` at averlang.dev/llms.txt &mdash; a long-form crib sheet covering syntax, the `=>` separator (vs `=`), constructor qualification (`Result.Ok`, never bare `Ok`), and a numbered list of the most common LLM mistakes. `CLAUDE.md` and a `.claude/skills/` directory ship in the repo. The `aver context` command exports a token-budgeted slice of the codebase. Diagnostics ship with structured hints (`Hint: add ! [Console.print]`); the playground renders the same diagnostics live.

## Design DNA

- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Closest design relative. Both ship mandatory verification artefacts, explicit effects, no if/else, no exceptions. Vera drops variable names entirely (@Int.0); Aver keeps names and makes the surrounding metadata mandatory. Aver became the first non-Python/TS baseline integrated into VeraBench, described in the bench README as &lsquo;a Haskell-inspired language with zero LLM training data.&rsquo;
- **[Prove](https://agentlanguages.dev/languages/prove.md)** *(Verification)* — Same camp, opposite politics. Both ship contracts and explicit effects; Aver ships an llms.txt and welcomes AI authoring, Prove ships an anti-training licence that prohibits training use of source.
- **[Pact](https://agentlanguages.dev/languages/pact.md)** *(Verification)* — Adjacent design DNA. Both treat intent and effects as declarations on every function (Aver's ? and ![Effect]; Pact's intent and needs db). Aver pushes proof export; Pact pushes built-in SQLite and HTTP.

## Timeline

- **Apr 2026** — First external language integrated into VeraBench as a baseline alongside Python and TypeScript &mdash; described in the bench README as &lsquo;a Haskell-inspired language with zero LLM training data, providing a second data point alongside Vera for the zero-training-data thesis.&rsquo;
- **May 2026** — v0.21 published on crates.io. Oracle proof export to Lean 4 and Dafny stabilises. Seven games shipped to WASM-GC (Snake at 4.3&nbsp;KiB, Doom at 20.4&nbsp;KiB, roguelike at 25.6&nbsp;KiB) on Chrome 119+/Firefox 120+/Safari 18.2+.
