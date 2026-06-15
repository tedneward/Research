title=NERD (No Effort Required, Done)
tags=language, ai, syntactic, llvm
summary=Programming language designed for AI use.
~~~~~~

[Website](https://www.nerd-lang.org) | [Source](https://github.com/Nerd-Lang/nerd-lang-core)

> Replaces every operator with an English keyword on the bet that LLM tokenisers spend fewer tokens on words than on symbols. Built-in MCP client and LLM call primitives.

**Camp:** Syntactic
**Author:** Guru Sattanathan
**Implementation language:** C
**Compilation target:** LLVM IR (then native via clang)
**Licence:** Apache-2.0
**First seen:** January 2026
**Maturity:** working compiler

**Agent tooling:**
- llms.txt
- First-class MCP client primitives (mcp tools / mcp use / mcp resources / mcp read / mcp prompts / mcp init / mcp log)
- First-class LLM call primitive (llm claude "prompt")

## Key idea

NERD strips every symbolic operator out of the surface syntax and replaces it with an English keyword: `plus`, `minus`, `times`, `eq`, `gt`, `mod`. The author's claim is that BPE tokenisers fragment punctuation but treat common English words as single tokens, so the same logic is cheaper to generate. There is no type system, no braces, no semicolons; functions and side-effects (`http get`, `mcp use`, `llm claude`) are first-class statements.

## Thesis

NERD treats the problem as token economics. The site states "40% of code is LLM-written. That number is growing," and the syntactic-camp move is to remove the symbols that fragment under BPE. Operators become English words (`plus`, `minus`, `eq`, `gt`, `mod`), braces and semicolons disappear, control flow ends with `done` rather than a brace. The README is explicit that humans are no longer the audience: "Machines write it. Machines read it. Humans observe it."

<p class="pullquote">The irony: cryptic symbols don't save tokens. Plain words win.</p>

The distinctive move is what NERD does *not* ship: no type system, no error union, no contracts, no checker beyond the parser. This is the syntactic camp at its purest &mdash; the bet is that smoothing the generation surface buys more than verification would, and the difference shows up in the inference bill. Magpie reaches a similar diagnosis through the opposite mechanism (SSA form, every value named and typed at definition); NERD picks the lower-effort lever and accepts that "audit" rather than "verify" is the only safety net.

## What it looks like

<div class="code-sample">
  <div class="code">
<pre>fn fizzbuzz n
repeat n times as i
  if i mod 15 eq zero out "FizzBuzz" else if i mod three eq zero out "Fizz" else if i mod five eq zero out "Buzz" else out i
done

fn main
call fizzbuzz 15</pre>
  </div>
  <p class="caption">Every operator is a word: <code>mod</code>, <code>eq</code>, <code>repeat</code>, <code>done</code>. No braces, no semicolons, no <code>+</code>/<code>==</code>.</p>
</div>

## Distinctive moves

- **Operators as keywords.** `plus minus times over mod`, `eq ne gt lt ge le`, `inc x`, `dec x`, `neg x`. No `+`, `==`, `++`, or `!`.
- **Agent primitives in the grammar.** `llm claude "prompt"`, `mcp tools "url"`, `mcp use "url" "tool" "args"`, `http get "url" auth bearer "token"`. MCP and HTTP are statements, not library calls.
- **`llms.txt` published at the project root.** The site exposes a teaching corpus designed for an LLM to ingest the syntax in one fetch.
- **Self-reported token savings.** The author's four-function math benchmark reports 32 NERD tokens against 70 for JavaScript (54% saving), 96 for TypeScript (67% saving), and 273 for Java (80% saving) &mdash; a single workload by a single tokeniser, not an independent study.
- **C bootstrap to LLVM IR.** Lexer and parser in C, codegen to LLVM IR, then `clang` to native. No runtime; releases ship as single binaries for macOS Apple Silicon and static Linux x86_64.

## Maturity

Working compiler, Apache-2.0, 135 stars and two contributors, 30 commits, five tagged releases (latest v0.1.4, Jan 2026). The README labels itself "🚧 Early days" and warns the implementation might change completely. Native binaries for macOS-arm64 and static Linux are checked into the repo alongside source.

## Agent tooling

`llms.txt` is the primary surface, served from the site root for direct ingestion. The agent capabilities table marks fifteen MCP and HTTP operations as shipping today, plus a single-line `llm claude "..."` primitive that auto-loads `ANTHROPIC_API_KEY` from `.env`. The README is explicit that this is scaffolding to experiment with, not a production agent stack &mdash; OAuth 2.1 and SSE streaming are listed as "coming next."

## Design DNA

- **[Magpie](https://agentlanguages.dev/languages/magpie.md)** *(Syntactic)* — Same diagnosis — strip ambiguity at the surface — opposite mechanism. Magpie surfaces SSA with %-prefixed names and one canonical operation per concept; NERD strips the operators and accepts a larger surface for shorter tokens.
- **[Zero](https://agentlanguages.dev/languages/zero.md)** *(Verification)* — Cross-camp foil. Zero also leans on keywords and 'one obvious way' but pairs that with a type checker and a structured-JSON CLI; NERD ships neither.
- **[X07](https://agentlanguages.dev/languages/x07.md)** *(Syntactic)* — Same camp, most extreme contrast. X07 walks past textual syntax to JSON ASTs; NERD keeps the text and economises the tokens inside it.
