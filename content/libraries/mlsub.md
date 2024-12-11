title=MLSub
tags=library, language
summary=Prototype type inference engine.
~~~~~~

[Source](https://github.com/stedolan/mlsub)

This is a prototype type inferencer for an ML-like language with subtyping and polymorphism. It's written in OCaml, and building it requires Menhir.

It accepts lines containing programs written in a very limited subset of OCaml (just lambdas, unit and let), and spews some debugging output and their principal type if it likes them, and an unceremonious exception if it does not.
