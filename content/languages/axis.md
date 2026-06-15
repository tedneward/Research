title=Axis
tags=ai, language, syntactic, verification, native
summary=Backend API language for smal LLMs.
~~~~~~

[Source](https://github.com/vmelnic/axis)

> Twelve top-level constructs cover a production backend; LL(1) grammar and prefix-only expressions ship per-state logit masks for constrained decoding.

**Camp:** Syntactic
**Also spans:** Verification
**Author:** Vladimir Melnic
**Implementation language:** Rust
**Compilation target:** Native artefacts (SQL DDL, Rust/axum server, TypeScript and Rust client SDKs, OpenAPI, GraphQL); also interpreted directly from the AST via axum + sqlx
**Licence:** Unknown
**First seen:** May 2026
**Maturity:** working compiler

**Agent tooling:**
- CLAUDE.md
- axis --constrain (grammar state machine as JSON)
- axis --logit-masks (per-state binary masks over the Axis token vocabulary)
- axis --completions (parser state and valid next tokens at cursor)
- axis --lsp (language server over stdio)

## Key idea

Axis targets small LLMs (1B/3B/7B) explicitly. The bet is that a backend authored in twelve constructs (SHAPE, SOURCE, REALM, FLOW, SAGA, SURFACE, POLICY, SERVICE, MIGRATE, STREAM, FUNC, STORAGE) with an LL(1) grammar and prefix-only expressions fails less than free-form framework code. The compiler ships grammar-aware logit masks as JSON; the same source either compiles to SQL / OpenAPI / TypeScript / Rust artefacts, or is served directly from the AST by axum + sqlx against Postgres, MySQL, or SQLite.

## Thesis

Axis names a different bet from the rest of the syntactic camp. Most catalogue entries target "LLMs" generically and assume the model has enough context and capability to navigate a large surface. Axis targets the smallest practical agents explicitly &mdash; the v0.2 spec declares "target authors: 1B, 3B, 7B parameter models with 2K&ndash;32K context windows" &mdash; and constrains the surface accordingly. Twelve top-level keywords (`SHAPE`, `SOURCE`, `REALM`, `FLOW`, `SAGA`, `SURFACE`, `POLICY`, `SERVICE`, `MIGRATE`, `STREAM`, `FUNC`, `STORAGE`) cover a production backend; the grammar is LL(1) with one token of lookahead and no backtracking; expressions are prefix-only (`FILTER id EQ path.id`, never `id == path.id`); the "one operation per binding" principle forbids compound expressions.

<p class="pullquote">Axis is not a better Python. It is the negation of human-centric programming.</p>

The distinctive move is constrained decoding shipped as toolchain output. `axis --constrain` exports the parser as a state machine in JSON; `axis --logit-masks` exports a per-state binary mask over the Axis token vocabulary. The implementation in `src/editor/constrain.rs` enumerates 41 parse states (`TopLevel`, `ShapeBody`, `FlowBodyField`, `FilterClause`, &hellip;) and emits the allowed token set for each. A host harness maps these masks onto an LLM tokeniser at decode time; the model can then only emit syntactically valid Axis. Most agent-targeted languages assume free generation followed by verification; Axis tries to make syntactic invalidity unreachable at generation time. Mog reaches a comparable surface bound from the spec direction (3,200 tokens fits the language); Axis reaches it from the grammar direction and adds the masks.

## What it looks like.

<div class="code-sample">
  <div class="code">
<pre><span class="kw">SHAPE</span> <span class="ty">Todo</span>
  id <span class="ty">UUID</span> <span class="ct">PK</span> <span class="ct">AUTO</span>
  title <span class="ty">STRING</span> <span class="num">200</span> <span class="ct">REQUIRED</span>
  completed <span class="ty">BOOL</span> <span class="ct">DEFAULT</span> <span class="kw">false</span>

<span class="kw">SOURCE</span> todos <span class="kw">POSTGRES</span>
  <span class="kw">SHAPE</span> <span class="ty">Todo</span>
  <span class="ct">INDEX</span> completed

<span class="kw">REALM</span> api
  <span class="ct">CAPABILITY</span> read todos
  <span class="ct">CAPABILITY</span> write todos

<span class="kw">FLOW</span> get_todo <span class="kw">get</span> /todos/:id
  <span class="kw">REALM</span> api
  <span class="kw">LET</span> todo
    <span class="kw">FETCH</span> todos
      <span class="ct">FILTER</span> id <span class="op">EQ</span> path.id
    <span class="ct">OR</span> <span class="num">404</span>
  <span class="kw">RETURN</span> <span class="num">200</span> todo</pre>
  </div>
  <p class="caption">Indentation is significant (2 spaces, tabs illegal). Operators are prefix tokens: <code>EQ</code>, not <code>==</code>. The <code>OR 404</code> clause makes the missing-row case a parse-level concern rather than a runtime <code>if</code>.</p>
</div>

## Distinctive moves.

- **Targeted at 1B/3B/7B-parameter models.** The spec names the audience explicitly. Design principles include "context locality: a single endpoint must be fully generatable within 512 Axis tokens (~2K LLM tokens)" and "failure is syntax: unhandled errors, missing auth, unindexed queries are parse or compile errors, not runtime surprises."
- **Twelve constructs cover a production backend.** `SHAPE` (data model), `SOURCE` (database binding), `REALM` (permission scope and tenancy), `FLOW` (HTTP endpoint), `SAGA` (distributed transaction with compensating steps), `SURFACE` (API routing and versioning), `POLICY` (compile-time invariants across flows), `SERVICE` (external integration), `MIGRATE` (schema migration), `STREAM` (WebSocket/SSE), `FUNC` (pure function), `STORAGE` (file backend).
- **Grammar-aware logit masks shipped as JSON.** `axis --constrain` emits the parser state machine; `axis --logit-masks` emits a binary mask per state over the Axis token vocabulary. The harness maps these masks onto an LLM tokeniser at decode time. The masks live in `src/editor/constrain.rs`; the CLI plumbing in `src/main.rs` writes them as `{vocabulary, masks}` JSON.
- **Two execution modes from one source.** The compile pipeline (`lex → parse → link → verify → plan → codegen`) emits SQL DDL (`--sql`), an axum server (`--rust`), TypeScript and Rust client SDKs, OpenAPI 3.0, GraphQL, Kubernetes manifests, migrations, and a generated test suite, each behind its own flag. `axis --serve` runs `lex → parse → verify → serve`, interpreting the AST directly through axum + sqlx against Postgres, MySQL, or SQLite (auto-detected from `DATABASE_URL`). No codegen step on the serve path.
- **Prefix operators, one operation per binding.** `FILTER id EQ path.id` puts the operator first; the design principle forbids compound expressions like `a + b * c`. Every `LET` binds exactly one operation, removing precedence ambiguity at the syntax level.
- **POLICY as compile-time cross-cutting rules.** Tenant isolation, capability checks, rate limits, and auth requirements are declared once in a `POLICY` block and verified across every `FLOW` at compile time rather than re-asserted per endpoint.

## Maturity.

A single initial commit on 24 May 2026 dropped the entire project as a working Rust workspace: compiler front-end (`lexer`, `parser`, `link`, `verify`, `plan`), codegen backends for SQL, Rust/axum, WASM stubs, and client SDKs, generators for OpenAPI, TypeScript, GraphQL, Kubernetes manifests, migrations, and test suites, plus a stdio LSP, a VS Code extension, and a 73 KB specification (`docs/axis-spec.md` v0.2). Cargo metadata reports `version = "0.1.0"` against Rust 1.85 (edition 2024). The repository ships three working projects: `todolist/` (CRUD proof, 20/20 integration tests), `advanced/` (auth, tenants, guards, rules, funcs, MATCH, TRY/RECOVER, rate limiting, caching, surfaces &mdash; 32/32 tests), and `helperbook/` (a client-provider marketplace with Postgres, Redis, Meilisearch, Prometheus, and Grafana wired through Docker Compose, "zero application source code" outside `.axis` files).

3 stars, 0 forks, 0 open issues at time of cataloguing; no GitHub releases tagged. **The repository does not ship a `LICENSE` file** and the GitHub API reports the licence field as null; the `Cargo.toml` manifest declares `license = "MIT"`, but the absence of a top-level licence file leaves the question open until the author resolves it. The bet is the one named in the spec's framing sentence ("the negation of human-centric programming") &mdash; that a domain-specific surface drawn tight enough for a 1B model to navigate, plus grammar-aware decoding to keep it on rails, will outperform a general-purpose language plus a frontier model. No catalogue entry has previously shipped grammar-aware logit masks; integration with a downstream decoder is the next milestone to watch for.

## Agent tooling.

`CLAUDE.md` (7.5 KB) targets agents writing the Axis compiler itself, not agents writing in Axis: it names the build commands, maps the repository module by module, names canonical AST field names to head off guessing ("`TypeExpr` &mdash; not `FieldType`, not `ScalarType`"), and states the two pipelines explicitly. No `AGENTS.md`, no `SKILL.md`, no MCP server, no `llms.txt`. The surface for *authoring* Axis is the constrained-decoding pipeline: `axis --constrain` for the grammar state machine, `axis --logit-masks` for the per-state vocabulary masks, `axis --completions` for parser state and valid next tokens at a cursor position, and `axis --lsp` for editor integration. Compile-mode outputs (`--plan`, `--openapi`, `--testgen`, &hellip;) emit structured JSON for downstream agents to consume.

## Design DNA

- **[Mog](https://agentlanguages.dev/languages/mog.md)** *(Syntactic)* — Closest editorial sibling on the 'small constrained surface' bet. Mog fits its full spec in 3,200 tokens for a general-purpose embedded language; Axis fits a production backend in twelve top-level constructs. Different scopes, same wager that bounding the surface beats scaling the model.
- **[NERD](https://agentlanguages.dev/languages/nerd.md)** *(Syntactic)* — Same camp, different lever. NERD strips operators down to English keywords on the bet that BPE tokenisers prefer words to symbols; Axis strips an entire backend stack down to twelve construct keywords and forbids compound expressions (one operation per <code>LET</code>).
- **[X07](https://agentlanguages.dev/languages/x07.md)** *(Syntactic)* — Both treat the AST as the executable artefact. X07 stores programs as canonical JSON ASTs and edits them via RFC 6902 JSON Patch; Axis keeps a textual <code>.axis</code> surface but the <code>--serve</code> mode runs the parsed AST directly through axum + sqlx with no codegen step.
- **[Codong](https://agentlanguages.dev/languages/codong.md)** *(Syntactic)* — Same diagnosis (choice paralysis), different scope of canonicality. Codong ships one canonical function per task across a nine-module general-purpose stdlib; Axis ships one canonical construct per backend concern — auth is <code>REALM</code>, distributed transactions are <code>SAGA</code>, cross-cutting rules are <code>POLICY</code>.
