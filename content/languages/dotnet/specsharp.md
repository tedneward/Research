title=Spec#
tags=language, research, clr
summary=A formal language for API contracts, which extends C# with constructs for non-null types, preconditions, postconditions, and object invariants.
~~~~~~

"The Spec# programming system is a new attempt at a more cost effective way to develop and maintain high-quality software. Spec# is pronounced “Spec sharp” and can be written (and searched for) as the “specsharp” or “Spec# programming system”. The Spec# system consists of:

* The Spec# programming language. Spec# is an extension of the object-oriented language C#. It extends the type system to include non-null types and checked exceptions. It provides method contracts in the form of pre- and postconditions as well as object invariants.
* The Spec# compiler. Integrated into the Microsoft Visual Studio development environment for the .NET platform, the compiler statically enforces non-null types, emits run-time checks for method contracts and invariants, and records the contracts as metadata for consumption by downstream tools.
* The Spec# static program verifier. This component (codenamed Boogie) generates logical verification conditions from a Spec# program. Internally, it uses an automatic theorem prover that analyzes the verification conditions to prove the correctness of the program or find errors in it.

"A unique feature of the Spec# programming system is its guarantee of maintaining invariants in object-oriented programs in the presence of callbacks, threads, and inter-object relationships."

[Website](https://www.microsoft.com/en-us/research/project/spec/) | [Codeplex archive](https://archive.codeplex.com/?p=specsharp)

