title=B-IR
tags=language, ai, syntactic, python, native
summary=
~~~~~~

[Blog post](https://articles.imjasonh.com/llm-programming-language.md) | [Source](https://github.com/imjasonh/loom)

> A Jason Hall blog post on three attempts at an LLM-optimised language: B-IR with unicode opcodes, TBIR with control characters the model rewrote into English keywords, and Loom with pre/postconditions and stable error codes.

**Camp:** Syntactic
**Author:** Jason Hall (Chainguard)
**Implementation language:** Python (bootstrap)
**Compilation target:** Arm64 assembly (Mach-O via clang)
**Licence:** Unknown
**First seen:** January 2026
**Maturity:** thought experiment

## Key idea

B-IR is a written narrative of three iterations. Gemini produced B-IR with multi-byte unicode opcodes, then proved too cumbersome to bootstrap. Claude Opus replaced it with TBIR using single-byte control characters in the 0x80-0x8B range, then on its own decided the unreadable characters were getting in the way and substituted short English keywords (init, fetch, emit, print, loop, exit). The final iteration, Loom, keeps token density but adds unambiguous scope, mandatory pre/postconditions, and stable error codes that the model is expected to look up rather than re-read in prose.

## What it is

B-IR is not a project. It is a blog post by Jason Hall, principal engineer at Chainguard, first published on his personal articles site on 11 January 2026. The article describes a Sunday spent prompted by a prediction made on the Oxide and Friends "Predictions for 2026" episode that 2026 would be the year LLMs got a programming language not intelligible to humans. Hall asked first Gemini and then Claude Opus to design such a language and recorded what each model produced. The experimental artefacts &mdash; manual.md, an l1-compiler.tbir clocking in at just under 700 lines, and the loom.md specification &mdash; live in the companion GitHub repository `imjasonh/loom` (the repo was originally published as `imjasonh/b-ir`, and that URL still redirects). The article is candid about the iteration arc: the first design (multi-byte unicode opcodes) was too unwieldy for the model itself to bootstrap; the second (single-byte control characters) was abandoned mid-implementation by the model, which substituted short English keywords on its own initiative; the third (Loom) keeps token density but adds the kind of structure the verification camp has long argued for.

## Why it's here

The catalogue includes B-IR as a marker of a meta-question. The interesting result is not the languages themselves but what happens when a working engineer asks two frontier models to design for their own consumption and reports on it honestly. Hall's own observation is that the third iteration ends up resembling existing languages with cleaner error codes and unambiguous scope &mdash; which the catalogue reads as the design space converging on the same concerns the verification camp arrived at independently. The catalogue does not rate B-IR against working compilers. It marks the article as a different kind of evidence: a candid record of what the model gravitates toward when given a blank page.

## Design DNA

- **[Sever](https://agentlanguages.dev/languages/sever.md)** *(Syntactic)* — Both are catalogue-meta companions. Each captures what falls out when a frontier model is asked to design a language for itself; both authors keep the result at arm's length from any production claim.
- **[Laze](https://agentlanguages.dev/languages/laze.md)** *(Syntactic)* — Both are small explorations by a single author working with one model over a weekend. Laze ships a compiler; B-IR ships an article.
- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Loom's conclusions — unambiguous scope, mandatory pre/postconditions, stable error codes — converge on the diagnosis Vera arrived at independently in the verification camp.
