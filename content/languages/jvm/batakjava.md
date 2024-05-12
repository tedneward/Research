title=Batakjava
tags=language, jvm, versioning
summary=Implementation of Java with multi-versioned classes.
~~~~~~

[Source](https://github.com/ansharlubis/batakjava) | [Paper](https://dl.acm.org/doi/abs/10.1145/3567512.3567531)

Not entirely sure what the point is here--I can see classes tagged with "ver 1" and "ver 2" in the source, but there doesn't seem to be anything doing anything with that.

From a paper:

> Programming with versions is a recent proposal that supports multiple versions of software components in a program. Though it would provide greater freedom for the programmer, the concept is only realized as a simple core calculus, called λVL, where a value consists of λ-terms with multiple versions. We explore a design space of programming with versions in the presence of data structures and module systems, and propose BatakJava, an object-oriented programming language in which multiple versions of a class can be used in a program. This paper presents BatakJava’s language design, its core semantics with subject reduction, an implementation as a source-to-Java translator, and a case study to understand how we can exploit multiple versions in BatakJava for developing an application program with an evolving library.

