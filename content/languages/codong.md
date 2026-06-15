title=Codong
tags=language, ai, syntactic, native
summary=Designed for AI to write, with one canonical way to express every operation.
~~~~~~

[Website](https://codong.org) | [Source](https://github.com/brettinhere/Codong) | [Playground](https://codong.org/arena/)

> Nine bundled modules, structured JSON errors with fix/retry fields, ? operator for propagation. Compiles to Go IR, then native via go build.

**Camp:** Syntactic
**Author:** Brett (brettinhere)
**Implementation language:** Go
**Compilation target:** Native binary via Go IR + `go build`
**Licence:** MIT
**First seen:** March 2026
**Maturity:** working compiler

**Agent tooling:**
- SPEC_FOR_AI.md (system-prompt injection — Markdown spec with paired CORRECT/WRONG examples for every rule)
- Structured JSON errors with `fix` and `retry` repair fields
- Compact error format (project-reported ~39% token reduction)

## Key idea

Codong is designed for AI to write, humans to review, machines to execute. The syntactic-camp move is to collapse choice paralysis: one canonical function per task, nine bundled modules covering most AI workloads with zero external dependencies, structured JSON errors with fix/retry fields, ? operator for error propagation. Compiles through Go — .cod source goes to Go IR, then `go build` produces a static native binary.

## Thesis

Codong's diagnosis is choice paralysis. Python has five ways to make an HTTP request. JavaScript has four state-management libraries. Every choice costs tokens to navigate and produces unpredictable output. The README states it directly: "Codong is designed for AI to write, humans to review, and machines to execute." The syntactic-camp move is to collapse the language and its standard library to one canonical form per task &mdash; `http.get(url)`, `web.serve(port: N)`, `db.connect(url)`, `json.parse(s)`. Nine modules bundled, zero external dependencies, no package manager required.

<p class="pullquote">Codong has exactly one way to do everything.</p>

The distinctive move is which kind of choice gets eliminated. NERD strips operators down to English keywords; Magpie strips ambiguity at the surface by making SSA the user-facing form. Codong leaves both operators and surface alone and instead collapses the standard library &mdash; one HTTP function, one JSON parser, one error shape. Compilation routes through Go: `.cod` source passes through lexer, parser, AST, Go IR, then `go build` for a static native binary. The compiler is essentially a frontend for Go's toolchain, in the same way TypeScript is a frontend for JavaScript or Kotlin is a frontend for JVM bytecode.

## What it looks like.

<div class="code-sample">
  <div class="code">
<pre><span class="kw">fn</span> load_config(path) {
    content = fs.read(path)<span class="op">?</span>
    config = json.parse(content)<span class="op">?</span>
    host = config.get(<span class="str">"host"</span>, <span class="str">"localhost"</span>)
    port = config.get(<span class="str">"port"</span>, <span class="num">8080</span>)
    <span class="kw">return</span> {host: host, port: port}
}

<span class="kw">try</span> {
    config = load_config(<span class="str">"config.json"</span>)<span class="op">?</span>
    print(<span class="str">"Server: <span class="sl">{config.host}</span>:<span class="sl">{config.port}</span>"</span>)
} <span class="kw">catch</span> err {
    print(<span class="str">"Failed: <span class="sl">{err.code}</span> - <span class="sl">{err.fix}</span>"</span>)
}</pre>
  </div>
  <p class="caption">Two bundled stdlib calls, <code>?</code> on three of them propagating structured errors up the stack, and the <code>err.fix</code> field doing repair-loop work in the catch branch.</p>
</div>

## Distinctive moves

- **One canonical function per task.** `http.get(url)` is the only way to make an HTTP request. `db.connect(url)` is the only way to open a database. No choice between five libraries; the bundled stdlib *is* the ecosystem.
- **Nine bundled modules, zero external dependencies.** `web`, `db`, `http`, `llm`, `fs`, `json`, `env`, `time`, `error` ship with the compiler. No package manager required; no version-resolution tax. (The README headline counts eight; the table lists nine — `error` ships alongside the rest.)
- **Structured JSON errors with `fix` and `retry` fields.** Errors carry a stable code, a message, a human-readable fix suggestion, and a retry boolean. Agents can match on the code, apply the fix, and decide whether to retry without parsing prose.
- **`?` operator for error propagation.** Unary postfix at the highest precedence alongside `()` and `.`. `content = fs.read(path)?` either binds the value or returns the error up the stack. No nested `if err != nil` chains.
- **Three execution modes from one source.** `codong eval` (AST interpreter, sub-second startup), `codong run` (Go IR &rarr; `go run`, 0.3–2s startup), `codong build` (Go IR &rarr; static native binary). Same `.cod` file, three deployment shapes.
- **Self-reported token savings.** The project's Arena benchmark (codong.org/arena) reports a 955-token Codong solution against 1,867 for Python, 1,710 for JavaScript, and 4,367 for Java on a Posts-CRUD task with Claude Sonnet 4 &mdash; a single workload measured by the project itself, not an independent study.

## Maturity

Working compiler, MIT-licensed, v0.1.3 (28 March 2026) with four tagged releases since v0.1.0 first shipped on 24 March 2026. 92 commits, 67 stars, 7 forks. 1,427 tests across three suites (1,425 passing, 2 skipped for unconfigured MySQL/PostgreSQL environments). Written in Go (95.9% of source), with binaries published for Linux and macOS on amd64 and arm64; no Windows binary yet. v0.1.3 added a compilation cache the project reports as a "~170× speedup" on repeat runs. Single-author project (Brett, `brettinhere`); the repository's contributors list also shows a `claude` bot account, consistent with the project's "AI to write, humans to review" framing.

## Agent tooling

`SPEC_FOR_AI.md` ships at the repo root &mdash; a structured Markdown spec (~6,000 words, ~1,600 lines, 20+ sections) with paired `// CORRECT` and `// WRONG` examples for every rule, designed for paste-in to any LLM system prompt. Structured JSON errors with `fix` and `retry` fields handle the repair-loop side. A `set_format("compact")` toggle produces single-line errors (`err_code:E_MATH|src:divide|fix:check divisor|retry:false`) for token-constrained agent contexts, with a project-reported ~39% token reduction in error output. An MCP server for Claude Desktop is listed as Stage 7 in the v0.1.3 Roadmap — planned, not yet shipped.

## Design DNA

- **[NERD](https://agentlanguages.dev/languages/nerd.md)** *(Syntactic)* — Same camp, same diagnosis — choice paralysis burns tokens — opposite lever. NERD strips operators down to English keywords; Codong keeps conventional operators and collapses the standard library to one canonical function per task. Both self-report token-savings benchmarks from single-author runs.
- **[Zero](https://agentlanguages.dev/languages/zero.md)** *(Verification)* — Cross-camp foil sharing the 'one X way' design slogan. Zero buys obviousness with capability-typed effects, <code>raises</code> markers, and a typed <code>zero fix --plan --json</code> API inside a verification project; Codong buys it with a single canonical stdlib inside a pure syntactic project. Industrial-backing contrast: Vercel Labs vs single author.
- **[Magpie](https://agentlanguages.dev/languages/magpie.md)** *(Syntactic)* — Same camp, opposite mechanism. Magpie surfaces SSA — every value <code>%</code>-prefixed, ~2.3× more tokens per operation — so the model has nowhere to be wrong; Codong keeps conventional surface but ships one canonical function per task so the model never has to choose. Magpie pays in tokens for unambiguity; Codong pays in stdlib scope.
