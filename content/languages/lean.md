title=Lean
tags=language, functional, proof
summary=An open-source programming language and proof assistant that enables correct, maintainable, and formally verified code.
~~~~~~

[Website](https://lean-lang.org/) | [Source](https://github.com/leanprover/lean4) | [Docs](https://lean-lang.org/documentation/) | [Theorem Proving in Lean](https://lean-lang.org/theorem_proving_in_lean4/title_page.html) | [Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/)

Lean is an open source theorem prover and programming language being developed at Microsoft Research. Lean aims to bridge the gap between interactive and automated theorem proving, by situating automated tools and methods in a framework that supports user interaction and the construction of fully specified axiomatic proofs.

Lean has numerous features, including:

* Type inference
* First-class functions
* Powerful data types
* Pattern matching
* Type classes
* Extensible syntax
* Hygienic macros
* Dependent types
* Metaprogramming framework
* Multithreading
* Verification: you can prove properties of your functions using Lean itself

Example:
```
-- Defines a function that takes a name and produces a greeting.
def getGreeting (name : String) := s!"Hello, {name}! Isn't Lean great?"

-- The `main` function is the entry point of your program.
-- Its type is `IO Unit` because it can perform `IO` operations (side effects).
def main : IO Unit :=
  -- Define a list of names
  let names := ["Sebastian", "Leo", "Daniel"]

  -- Map each name to a greeting
  let greetings := names.map getGreeting

  -- Print the list of greetings
  for greeting in greetings do
    IO.println greeting

```


