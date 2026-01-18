title=Big Bang
tags=langdev, language, object
summary=A research project around object language(s).
~~~~~~

[Website](https://pl.cs.jhu.edu/projects/big-bang/) | [Safe, Fast and Easy: Towards Scalable Scripting Languages](/langdev/big-bang/safe-fast-and-easy--towards-scalable-scripting-languages.pdf) | [Building a Typed Scripting Language](/langdev/big-bang/building-a-typed-scripting-language.pdf)

The Big Bang project aims to create a typed programming language with the feel and convenience of modern scripting languages. Projects such as DRuby and Typed Racket retrofit type systems onto existing scripting languages; unfortunately, these projects are burdened by backwards compatibility, as dynamic scripting languages are developed without regard to the static typeability of the features they include. Big Bang re-examines the design of scripting-style languages from a static typing perspective.

* No explicit typing: One primary appeal of scripting languages is that programmers need not explicitly specify types, even at module or function boundaries.
* Global type inference: The type system should not be brittle to refactorings such as method extraction.
* Performance: Using static type information, we contend that it will be possible to compile Big Bang scripts to much more efficient programs than with scripting languages such as Python or Ruby.
* Path sensitivity: Scripting programmers often use path-sensitive reasoning when confirming that a program is sound; the Big Bang type system does as well.
* No arbitrary cutoffs: Polymorphism in Big Bang does not rely on fixed cutoffs or scoping limitations; this ensures that the programmer will not be surprised by arbitrary compiler decisions.

