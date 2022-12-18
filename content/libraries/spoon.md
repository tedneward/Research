title=SPOON
tags=library, language, jvm, code generation, static analysis, metaobject programming
summary=A metaprogramming library to analyze and transform Java source code; it parses source files to build a well-designed AST with powerful analysis and transformation API.
~~~~~~

[Website](http://spoon.gforge.inria.fr/) | [Source](https://github.com/INRIA/spoon)

### Design Philosophy
R1) The Spoon metamodel is as close as possible to the language concepts.

R2) The Spoon model of a program is complete and sound.

R3) The text version of a Spoon model is well-formed and semantically equivalent to the original program.

R4) The analysis and transformation API is intuitive and regular.

R5) Transformation operators are designed to warn as fast as possible about invalid programs. This is done either with static type checking or with dynamic checks when the operators are used.

R6) When feasible, the text version of a Spoon model is close to the original one.

