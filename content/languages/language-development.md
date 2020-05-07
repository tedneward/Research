title=Language Development Tools
tags=language, library
summary=A collection of language development tools and libraries.
~~~~~~

## Tools
[Pck: The Parser Construction Kit](https://www.codeproject.com/Articles/5163943/Pck-The-Parser-Construction-Kit): "It currently supports Yacc/Bison and Flex/lex. Support is coming for GOLD, ANTLR and possibly Coco/R. ... In addition, Pck is unique in that it exposes much of the generation process (including grammar transformation) to the console, so that you can run intermediate tools on the output before feeding into the input of the next phase of the transformation. For example, you may convert a high level representation of a grammar into the low level representation used by the engine, and then left factor it for LL(1) parsing before passing it to the generator, a bit like your compiler and linker work together." [Code](https://github.com/codewitch-honey-crisis/pck)

[Coco/R](http://www.ssw.uni-linz.ac.at/Coco/): "Coco/R is a compiler generator, which takes an attributed grammar of a source language and generates a scanner and a parser for this language. The scanner works as a deterministic finite automaton. The parser uses recursive descent. LL(1) conflicts can be resolved by a multi-symbol lookahead or by semantic checks. Thus the class of accepted grammars is LL(k) for an arbitrary k. There are versions of Coco/R for different languages (see below). The latest versions from the University of Linz are those for C#, Java and C++."

