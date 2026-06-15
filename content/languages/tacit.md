title=Tacit
tags=language, ai, agent, syntactic, verification
summary=An LLM-first programming language, implemented with heavy help from an LLM.
~~~~~~

[Blog post](https://hauntemplations.leaflet.pub/3mm3itthizk2v) | [Source](https://github.com/weetster/tacit)

In Claude's ideal LLM-first programming language, there is only one standard way to do something. No coding styles or standards, no formatters, no There's More Than One Way To Do It (TMTOWTDI), no syntactic sugar.

In this new language, there is not just one syntax, but several syntaxes that represent the same AST, depending on the task at hand. Authoring new code, inspecting or debugging code, compiling code, and storing code in source control could each have their own syntax that offers advantages for the requirements of each activity. The conceptual AST becomes the source of truth, instead of one particular representation.

The ideal LLM-first language would track effects of functions, so that understanding the effects of a function is a lookup, not a calculation. If one function in a call chain allocates memory, makes a recursive call, or performs disk I/O, that effect is tracked all the way up the call chain. When an LLM authors or debugs code, no inference of effects is necessary.

Lastly, an LLM-first language would be token-efficient. Less tokens used means less cost.

Before I could even ask Claude what to name this new language, it had already suggested "Tacit", which means "to express without words or speech". Who am I to deny Claude's suggestion?

...

The Tacit compiler is written in Rust. I admit that I've never programmed in Rust and that the compiler is 100% vibe-coded. I've put a lot of trust into the Opus 4.7 and GPT-5.5 frontier models to write correct code, based on the design and ADR documents. Combined with tests, the compiler and toolchain appears to work well.

The compiler uses the inkwell Rust library to generate LLVM intermediate representation (IR). The IR can then be compiled to a native binary for any CPU architecture supported by LLVM, using the decades of optimization that LLVM provides. This allows Tacit to be cross-platform from the beginning.

The compiler supports the concept of "hole nodes" in an AST to represent invalid syntax, which allows the compiler to emit detailed errors and continue parsing the rest of the AST.

Tacit does not support Foreign function interface (FFI) to interoperate with other programming languages, nor does it support use of third-party libraries. To do so would invalidate the effect-tracking model that Tacit is built upon. If Tacit were to make function calls into unknown code, it would lose the ability to make guarantees about what those functions do and the types of undefined behaviour that they may cause.

In order to interact with third-party libraries, Tacit supports a well-defined application binary interface (ABI) that allows two-way communication between a Tacit library and a host program written in C or Rust. A host program can then load both third-party libraries and Tacit code, and act as an intermediary that passes data between the two. In this architecture, code that could have undefined behaviour stays isolated from Tacit and allows Tacit to remain internally consistent.

---

> AST as the source of truth. Canonical byte-exact text, BLAKE3-addressed definitions, DeBruijn indices, typed Hole nodes for malformed code, and explicit effects in function signatures.

**Camp:** Syntactic
**Also spans:** Verification
**Author:** weetster
**Implementation language:** Rust
**Compilation target:** LLVM IR / native (x86_64 Linux)
**Licence:** Apache-2.0 OR MIT
**First seen:** April 2026
**Maturity:** working compiler

**Agent tooling:**
- AGENTS.md
- CLAUDE.md

## Key idea

Tacit treats human-oriented surface syntax as a lossy intermediate. The AST
is the authoritative artefact; every valid AST has exactly one canonical
text serialisation, definitions are content-addressed by the BLAKE3 hash of
that canonical form, variable references are DeBruijn indices, and parser
errors produce typed `Hole` nodes with structured diagnostics rather than
failing the parse. Effects are explicit in function signatures.

## Thesis

Tacit's diagnosis is that text-based source forces models to maintain stylistic conventions, name choices, and whitespace that the compiler immediately discards. The project's response is to make the AST the canonical artefact and treat text as a derived view. The repository's README states the position directly: &ldquo;The AST is the source of truth. Tacit does not treat a human-oriented surface syntax as the authoritative program representation.&rdquo;

<p class="pullquote">If human readability is not the primary constraint, a language can optimise for three things at once.</p>

Two views render the same tree: a dense **authoring view** sized for model token budgets, and an **inspection view** layered for debugging and human review. Both round-trip losslessly through a JSON sidecar (`.tacd`). Canonical text is byte-exact &mdash; there is exactly one serialisation per AST, which eliminates formatter debates and makes hashing meaningful. Definitions are identified by the BLAKE3 hash of their canonical text; display names live in the sidecar and carry no semantic weight. Variable references use DeBruijn indices in canonical form. The cross-camp move is the verification-adjacent effect lattice: Tacit-Lite tracks `IO` / `Alloc` / `Mut` / `Div` in signatures, and unit boundaries must declare type and effect rows explicitly.

## What it looks like

```tacit
unit Math {
  import inc : Int -> Int
    from blake3:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;

  private double : Int -> Int =
    lambda x. @add x x;

  export public add_two : Int -> Int =
    lambda x. inc (inc x);
}
```

Imports name exact `blake3:<64-hex>` definition hashes, not paths or version ranges. Visibility (`public` / `package` / `private`) is part of the artefact. The display names `x`, `inc`, `double` are sidecar metadata; in canonical form references are DeBruijn indices.

## Distinctive moves

- **AST as authoritative source.** The on-disk `.tac` file is the byte-exact canonical projection of the tree; comments and free-form formatting are not in the language. Names, field order, and type/effect hints live in a `.tacd` JSON sidecar.
- **Content-addressed definitions.** Imports resolve to BLAKE3 hashes, not names. Renaming a definition leaves its hash unchanged; changing its signature, body, or referenced hashes produces a new identity. Package manifests pin a hash-indexed local cache.
- **Typed `Hole` nodes instead of parse failures.** Malformed code reduces to a `Hole` node with a structured diagnostic and a type slot, so downstream tools can keep operating on partial programs (ADR 0040, landed in Phase 2).
- **Explicit effect rows on boundaries.** Tacit-Lite's fixed lattice is `IO` / `Alloc` / `Mut` / `Div`; effect signatures are mandatory at unit exports and inferred locally elsewhere. Tacit-Full (refinement types, capability-based security, handlers) is reserved as a roadmap, not shipped.
- **Toolchain pin as a first-class artefact.** `tacit init` writes a `tacit-toolchain.toml` that pins toolchain, primer, and bundled stdlib hashes; every package-aware command refuses to run on a mismatched pin and surfaces a `toolchain-pin-*` diagnostic.

## Maturity

A Rust workspace (five crates: `tacit-canonical`, `tacit-views`, `tacit-typecheck`, `tacit-codegen`, `tacit-cli`) at v0.7.7, released 19 May 2026. Apache-2.0 / MIT dual-licensed; 237 commits, 3 stars, 2 forks at time of cataloguing. The decision log runs to ~90 ADRs; Phase 6 was frozen by [ADR 0089](https://github.com/weetster/tacit/blob/main/decisions/0089-phase-6-frozen.md) on 2026-05-17, closing modules/units, package manifests with hash-pinned lockfiles, package tests with stable `tacit-test-v1` JSON output, fixed-width integers with wrapping/checked/saturating arithmetic, typed mutable-memory handles, source-level stdlib packages (`tacit.core`, `.bytes`, `.array`, `.text`, `.collections`, `.io`), and a constrained host-interface ABI with generated C headers and Rust bindings. A Rust embedding demo links a Tacit kernel as a static library. Phase 7 is the next planned phase; debugger, diff/blame, IDE, public registry, and arbitrary FFI are explicitly out of scope until a later ADR. LLVM 19 is pinned via `inkwell`; published release artefacts target Linux x86_64 with a glibc 2.35 floor.

## Agent tooling

`AGENTS.md` (1.7 KB) carries the Codex-facing sealed-corpus guardrail and a pointer to `CLAUDE.md`. `CLAUDE.md` (~20 KB) functions as a full development guide rather than a SKILL.md &mdash; it enumerates frozen artefacts, ground rules, the file-extension contract (`.tac` / `.tacd` / `.taca`), and the per-phase delivered surface. The toolchain ships its own primer: `tacit primer` prints the byte-pinned Tacit-Lite primer, and `tacit primer --search` / `--list-sections` / `--section <id>` support selective disclosure designed to fit a model's context window without flooding it. Diagnostics, package tests, and `tacit version` all emit stable JSON.

## Design DNA

- **[Magpie](https://agentlanguages.dev/languages/magpie.md)** *(Syntactic)* — Closest neighbour in the same camp. Magpie surfaces SSA as the textual source; Tacit goes a step further and declares the text itself non-authoritative &mdash; the <code>.tac</code> file is a canonical projection of the AST, not the source. Both pay a token cost to strip ambiguity.
- **[X07](https://agentlanguages.dev/languages/x07.md)** *(Syntactic)* — Same direction along the &lsquo;text is lossy&rsquo; axis. X07 stores programs as canonical JSON ASTs and edits them with JSON Patch; Tacit stores them as canonical text projected from the AST, with BLAKE3-addressed identity. Different surfaces, same diagnosis.
- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Cross-camp foil on names. Vera abolishes parameter names entirely in favour of typed DeBruijn slots (<code>@Int.0</code>); Tacit keeps display names as sidecar metadata but uses DeBruijn indices in canonical form. Both treat names as a source of model error rather than a feature.
- **[Mog](https://agentlanguages.dev/languages/mog.md)** *(Syntactic)* — Adjacent on the embedding angle. Mog is a small embedded language with a capability system and a sub-3,200-token spec; Tacit ships a constrained host-interface ABI for a Rust host and explicitly defers capabilities to Tacit-Full. Different bets on whether capability tracking belongs in v1.
