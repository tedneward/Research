title=Nemerle
tags=language, clr, object, functional, metaobject
summary=A general-purpose, multi-paradigm programming language for the .Net platform; metaprogramming is based on macros bearing some similarity to Lisp.
~~~~~~

[Website](http://nemerle.org) [Source](https://github.com/rsdn/nemerle)

> Nemerle is a high-level statically-typed programming language for the .NET platform. It offers functional, object-oriented and imperative features. It has a simple C#-like syntax and a powerful meta-programming system.

> Features that come from the functional land are variants, pattern matching, type inference and parameter polymorphism (aka generics). The meta-programming system allows great compiler extensibility, embedding domain specific languages, partial evaluation and aspect-oriented programming.

Supported paradigms: Object-Oriented Programming (OOP), Functional Programming (FP), Metaprogramming (MP), Component-Oriented Programming (COP), DSL-Oriented Programming (DOP) or Language Oriented Programming (LOP).

Type system: static typing, strong typing, inferred, nominal.

Influenced by: C# (OOP & Imperative support), ML (FP support), Lisp (macros support).

Supported Platforms: CLI (.Net & Mono).

## Examples
Create `hello.n`:

```
using System.Console;

WriteLine("Hello world")
```

