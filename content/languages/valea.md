title=Valea
tags=language, ai, native
summary=AI-first language that proritizes deterministic syntax, explicit semantics with no hidden allocations or exceptions, machine-readable diagnostics, canonical formatting, and a small language surface to reduce edge cases.
~~~~~~

[Source](https://github.com/hvoetsch/valea)

> An AI-native systems programming language announced on Hacker News in March 2026. The Rust MVP compiler ships JSON diagnostics, a JSON AST exporter, a formatter, and a C backend. Public information beyond the repository README is limited.

**Camp:** Unclassified
**Author:** Hans Voetsch (Google)
**Implementation language:** Rust
**Compilation target:** C (via the emit-c command)
**Licence:** MIT
**First seen:** March 2026
**Maturity:** early implementation

**Agent tooling:**
- JSON-emitting diagnostics (`valea check --json`) with stable error codes such as E001
- JSON AST export (`valea ast --json`)
- Canonical formatter (`valea fmt`)
- AGENTS.md and CLAUDE.md present in the repository for agent orientation

## Key idea

Valea declares five properties as its design surface: deterministic syntax, explicit semantics with no hidden allocations or exceptions, machine-readable diagnostics, canonical formatting, and a small language surface to reduce edge cases. The README sketches the intended workflow as an agent receiving a goal, writing Valea code, reading JSON diagnostics from the compiler, applying fixes, and producing a program that compiles and runs.

## What it is

We do not have enough public information to classify Valea, and that honesty is itself the entry's defining quality. What is publicly available is a Hacker News post from March 2026 titled "Valea: An AI-native systems programming language," a GitHub repository at `hvoetsch/valea`, and a README that frames the project as a community language experiment. The README lists five design principles (deterministic syntax, explicit semantics, machine-readable diagnostics, canonical formatting, small language surface) and an example function in a Rust-flavoured surface. The compiler is a Rust MVP exposing four subcommands: `check` (with JSON output), `ast` (with JSON output), `fmt`, and `emit-c`. The repository contains a SPEC.md, MANIFESTO.md, ROADMAP.md, AGENTS.md, and CLAUDE.md, with 24 commits and a single demo recording on asciinema. Licence is MIT. The Google affiliation listed on the catalogue card is not stated in the repository itself.

## Why it's in the agentlanguages catalog

The catalogue includes Valea as a marker of the noise floor of the field. Projects with this much intent, this little code, and this much manifesto are now common enough that the catalogue has an unclassified bucket for them. The relevant observation is not what Valea is but that an entry like this exists at all &mdash; that "AI-native systems programming language" has become a recognisable category on Hacker News with a recognisable shape (Rust compiler, JSON diagnostics, agent-oriented README files). The catalogue does not rate Valea against working compilers with measured benchmarks. It marks it as a different kind of evidence: an early signal that the design vocabulary of the field is stabilising even where the implementations have not yet shipped enough to evaluate.
