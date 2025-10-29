title=Logic Programming
tags=language, concept, logic, relational, rules
summary=Discussions of logically-dependent expressionism in programming, aka logic programming.
~~~~~~

## Languages

- [Prolog](/languages/prolog/)
- [Datalog](/languages/datalog)

## Reading

### Books

* [Logic Programming and Databases](https://link.springer.com/book/10.1007/978-3-642-83952-8) (1990)

### Papers

* [Finite-Choice Logic Programming](https://arxiv.org/abs/2405.19040) ([PDF](https://arxiv.org/pdf/2405.19040)): "Logic programming, as exemplified by datalog, defines the meaning of a program as its unique smallest model: the deductive closure of its inference rules. However, many problems call for an enumeration of models that vary along some set of choices while maintaining structural and logical constraints -- there is no single canonical model. The notion of stable models for logic programs with negation has successfully captured programmer intuition about the set of valid solutions for such problems, giving rise to a family of programming languages and associated solvers known as answer set programming. Unfortunately, the definition of a stable model is frustratingly indirect, especially in the presence of rules containing free variables.
    "We propose a new formalism, finite-choice logic programming, that uses choice, not negation, to admit multiple solutions. Finite-choice logic programming contains all the expressive power of the stable model semantics, gives meaning to a new and useful class of programs, and enjoys a least-fixed-point interpretation over a novel domain. We present an algorithm for exploring the solution space and prove it correct with respect to our semantics. Our implementation, the Dusa logic programming language, has performance that compares favorably with state-of-the-art answer set solvers and exhibits more predictable scaling with problem size."

### Tutorials

* [A Very Gentle Introduction To Relational & Functional Programming](https://github.com/swannodette/logic-tutorial): This tutorial will guide you through the magic and fun of combining relational programming (also known as logic programming) with functional programming.

