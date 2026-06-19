title=Lumen
tags=ai, language, llvm, orchestration
summary=AI-first language intended for humans authoring agent workflows.
~~~~~~

> Markdown-native source (.lm.md). Algebraic effects, grants for tool and model calls, @deterministic compile-time enforcement, and pipeline / machine / memory process kinds. A language for humans authoring agent workflows.

**Camp:** Orchestration
**Author:** alliecatowo
**Implementation language:** Rust
**Compilation target:** LIR bytecode → register-based VM (~100 opcodes); WebAssembly via lumen-wasm
**Licence:** MIT
**First seen:** February 2026
**Maturity:** working compiler
**Site:** https://alliecatowo.github.io/lumen/
**Repo:** https://github.com/alliecatowo/lumen

**Agent tooling:**
- AGENTS.md (multi-agent dev team config)
- CLAUDE.md
- .opencode/agents/
- LSP server (lumen-lsp) with semantic search
- VS Code extension
- Tree-sitter grammar
- MCP provider crate (lumen-provider-mcp)
- emit-bytecode-as-JSON CLI (`lumen emit`)

## Key idea

Lumen is for humans authoring agent workflows, not for agents to author general code — it earns its place in the catalogue via the orchestration-camp criterion of first-class effect declarations for model calls and agent-coordination primitives. Algebraic effects appear in function signatures after a slash; grants constrain every call to a tool with explicit caps; @deterministic enforces rejection of nondeterministic ops at compile time; pipeline / machine / memory are first-class process kinds. Source is markdown-native — .lm.md files unify code and documentation in one artefact.

## Thesis

Lumen is a language for humans, but its target is the substrate above the model rather than the model itself. The catalogue's nominal inclusion bar is "designed for LLMs to author code"; Lumen earns its place via the orchestration-camp criterion of first-class effect declarations for model calls and agent-coordination primitives. The vocabulary is the giveaway: `cell` (function), `effect`, `grant`, `agent`, `pipeline`, `machine`, `memory` are all language keywords. Functions declare effects in the return type after a slash (`cell main() -> String / {Log}`); tools must be granted with explicit caps (`grant Chat max_tokens 1024 temperature 0.7`); the runtime can be locked into `@deterministic true` mode that rejects nondeterministic operations at compile time, not at runtime.

<p class="pullquote">Build deterministic agent workflows with static types, first-class AI primitives, and markdown-native source files.</p>

The distinctive move is making the source file the same artefact as the documentation. Three source extensions ship: `.lm.md` (markdown with fenced Lumen blocks), `.lm` (raw source), and `.lumen` (markdown-native). The compiler's first pipeline stage is markdown extraction &mdash; code and prose share one file, and the model writing one writes the other. Where Boruna does deterministic-workflow enforcement at the bytecode VM via policy-gated effects and hash-chained evidence, Lumen does it at the type system via algebraic effects, grants, and the `@deterministic` annotation. Same orchestration-camp diagnosis, different layer.

## What it looks like

<div class="code-sample">
  <div class="code">
<pre><span class="kw">effect</span> <span class="ty">Log</span>
  <span class="kw">cell</span> info(msg: <span class="ty">String</span>) -&gt; <span class="ty">Unit</span>
<span class="kw">end</span>

<span class="kw">cell</span> <span class="ty">main</span>() -&gt; <span class="ty">String</span> / {<span class="ct">Log</span>}
  <span class="kw">perform</span> <span class="ty">Log</span>.info(<span class="str">"Starting"</span>)
  <span class="kw">return</span> <span class="str">"Done"</span>
<span class="kw">end</span>

<span class="kw">handle</span> main() <span class="kw">with</span> <span class="ty">Log</span>.info(msg) -&gt; resume(unit)
  print(<span class="str">"LOG: {msg}"</span>)
<span class="kw">end</span></pre>
  </div>
  <p class="caption">The <code>/ {Log}</code> in the return type declares the effect. <code>perform</code> invokes it; <code>handle ... with ...</code> discharges it. One-shot delimited continuations under the hood. <code>cell</code> is the function keyword — Lumen does not use <code>fn</code>.</p>
