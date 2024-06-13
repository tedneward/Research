title=Albatross
tags=language
summary=A Programming Language with Static Verification, a Proof Assistant, and a Theorem Prover.
~~~~~~

[Source](https://albatross-lang.sourceforge.net/)

A Programming Language with Static Verification: You can develop programs and algorithms and prove them to be correct in Albatross.

A Proof Assistant: Arbitrary mathematical theories can be expressed and proved in Albatross

A Theorem Prover: It has a proof engine which supports you significantly in doing proofs.

### Why is Albatross Unique?
There are currently a lot of programming languages available on the market. Does adding a new one add value?

On the side of proof assistants and theorem provers it looks similar. There is Coq, Isaballe/HOL, PVS, Mizaar, Agda, etc. just to name some of them. Do we need a new one?

But there are nearly no proof assistants which are also programming languages in the sense that you can write executable programs. E.g. the proof assistant Coq allows you to write functions and proof properties of these functions and to extract the functions into some functional programming language to actually compile them. However you cannot do it in an integrated way and you are limited to the functions expressible in Coq (you cannot write imperative constructs in Coq). I.e. there is a need to fill this gap and have a programming language which allows you to write arbitrary imperative and functional code in it, verify it (i.e. proof it to be correct), compile it and execute it. Albatross is going to fill this gap.

Caveat: The Albatross compiler is in development.

#### Unique Features as Proof Assistant

Information hiding: Each module has private view and a public view, each view resides in a separate file. The private view has all detailed definitions and proofs. The developer can decide which of the functions and assertions it makes available for the users of the module.

No special proof language: Correctness conditions are expressed as assertions which are boolean expressions in predicate logic. Assertions are proved automatically by the proof engine. In case that the proof engine cannot prove an assertion, the programmer adds some intermediate assertions so that the proof engine can step from the assumptions to the conclusion via the intermediate assertions.

Proof automation supported: The proof engine has a lot of automation features included. It does forward and backward reasoning, it expands function definitions, it does simplifications, etc. and it does it recursively. I.e. for many assertions the proof engine does all the work.

The more assertions are visible to the proof engine (i.e. all public assertions of the used modules and the already proved assertions in the current module) the more powerful the proof engine becomes. The developer extends the power of the proof engine by writing clever assertions.

Axiomatic base: There are only a few axioms and inference rules whose validity is evident (see documentation for details). The programmer has to learn only the inference rules in order to prove assertions to be correct. There is no need to understand the theory of dependent types nor constructive logic.

Mathematical functions definable: Beside the possibility to define functions via expressions or recursion (i.e. via an actual computation), Albatross allows the definition of arbitrary mathematical functions. I.e. you can define a function by specifying properties of its result, provided that the proof engine can verify the existence and uniqueness of the result.

Inheritance: Being an object oriented language Albatross supports inheritance. I.e. you can define abstract classes with abstract features and assertions and define functions based on the abstract functions and prove assertions based on the abstract assertions.

Any class which inherits the abstract class has to prove that in implements the abstract functions and assertions and will inherit all the derived functions and assertions.

Albatross extends the inheritance mechanism (which applies to features in other object oriented programming languages) to assertions. I.e. you have function and assertion reuse in derived classes.

#### Unique Features as Programming Language
Statically verified: Each program has a specification and the proof engine verifies that the program satisfies its specification.

Functional, imperative and concurrent: Albatross combines the power of functional, imperative and concurrent languages

Like in your favorite functional language it is possible to use inductive/algebraic data types and to write recursive functions with pattern matching.

Imperative elements like arrays with random access, mutable data structures, flow control constructs like loops, alternative statements etc. are available in Albatross. In principle it is possible to write a certified operating system in Albatross.

Concurrency is supported by processes. Any Albatross program is a process which interacts with its environment by reading and writing to files, listening and responding to sockets. Internally an Albatross program can split up the work to various concurrently executing processes.
