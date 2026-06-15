title=Mog
tags=language, ai, syntactic, verification, native
summary=Statically-typed, embedded-only language explicitly designed for LLMs to write.
~~~~~~

[Website](https://moglang.org) | [Source](https://github.com/voltropy/mog)

> Statically typed embedded language with flat operators (no precedence) and host-granted capabilities. Full spec fits in 3,200 tokens. Compiles to native via a safe-Rust port of QBE.

**Author:** Voltropy
**Implementation language:** Rust
**Compilation target:** Native (via rqbe, an in-process safe-Rust port of QBE)
**Licence:** MIT
**First seen:** March 2026
**Maturity:** working compiler

**Agent tooling:**
- docs/context.md ("LLM Context — Compact reference designed to fit in an LLM's context window")
- lang_spec.md
- showcase.mog (755-line single file demonstrating every language feature)
- .mogdecl capability declarations (host-side typing)

## Key idea

Mog is a statically typed, embedded-only language explicitly designed for LLMs to write. The full spec fits in 3,200 tokens. Flat operators mean a + b * c is a compile error; capabilities (fs, http, log) must be declared in source with `requires` or `optional` and granted by the host. There is no standard library — the host provides every capability. Compiles to native via rqbe, a ~15,000-line safe-Rust port of Quentin Carbonneaux's QBE backend. The first version was authored by Voltropy's Volt coding agent in a single three-week continuous session.

## The thesis

Mog's diagnosis sits at the intersection of two camp moves: at the syntactic level, ambiguity is the enemy; at the verification level, ambient authority is the enemy. The flat-operators move makes `a + b * c` a compile error &mdash; every mix of operators requires parentheses, no precedence table to memorise. The capability move makes I/O a declaration: a `requires http, log;` line at the top of a Mog script declares what the host must provide; everything else is unreachable. The project's site frames it as "statically typed Lua, designed to be written by LLMs."

<p class="pullquote">The full spec fits in 3,200 tokens.</p>

The distinctive move is what Mog refuses to do. It is not standalone; it has no standard library; it ships only as an embedded language inside a host application that provides every capability. Compilation is in-process &mdash; no JIT, no interpreter overhead, no process startup cost; the frontend compiles a `.mog` file via rqbe (a safe-Rust port of QBE, ~15,000 lines) and produces a `.dylib` or `.so` the host can `dlopen`. The first version of Mog itself was authored by Voltropy's Volt coding agent in a single three-week continuous session, using Claude Opus 4.6, Kimi k2.5, and GLM-4.7 with Voltropy's lossless context management preserving working memory across compactions. This puts Mog in the same agent-authored cluster as AILANG.

## What it looks like

<div class="code-sample">
  <div class="code">
<pre><span class="kw">import</span> agent;
<span class="kw">optional</span> log;

<span class="cm">// post-compaction hook: re-inject key context</span>
<span class="kw">pub</span> <span class="kw">fn</span> on_post_compaction(session: agent.<span class="ty">Session</span>) {
  log.info(<span class="str">"post-compaction hook: injecting reminder"</span>);

  session.messages.push(agent.<span class="ty">Message</span> {
    role: agent.<span class="ty">Role</span>.SYSTEM,
    content: <span class="str">"IMPORTANT: Always run tests before committing."</span>,
  });
}</pre>
  </div>
  <p class="caption">A Mog script declaring an <code>agent</code> import and an <code>optional</code> log capability. The host decides whether to provide <code>log</code>; the script runs either way. The <code>agent</code> namespace is host-provided typed data.</p>
</div>

## Distinctive moves

- **Flat operators, no precedence.** Mixing different operators requires parentheses; `a + b * c` is a compile error. Non-associative operators (`-`, `/`, `%`, comparisons) cannot chain even with themselves &mdash; `a - b - c` is also rejected; `(a - b) - c` is fine.
- **Capability-based I/O.** A script declares `requires fs, http, log;` (or `optional` for graceful degradation). The host registers what it provides via `.mogdecl` declarations; the runtime refuses calls to anything unregistered. Authority is the host's to grant, not the script's to assume.
- **Embedded only.** Mog explicitly does not target standalone systems work. The README is direct: "Not standalone. Mog is always embedded in a host application. There is no standard library for file I/O or networking &mdash; the host provides everything." The orthogonality is the point.
- **Spec fits in 3,200 tokens.** `docs/context.md` is "compact reference designed to fit in an LLM's context window." A full language spec, deliberately bounded by token budget rather than feature count.
- **rqbe.** Quentin Carbonneaux's QBE backend (2016, ~10% the code of advanced compilers for ~70% the performance) ported to safe Rust at roughly 15,000 lines. The compiler runs in-process; the pipeline shells out only to the system assembler and linker.
- **Agent-authored at origin.** The first version was created by Voltropy's Volt coding agent in a single three-week continuous session. Lossless context management preserved working memory across compactions across Claude Opus 4.6, Kimi k2.5, and GLM-4.7.

## Maturity

128 commits on main, no tagged release, 1,146+ compiler tests plus 186 rqbe tests passing. The 17-chapter guide on the site covers everything from basics through embedding APIs, capabilities, and tensors. The security model is candidly self-described as unaudited: "Mog has not been audited, and it is presented without security guarantees. It should be possible to secure it, but that work has not yet been done." Zero public stars at the time of cataloguing &mdash; like Boruna's initial state, this understates the surface area shipped: a working compiler, a safe-Rust port of QBE, a 17-chapter spec, a capability system, async/await via LLVM-style coroutine lowering.

## Agent tooling

`docs/context.md` is the headline agent-facing surface &mdash; the compact reference designed for LLM consumption. The full `lang_spec.md` and a 755-line `showcase.mog` (demonstrating every language feature in a single file) accompany it. There are no SKILL.md, AGENTS.md, CLAUDE.md, MCP server, or llms.txt files in the repo; the bet is that a spec small enough to fit in the model's context is the right level of agent tooling, rather than a sprawl of orientation documents. Mog ships less than Vera or Boruna do for agent authors and gets away with it because the language itself is small.

## Design DNA

- **[AILANG](https://agentlanguages.dev/languages/ailang.md)** *(Verification)* — Closest design relative on capabilities. AILANG carves IO/FS/Net/Clock/AI as row-polymorphic effects in the type system; Mog grants per-capability at the host via .mogdecl declarations. Both bet authority must be explicit in the surface. Both originated as agent-authored projects.
- **[Zero](https://agentlanguages.dev/languages/zero.md)** *(Verification)* — Sister project on the 'small, one canonical way' diagnosis. Zero pairs that with verification machinery and a structured-JSON CLI; Mog pairs it with capabilities and an in-process QBE backend. Both compile to native.
- **[NanoLang](https://agentlanguages.dev/languages/nanolang.md)** *(Verification)* — Cross-camp cousin in the syntactic+verification spanning region. NanoLang ships Coq proofs and mandatory tests; Mog ships capabilities and a 3,200-token spec. Different bets on what to make load-bearing in a small language.
