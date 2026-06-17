title=Koru
tags=language, ai, architecture
summary=AI-first architectural language.
~~~~~~

[Website](https://www.korulang.org/) | [Source](https://github.com/korulang/koru)

> Zig-superset systems language with event continuations, mandatory branch handling, phantom typing, and purity tracking. Pre-alpha — 'only ever been compiled on a single computer.' AI-First framing intentionally tongue-in-cheek.

**Camp:** Unclassified
**Author:** Author anonymous (korulang)
**Implementation language:** Koru (metacircular, bootstrapped through Zig)
**Compilation target:** Zig (then native via Zig's backends)
**Licence:** Unknown
**First seen:** December 2025
**Maturity:** early implementation

## Key idea

Koru is a Zig-superset systems language. Every .kz file is valid Zig; Koru constructs are marked by a ~ leader. The distinctive design move is event continuations with mandatory branch handling — events declare their inputs and possible output branches in advance, and invoking an event requires explicitly handling each branch. Phantom typing tracks compile-time resources; purity is tracked; the compiler is metacircular (Koru compiles to Zig). The "AI-First" claim is architectural (event boundaries aid AI reasoning) rather than machinery-based — no SKILL.md, AGENTS.md, MCP server, or structured-JSON diagnostics ship. The compiler itself was authored using Claude Opus 4.1–4.5 and Sonnet 4.5.

## What it is

Koru is a pre-alpha Zig-superset systems programming language. Every `.kz` file is valid Zig; Koru constructs are marked by a `~` leader. The distinctive design move is event continuations with mandatory branch handling &mdash; events declare their inputs and possible output branches in advance, and invoking an event requires explicitly handling each branch. Phantom typing tracks compile-time resources; purity is tracked through the type system; the compiler is metacircular (Koru compiles to Zig). The author is anonymous behind the `korulang` GitHub org and Twitter account; the project's site lists Claude Opus 4.1&ndash;4.5 and Sonnet 4.5 as the models that authored the compiler itself.

The site's tagline is intentionally tongue-in-cheek: "The Hyper-Performant AI-First Postmodern Zero-Cost Fractal Metacircular Phantom-Typed Auto-Disposing Monadic Event Continuation Language with Semantic Space Lifting and Event Taps." Underneath the buzzword cascade, the README is candid about state: *"Pre-Alpha &mdash; Koru is pre-alpha. It has only ever been compiled on a single computer. Use and testing at your own risk."* No `SKILL.md`, `AGENTS.md`, MCP server, or structured-JSON diagnostics ship. The closest planned agent-facing surface is the Compiler Control Protocol (CCP), described as "soon" &mdash; a Koru-internal proposal, not the Model Context Protocol.

## Why it's here

The catalogue includes Koru as a marker of the position where "AI-First" became a tagline trope. The architectural claim (event boundaries provide bounded contexts that aid AI reasoning) is a real design move; the buzzword-cascade tagline is real satire; and the catalogue's unclassified bucket exists for projects whose camp placement isn't yet evidenced by shipped agent-authoring machinery. Companion to Valea and Spec: a real project with substantive design, candidly aware of its pre-alpha state, where the "AI-First" claim is a language-architecture argument rather than a tooling commitment. The pre-alpha disclosure quoted above is the editorial centre of gravity &mdash; the rest of the entry exists to give it context.

## Design DNA

- **[Valea](https://agentlanguages.dev/languages/valea.md)** *(Unclassified)* — Companion in the unclassified bucket. Both stake an 'AI-native systems programming language' position with substantive design proposals but limited public evidence and no agent-authoring machinery shipped. Valea is a Rust MVP announced on Hacker News with JSON diagnostics planned; Koru is a Zig-superset metacircular compiler with event continuations and an explicitly tongue-in-cheek marketing voice.
- **[Spec](https://agentlanguages.dev/languages/spec.md)** *(Unclassified)* — Adjacent unclassified entry on the 'architecture as AI-friendliness' axis. Spec proposes a two-domain IR for multi-agent collaboration; Koru proposes architectural primitives (event boundaries, mandatory branch handling) that aid AI reasoning at the language level. Both make architectural claims about AI-friendliness without shipping agent-authoring tooling.
