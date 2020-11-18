title=Zetavm
tags=vm, language
summary=Multi-Language Platform for Dynamic Programming Languages.
~~~~~~

[Website](https://pointersgonewild.com/category/zeta/) | [Source](https://github.com/zetavm/zetavm)

(Claims under development, but no commits for 3 years.)

ZetaVM is a Virtual machine and JIT compiler for dynamic programming languages. It implements a basic core runtime environment on top of which programming dynamic languages can be implemented with relatively little effort.

Features of the VM include:

* Built-in support for dynamic typing
* Garbage collection
* JIT compilation
* Dynamically growable objects (JS-like)
* Dynamically-typed arrays (JS/Python-like)
* Integer and floating-point arithmetic
* Immutable UTF-8 strings
* Text-based code and data storage format (JSON-like)
* First-class stack-based bytecode (code is data)
* Built-in graphical and audio libraries
* Coming soon: built-in package manager

Zeta image files (.zim) are JSON-like, human-readable text files containing objects, data and bytecodes to be executed by ZetaVM. They are intended to serve as a compilation target, and may contain executable programs, or libraries/packages.
