title=Crow
tags=language, native
summary=An upcoming general-purpose, high-level programming language.
~~~~~~

[Website](https://crow-lang.org/) | [Source](https://github.com/andy-hanson/crow)

Features:

* Crow programs can be run directly or build to a standalone executable.
* Crow code can directly call C functions. (But typically code is higher-level and safe.)
* Crow has IDE support. The IDE uses the same compiler as on the command line, giving it complete information.
* Syntax is expression-based and uses indentation. Function bodies are expressions with no return needed. Even if and for are expressions.
* Code is flat. Declarations are not nested. (For example, a function doesn't "belong" to a type and so doesn't go inside of it.)
* A 100 character per line limit is realistic.
* All code goes in modules. There are no global declarations, and what you don't import can't hurt you.
* Crow is strongly typed with no subtyping, implicit conversion, or null values.
* Overload resolution is unambiguous; there are no "better" matches.
* Expressions are type-checked with an expected type.
* The same syntax 1, 2 could be a list, tuple, vector, etc., inferred by where it is used. This saves you from having to write something like new List<int>(1, 2).
* Data is garbage collected. Don't worry about what's by-reference or by-value.
* Mutability is controlled. Types track what is safe to share between parallel tasks. It's also easy to use mutable data and ensure that tasks using it wait their turn. Data structures are immutable by default (with efficient immutable updates).
* I/O is controlled. Functions are pure by default and can't do I/O except through parameters.
* Templates are statically checked to work for all possible types.
* Specs allow you to call functions provided by the caller's context.
