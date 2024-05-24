title=Crow
tags=language
summary=  - Crow programs can be run directly from source. You can also build your program to a standalone executable. In either case, you don't need a build system. You can directly call C functions. Data is garbage collected. Don't worry about what's by-reference or by-value. Crow is statically typed. There's no subtyping or implicit conversion. There are no null references. Overload resolution is unambiguous. I/O is controlled. Normal functions can't do I/O except by invoking a lambda from a parameter. You can launch parallel tasks and get the result as a future. Mutability is controlled. The type system tracks whether a type allows access to mutable data. This ensures that mutable data is not shared across threads. Syntax is expression-based. Function bodies are expressions with no return needed. Even if and for are expressions. Code is flat. Most declarations are not nested inside of anything. Expressions are type-checked with an expected type. The same syntax like (1, 2) could be a list, tuple, vector, etc. This saves you from having to write new Foo(). There are discriminated unions, including option types. There are templates; these are type-checked abstractly, not at each instantiation. All crow code goes in modules. There are no global declarations.
~~~~~~

[Source](https://crow-lang.org)

