title=Julia
tags=language, functional
summary=A flexible dynamic language, appropriate for scientific and numerical computing, with performance comparable to traditional statically-typed languages.
~~~~~~

[Website](https://julialang.org/) | [Docs](https://docs.julialang.org/en/v1/) | [Source](https://github.com/JuliaLang/julia) | [Style Guide](https://docs.julialang.org/en/v1/manual/style-guide/#Style-Guide)

### Julia in a Nutshell

* Fast: Julia was designed from the beginning for high performance. Julia programs compile to efficient native code for multiple platforms via LLVM.

* Dynamic: Julia is dynamically typed, feels like a scripting language, and has good support for interactive use.

* Reproducible: Reproducible environments make it possible to recreate the same Julia environment every time, across platforms, with pre-built binaries.

* Composable: Julia uses multiple dispatch as a paradigm, making it easy to express many object-oriented and functional programming patterns. The talk on the Unreasonable Effectiveness of Multiple Dispatch explains why it works so well.

* General: Julia provides asynchronous I/O, metaprogramming, debugging, logging, profiling, a package manager, and more. One can build entire Applications and Microservices in Julia.

* Open source: Julia is an open source project with over 1,000 contributors. It is made available under the MIT license. The source code is available on GitHub.

Julia features optional typing, multiple dispatch, and good performance, achieved using type inference and just-in-time (JIT) compilation, implemented using LLVM. It is multi-paradigm, combining features of imperative, functional, and object-oriented programming. Julia provides ease and expressiveness for high-level numerical computing, in the same way as languages such as R, MATLAB, and Python, but also supports general programming. To achieve this, Julia builds upon the lineage of mathematical programming languages, but also borrows much from popular dynamic languages, including Lisp, Perl, Python, Lua, and Ruby.

The most significant departures of Julia from typical dynamic languages are:

* The core language imposes very little; Julia Base and the standard library are written in Julia itself, including primitive operations like integer arithmetic
* A rich language of types for constructing and describing objects, that can also optionally be used to make type declarations
* The ability to define function behavior across many combinations of argument types via multiple dispatch
* Automatic generation of efficient, specialized code for different argument types
* Good performance, approaching that of statically-compiled languages like C

Although one sometimes speaks of dynamic languages as being "typeless", they are definitely not: every object, whether primitive or user-defined, has a type. The lack of type declarations in most dynamic languages, however, means that one cannot instruct the compiler about the types of values, and often cannot explicitly talk about types at all. In static languages, on the other hand, while one can – and usually must – annotate types for the compiler, types exist only at compile time and cannot be manipulated or expressed at run time. In Julia, types are themselves run-time objects, and can also be used to convey information to the compiler.

While the casual programmer need not explicitly use types or multiple dispatch, they are the core unifying features of Julia: functions are defined on different combinations of argument types, and applied by dispatching to the most specific matching definition. This model is a good fit for mathematical programming, where it is unnatural for the first argument to "own" an operation as in traditional object-oriented dispatch. Operators are just functions with special notation – to extend addition to new user-defined data types, you define new methods for the + function. Existing code then seamlessly applies to the new data types.

Partly because of run-time type inference (augmented by optional type annotations), and partly because of a strong focus on performance from the inception of the project, Julia's computational efficiency exceeds that of other dynamic languages, and even rivals that of statically-compiled languages. For large scale numerical problems, speed always has been, continues to be, and probably always will be crucial: the amount of data being processed has easily kept pace with Moore's Law over the past decades.

# Notes

## From the official docs

### Syntax
Semicolons optional. In the REPL, semicolon prevents display of the expression preceding it.

To evalue expressions in a source file: `include("file.jl")`. To run code from a file non-interactively, use `julia script.jl arg1 arg2 arg3`. To evaluate a literal string at the command-line, use -e: 

```
$ julia -e 'println(PROGRAM_FILE); for x in ARGS; println(x); end' foo bar

foo
bar
```

Local variables are mutable by default and do not require declaration before use. Names are case-sensitive. Unicode source.

All variables can be rebound, including predefined values (`pi`, `sqrt`, etc). However, if the variable is "in use elsewhere", it prevents the redefinition.

Operators (like `(+)`) are valid identifiers and can be re-bound.

### Variable types
`(U)Int8/16/32/64/128`, `Bool`, `Float16/32/64`. 

Supports [complex and rational numbers](https://docs.julialang.org/en/v1/manual/complex-and-rational-numbers/) in a manner that looks relatively native. `im` is the suffix for complex number literals. Rationals are constructed via the `//` operator. Rational numbers support the usual mathematical operations: `2//3 == 6//9` is true. `3//4 > 2//3` is also true. `2//4 + 1//6` yields `2//3`.

Strings are finite sequences of characters (`Char`: "32-bit primitive type with a special literal representation and appropriate arithmetic behaviors, and which can be converted to a numeric value representing a Unicode code point"). String literals denoted by double quotes or triple quotes: `str = "Hello world"` or `"""Contains "quote" characters"""`. Strings concatenate using the `*` operator: `greet = "Hello"; whom = "world"; greet * ", " * whom * ".\n"` yields `Hello, world.`. Strings also support `$`-prefixed interpolation (using rounded brackets to group into a single expression if necessary or desired).



### REPL
Local value `ans` is always bound to the result of the most-recent expression. This is not supported when not running in the interactive interpreter/REPL.

### Stylistic Conventions
While Julia imposes few restrictions on valid names, it has become useful to adopt the following conventions:

* Names of variables are in lower case.
* Word separation can be indicated by underscores ('_'), but use of underscores is discouraged unless the name would be hard to read otherwise.
* Names of Types and Modules begin with a capital letter and word separation is shown with upper camel case instead of underscores.
* Names of functions and macros are in lower case, without underscores.
* Functions that write to their arguments have names that end in !. These are sometimes called "mutating" or "in-place" functions because they are intended to produce changes in their arguments after the function is called, not just return a value.


