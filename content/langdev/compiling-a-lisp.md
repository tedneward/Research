title=Lisp Implementations (blog series)
tags=langdev, native, lisp
summary=This time, we’re going to write a Lisp compiler.
~~~~~~

[Website](https://bernsteinbear.com/blog/lisp/)

#### Writing a Lisp

* [Part 0: Fundamentals](https://bernsteinbear.com/blog/lisp/00_fundamentals/)
* [Part 1: Booleans](https://bernsteinbear.com/blog/lisp/01_booleans/)
* [Part 2: Symbols](https://bernsteinbear.com/blog/lisp/02_symbols/)
* [Part 3: Lists](https://bernsteinbear.com/blog/lisp/03_lists/)
* [Part 4: Environments](https://bernsteinbear.com/blog/lisp/04_environments/)
* [Part 5: If-Expressions](https://bernsteinbear.com/blog/lisp/05_if/)
* [Part 6: Primitives 1](https://bernsteinbear.com/blog/lisp/06_prim1/)
* [Part 7: Primitives 2](https://bernsteinbear.com/blog/lisp/07_prim2/)
* [Part 8: ASTs](https://bernsteinbear.com/blog/lisp/08_asts/)
* [Part 9: Quote](https://bernsteinbear.com/blog/lisp/09_quote/)
* [Part 10: Closures](https://bernsteinbear.com/blog/lisp/10_closures/)
* [Part 11: Primitives 3](https://bernsteinbear.com/blog/lisp/11_prim3/)
* [Part 12: Metacircular Evaluator](https://bernsteinbear.com/blog/lisp/12_metacircular/)
* [Part 13: Let](https://bernsteinbear.com/blog/lisp/13_let/)
* [Part 14: Comments](https://bernsteinbear.com/blog/lisp/14_comments/)
* [Part 15: I/O](https://bernsteinbear.com/blog/lisp/15_io/)
* [Part 16: Standard Library](https://bernsteinbear.com/blog/lisp/16_stdlib/)
* [Part 17: Modules](https://bernsteinbear.com/blog/lisp/17_modules/)
* [Part 18: No Define](https://bernsteinbear.com/blog/lisp/18_nodefine/)

#### Compiling a Lisp

"This series is an adaptation of Abdulaziz Ghuloum’s excellent paper [An Incremental Approach to Compiler Construction](/langdev/11-ghuloum.pdf), with several key differences:

* Our implementation is in C, instead of Scheme
* Our implementation generates machine code directly, instead of generating text assembly
* Our implementation may omit some runtime data structures

"See [my implementation](https://github.com/tekknolagi/ghuloum) for reference, but note that it may be incomplete and also may look a little bit different than the compiler detailed in these posts."


* [Overture](https://bernsteinbear.com/blog/compiling-a-lisp-0/)
* [The smallest program](https://bernsteinbear.com/blog/compiling-a-lisp-1/)
* [Integers](https://bernsteinbear.com/blog/compiling-a-lisp-2/)
* [Booleans, characters, nil](https://bernsteinbear.com/blog/compiling-a-lisp-3/)
* [Primitive unary functions](https://bernsteinbear.com/blog/compiling-a-lisp-4/)
* [Primitive binary functions](https://bernsteinbear.com/blog/compiling-a-lisp-5/)
* [Reader](https://bernsteinbear.com/blog/compiling-a-lisp-6/)
* [Let](https://bernsteinbear.com/blog/compiling-a-lisp-7/)
* [If](https://bernsteinbear.com/blog/compiling-a-lisp-8/)
* [Heap allocation](https://bernsteinbear.com/blog/compiling-a-lisp-9/)
* [Instruction encoding interlude](https://bernsteinbear.com/blog/compiling-a-lisp-10/)
* [Labelled procedure calls](https://bernsteinbear.com/blog/compiling-a-lisp-11/)
* [Closure conversion](https://bernsteinbear.com/blog/compiling-a-lisp-12/)

Compile heap allocation (strings, symbols, etc)
Compile closures
Add tail-call optimization
Compile complex constants (quote)
Compile variable assignment (set!)
Add macro expander
Add extended forms using macro expander (let*, letrec, etc)
Add support for libraries and separate compilation
Compile foreign function calls
Add error checking to primitives and procedure calls
Compile variable-arity procedures (aka varargs)
Compile apply
Add output ports (kind of like FILE*)
Add write, display
Add input ports
Add a tokenizer in Lisp
Add a reader in Lisp
Add a Lisp interpreter (or compiler) in Lisp
