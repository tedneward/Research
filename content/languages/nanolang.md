title=Nanolang
tags=language, ai, verification, syntactic, native, llvm, web assembly
summary=A tiny experimental language designed to be targeted by coding LLMs.
~~~~~~

[Website](https://jordanhubbard.github.io/nanolang/) | [Source](https://github.com/jordanhubbard/nanolang)

> Mandatory shadow test blocks on every function. The proved core (NanoCore) has 193 Coq theorems with zero axioms. Multi-target codegen across C, WebAssembly, LLVM IR, PTX, and RISC-V.

**Camp:** Verification
**Also spans:** Syntactic
**Author:** Jordan Hubbard
**Implementation language:** C
**Compilation target:** C (default), WebAssembly, LLVM IR, PTX, RISC-V
**Licence:** Apache-2.0
**First seen:** September 2025
**Maturity:** working compiler

**Agent tooling:**
- AGENTS.md
- CLAUDE.md
- MEMORY.md ("training reference for patterns and idioms")
- spec.json (machine-readable formal specification)
- .mcp.json
- .claude/, .cursor/, .factory/ config folders
- VS Code extension with LSP (nanolang-lsp) and DAP (nanolang-dap)
- Web playground with CodeMirror-6, share permalinks, live evaluation

## Key idea

Mandatory shadow test blocks on every function (the compiler refuses
to compile without one) plus 6,170 lines of Coq proving the language's
core. NanoCore is the proved subset, not the entire surface language —
algebraic effects, async/await, FFI, the VM, and multi-target codegen
sit outside the proof set. The first-person README persona ("I refuse
to compile a function unless you provide a shadow test block") is
documented as deliberate design, not flourish.

## The thesis.

NanoLang takes the verification camp's diagnosis literally: if LLMs are going to write code, the language should refuse to accept their work without tests, and the language's core should have proofs to back its promises. Every function declaration must be paired with a `shadow` test block; the compiler rejects functions without one. The proved core (NanoCore) has 6,170 lines of Coq across 9 files, 193 theorems and lemmas, zero axioms, zero `Admitted` &mdash; the proofs cover preservation, progress, determinism, semantic equivalence of big-step and small-step, and evaluator soundness against a fuel-based reference interpreter extractable to OCaml. The README announces it in first person: "I refuse to compile a function unless you provide a shadow test block for it."

<p class="pullquote">"I am a minimal programming language designed for machines to write and humans to read. I require tests, I use unambiguous syntax, and my core is formally proved."</p>

The distinctive move is the depth of what is actually proved &mdash; and the honesty about what is not. NanoCore covers integers, booleans, strings, arithmetic, conditionals, mutable variables, while loops, lambda/application, arrays, records, recursive functions, variants, and pattern matching. Algebraic effects, async/await, FFI, the VM, and the multi-target codegen sit outside the proof set, and `formal/README.md` says so plainly. Vera proves contracts at the function level via Z3; NanoLang proves the type system itself, from below. Same camp, complementary layers.

## What it looks like.

<div class="code-sample">
  <div class="code">
<pre><span class="kw">fn</span> <span class="ty">greet</span>(name: <span class="ty">string</span>) -&gt; <span class="ty">string</span> {
  <span class="kw">return</span> (+ <span class="str">"Hello, "</span> name)
}

<span class="kw">shadow</span> greet {
  <span class="ct">assert</span> (== (greet <span class="str">"World"</span>) <span class="str">"Hello, World"</span>)
}

<span class="kw">fn</span> <span class="ty">main</span>() -&gt; <span class="ty">int</span> {
  (<span class="ty">println</span> (greet <span class="str">"World"</span>))
  <span class="kw">return</span> <span class="num">0</span>
}

<span class="kw">shadow</span> main { <span class="ct">assert</span> <span class="kw">true</span> }</pre>
  </div>
  <p class="caption">Every function needs a shadow block. <code>shadow main { assert true }</code> exists only because the compiler refuses to compile without it — and the trivial case still has to satisfy the discipline.</p>
</div>

## Distinctive moves.

- **Mandatory shadow tests.** No function compiles without a `shadow` block. The smallest legal program contains `shadow main { assert true }` &mdash; the discipline applies to the trivial case alongside the substantive one.
- **Coq proofs, zero axioms.** 193 theorems and lemmas across `Syntax.v`, `Semantics.v`, `Typing.v`, `Soundness.v`, `Progress.v`, `Determinism.v`, `Equivalence.v`, `EvalFn.v`, and `Extract.v`. No `Admitted` lemmas; the proofs go through. Built on Rocq Prover (Coq) &ge; 9.0.
- **NanoCore is the proved subset, not the whole language.** The proved fragment is honest about its scope. Effects, async, FFI, the VM, and codegen are out-of-scope for the formal work and the project documents that directly.
- **NanoISA VM with co-process FFI.** Stack-based VM, 178 opcodes, reference-counted GC. External calls run in a separate co-process (`nano_cop`); if they crash, the VM survives. Trap model separates computation from I/O.
- **Multi-target codegen.** Default target is C transpilation. Also `--target wasm` (with source-map sidecar and Ed25519 signing), `llvm`, `ptx`, `riscv`. Production parity is claimed for C and WebAssembly; the other backends are present in the toolchain.
- **Dual notation, prefix and infix.** `(+ a b)` and `a + b` are both legal. The prefix form is described as unambiguous and is the form the formal semantics is stated against.
- **First-person persona.** README, diagnostics, and `AGENTS.md` instruct agents to write in NanoLang's voice. Documented under `docs/PERSONA.md` as a design choice, not a quirk.

## Maturity.

v3.3.7 (April 2026), 51 tagged releases, ~2,156 commits, bootstrap 100% (the compiler compiles itself). Apache-2.0. Hardware support: Ubuntu 22.04+ on x86_64 and ARM64, macOS 14+ Apple Silicon, FreeBSD; Windows via WSL2 only. The author is Jordan Hubbard &mdash; co-founder of FreeBSD in 1993, currently Senior Director for GPU Compute Software at Nvidia &mdash; and the project's GitHub topics include `thought-exercise` and `vibe-coding`, applied by the author himself. The README's "Totally True and Not At All Embellished History" notes the language has "been used in production by exactly one person, who also wrote it." That candour matches the catalogue's tone: the engineering is real, the framing is honest about what the engineering is for.

## Agent tooling.

The repository root ships `AGENTS.md`, `CLAUDE.md`, `MEMORY.md` (self-described as "my training reference for patterns and idioms"), `spec.json` (machine-readable formal specification), `.mcp.json`, and config folders for Claude, Cursor, and Factory. The IDE surface includes a Language Server (`bin/nanolang-lsp`) and Debug Adapter (`bin/nanolang-dap`) plus a VS Code extension; the web playground supports share permalinks and live evaluation. The agent-facing surface is wider than most catalogue entries &mdash; NanoLang ships not just orientation files but its own corpus.

## Design DNA

- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Same camp, different layer of the same idea. Vera proves contracts at the function level via Z3; NanoLang proves the language's core type system itself, from below, via Coq. Vera's <code>&lt;Inference&gt;</code> effect has no NanoLang analogue.
- **[Aver](https://agentlanguages.dev/languages/aver.md)** *(Verification)* — Same-camp neighbour on the ship-the-verification-artefacts axis. Aver exports per-function proofs to Lean 4 and Dafny; NanoLang ships its proofs alongside the source as Coq, zero axioms, 193 theorems.
- **[Magpie](https://agentlanguages.dev/languages/magpie.md)** *(Syntactic)* — Cross-camp foil on the syntactic axis. Magpie strips ambiguity via SSA-as-surface; NanoLang reduces it via prefix-call disambiguation, mandatory annotations, and one canonical form. Different mechanisms for the same diagnosis.
- **[NERD](https://agentlanguages.dev/languages/nerd.md)** *(Syntactic)* — Syntactic-camp direction without the formalism. NERD ships a token-friendly surface and no type system; NanoLang ships Coq proofs. The contrast clarifies what 'unambiguous syntax' costs to back up.
