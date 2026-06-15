title=Laze
tags=ai, language, syntactic, native
summary=AI-first language focusing on emitting text-shaped, readable input.
~~~~~~

[Source](https://github.com/kerv/laze)

> Minimal indentation-based syntax with no punctuation. A Python bootstrap compiler emits C in memory and pipes it to cc -O2. Framed by its author as a weekend experiment in what an LLM produces when asked to design a language for itself.

**Camp:** Syntactic
**Author:** kerv
**Implementation language:** Python (bootstrap)
**Compilation target:** C (via gcc/clang)
**Licence:** Unknown
**First seen:** April 2026
**Maturity:** early implementation

## Key idea

Laze is an indentation-based language with infix operators and no punctuation. The compiler is a single Python script (laze/lazec.py) that parses .laze files into an AST, generates C in memory without writing it to disk, and pipes the result to a C compiler. The bet is that LLMs are most accurate when emitting text-shaped, readable input; ergonomic syntax for the model is treated as more important than expressive power or efficiency at the language layer.

## What it is

Laze is a weekend experiment, not a production tool. The README opens with the warning, verbatim: "This was just an experiment in which I asked Claude Opus 4.7 to create a programming language in the most efficient way it could." The surface is indentation-based, drops most punctuation, and uses infix operators. The compiler is a Python script that emits C internally &mdash; never written to disk &mdash; and pipes it to `cc -O2` for a native macOS binary. The repository (linked from the author's LinkedIn handle millerkev) contains four commits, two example files, and a single demonstration: `nes.laze`, a 2,000-plus-line NES emulator file covering a 6502 CPU, PPU sprites and scrolling, an APU, and mappers 0, 1, and 4. The author reports Super Mario Bros. as fully playable and Legend of Zelda playable with minor glitches.

## Why it's here

The catalogue includes Laze as a marker of a position in the syntactic camp: optimise the surface for what an LLM finds easiest to produce, not for what a compiler can analyse. The thesis, stated in the README, is that an LLM specialises in text-shaped input because that is what it is trained on, so the right target is whichever syntax it generates most correctly and fastest. The catalogue does not rate Laze against working compilers shipped by larger teams. It marks it as a different kind of evidence: a single contributor's snapshot of what falls out when an LLM is allowed to design its own language and a human supplies only the prompt.

## Design DNA

- **[Magpie](https://agentlanguages.dev/languages/magpie.md)** *(Syntactic)* — Same camp, opposite end of the same axis. Magpie chooses an explicit SSA surface to remove ambiguity; Laze strips punctuation and indentation rules to maximise the model's generation speed.
- **[B-IR](https://agentlanguages.dev/languages/b-ir.md)** *(Syntactic)* — Both are small individual explorations — a weekend's worth of letting an LLM design its own language and recording what came out.
