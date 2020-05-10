title=PLZoo (Programming Languages Zoo)
tags=language, place, vm
summary=The Programming Languages Zoo is a collection of miniature programming languages which demonstrates various concepts and techniques used in programming language design and implementation.
~~~~~~

It is a good starting point for those who would like to implement their own programming language, or just learn how it is done. The following features are demonstrated:

* functional, declarative, object-oriented, and procedural languages
* source code parsing with a parser generator
* recoding of source code positions
* pretty-printing of values
* interactive shell (REPL) and non-interactive file processing
* untyped, statically and dynamically typed languages
* type checking and type inference
* subtyping, parametric polymorphism, and other kinds of type systems
* eager and lazy evaluation strategies
* recursive definitions
* exceptions
* interpreters and compilers
* abstract machine

The languages are not really meant to be used. Rather, you should read and study the source code, which is decorated with ample comments. Also, each language `lang` has its own `README.markdown` and `example.lang` in the subdirectory `src/lang`. Nevertheless, all the language are fully functioning miniature versions of real languages and can be executed.

[Website](http://plzoo.andrej.com/) | [Github](https://github.com/andrejbauer/plzoo)
