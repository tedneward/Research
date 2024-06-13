title=Dafny
tags=language, verification, clr, jvm, python, ecmascript
summary=A verification=ready programming language.
~~~~~~

[Website](https://dafny.org/) | [Source](https://github.com/dafny-lang/dafny)

Dafny is a verification-ready programming language. As you type in your program, Dafny's verifier constantly looks over your shoulder, flags any errors, shows you counterexamples, and congratulates you when your code matches your specifications. When you're done, Dafny can compile your code to C#, Go, Python, Java, or JavaScript (more to come!), so it can integrate with your existing workflow.

Dafny will give you assurance that your code meets the specifications you write, while letting you write both code and specifications in the Dafny programming language itself. Since verification is an integral part of development, it will thus reduce the risk of costly late-stage bugs that are typically missed by testing.

Dafny has support for common programming concepts such as classes and trait inheritance, inductive datatypes that can have methods and are suitable for pattern matching, lazily unbounded datatypes, subset types e.g. for bounded integers, lambdas, and immutable and mutable data structures.

Dafny also offers an extensive toolbox for mathematical proofs, such as unbounded and bounded quantifiers, calculational proofs, pre- and post-conditions, termination conditions, loop invariants, and read/write specifications.

The language itself draws pieces of influence from:

* Euclid (from the mindset of a designing a language whose programs are to be verified),
* Eiffel (like the built-in contract features),
* CLU (like its iterators, and inspiration for the out-parameter syntax),
* Java, C#, and Scala (like the classes and traits, and syntax for functions),
* ML (like the module system, and its functions and inductive datatypes), and
* Coq and VeriFast (like the ability to include co-inductive datatypes and being able to write inductive and co-inductive proofs).

