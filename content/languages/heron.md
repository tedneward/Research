title=Heron
tags=language, functional, node, browser
summary=A pure functional type-inferred language based on JavaScript.
~~~~~~

[Website](https://cdiggins.github.io/heron-language) | [Source](https://github.com/cdiggins/heron-language)

Heron is a small cross-platform language designed for ease of use, performance, and safety with a JavaScript like syntax. Heron emphasizes pure functional programming code, but looks like a traditional imperative or object-oriented code.

### Design Goals
Heron is intended as a language for expressing libraries of algorithms, that can be reused within other languages as opposed to a language for writing full applications.

Heron is a fully statically typed language that does not require type annotations in most cases (it supports type inference), so it looks and feels like a dynamic language, with the potential efficiency, safety, and tooling of a compiled language.

The Heron design is influenced most heavily by JavaScript, Haskell, C#, Scala, GLSL, and Scheme, but other languages play a role as well. Heron has a powerful module system built into the language, and a language versioning scheme for maintaining backwards compatibility while the language evolves.

Current development on Heron is focused on numerical array processing, such as required in sound and image processing, and data visualization in 2D and 3D. The reference implementation generates JavaScript, but a C++ generator is planned as well.

Heron is built on the principle of emphasizing functional programming, immutable data structures, and type safety while minimizing complexity.

