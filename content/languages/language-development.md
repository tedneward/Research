title=Language Development Tools
tags=language, library
summary=A collection of language development tools and libraries.
~~~~~~

## Tools
[Pck: The Parser Construction Kit](https://www.codeproject.com/Articles/5163943/Pck-The-Parser-Construction-Kit): "It currently supports Yacc/Bison and Flex/lex. Support is coming for GOLD, ANTLR and possibly Coco/R. ... In addition, Pck is unique in that it exposes much of the generation process (including grammar transformation) to the console, so that you can run intermediate tools on the output before feeding into the input of the next phase of the transformation. For example, you may convert a high level representation of a grammar into the low level representation used by the engine, and then left factor it for LL(1) parsing before passing it to the generator, a bit like your compiler and linker work together." [Code](https://github.com/codewitch-honey-crisis/pck)

[Coco/R](http://www.ssw.uni-linz.ac.at/Coco/): "Coco/R is a compiler generator, which takes an attributed grammar of a source language and generates a scanner and a parser for this language. The scanner works as a deterministic finite automaton. The parser uses recursive descent. LL(1) conflicts can be resolved by a multi-symbol lookahead or by semantic checks. Thus the class of accepted grammars is LL(k) for an arbitrary k. There are versions of Coco/R for different languages (see below). The latest versions from the University of Linz are those for C#, Java and C++."

[ANTLR](http://www.antlr.org): Popular parser generator from Terrence Parr. [Github](https://github.com/antlr/antlr4) and [Docs](https://github.com/antlr/antlr4/blob/4.8/doc/index.md). There's also a bunch of [grammars](https://github.com/antlr/grammars-v4) already written for it.

## Examples
[This site](https://catseye.tc/article/Languages.md) has an interesting collection of tiny languages, many of which are esoteric in nature, but some of which have some interesting principles that are worth investigating. It looks like the author of the site spends a ton of time just writing a new language each month or something, going all the way back to 2008 and earlier....

