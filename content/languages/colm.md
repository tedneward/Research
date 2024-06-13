title=Colm
tags=language, tool, program transformation
summary=A programming language designed for the analysis and transformation of computer languages.
~~~~~~

[Source](https://github.com/adrian-thurston/colm)

Colm = COmputer Language Machinery

## What is a transformation language?
A transformation language has a type system based on formal languages.
Rather than defining classes or data structures, one defines grammars.

A parser is constructed automatically from the grammar, and the parser is used for two purposes:

* to parse the input language,
* and to parse the structural patterns in the program that performs the analysis.

In this setting, grammar-based parsing is critical because it guarantees that both the input and the structural patterns are parsed into trees from the same set of types, allowing comparison.

## Colm's features
Colm is not-your-typical-scripting-language™:

* Colm's main contribution lies in the parsing method.
* Colm's parsing engine is generalized, but it also allows for the construction of arbitrary global data structures that can be queried during parsing. In other generalized methods, construction of global data requires some very careful consideration because of inherent concurrency in the parsing method. It is such a tricky task that it is often avoided altogether and the problem is deferred to a post-parse disambiguation of the parse forest.
* By default Colm will create an elf executable that can be used standalone for that actual transformations.
* Colm is a static and strong typed scripting language.
* Colm is very tiny and fast and can easily be embedded/linked with c/cpp programs.
* Colm's runtime is a stackbased VM that starts with the bare minimum of the language and bootstraps itself.

