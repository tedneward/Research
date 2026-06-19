title=Plumbing
tags=language, ai
summary=A typed language for the wiring between agents: symmetric monoidal category, typed channels, structural morphisms, agents as stateful morphisms with control ports.
~~~~~~

[Website](https://johncarlosbaez.wordpress.com/2026/03/11/a-typed-language-for-agent-coordination/) | [Paper](https://arxiv.org/abs/2602.13275)

**Camp:** Adjacent
**Author:** William Waites / Leith Document Company
**Implementation language:** Not publicly disclosed
**Compilation target:** Native binaries (Linux x86_64, macOS Apple Silicon)
**Licence:** Free for educational/personal use; commercial licence on request
**First seen:** March 2026
**Maturity:** early implementation

**Agent tooling:**
- MCP server

## Key idea

Plumbing is a typed language for the wiring between agents — the substrate that orchestration-camp languages run on top of. Objects are typed channels carrying infinite streams. Morphisms are processes: four structural (copy, discard, merge, barrier) and two utility (map, filter), composed sequentially or in parallel via the tensor product. Agents are stateful morphisms with main, control, tool, operator-in-the-loop, and telemetry ports. Type-checking happens before the graph runs.

## Thesis

Plumbing is the catalogue's piece of infrastructure. It is not an orchestration language in the sense Boruna, Pel, or Marsha are &mdash; it is the typed substrate that orchestration languages can be expressed *on top of*. Where existing agent frameworks (n8n, LangGraph, CrewAI) coordinate agents with ad hoc engineering, Plumbing coordinates them with morphisms in a copy-discard symmetric monoidal category. Objects are typed channels: `!A` is a stream of `A`s, `!string` a stream of strings. Morphisms are processes with typed inputs and outputs. Four structural morphisms (copy, discard, merge, barrier) plus two utilities (map, filter) compose sequentially and via the tensor product. The compiler statically checks that every wiring is well-formed before any agent runs.

<p class="pullquote">Static typing prevents the waste.</p>

The distinctive move is to refuse the orchestration camp's normal framing. Where Boruna treats the unit of computation as an `.ax` workflow with declared effects, and Pel treats it as a grammar-level capability, Plumbing treats the unit as a channel between two processes, with the agent itself reduced to a stateful morphism with a typed protocol &mdash; main input, main output, plus control ports for runtime parameter modulation (e.g. temperature), tool-call ports, operator-in-the-loop ports, and telemetry. A judge agent that wants to cool down a debate sends a `set_temp` message on the debaters' control ports; the wiring is type-checked the same as the data path.

## What it looks like

<div class="code-sample">
  <div class="code">
<pre><span class="kw">type</span> <span class="ty">Verdict</span> = { verdict: <span class="ty">bool</span>, commentary: <span class="ty">string</span>, draft: <span class="ty">string</span> }
<span class="kw">type</span> <span class="ty">Review</span>  = { score: <span class="ty">int</span>, review: <span class="ty">string</span>, draft: <span class="ty">string</span> }

<span class="kw">let</span> composer : !<span class="ty">string</span>  <span class="op">-&gt;</span> !<span class="ty">string</span>  = <span class="kw">agent</span> { ... }
<span class="kw">let</span> checker  : !<span class="ty">string</span>  <span class="op">-&gt;</span> !<span class="ty">Verdict</span> = <span class="kw">agent</span> { ... }
<span class="kw">let</span> critic   : !<span class="ty">Verdict</span> <span class="op">-&gt;</span> !<span class="ty">Review</span>  = <span class="kw">agent</span> { ... }

<span class="kw">let</span> main : !<span class="ty">string</span> <span class="op">-&gt;</span> !<span class="ty">string</span> = <span class="kw">plumb</span>(input, output) {
  input   ; composer ; checker
  checker ; <span class="ty">filter</span>(verdict = <span class="kw">false</span>)
          ; <span class="ty">map</span>({verdict, commentary}) ; composer
  checker ; <span class="ty">filter</span>(verdict = <span class="kw">true</span>) ; critic
  critic  ; <span class="ty">filter</span>(score &lt; 85)
          ; <span class="ty">map</span>({score, review}) ; composer
  critic  ; <span class="ty">filter</span>(score &gt;= 85).draft ; output
}</pre>
  </div>
  <p class="caption">An adversarial cover-letter composer with two feedback loops. The critic cannot see source materials &mdash; the information partition is a type-level consequence of the wiring, not a prompt instruction.</p>
</div>

## Distinctive moves

- **Typed channels, not typed messages.** Objects in the category are streams. `!A` is a stream of `A`s; sequential composition glues stream-producing morphisms; the tensor product runs them in parallel. Well-formedness is a category-theoretic property, checked at compile time.
- **Four structural morphisms.** Copy duplicates a stream, discard throws it away, merge interleaves two streams of the same type (after coproduct injection), barrier synchronises two streams into a pair. Barrier is the synchronisation primitive that unlocks session types.
- **Agents as stateful morphisms with control ports.** An agent has main input/output plus typed control, tool, operator-in-the-loop, and telemetry ports. Runtime parameter changes (e.g. temperature) flow through the same typed pipework as data.
- **The κ-calculus "don't care, don't write" convention.** Any output port not mentioned in the program is implicitly connected to discard. The textual surface stays small while the type system still tracks every port.
- **MCP server in the release.** The first public drop ships a compiler, an interpreter, and an MCP server &mdash; agent harnesses are first-class consumers of the language, not an afterthought.

## Maturity

Version 0p1, first public release March 2026, binary downloads for Linux x86_64 and macOS Apple Silicon. The release ships a compiler, interpreter, and MCP server. There is no public Git repository; the licence is free for educational and personal use, with a separate commercial licence available from Leith Document Company. The author is William Waites, a Chancellor's Fellow at the University of Strathclyde; the broader programme of work is described in his arXiv paper *Artificial organisations* (arXiv:2602.13275). A second blog post, "The agent that doesn't know itself," extends the calculus with session types and context compaction.

The bet is that orchestration languages eventually need a category-theoretic substrate underneath them, and that the substrate is more valuable as a typed coordination layer than as another orchestration framework competing for workflow attention.

## Agent tooling

The release includes an MCP server alongside the compiler and interpreter, which is the entire agent-facing surface &mdash; there is no `SKILL.md`, `AGENTS.md`, or `CLAUDE.md` in this drop, because Plumbing's framing is that the language *is* the agent tooling for everything above it. Agent harnesses consume Plumbing through MCP; what agents author *in* Plumbing is the wiring diagram for other agents.

## Design DNA

- **[Boruna](https://agentlanguages.dev/languages/boruna.md)** *(Orchestration)* — Plumbing defines the wiring between agents; Boruna defines what runs inside one agent and how it is audited. Plumbing is substrate, Boruna is workload.
- **[Pel](https://agentlanguages.dev/languages/pel.md)** *(Orchestration)* — Same orchestration adjacency, different formalism. Pel is a grammar-level capability calculus on an academic paper; Plumbing is a copy-discard category with session types, with a working compiler and runtime.
