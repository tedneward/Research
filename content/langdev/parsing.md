title=Parsing (language syntax)
tags=reading, language development, tool, library
summary=A collection of links on parsers, parser generators, parsing algorithms, and so on.
~~~~~~


## Tools

* [Bison](/tools/bison)/yacc
* [Lemon](/tools/lemon)
* [ANTLR](/tools/antlr)
* Parser Expression Grammars (PEGs)
* [myna](https://github.com/cdiggins/myna-parser): Myna is an efficient and easy to use parsing library for JavaScript written using TypeScript 2.0 which targets ECMAScript 5.1.
* [syntax](https://github.com/DmitrySoshnikov/syntax): Syntactic analysis toolkit, language-agnostic parser generator.
* [Gold](./gold.md)

## Articles

* Strumenta

    * [Parsing in JavaScript](https://tomassetti.me/parsing-in-javascript)

* [Building a Parser from scratch](https://dmitrysoshnikov.teachable.com/p/parser-from-scratch)
* [Building Extensible Parsers with Camlp4](https://asankhaya.github.io/pdf/BuildingExtensibleParserswithCamlp4.pdf)
* [Demystifying Pratt Parsers](https://martin.janiczek.cz/2023/07/03/demystifying-pratt-parsers.html)
* [Rewriting the Ruby parser](https://railsatscale.com/2023-06-12-rewriting-the-ruby-parser)
* [A Guide to Parsing: Algorithms and Terminology](https://tomassetti.me/guide-parsing-algorithms-terminology/)

## Theory and approaches

[Pratt parsing](http://web.archive.org/web/20151223215421/http://hall.org.ua/halls/wizzard/pdf/Vaughan.Pratt.TDOP.pdf)

[Tree-sitter](https://tree-sitter.github.io/tree-sitter/): a parser generator tool and an incremental parsing library. It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited. Tree-sitter aims to be: **General** enough to parse any programming language; **Fast** enough to parse on every keystroke in a text editor; **Robust** enough to provide useful results even in the presence of syntax errors; **Dependency-free** so that the runtime library (which is written in pure C) can be embedded in any application

