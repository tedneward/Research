title=Pact
tags=language, ai, verification
summary=AI-first language that focuses on intent being more explict.
~~~~~~

[Source](https://github.com/KikotVit/pact-lang)

> Intent blocks on every function and route, pipeline syntax, explicit effects, errors as types. Single binary that ships an HTTP server, SQLite, an LSP, and an MCP server with five tools.

**Camp:** Verification
**Author:** Viktor Kikot
**Implementation language:** Rust
**Compilation target:** Interpreted (tree-walking)
**Licence:** MIT
**First seen:** April 2026
**Maturity:** working compiler

**Agent tooling:**
- CLAUDE.md
- .mcp.json
- Built-in MCP server (pact mcp) with 5 tools
- LSP server (pact lsp)
- Built-in docs (pact docs)

## Key idea

Every function and route opens with an `intent` clause and a `needs` list declaring effects. Errors are part of the type signature (`-> User or NotFound`), data flows through left-to-right pipelines, and the runtime ships HTTP, SSE, SQLite, JWT, and an MCP server inside a single ~5MB binary. The bet is that surfacing intent, effects, and outcomes at the signature level lets agents skip the reverse-engineering pass.

## Thesis

Pact's diagnosis is that most backend code is glue, and that the glue is exactly where agents waste iterations. Intent is hidden in comments that drift, effects are hidden in implementation bodies, and errors are hidden in exception hierarchies. The verification-camp move is to drag all three back into the signature: every function and every route opens with an `intent` string, declares a `needs` list of effects, and resolves to a sum type like `User or NotFound`. The compiler reads that as the contract; the type checker, formatter, LSP, and MCP server all consume the same declarations.

<p class="pullquote">Every function says why it exists. Errors are data, not explosions.</p>

The distinctive move is the breadth of what ships inside one binary. A `.pact` file declares `app Notes { port: 8080, db: "sqlite://notes.db" }` and `pact run` brings up an HTTP server with SSE streaming, SQLite in WAL mode, JWT auth, a structured logger, and a built-in MCP server &mdash; no dependencies, no ORM, tables auto-created from struct fields. This is close to Aver in design DNA (declared intent + declared effects + colocated checks), but where Aver lifts verify blocks into Lean 4 and Dafny, Pact spends its complexity budget on the runtime an agent will actually drive.

## What it looks like

<div class="code-sample">
  <div class="code">
<pre>intent "create a new user with default Viewer role"
fn create_user(data: NewUser) -&gt; User or BadRequest
  needs db, time, rng
{
  let existing: User = find_by_email(data.email)
  return BadRequest { message: "Email already taken" } if existing != nothing

  let user: User = {
    id: rng.uuid(),
    email: data.email,
    role: "Viewer",
    active: true,
    created_at: time.now(),
  }

  db.insert("users", user)
}</pre>
  </div>
  <p class="caption">An intent line, an effect list, and a sum-typed return &mdash; all in the signature before the body.</p>
</div>

## Distinctive moves

- **Intent in the signature.** Every `fn` and `route` carries a one-line `intent` string read by the agent before the body. The author argues this lets a model skip the "reverse-engineer purpose from implementation" step.
- **Effects in the signature.** `needs db, time, rng, auth, log, env, http` declares side effects up front. Tests swap them deterministically: `using time = time.fixed(...)`, `using db = db.memory()`.
- **Errors as types.** Sum types replace exceptions; `| on NotFound: respond 404 with ...` handles each variant; Rust-style `?` propagates.
- **Pipelines as the default control flow.** `data | filter where .x > 0 | sort by .name | take first 10` is the canonical shape for data transforms and route handlers alike.
- **One binary, one runtime.** ~5MB Rust binary bundles lexer, parser, tree-walking interpreter, HTTP server, SSE, SQLite, JWT, HTTP client, LSP, MCP server, formatter, and docs.

## Maturity

Single-author project, MIT-licensed, currently at v0.5 with six tagged releases (latest v0.3.1, Apr 2026), 204 commits and 496+ tests on the master branch. The README is explicit that it works for small APIs and CRUD services and is not production-ready; the web playground is the next planned milestone. Stars and forks are at zero, which understates the surface area shipped &mdash; deep type checker, formatter, LSP, MCP server, VS Code extension, install script for macOS/Linux, and a Docker image are all in the tree today.

## Agent tooling

`CLAUDE.md` and a checked-in `.mcp.json` orient Claude Code at the project level. `pact mcp` exposes five tools over stdio JSON-RPC: `pact_run`, `pact_check`, `pact_docs`, `pact_format`, `pact_test`. `pact lsp` provides diagnostics, hover, and autocomplete for any LSP-capable editor. Documentation is queryable from the CLI (`pact docs <topic>`) so an agent can pull a topic and a working example before generating code.

## Design DNA

- **[Aver](https://agentlanguages.dev/languages/aver.md)** *(Verification)* — Closest design relative. Both attach declared intent and effects to every function; Aver lifts the verify block into Lean 4 and Dafny exports, while Pact keeps the surface lighter and ships a working web stack.
- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Vera's requires/ensures clauses are the strict cousin of Pact's intent blocks. Vera mechanically discharges them via Z3; Pact treats the intent as documentation the type checker and MCP server consume.
- **[Boruna](https://agentlanguages.dev/languages/boruna.md)** *(Orchestration)* — Another single-author Rust project where the engineering depth runs well ahead of the public profile. Both ship MCP servers as the agent-facing surface.
