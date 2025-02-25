title=Mojo
tags=language, macos, linux, python
summary=Bridges the gap between research and production by combining Python syntax and ecosystem with CPU+GPU, systems programming and metaprogramming features.
~~~~~~

[Website](https://www.modular.com/mojo) | [Github](https://github.com/modularml/mojo)

Hello, Mojo:
```
def main():
    print("Hello Mojo!")
```

* [Getting Started](https://docs.modular.com/mojo/manual/get-started/)
* [Language basics](https://docs.modular.com/mojo/manual/basics)

Uses a new CLI (`magic`) as the usual project management utility.

Supports both declared (`var`) and implicitly-declared variables. Uses optional type annotations. Indentation scoped. Comments are `#`-prefixed single-line.

Functions declared either by `def` or by `fn` (which requires argument and return types, and `raises` if it can raise an error). By default immutable reference argument passing, but allowing for declarations on arguments to indicate by value (`owned`) or by reference (`read` is immutable reference, `mut` as mutable reference). 

Structs use Python class syntax, but are entirely static--bound at compile-time--allowing no dynamic dispatch or runtime changes to the struct.

Metaprogramming:

* Traits are "like a template of characteristics for a struct".
* Parameterization; "a parameter is a compile-time variable that becomes a runtime constant, and it's declared in square brackets on a function or struct." *NOTE:* "Many other languages use "parameter" and "argument" interchangeably, so be aware that when we say things like "parameter" and "parametric function," we're talking about these compile-time parameters. Whereas, a function "argument" is a runtime value that's declared in parentheses." *(This is a huge point-of-definition/glossary obstacle/concern/point-of-awareness.)*

## Articles

* LogRocket: [Getting Started](https://blog.logrocket.com/getting-started-mojo-programming-language/)