</div>

## Distinctive moves

- **Markdown-native source.** `.lm.md` files contain markdown prose with fenced `lumen` blocks. The compiler extracts code as its first pipeline stage. Documentation and implementation are one artefact.
- **`cell` is the function keyword.** Not `fn`. Cells take typed parameters and declare effects in the return type after a slash.
- **Algebraic effects, first-class.** `effect Log` declarations, `perform` to invoke, `handle ... with ...` to discharge. The runtime uses one-shot delimited continuations; opcodes `Perform`, `HandlePush`, `HandlePop`, and `Resume` are first-class in the VM.
- **Grants as syntactic policy.** `grant Chat max_tokens 1024 temperature 0.7` constrains every call to that tool. Policy lives in source, not configuration &mdash; Boruna's effect declarations lifted to the language surface.
- **`@deterministic true` mode.** A compile-time annotation that rejects `uuid()`, `timestamp()`, and other nondeterministic operations. The static analogue of Boruna's runtime deterministic replay.
- **Three process kinds.** `pipeline` for auto-chained stages (extract → transform → load), `machine` for state graphs, `memory` for key-value stores. Each is a first-class language construct rather than a library pattern.
- **MCP as a provider crate.** `lumen-provider-mcp` ships alongside `lumen-provider-http`, `lumen-provider-json`, `lumen-provider-fs`, `lumen-provider-gemini`, `lumen-provider-crypto`, `lumen-provider-env`. MCP is one tool source among several, not the privileged one.

## Maturity

v0.1.10 (February 2026), 352 commits, ~5,300 passing tests across all crates (AGENTS.md figure; the README's 1,365+ is at a different cut). MIT-licensed, written in Rust (96.5% of the source), compiles to LIR bytecode for a register-based VM with ~100 opcodes, 32-bit fixed-width encoding, and COW collections via `Rc::make_mut`. The workspace contains 12+ crates covering compiler, VM, runtime, CLI, LSP, JIT codegen, WebAssembly bindings, tensor operations, and provider integrations. Single-author at the human level (`alliecatowo`); AGENTS.md notes that "only the Delegator agent commits code" &mdash; the contributors listing reflects agent runs of the project's own multi-agent dev team.

## Agent tooling

The agent-facing surface is unusually elaborate. `AGENTS.md` declares a multi-agent development team &mdash; Delegator (Gemini 3 Pro), Auditor, Debugger (Claude Opus 4.6), Coder (Claude Sonnet 4.5), Worker (Claude Haiku 4.5), Tester, Task Manager, Performance, Planner &mdash; each with a defined role and only the Delegator authorised to commit. `CLAUDE.md` and `.opencode/agents/` provide further orientation. The LSP includes semantic search; the VS Code extension covers `.lm.md` files; a tree-sitter grammar ships at `tree-sitter-lumen/`. The CLI's `lumen emit` mode outputs bytecode as JSON for downstream agent consumption.

## Design DNA

- **[Boruna](https://agentlanguages.dev/languages/boruna.md)** *(Orchestration)* — Closest design relative. Both target deterministic AI workflows. Boruna enforces at the bytecode VM via policy-gated effects and hash-chained evidence bundles; Lumen enforces at the type system via algebraic effects, grants, and a compile-time <code>@deterministic</code> annotation. Both ship MCP integration. Lumen targets humans authoring workflows; Boruna targets auditable execution.
- **[Plumbing](https://agentlanguages.dev/languages/plumbing.md)** *(Adjacent)* — Plumbing wires agents (typed channels, copy-discard symmetric monoidal category); Lumen is what runs inside a single node of that wiring. Complementary substrates rather than competitors.
- **[AILANG](https://agentlanguages.dev/languages/ailang.md)** *(Verification)* — Cross-camp on effect systems. AILANG's row-polymorphic Hindley-Milner with capability categories (IO/FS/Net/Clock/AI) is the verification cousin of Lumen's effect-row syntax. Different mechanism, same diagnosis: model calls must be visible in the signature.
