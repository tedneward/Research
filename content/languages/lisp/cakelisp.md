title=Cakelisp
tags=language, gamedev
summary=A metaprogrammable, hot-reloadable, non-garbage-collected language ideal for high performance, iteratively-developed programs (especially games).
~~~~~~

[Website](https://cakelisp.handmade.network/) | [Source](https://macoy.me/code/macoy/cakelisp) | [Archived Source](https://github.com/makuto/cakelisp) | [Article](https://macoy.me/blog/programming/CakelispIntro)

It is implemented as a transpiler which generates C or C++ from an S-expression syntax.

Features

* The metaprogramming capabilities of Lisp: True full-power macro support. Macros can use compile-time code execution to conditionally change what is output based on the context of the invocation
* The performance of C: No heavyweight runtime, boxing/unboxing overhead, etc.
* "Real" types: Types are identical to C types, e.g. int is 32 bits with no sign bit or anything like other Lisp implementations do
* No garbage collection: I primarily work on games, which make garbage collection pauses unacceptable. I also think garbage collectors add more complexity than manual management
* Hot reloading: It should be possible to make modifications to functions and structures at runtime to quickly iterate
* Truly seamless C and C++ interoperability: No bindings, no wrappers: C/C++ types and functions are as easy to declare and call as they are in C/C++. In order to support this, I've decided to ignore type deduction when possible and instead rely on the C compiler/linker to relay typing errors. Cakelisp will blindly generate what look like C/C++ function calls without knowing if that function actually exists, because the C/C++ compiler will tell us what the answer is
* Compile-time code modification: After all macros are expanded, the programmer can specify compile-time functions which can do arbitrary modification of the expanded code. This makes it possible to validate functions, automatically insert profiling instrumentation (similar to this Jai demonstration), and other tasks which would be cumbersome or impossible to do with macros alone
* Output human-readable C/C++ source and header files: This makes it possible to use Cakelisp in a subset of your project. It also means Cakelisp will work on any platform C/C++ works on. Generated code closely resembles the source Cakelisp code whenever possible
* Build system: Simple projects will automatically be built and linked into an executable. Complex projects can use compile-time code execution to override stages of the build process. The code essentially knows how to build itself!

