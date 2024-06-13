title=Austral
tags=language
summary=Systems language with linear types.
~~~~~~

[Website](https://austral-lang.org/) | [Source](https://github.com/austral/austral)

Features:

Linear types: linear types allow resources to be handled in a provably-safe manner. Memory can be managed safely and without runtime overhead, avoiding double free(), use-after-free errors, and double fetch errors. Other resources like file or database handles can also be handled safely.

Capabilities: linear capabilities enable fine-grained permissioned access to low-level facilities. Third-party dependencies can be constrained in what types of resources they can access. This makes the language less vulnerable to supply chain attacks.

Typeclasses: typeclasses, borrowed from Haskell, allow for bounded ad-hoc polymorphism.

Safe Arithmetic: Austral has well-defined semantics for all arithmetic operations on numeric types. There are distinct operations for trap-on-overflow arithmetic and modular arithmetic, as in Ada.

Algebraic Data Types: algebraic data types, as in ML or Haskell, with exhaustiveness checking.

Anti-features:

No garbage collection.
No destructors.
No exceptions (and no surprise control flow).
No implicit function calls.
No implicit type conversions.
No implicit copies.
No global state.
No subtyping.
No macros.
No reflection.
No Java-style @Annotations.
No type inference, type information flows in one direction.
No uninitialized variables.
No pre/post increment/decrement (x++ in C).
No first-class async.
No function overloading (except through typeclasses, where it is bounded).
No arithmetic precedence.
No variable shadowing.

