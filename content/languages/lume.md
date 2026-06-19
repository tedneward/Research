title=Lume
tags=language, ai, syntactic, native
summary=AI-first backend language, immutable by default, with one canonical way to express each operation.
~~~~~~

[Source](https://github.com/mavboas/lume)

> Ships a built-in token-budgeted retrieval tool (lume kb) that packs local language docs, examples, and structured diagnostics under a caller-set token cap.

**Camp:** Syntactic
**Author:** Marcelo Augusto Vilas Boas
**Implementation language:** Go
**Compilation target:** Native binary via Go transpilation + `go build`
**Licence:** MIT
**First seen:** May 2026
**Maturity:** early implementation

**Agent tooling:**
- lume kb build / pack / lint / stats (token-budgeted local context packer)
- Structured semantic diagnostics with stable codes and fix_hint metadata (catalogued in JSON)
- VS Code syntax highlighting and snippets for .lm files

## Key idea

Lume is an AI-first backend language transpiling to Go. The syntactic move is the standard one — immutable by default, inferred types, errors as values, one canonical way to express each operation — but the distinctive move sits in the toolchain rather than the syntax: `lume kb` builds a local Markdown knowledge base from the project's own docs, examples, and diagnostic catalog, then `lume kb pack "<question>" --ai --max-tokens N` scores the pages against the query and assembles a token-budgeted context pack the host can paste straight into an LLM prompt.

## Thesis

Lume's diagnosis is the one most syntactic-camp projects start from: ambient choice in a conventional backend language wastes tokens and produces unpredictable LLM output. The README's framing sentence: "Immutable by default, designed for concise LLM-generated code, and currently implemented as an experimental compiler that transpiles `.lm` files to Go before invoking `go build`." The shipped subset implements that frame at the surface level — `=` rebinds rather than mutates, type annotations are optional and inferred, functions return their final expression, classes derive new values via `.with()` rather than field assignment, `switch` and `match` cover literal dispatch and pattern matching with exhaustiveness checks. The `docs/design.md` principles read as a syntactic-camp manifesto: "Tokens are a real cost. Syntax should be concise without becoming cryptic. Immutability is the default. Errors should become values, not hidden control flow. The language should prefer one canonical way to express common backend tasks."

<p class="pullquote">The goal is to avoid sending the same language reference, examples, diagnostics, and compiler notes to an LLM on every interaction.</p>

The distinctive move sits in the toolchain rather than the syntax. `lume kb pack "implement pipe" --ai --max-tokens 1200` tokenises the query, scores each page in a locally-built Markdown knowledge base by path-match and body-match weight, then assembles an "AI Context Pack" header plus the highest-scoring page bodies until the next page would exceed the budget. Codong ships `SPEC_FOR_AI.md` for whole-spec injection; Mog ships `docs/context.md` as a hand-curated compact reference; Lume ships a query-scoped extractor with a caller-set ceiling and treats the on-disk knowledge base as build output rather than maintained prose.

## What it looks like

<div class="code-sample">
  <div class="code">
<pre><span class="kw">cl</span> <span class="ty">Account</span>
{
    id: <span class="ty">str</span>
    balance: <span class="ty">int</span>
}

<span class="kw">fn</span> debit(acc: <span class="ty">Account</span>, amount: <span class="ty">int</span>) -&gt; <span class="ty">Account</span>
<span class="str">"Returns a new Account with balance reduced by amount."</span>
{
    acc.with(balance<span class="op">=</span> acc.balance <span class="op">-</span> amount)
}

<span class="kw">fn</span> main()
{
    acc <span class="op">=</span> <span class="ty">Account</span>(id<span class="op">=</span> <span class="str">"acc-1"</span>, balance<span class="op">=</span> <span class="num">1000</span>)
    acc2 <span class="op">=</span> debit(acc, <span class="num">300</span>)
    print(<span class="str">"After debit: <span class="sl">${acc2.balance}</span>"</span>)
}</pre>
  </div>
  <p class="caption">Classes declared with <code>cl</code>, named constructors, optional doc strings on function signatures, and <code>.with()</code> deriving a new value instead of mutating a field. <code>=</code> introduces a binding on first use; a second <code>=</code> on the same name in the same scope rebinds rather than mutates.</p>
</div>

## Distinctive moves

- **`lume kb pack` as the agent-facing surface.** A single CLI call (`lume kb pack "<question>" --ai --max-tokens N`) reads the on-disk knowledge base, scores its pages against the query, and prints a Markdown context pack the host can paste straight into an LLM prompt. The pack carries a header (`# Lume AI Context Pack`, `query:`, `budget:`, listed concepts, examples, error codes, source refs) followed by chunked page bodies, with the implementation in `internal/kb/kb.go` (~830 lines) tracking the running token estimate and stopping before the budget is breached.
- **Diagnostics as a structured catalog.** `internal/sema/diagnostics.go` ships 37 semantic diagnostics, each a `{code, feature, message, fix_hint}` record (`E2805` is "match expression is not exhaustive", with `fix_hint: "add case(_) or cover true/false for bool"`). `lume kb build` writes one Markdown page per code under `kb/errors/`, wikilinked from the relevant concept page; `lume kb pack` can pull error context by code into a budgeted pack.
- **Immutable bindings, no field mutation.** `=` introduces or rebinds a name; class fields and object fields cannot be reassigned in the current subset. `.with()` is the canonical way to derive a modified class value. The language reference is explicit: "Same-scope rebinding as a new value, not mutation."
- **Go transpilation as the v0 strategy.** `internal/codegen/golang.go` emits Go source; `internal/driver/driver.go` invokes `go build` for a native binary. `lume gen <file.lm>` prints the generated Go for debugging. The `docs/design.md` names this as deliberately interim: "This keeps the runtime, scheduler, garbage collector, and native binary story simple while the language surface is still changing."
- **Sequential `let` expressions.** `let(base = price * qty, fee = 2){ base + fee }` introduces multiple local bindings in order inside a scoped block, available as the function's final expression. One construct for both same-scope and nested local binding rather than two.

## Maturity

`v0.1.0-experimental` at the time of cataloguing. The repository contains seven commits, all dated 16 May 2026, which together drop the entire project — CLI entry (`cmd/lume/main.go`), compiler (lexer, parser, AST, semantic checker, Go codegen, driver), knowledge-base internals (`internal/kb/kb.go`), 10 example programs under `examples/`, a four-document `docs/` set (language reference, compiler architecture, design notes, roadmap), a VS Code extension scaffold under `vscode/`, and the standard project files (CHANGELOG, CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, LICENSE). Roughly 6,000 lines of Go in total; 69 test functions across `internal/parser`, `internal/sema`, `internal/driver`, and `internal/kb`. MIT-licensed. The single author is Marcelo Augusto Vilas Boas, who describes himself in his GitHub bio as "Tech Lead | Itaú Unibanco | 3x AWS | 1x Azure | MBA." 1 star, 0 forks, no tagged GitHub releases at time of cataloguing.

The README states what is shipped and what is not. The README's "Planned Language Ideas" section lists Hindley-Milner inference, ADTs and union pattern matching, `Result`/`Option` with `?` propagation, the pipe operator, modules, lambdas, effect annotations, refinement types, spec blocks, and a backend standard library as target-language ideas not yet in the compiler. The GitHub project description claims the syntax is "strict enough for the compiler to prove correctness"; what is actually shipped is conventional type-system soundness — name resolution, type compatibility, exhaustiveness checks on `match`, branch-type agreement on `if`/`switch`, list-element homogeneity, class-field validation — not refinement types or contract discharge. Refinement types are on the roadmap; on present evidence the entry sits in the syntactic camp without spanning into verification.

A separate "Lume" was announced as a manifesto on 25 May 2026 by David Brown (LinkedIn `dbrown01`, ex-TechnologyOne principal architect), with no public code, no GitHub presence, and no company entity at time of cataloguing. Mavboas's Lume predates that announcement by nine days and is the Lume with shipped code; the catalogue follows its standing convention of cataloguing whichever project ships code first under a given name. If David Brown's Lume later ships code, the catalogue will need to disambiguate the two; until then, "Lume" in this catalogue refers to mavboas/lume.

## Agent tooling

`lume kb build` reads `docs/language.md`, `docs/compiler.md`, every `.lm` example, and the structured diagnostic catalog, and writes one Markdown page per concept (`kb/language/let.md`), per example (`kb/examples/let.lm.md`), and per error code (`kb/errors/E2805.md`), with `[[wikilink]]` cross-references and a top-level `kb/index.md`. `lume kb pack` scores pages by query terms, assembles a budgeted pack listing the included concepts, examples, error codes, and source refs, and stops before the next page would breach the cap. `lume kb lint` flags broken wikilinks and undocumented examples; `lume kb stats` reports raw versus packed token estimates. The repository ships no `SKILL.md`, `AGENTS.md`, `CLAUDE.md`, `llms.txt`, or MCP server at the project root — `lume kb` is the equivalent agent-facing surface, and the structured diagnostic catalog under `internal/sema/diagnostics.go` is the repair-loop substrate it pulls from.

## Design DNA

- **[Codong](https://agentlanguages.dev/languages/codong.md)** *(Syntactic)* — Closest editorial sibling on the 'one canonical way' bet. Codong collapses choice paralysis across a nine-module general-purpose stdlib with one canonical function per task; Lume applies the same diagnosis to a smaller backend-oriented surface and transpiles through Go in the same way. Codong ships <code>SPEC_FOR_AI.md</code> for system-prompt injection; Lume ships <code>lume kb pack</code> for query-scoped context extraction. Different mechanisms for the same context-budget concern.
- **[Axis](https://agentlanguages.dev/languages/axis.md)** *(Syntactic)* — Same wave (May 2026), same backend-DSL framing, opposite end of the syntactic-camp lever. Axis bounds the surface to twelve top-level constructs with an LL(1) grammar and ships per-state logit masks so 1B/3B/7B models can't emit invalid syntax; Lume keeps a conventional curly-brace surface and instead bounds the context the model sees via <code>lume kb pack --max-tokens N</code>.
- **[NERD](https://agentlanguages.dev/languages/nerd.md)** *(Syntactic)* — Same camp, different lever. NERD swaps operators for English keywords on the bet that BPE tokenisers prefer words to symbols; Lume keeps conventional operators and bets that the bigger token win is in what context the model receives, not in how each operator is spelled.
- **[Mog](https://agentlanguages.dev/languages/mog.md)** *(Syntactic)* — Both small projects addressing the same context-budget concern from opposite directions. Mog fits its full spec in 3,200 tokens by designing the language under budget; Lume ships a larger surface and tools that extract a query-relevant subset under budget at call time. Mog also ships <code>docs/context.md</code> as a compact reference; Lume's equivalent is the generated <code>kb/</code> tree the CLI rebuilds from sources.
