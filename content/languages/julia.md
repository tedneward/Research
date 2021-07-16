title=Julia
tags=language, functional
summary=A flexible dynamic language, appropriate for scientific and numerical computing, with performance comparable to traditional statically-typed languages.
~~~~~~

[Website](https://julialang.org/) | [Docs](https://docs.julialang.org/en/v1/) | [Source](https://github.com/JuliaLang/julia)

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

