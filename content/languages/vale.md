title=Vale (aka VLang, GelLLVM)
tags=language, native
summary=An AOT compiled language that uses an entirely new approach to memory management: generational references, which have zero aliasing costs and no garbage collection pauses.
~~~~~~

[Website](https://vale.dev/) | [Source](https://github.com/ValeLang/Vale) | [Guide](https://vale.dev/guide/introduction)

Vale's goal is to show the world that speed and safety can be easy. Vale is:

* Fast: Vale is an AOT compiled language that uses an entirely new approach to memory management: [generational references](https://vale.dev/blog/generational-references), which have zero aliasing costs and no garbage collection pauses.
* Fearless: It is the [safest native language](https://vale.dev/blog/fearless): zero unsafe, region isolation, extern boundaries, and dependency extern whitelisting.
* Flexible: Its new take on [regions](https://vale.dev/guide/regions) enables alternate memory management and allocation strategies, with the [region borrow checker](https://vale.dev/blog/zero-cost-refs-regions) enabling seamless, fast, and easy interop between them.

Read comparisons with [C++](), [Javascript](), and [Rust]()!

Featuring:

* Statically Typed with type inference.
* Ownership, move semantics, and deterministic destruction.
* Memory Safe, using constraint and weak references.
* Regions for different allocation strategies.
* Inline References for optimization.
* Generics, including virtual generics.
* Interface Constructors
* Universal Function Call Syntax
* Mutable and Immutable Objects
* Patterns: Destructuring, Parameters, Extractors

