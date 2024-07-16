title=Reading on Domain-Specific Languages (DSLs)
tags=reading, language, langdev
summary=A collection of articles and other links.
~~~~~~

[BuildIt](https://buildit.so/): A framework for rapidly developing high-performance Domain Specific Languages (DSLs) with little to no compiler knowledge. [Source](https://github.com/BuildIt-lang/buildit/)

[gel: Generic Extensible Language](https://www.cs.utexas.edu/~wcook/Drafts/2008/gel.pdf) (PDF)

> One of the things I like about this paper is that it points out that Lisp and XML are essentially the same creature: Lisp: `(if (< x 3) (print x))` == XML: `<if><test op="lt"><var name="x"/><const>3</const></test><then><call fun="print"><arg>x</arg></call></then></if>` I kinda love that.

[coAST](https://github.com/coala/coAST): coAST is a universal abstract syntax tree that allows to easily analyze each programming language. Especially adding new languages should be easy and generic. (Last update Dec 2018)

[MLIR: Creating a Toy Language and AST](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-1/)

[Creating a DSL Step by Step, Part 1](https://www.youtube.com/watch?v=3sfMSHyjMHk)

[Create a programming language that the whole company can understand](https://www.youtube.com/watch?app=desktop&v=G2TxT0muOis)

[Creating a Ruby DSL: A Guide to Advanced Metaprogramming](https://www.toptal.com/ruby/ruby-dsl-metaprogramming-guide)

[Towards Dynamically Extensible Syntax](https://homepages.cwi.nl/~storm/publications/jh.pdf): introduces CherryLisp -- a Lisp dialect with dynamically user-definable syntax that suffers from neither of [drawbacks listed in the abstract].
