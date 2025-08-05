title=Parsing (language syntax)
tags=reading, language development, tool, library
summary=A collection of links on parsers, parser generators, parsing algorithms, and so on.
~~~~~~


## Tools

* [ANTLR](/langdev/antlr)
* [APG](http://sabnf.com/): a recursive-descent parser using a variation of Augmented BNF, that they call Superset Augmented BNF. ABNF is a particular variant of BNF designed to better support bidirectional communications protocol. APG also support additional operators, like syntactic predicates and custom user defined matching functions. It can generate parsers in C/C++, Java e JavaScript. Support for the last language seems superior and more up to date: it has a few more features and seems more updated. In fact the documentation says it is designed to have the look and feel of JavaScript RegExp.
* [Bison](/langdev/bison)/yacc
* [BYACC/J](http://byaccj.sourceforge.net/)
* [Canopy](/langdev/canopy): PEG parser compiler targeting Java, JavaScript, Python and Ruby. It takes a file describing a parsing expression grammar and compiles it into a parser module in the target language. The generated parsers have no runtime dependency on Canopy itself.
* [Coco/R](https://ssw.jku.at/Research/Projects/Coco/)
* [CookCC](https://github.com/coconut2015/cookcc)
* [CUP](http://www2.cs.tum.edu/projects/cup/) (Untouched in 2016)
* [Funcj.parser](https://github.com/typemeta/funcj/tree/master/parser): a Java parser combinator framework for constructing LL(1) parsers. It’s based primarily on the “Deterministic, error-correcting combinator parsers” paper by S.D. Swierstra & L. Duponcheel, and draws inspiration from various parsers in the Haskell world, as well as the ParsecJ library. It is part of [a framework of functional Java libraries](https://github.com/typemeta/funcj). The library wants to provide a simple internal Domain Specific Language to express grammar languages.
* [Gold](/langdev/gold)
* [Grammatica](/langdev/grammatica)
* [Jacc](https://github.com/zipwith/jacc)
* [JavaCC](https://javacc.org/)
* [JParsec](/langdev/jparsec): the port of the parsec library of Haskell.
* [JFlex](http://jflex.de/)
* [Lambda PEG parser](https://github.com/ruediste/lambda-peg-parser): This is a Java library providing easy-to-use, powerful and elegant parsing of arbitrary text. It is based on Parsing Expression Grammars (PEGs), which are similar to simple recursive descent parsers, as you would write them by hand, with the addition of backtracking (try something, if it fails, try something else) and support for left recursion. This project is similar to parboiled, with the important difference that the rule methods are executed directly and can return any value. This reduces the conceptual difference to hand coded parsers and thus makes learning to use the parser easier.
* [Lemon](/langdev/lemon)
* [ModelCC](http://www.modelcc.org/)
* [Mouse](/langdev/mousepeg): a tool to transcribe PEG into an executable parser written in Java
* [myna](https://github.com/cdiggins/myna-parser): Myna is an efficient and easy to use parsing library for JavaScript written using TypeScript 2.0 which targets ECMAScript 5.1.
* [Parboiled](/langdev/parboiled): a recursive descent PEG parser implementation that operates on PEG rules you specify.
* [PetitParser](https://github.com/petitparser/java-petitparser): combines ideas from scannerless parsing, parser combinators, parsing expression grammars and packrat parsers to model grammars and parsers as objects that can be reconfigured dynamically. All the information is written in the source code, but the source code is divided in two files. In one file you define the grammar, while in the other one you define the actions corresponding to the various elements. The idea is that it should allow you to dynamically redefine grammars. While it is smartly engineered, it is debatable if it is also smartly designed.
* [Rats!](http://cs.nyu.edu/rgrimm/xtc/): Parser generator part of xtc. (Appears down.)
* [Rekex](https://github.com/zhong-j-yu/rekex): a new parser generator with a novel approach that flips writing a parser on its head. With traditional parser generators you write a grammar and then the generated parser produces a parse tree. One issue with this approach is that the parse tree is rarely what you want. So, you need to post-process the parse tree to create a data structure that fits your program. This can be a long process in itself. Particularly if you are dealing with a large grammar. You might be forced to optimize the grammar for performance during parsing, but this leads to a convoluted parse tree. Therefore you then have to spend more time in creating a sensible AST for your end users. Rekex changes the process of designing a parser starting from the desired AST. 
* [Tree-sitter](/langdev/tree-sitter)
* [syntax](https://github.com/DmitrySoshnikov/syntax): Syntactic analysis toolkit, language-agnostic parser generator.

## Articles

* Strumenta

    * [Parsing in JavaScript](https://tomassetti.me/parsing-in-javascript)
    * [Parsing in Java](https://tomassetti.me/parsing-in-java/)

* [Building a Parser from scratch](https://dmitrysoshnikov.teachable.com/p/parser-from-scratch)
* [Building Extensible Parsers with Camlp4](https://asankhaya.github.io/pdf/BuildingExtensibleParserswithCamlp4.pdf)
* [Demystifying Pratt Parsers](https://martin.janiczek.cz/2023/07/03/demystifying-pratt-parsers.html)
* [Rewriting the Ruby parser](https://railsatscale.com/2023-06-12-rewriting-the-ruby-parser)
* [A Guide to Parsing: Algorithms and Terminology](https://tomassetti.me/guide-parsing-algorithms-terminology/)
* ["Runtime-Extensible Parsers"](https://duckdb.org/pdf/CIDR2025-muehleisen-raasveldt-extensible-parsers.pdf)
* ["Packrat Parsers Can Support Left Recursion"](https://github.com/ruediste/lambda-peg-parser/blob/master/www.vpri.org/pdf/tr2007002_packrat.pdf)
* [Incremental recursive descent parsing](https://www.academia.edu/29004707/Incremental_recursive_descent_parsing) (1990)

## Theory and approaches

[Pratt parsing](http://web.archive.org/web/20151223215421/http://hall.org.ua/halls/wizzard/pdf/Vaughan.Pratt.TDOP.pdf)

[Tree-sitter](https://tree-sitter.github.io/tree-sitter/): a parser generator tool and an incremental parsing library. It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited. Tree-sitter aims to be: **General** enough to parse any programming language; **Fast** enough to parse on every keystroke in a text editor; **Robust** enough to provide useful results even in the presence of syntax errors; **Dependency-free** so that the runtime library (which is written in pure C) can be embedded in any application

