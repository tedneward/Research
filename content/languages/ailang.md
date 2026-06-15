title=AILang
tags=language, ai, verification
summary=Purely-functional, effect-typed substrate language for AI-generated code.
~~~~~~

[Website](https://ailang.sunholo.com) | [Source](https://github.com/sunholo-data/ailang) | [Benchmark Dashboard](https://ailang.sunholo.com/docs/benchmarks/performance)

> Row-polymorphic Hindley-Milner with capability-based effects (IO, FS, Net, Clock, AI). No loops, lambda calculus only. Written autonomously by AI agents.

**Camp:** Verification
**Author:** Mark Edmondson / Sunholo
**Implementation language:** Go
**Compilation target:** Native binaries, WebAssembly
**Licence:** Apache-2.0
**First seen:** September 2025
**Maturity:** working compiler

**Agent tooling:**
- SKILL.md
- AGENTS.md
- CLAUDE.md
- MCP server
- llms.txt
- Claude Code plugin
- Gemini CLI extension
- slash commands

## Key idea

AILANG ships a purely functional, effect-typed substrate for AI-generated code. The type system is Hindley-Milner with row polymorphism; the effect system carves authority into capability categories (IO, FS, Net, Clock, AI) that must be granted at the CLI with --caps. There are no loops — the language commits to lambda calculus, pattern matching, and ADTs as the only forms of control. The compiler itself is written autonomously by AI agents via a coordinator.

## Thesis

AILANG takes the verification camp's diagnosis and applies it at the layer of authority. The diagnosis is that LLMs hallucinate side effects &mdash; network calls in pure functions, filesystem writes in helpers that look read-only, model calls in code paths the operator never approved. AILANG's answer is to carve effects into capability categories &mdash; `IO`, `FS`, `Net`, `Clock`, `AI` &mdash; and make every one of them visible in the function's signature, row-polymorphically, with Hindley-Milner inference filling in the rest. A function that doesn't declare an effect can't perform it; a run that wasn't given a capability at the CLI can't grant it from inside.

<p class="pullquote">For humans, a language is a tool for expression. For AIs, it's a substrate for reasoning.</p>

The distinctive move is the no-loops decision. AILANG commits to lambda calculus, pattern matching, and ADTs as its only forms of control flow &mdash; no `for`, no `while`, no mutable accumulator. Where Vera tracks model calls as a single `<Inference>` effect, AILANG splits the world into five capability categories and refuses to let the language grow a construct that obscures any of them. The bet is that determinism, replay, and structured per-effect traces are worth giving up the loop.

## What it looks like.

<div class="code-sample">
  <div class="code">
<pre><span class="kw">module</span> examples/hello

<span class="kw">import</span> std/io (println)

<span class="kw">export</span> <span class="kw">func</span> <span class="ty">main</span>() <span class="op">-&gt;</span> () ! {<span class="ct">IO</span>} {
  <span class="ty">println</span>(<span class="str">"Hello from AILANG!"</span>)
}</pre>
  </div>
  <p class="caption">The <code>! {IO}</code> after the return type is the effect row. A caller without an <code>IO</code> capability granted via <code>ailang run --caps IO</code> cannot invoke this function. Effect rows compose: a function that calls <code>IO</code>- and <code>FS</code>-effecting helpers must declare <code>{IO, FS}</code>.</p>
</div>

## Distinctive moves

- **Capability carving, not capability tracking.** Effects are partitioned into `IO`, `FS`, `Net`, `Clock`, `AI`. Each is granted (or refused) separately at the CLI with `--caps`. The model can't widen authority from inside the program.
- **No loops.** Lambda calculus, recursion, and pattern matching only. The language has a dedicated "Why No Loops?" reference page; the design axioms treat the absence of mutable iteration as load-bearing for replay.
- **Row-polymorphic Hindley-Milner.** Effect rows are first-class type-level objects, inferred and unified the same way row-typed records are. A helper that doesn't touch the network has a smaller row than its caller.
- **Written by agents, end-to-end.** The README declares the language is "written autonomously by AI agents via its own coordinator"; static-analysis and supply-chain badges (Sonar, OpenSSF Scorecard, OpenSSF Best Practices) are cited as third-party verification of the output.
- **MCP-first developer surface.** A hosted MCP server at `mcp.ailang.sunholo.com` ships typed tools over stdlib, examples, and benchmarks. The Claude Code plugin and Gemini CLI extension install the compiler, the prompt, and the MCP server in one command.

## Maturity

v0.20.1 with 110 published releases on GitHub, Apache-2.0 licensed, 2,958 commits, 26 stars. The compiler is implemented in Go (85.5% of the source) and ships native binaries for macOS (Intel and Apple Silicon) and Linux plus a WebAssembly target used by nine in-browser demos. Standard library covers `std/io`, `std/fs`, `std/json`, `std/zip`, `std/xml`, `std/crypto`, `std/http`, `std/net`. The benchmark dashboard runs 33 tasks across 8 frontier models in three modes &mdash; zero-shot, self-repair, and full agentic &mdash; on every release.

The bet is that the rest of the catalogue's verification entries are designing a language a human reads and an AI writes, while AILANG is designing a language an AI both writes and maintains. The next test is whether the agent-authored development model produces a standard library deep enough to compete with MoonBit's roughly two-year head start (MoonBit launched 18 August 2023).

## Agent tooling

`SKILL.md`, `AGENTS.md`, and `CLAUDE.md` ship in the repository; `llms.txt` and `llms-full.txt` are served from the docs site. A remote MCP server exposes typed tools for stdlib lookup, examples, design docs, and the benchmark dashboard. The `ailang_bootstrap` plugin installs slash commands (`/ailang:prompt`, `/ailang:new`, `/ailang:run`, `/ailang:challenge`) into Claude Code and the equivalent extension into Gemini CLI; both download a platform-matched compiler binary on install. The CLI emits structured per-effect traces designed for the agent's next iteration to act on.

## Design DNA

- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Vera tracks LLM inference as one &lt;Inference&gt; effect; AILANG carves authority into IO, FS, Net, Clock, AI as separate capability categories granted per run.
- **[Boruna](https://agentlanguages.dev/languages/boruna.md)** *(Orchestration)* — Both build capability-based effect systems; Boruna enforces declared effects at the VM, AILANG enforces them at the type system and the CLI capability flag.
- **[MoonBit](https://agentlanguages.dev/languages/moonbit.md)** *(Verification)* — Both ship effect typing on a functional core; MoonBit's effects are conventional and general-purpose, AILANG's are row-polymorphic and carved for agent-relevant authority.

## Timeline

- **Sep 2025** — First public release on GitHub under Apache-2.0.
- **Jan 2026** — AILANG reaches v0.6.2; Mark Edmondson publishes the language framing on dev.to.
- **May 2026** — v0.20.1 ships. 110 releases, 2,958 commits. 33-benchmark dashboard runs across 8 frontier models on every release. MCP server, Claude Code plugin, and Gemini CLI extension all in production.
