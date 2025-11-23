title=Language Implementation
tags=langdev, reading, language, llvm, native
summary=Collection of articles and tutorials on implementing languages.
~~~~~~

## Reading

- [Implementing a Simple Compiler on 25 Lines of JavaScript](https://blog.mgechev.com/2017/09/16/developing-simple-interpreter-transpiler-compiler-tutorial)

### Compiler

- [A miniature model of the Typescript compiler](https://github.com/imteekay/mini-typescript)
- [Alias analysis](https://en.wikipedia.org/wiki/Alias_analysis)
- [An Introduction to Interpreters and JIT Compilation](https://stefan-marr.de/2023/09/pliss-summer-school)
- [AST (Abstract Syntax Tree)](https://medium.com/@dinis.cruz/ast-abstract-syntax-tree-538aa146c53b)
- [Anders Hejlsberg on Modern Compiler Construction](https://www.youtube.com/watch?v=wSdV1M7n4gQ)
- [Compilers Resources](https://glyphack.com/blog/compiler-resources)
- [Compilers: Nuts and bolts of Programming Languages](https://pgrandinetti.github.io/compilers)
- [Compiling Scheme to C with closure conversion](https://matt.might.net/articles/compiling-scheme-to-c)
- [Compiling to Java](https://matt.might.net/articles/compiling-to-java)
- [Compiling to lambda-calculus](https://matt.might.net/articles/compiling-up-to-lambda-calculus)
- [Flattening ASTs (and Other Compiler Data Structures)](https://www.cs.cornell.edu/~asampson/blog/flattening.html)
- [Fredrik Lundh - Simple Town-Down Parsing In Python](https://11l-lang.org/archive/simple-top-down-parsing)
- [How To Build A Programming Language From Scratch](https://www.youtube.com/watch?v=8VB5TY1sIRo&list=PL_2VhOvlMk4UHGqYCLWc6GO8FaPl8fQTh&ab_channel=tylerlaceby)
- [How to Compile Your Language](https://isuckatcs.github.io/how-to-compile-your-language/)
- [How to implement a programming language in JavaScript](http://lisperator.net/pltut)
- [How would compilers change in the next 10 years?](https://www.youtube.com/watch?v=p15qRHZ_Leg&ab_channel=CompilerConstruction)
- [Implementing a bignum calculator](https://www.youtube.com/watch?v=PXoG0WX0r_E)
- [Interpreter, Compiler, JIT](https://nickdesaulniers.github.io/blog/2015/05/25/interpreter-compiler-jit) - Nick Desaulniers
- [IU Compiler Course](https://iucompilercourse.github.io/IU-P423-P523-E313-E513-Fall-2020)
- [JavaScript ∩ WebAssembly](https://www.youtube.com/watch?v=PP5r_b3Ws8s&ab_channel=ReactEurope)
- [JavaScript implementation in SpiderMonkey](https://www.youtube.com/playlist?list=PLo3w8EB99pqJVPhmYbYdInBvAGarDavh-)
- [KAIST CS420: Compiler Design](https://www.youtube.com/playlist?list=PL5aMzERQ_OZ8RWqn-XiZLXm1IJuaQbXp0)
- [Language grammar](https://stackoverflow.com/a/4726662/11314146)
- [Lessons from Writing a Compiler](https://borretti.me/article/lessons-writing-compiler)
- [Lexical Scanning in Go](https://www.youtube.com/watch?v=HxaD_trXwRE)
- [Lexing in JS style](https://areknawo.com/the-lexer-in-js)
- [Mozilla Hacks Compiler Compiler](https://www.youtube.com/playlist?list=PLo3w8EB99pqKF1FQllRsxyQh3sA7V2Hc-)
- [Quick look at the TypeScript Compiler API](https://www.youtube.com/watch?v=AnjfW633e8o%E2%80%8E.%E2%80%8Edev)
- [Pursuit of Performance on Building a JavaScript Compiler](https://rustmagazine.org/issue-3/javascript-compiler)
- [Rethinking compiler technology in a heterogeneous world](https://www.youtube.com/watch?v=6Ncnx0bT4lk&ab_channel=HiPEACTV)
- [Scheme from Scratch - Introduction](http://peter.michaux.ca/articles/scheme-from-scratch-introduction)
- [The business of selling compilers](https://www.youtube.com/watch?v=JRyv2oyWIbA&ab_channel=HiPEACTV)
- [Top Down Operator Precedence](http://javascript.crockford.com/tdop/tdop.html) - Douglas Crockford
- [Understanding compiler optimization](https://www.youtube.com/watch?v=haQ2cijhvhE)
- [Understanding GC in JSC From Scratch](https://webkit.org/blog/12967/understanding-gc-in-jsc-from-scratch)
- [Write you a Haskell](http://dev.stephendiehl.com/fun)
- The Pipefish Type System [Part 1](https://www.reddit.com/r/ProgrammingLanguages/comments/1kbhftn/the_pipefish_type_system_part_i_what_is_it_for/) | [part 2](https://www.reddit.com/r/ProgrammingLanguages/comments/1lr7dit/the_pipefish_type_system_part_ii_what_i_actually/) | [Compiler Implementation](https://www.reddit.com/r/ProgrammingLanguages/comments/1d71e37/how_the_pipefish_compiler_works/)

### Interpreters

- [Which Interpreters are Faster, AST or Bytecode?](https://stefan-marr.de/2023/10/ast-vs-bytecode-interpreters)
- [Building an Interpreter](https://www.iamtk.co/series/building-an-interpreter)
- [Building an Interpreter from scratch](https://www.dmitrysoshnikov.education/p/essentials-of-interpretation)
- [Cheaply writing a fast interpreter](https://www.youtube.com/watch?v=V8dnIw3amLA&ab_channel=PerformanceSummit)
- [Compiling Lisp to bytecode](https://healeycodes.com/compiling-lisp-to-bytecode-and-running-it)
- [Crafting an Interpreter](https://github.com/imteekay/crafting-an-interpreter)
- [Crafting Interpreters](http://craftinginterpreters.com/) by Bob Nystrom ([Github](https://github.com/munificent/craftinginterpreters)): A neo-classic book, walking through the construction of an interpreted language, Lox:

    * C++: [CppLox](https://github.com/the-lambda-way/CppLox)
    * Rust: [rlox](https://github.com/cwbriones/rlox)
    * Rust: ["My Experience Crafting an Interpreter with Rust"](https://ceronman.com/2021/07/22/my-experience-crafting-an-interpreter-with-rust/): Book material ported to Rust.
    * Swift: [slox](https://github.com/alexito4/slox)



## Tutorials/Walkthroughs

- [Build Your Own Programming Language](https://github.com/PacktPublishing/Build-Your-Own-Programming-Language) (source)
- [How languages work #1: String interpolation](https://martin.janiczek.cz/2023/07/27/how-languages-work-1-string-interpolation.html)

### Compilers

- Creating the Bolt compiler (series):

    - [Source](https://github.com/mukul-rathi/bolt)
    - [Part 1: How I wrote my own "proper" programming language](https://mukulrathi.com/create-your-own-programming-language/intro-to-compiler/);
    - [Part 2: So how do you structure a compiler project?](https://mukulrathi.com/create-your-own-programming-language/compiler-engineering-structure/);
    - [Part 3: Writing a Lexer and Parser using OCamllex and Menhir](https://mukulrathi.com/create-your-own-programming-language/parsing-ocamllex-menhir/);
    - [Part 4: An accessible introduction to type theory and implementing a type-checker](https://mukulrathi.com/create-your-own-programming-language/intro-to-type-checking/);
    - [Part 5: A tutorial on liveness and alias dataflow analysis](https://mukulrathi.com/create-your-own-programming-language/data-race-dataflow-analysis/);
    - [Part 6: Desugaring - taking our high-level language and simplifying it!](https://mukulrathi.com/create-your-own-programming-language/lower-language-constructs-to-llvm/);
    - [Part 7: A Protobuf tutorial for OCaml and C++](https://mukulrathi.com/create-your-own-programming-language/protobuf-ocaml-cpp-tutorial/);
    - [Part 8: A Complete Guide to LLVM for Programming Language Creators](https://mukulrathi.com/create-your-own-programming-language/llvm-ir-cpp-api-tutorial/);
    - [Part 9: Implementing Concurrency and our Runtime Library](https://mukulrathi.com/create-your-own-programming-language/concurrency-runtime-language-tutorial/);
    - [Part 10: Generics - adding polymorphism to Bolt](https://mukulrathi.com/create-your-own-programming-language/generics-parametric-polymorphism/);
    - [Part 11: Adding Inheritance and Method Overriding to Our Language](https://mukulrathi.com/create-your-own-programming-language/inheritance-method-overriding-vtable/);

- [LLVM Tutorial: Kaleidoscope](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/index.html)
- [Let's build a compiler](https://generalproblem.net) (4 parts)
- [Let’s Build a Compiler!](/langdev/crenshaw) - Jack W. Crenshaw
- Let's make a Teeny Tiny compiler

    - [Part 1](https://austinhenley.com/blog/teenytinycompiler1.html)
    - [Part 2](https://austinhenley.com/blog/teenytinycompiler2.html)
    - [Part 3](https://austinhenley.com/blog/teenytinycompiler3.html)

- Let’s Build a Programming Language (Series):

    - [Part 1](https://medium.com/hackernoon/lets-build-a-programming-language-2612349105c6)
    - [Compilers and Interpreters](https://medium.com/hackernoon/compilers-and-interpreters-3e354a2e41cf)
    - [Lexical Analysis](https://medium.com/hackernoon/lexical-analysis-861b8bfe4cb0)

- Minsk: Immo Landwerth has done a collection of videos on building a language for the CLR platform in a live-streaming style: [Source](https://github.com/terrajobst/minsk):

	* [Episode 1](https://www.youtube.com/watch?v=wgHIkdUQbp0&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y)
	* [Episode 2](https://www.youtube.com/watch?v=3XM9vUGduhk&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=2)
	* [Episode 3](https://www.youtube.com/watch?v=61dLQNgd9o8&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=3)
	* [Episode 4](https://www.youtube.com/watch?v=xF-8rWeqV1A&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=4)
	* [Episode 5](https://www.youtube.com/watch?v=EEzuO9XWmUY&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=5)
	* [Episode 6](https://www.youtube.com/watch?v=EEzuO9XWmUY&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=6)
	* [Episode 7](https://www.youtube.com/watch?v=SJE_gUnJl2Y&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=7)
	* [Episode 8](https://www.youtube.com/watch?v=PfpayNvfu20&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=8)
	* [Episode 9](https://www.youtube.com/watch?v=QwZuY1dExAc&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=9)
	* [Episode 10](https://www.youtube.com/watch?v=QwZuY1dExAc&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=10)
	* [Episode 11](https://www.youtube.com/watch?v=QwZuY1dExAc&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=11)
	* [Episode 12](https://www.youtube.com/watch?v=psTZi6xpTlM&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=12)
	* [Episode 13](https://www.youtube.com/watch?v=NvVc8erZpeI&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=13)
	* [Episode 14](https://www.youtube.com/watch?v=NvVc8erZpeI&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=14)
	* [Episode 15](https://www.youtube.com/watch?v=NvVc8erZpeI&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=15)
	* [Episode 16](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=16)
	* [Episode 17](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=17)
	* [Episode 18](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=18)
	* [Episode 19](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=19)
	* ... more are likely on the way

- Subtype Inference by Example (series):

    - [Part 1: Introducing CubiML](https://blog.polybdenum.com/2020/07/04/subtype-inference-by-example-part-1-introducing-cubiml.html);
    - [Part 2: Parsing and Biunification](https://blog.polybdenum.com/2020/07/11/subtype-inference-by-example-part-2-parsing-and-biunification.html);
    - [Part 3: The Typechecker Frontend](https://blog.polybdenum.com/2020/07/18/subtype-inference-by-example-part-3-the-typechecker-frontend.html);
    - [Part 4: The Typechecker Core](https://blog.polybdenum.com/2020/07/25/subtype-inference-by-example-part-4-the-typechecker-core.html);
    - [Part 5: Incremental Reachability](https://blog.polybdenum.com/2020/08/01/subtype-inference-by-example-part-5-incremental-reachability.html);
    - [Part 6: Numeric Types and Operators](https://blog.polybdenum.com/2020/08/08/subtype-inference-by-example-part-6-numeric-types-and-operators.html);
    - [Part 7: Spanned Error Messages](https://blog.polybdenum.com/2020/08/15/subtype-inference-by-example-part-7-spanned-error-messages.html);
    - [Part 8: Mutability](https://blog.polybdenum.com/2020/08/22/subtype-inference-by-example-part-8-mutability.html);
    - [Part 9: Match Wildcards, Record Extension and Row Polymorphism](https://blog.polybdenum.com/2020/08/29/subtype-inference-by-example-part-9-nonexhaustive-matching-record-extensions-and-row-polymorphism.html);
    - [Part 10: Let Polymorphism](https://blog.polybdenum.com/2020/09/05/subtype-inference-by-example-part-10-let-polymorphism.html);
    - [Part 11: The Value Restriction and Polymorphic Recursion](https://blog.polybdenum.com/2020/09/19/subtype-inference-by-example-part-11-the-value-restriction.html);
    - [Part 12: Flow Typing and Mixed Comparison Operators](https://blog.polybdenum.com/2020/09/26/subtype-inference-by-example-part-12-flow-typing-and-mixed-comparison-operators.html);
    - [Part 13: Conditional Flow Constraints, Presence Polymorphism, and Type Level Computation](https://blog.polybdenum.com/2020/10/03/subtype-inference-by-example-part-13-conditional-flow-types-and-type-level-computation.html);
    - [Part 14: Type Annotations— What are they good for?](https://blog.polybdenum.com/2020/10/10/subtype-inference-by-example-part-14-type-annotation.html);
    - [Part 15: Monomorphic Type Annotations](https://blog.polybdenum.com/2020/10/17/subtype-inference-by-example-part-15-type-annotations.html);

### Compilers

- [Let's Build an Interpreter](https://github.com/hisystems/Interpreter/tree/master/Engine): 

	* [Part 1](https://ruslanspivak.com/lsbasi-part1/)
	* [Part 2](https://ruslanspivak.com/lsbasi-part2/)
	* [Part 3](https://ruslanspivak.com/lsbasi-part3/)
	* [Part 4](https://ruslanspivak.com/lsbasi-part4/)
	* [Part 5](https://ruslanspivak.com/lsbasi-part5/)
	* [Part 6](https://ruslanspivak.com/lsbasi-part6/)
	* [Part 7](https://ruslanspivak.com/lsbasi-part7/)
	* [Part 8](https://ruslanspivak.com/lsbasi-part8/)
	* [Part 9](https://ruslanspivak.com/lsbasi-part9/)
	* [Part 10](https://ruslanspivak.com/lsbasi-part10/)
	* [Part 11](https://ruslanspivak.com/lsbasi-part11/)
	* [Part 12](https://ruslanspivak.com/lsbasi-part12/)
	* [Part 13](https://ruslanspivak.com/lsbasi-part13/)
	* [Part 14](https://ruslanspivak.com/lsbasi-part14/)
	* [Part 15](https://ruslanspivak.com/lsbasi-part15/)
	* [Part 16](https://ruslanspivak.com/lsbasi-part16/)
	* [Part 17](https://ruslanspivak.com/lsbasi-part17/)
	* [Part 18](https://ruslanspivak.com/lsbasi-part18/)
	* [Part 19](https://ruslanspivak.com/lsbasi-part19/)
	* may be more...?

- [LittleBasic](https://github.com/mateiw/littlebasic)
- [Little lisp interpreter](https://maryrosecook.com/blog/post/little-lisp-interpreter)
- [Little Lisp interpreter](https://www.recurse.com/blog/21-little-lisp-interpreter)
- [mal](https://github.com/kanaka/mal) (Make A Lisp): Steps (and collection of implementations) to make your own Lisp.
- [Write Yourself a Scheme in 48 Hours](https://upload.wikimedia.org/wikipedia/commons/a/aa/Write_Yourself_a_Scheme_in_48_Hours.pdf)
- [Write Yourself a Scheme in 48 Hours using F#](https://write-yourself-a-scheme.pangwa.com/#/)

### Native/raw

* [AsmInterpreter](https://github.com/yekyam/AsmInterpreter): A simple assembly interpreter to help people with understanding the language without the hassle of setup.
* [Build your own Lisp](http://www.buildyourownlisp.com/contents) teaches C by building a Lisp.
* [luax](https://github.com/morrow1nd/luax): Lua-like programming language for studying compiler and interpreter courses.
* [Square](https://github.com/square-lang/Square): A tiny programming language under 200kb.
* [Write your own C compiler from scratch with Python](https://medium.com/@pasi_pyrro/how-to-write-your-own-c-compiler-from-scratch-with-python-90ab84ffe071)

### LLVM

* [A Tutorial on How to Write a Compiler Using LLVM](https://tomassetti.me/a-tutorial-on-how-to-write-a-compiler-using-llvm/)
* [Implementing a JIT Compiled Language with Haskell and LLVM](https://www.stephendiehl.com/llvm/)
* [Writing your own toy language](https://gnuu.org/2009/09/18/writing-your-own-toy-compiler/) using flex, bison, LLVM; [code](https://github.com/lsegal/my_toy_compiler)
* [Mapping high level constructs to LLVM IR](https://mapping-high-level-constructs-to-llvm-ir.readthedocs.io/en/latest/)
* [Kaleidoscope AST](https://ubiquitydotnet.github.io/Llvm.NET/v8.0.1/articles/Samples/Kaleidoscope-AST.html)

### CLR

* [Concatenative Thinking (wiki)](https://concatenative.org/wiki/view/Front%20Page): We are interested in both theoretical results and practical programming advice, especially as it pertains to any Concatenative language. We want to bring together disparate language communities and build a common knowledge repository that people can consult to learn more about this family of languages.
* Video - [Creating a domain specific language for .NET Application](https://www.youtube.com/watch?app=desktop&v=64x29FGaoK4)
* [How to Design Worlds (PDF)](https://world.cs.brown.edu/1/htdw-v1.pdf)
* Kaleidoscope: [Implementing a language with LLVM in CSharp](https://ice1000.org/llvm-cs/en/CSharpLangImpl01/): "By the end of the tutorial, we’ll have written a bit less than 1000 lines of non-comment, non-blank, lines of code. With this small amount of code, we’ll have built up a very reasonable compiler for a non-trivial language including a hand-written lexer, parser, AST, as well as code generation support with a JIT compiler. While other systems may have interesting “hello world" tutorials, I think the breadth of this tutorial is a great testament to the strengths of LLVM and why you should consider it if you’re interested in language or compiler design."
* [learn-programming-languages](https://github.com/jeanqasaur/learn-programming-languages): Resources for the working programmer to learn more about the fundamentals and theory of programming languages. (Jean Yang)
* Presentation - [Write your own domain specific language with F#](https://www.youtube.com/watch?app=desktop&v=NoGyFQ99NgY)

### JVM

* [joeq: A Virtual Machine and Compiler Infrastructure](https://joeq.sourceforge.net/) ([PDF](https://suif.stanford.edu/~jwhaley/papers/ivme03.pdf)) ([Source](https://sourceforge.net/projects/joeq/)): entirely implemented in Java, leading to greater reliability, portability, maintainability, and efficiency. It is also language-independent, so code from any supported language can be seamlessly compiled, linked, and executed --- all dynamically!
* Video - [Nashorn: implementing a dynamic language runtime on JVM](https://www.youtube.com/watch?v=KKaHkkpdHxg) (Attila Szegedi)
* [Scripting and Dynamic Interaction in Java](http://alumni.media.mit.edu/~mt/skij/dynjava/dynjava.html)
* [write_your_own_dynamic_language_runtime](https://github.com/forax/write_your_dynamic_language_runtime): How to write interpreters or dynamic compilers for dynamically typed languages on top of the JVM. This repository provides the basis to implement your own

    * Abstract Syntax Tree Interpreter
    * Stack based Interpreter
    * Java Virtual Machine based Interpreter

    of a dynamically typed language named smalljs which is almost a subset of JavaScript.

### Python

- [ast](https://docs.python.org/3/library/ast.html): The Python official documentation of the `ast` module that ships as part of Python. "The ast module helps Python applications to process trees of the Python abstract syntax grammar. The abstract syntax itself might change with each Python release; this module helps to find out programmatically what the current grammar looks like. An abstract syntax tree can be generated by passing ast.PyCF_ONLY_AST as a flag to the compile() built-in function, or using the parse() helper provided in this module. The result will be a tree of objects whose classes all inherit from ast.AST. An abstract syntax tree can be compiled into a Python code object using the built-in compile() function."
- [Code Transformer](https://github.com/danielzuegner/code-transformer): "The CodeTransformer is a Transformer based architecture that jointly learns from source code (Context) and parsed abstract syntax trees (AST; Structure). It does so by linking source code tokens to AST nodes and using pairwise distances (e.g., Shortest Paths, PPR) between the nodes to represent the AST. This combined representation is processed in the model by adding the contributions of each distance type to the raw self-attention score between two input tokens (See the paper for more details)."
- [Green Tree Snakes: The Missing Python AST docs](https://greentreesnakes.readthedocs.io/en/latest/index.html). Points out a few projects using the Python AST:

    - [pytest](https://docs.pytest.org/) (uses the AST to produce useful assertion error messages)
    - [astsearch](https://astsearch.readthedocs.io/) (search the semantics, not the syntax)
    - [astpath](https://github.com/hchasestevens/astpath) (XPath over an AST)
    - [bellybutton](https://github.com/hchasestevens/bellybutton) readily customised linter

- [(How to Write a (Lisp) Interpreter (in Python))](http://norvig.com/lispy.html): Norvig builds a simple Scheme in simple Python
- https://github.com/jonpry/Pill: Pill is an open source interpreter for the Cadence Skill language. Its purpose is to run PCell generator codes used in VLSI. Pill is written in Python and compiles the source into Python bytecode where it is then executed alongside regular python functions at similar speed to "native" python codes. *(This is an intriguing idea, and one that deserves some further exploration--if I can go from source to Py bytecode, we skip much of the parsing and get a startup speed benefit.)*
- https://github.com/jszheng/py3antlr4book: Covert ANTLR4 book source code to Python3 version.
- https://github.com/maxmalysh/tiny-py-interpreter: Python interpreter written in Python; uses ANTLR4
- [A Python Interpreter Written in Python](http://aosabook.org/en/500L/a-python-interpreter-written-in-python.html)
- Compiler Hacking (using [Chocopy](https://chocopy.org/))

    - Part 1: [Building a Compiler Front-end in Python](https://yangdanny97.github.io/blog/2020/05/29/chocopy-typechecker)
    - Part 2: [Building a JVM back-end](https://yangdanny97.github.io/blog/2021/08/26/chocopy-jvm-backend)
    - Part 3: [Building a CIL back-end](https://yangdanny97.github.io/blog/2022/05/22/chocopy-cil-backend)
    - Part 4: [Building a WASM back-end](https://yangdanny97.github.io/blog/2022/10/11/chocopy-wasm-backend)
    - Part 5: [Building a LLVM back-end](https://yangdanny97.github.io/blog/2023/07/18/chocopy-llvm-backend)

### Rust

- [Create Your Own Programming Language with Rust](https://createlang.rs/intro.html): Incomplete but interesting first steps
- [Make A Language](https://lunacookies.github.io/lang/):

    * [Part Twenty: Testing](https://lunacookies.github.io/lang/20/)
    * [Part Nineteen: Code Representations](https://lunacookies.github.io/lang/19/)
    * [Part Eighteen: Errors](https://lunacookies.github.io/lang/18/)
    * [Part Seventeen: Crates](https://lunacookies.github.io/lang/17/)
    * [Part Sixteen: Refactoring](https://lunacookies.github.io/lang/16/)
    * [Part Fifteen: Markers](https://lunacookies.github.io/lang/15/)
    * [Part Fourteen: Comments](https://lunacookies.github.io/lang/14/)
    * [Part Thirteen: Whitespace & Events](https://lunacookies.github.io/lang/13/)
    * [Part Twelve: Terminology](https://lunacookies.github.io/lang/12/)
    * [Part Eleven: Refinements](https://lunacookies.github.io/lang/11/)
    * [Part Ten: Starting Again](https://lunacookies.github.io/lang/10/)
    * [Part Nine: Function Calls](https://lunacookies.github.io/lang/9/)
    * [Part Eight: Function Definitions](https://lunacookies.github.io/lang/8/)
    * [Part Seven: A REPL](https://lunacookies.github.io/lang/7/)
    * [Part Six: Blocks](https://lunacookies.github.io/lang/6/)
    * [Part Five: Binding Usages](https://lunacookies.github.io/lang/5/)
    * [Part Four: Backtracking](https://lunacookies.github.io/lang/4/)
    * [Part Three: Defining Variables](https://lunacookies.github.io/lang/3/)
    * [Part Two: Whitespace Support](https://lunacookies.github.io/lang/2/)
    * [Part One: A Basic Parser](https://lunacookies.github.io/lang/1/)
    * [Part Zero: Getting set up](https://lunacookies.github.io/lang/0/)

### Go

[A simple Hindley-Milner type system in Go](https://github.com/chewxy/hm)

### Haskell

[Write You a Haskell](https://github.com/sdiehl/write-you-a-haskell)

### Learning/AI-related

- https://openreview.net/pdf?id=Xh5eMZVONGF : LANGUAGE-AGNOSTIC REPRESENTATION LEARNING OF SOURCE CODE FROM STRUCTURE AND CONTEXT
- [Sudolang: A powerful programming language for LLMs](https://medium.com/javascript-scene/sudolang-a-powerful-pseudocode-programming-language-for-llms-d64d42aa719b)

### Toy/experimental

- [Language Incubator](https://github.com/EarlGray/language-incubator): Repo of language experiments/explorations; "An incubator/sandbox for learning compilers, interpreters, code generation, virtual machines, assemblers, JITs, etc."

- [Bhai](https://github.com/DulLabs/bhai-lang): A toy programming language written in Typescript
- [Blink](https://github.com/ftchirou/blink)
- [Bob: A Tiny Object-Oriented Language](https://jacobfilipp.com/DrDobbs/articles/DDJ/1994/9415/9415e/9415e.htm)
- [Dwarf](https://github.com/nicolasdilley/dwarf-interpreter): A very small scripting language written in Elixir.
- [Epic](https://github.com/menezesd/epic-lang): interpreter for Python-like programming language with braces
- [Eval](https://github.com/tevelee/Eval): a lightweight interpreter framework written in Swift, evaluating expressions at runtime.
- Imp:

    - [IMP](https://github.com/jayconrod/imp-interpreter): A minimal interpreter for the toy language, IMP, used as an example for building interpreters.
    - https://github.com/nandor/utcn-imp: Imp Language and Interpreter

- [Kaleidoscope](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/LangImpl01.html): the classic from the LLVM website
- [Lepton](https://github.com/gingerBill/Lepton): Simple Programming Language
- [Maverick](https://github.com/willianscsilva/interpreter)
- [miniUni](https://github.com/gidra5/miniUni): A concurrent scripting language
- [Pointless](https://ptls.dev/) ([Source](https://github.com/pointless-lang/pointless)): a scripting language for learning and fun.
- [The Super Tiny Compiler](https://github.com/jamiebuilds/the-super-tiny-compiler) (JS)
- [TinyML: A tiny functional language interpreter](https://d3s.mff.cuni.cz/files/teaching/nprg077/02-tinyml.pdf) (Tomas Petricek)
- [uza](https://github.com/msanlop/uza): a simple statically-typed programming language
- [X-expressions in XMLisp: S-expressions and Extensible Markup Language Unite](https://home.cs.colorado.edu/~ralex/papers/PDF/X-expressions.pdf): "XMLisp unites S-expressions with XML into X-expressions that unify the notions of data sharing with computation. Using a combination of the Meta Object Protocol (MOP), readers and printers, X-expressions uniquely integrate XML at a language, not API level, into Lisp in a way that could not be done with other programming languages."

- https://github.com/yangtau/hedgehog: a toy programming language
- https://github.com/mattgreen/hython: Haskell-powered Python 3 interpreter
- https://github.com/proglangclass/interpreter: Language built during the Programming Language Masterclass.
- https://github.com/hisystems/Interpreter: Simple language interpreter written in pure C#.
- https://github.com/jamesdhutton/Interpreter: Interpreter for a simple language
- https://github.com/progschj/jtc: A toy programming language interpreter that has no dependencies and sits in a single C++ file. C++11 capable compilers should compile it without extra options other than enabling C++11.
- https://github.com/airtrack/luna: A toy interpreter of lua-like language
- https://github.com/hijkzzz/mini-interpreter: A simple scripting language (supports anonymous functions and clases)
- https://github.com/drmenguin/minilang-interpreter: Interpreter and Read-Eval-Print-Loop for a simple programming language called "MiniLang", written in C++
- https://github.com/JohnEarnest/ok: An open-source interpreter for the K5 programming language.
- https://github.com/oriontransfer/PL0-Language-Tools: An implementation of PL/0 including a tree-based interpreter and virtual machine. http://programming.dojo.net.nz/study/pl0-language-tools/index
- https://github.com/bbu/simple-interpreter: A hackable and extensible lexer, parser and interpreter for a minimalistic, imperative, C-like language.
- https://github.com/totalspectrum/tinyscript
- https://github.com/sam-astro/Z-Sharp: Custom programming interpreter for ZSharp (Z#), a language I made up.

#### Monkey
This is the language described by the book ["Writing an Interpreter in Go"](https://interpreterbook.com/). Also has a paired book, ["Writing a Compiler in Go"](https://compilerbook.com/) which appears to include the creation of a virtual machine for executing the compiled code.

* [Source](https://github.com/haifenghuang/monkey) (archived)
* [C++](https://github.com/zhuzilin/monkey)
* [C++](https://github.com/yhirose/monkey-cpp)
* [C++](https://github.com/Imymirror/mirror-monkey)
* Go: [Monkey in Go](https://github.com/bradford-hamilton/monkey-lang)
* [Haskell](https://github.com/hatashiro/monkey-hs)
* [Rust](https://github.com/Rydgel/monkey-rust)
* [Rust](https://github.com/wadackel/rs-monkey-lang)
* Rust: https://github.com/JoshMcguigan/monkey
* Rust: https://github.com/shuhei/cymbal
* Rust: https://github.com/hatashiro/monkey-rs
* Rust: [Monkey in Rust](https://github.com/bradford-hamilton/monkey_lang_rust)
* TypeScript: [Monkey in TypeScript](https://github.com/bradford-hamilton/monkey_lang_rust)
* [Gadget](https://github.com/vkandola/go-go-gadget): The 'Gadget' interpreter language, implemented in Go, using the Writing An Interpreter In Go book. This language is based off the Monkey interpreter language described in the book, and will be implemented as I progress through the book.
* [An interpreter for the Monkey programming language](https://github.com/imteekay/crafting-an-interpreter)

### Esolangs

- https://github.com/nickdesaulniers/bf_interpreter_jit_compiler: Teach myself about interpreters, JITs, and compilers using the Brainfuck language as the toy language -- https://nickdesaulniers.github.io/blog/2015/05/25/interpreter-compiler-jit/



## Uncategorized

* ALIVe: Automatic LLVM InstCombine Verifier
	- http://rise4fun.com/Alive
	- https://github.com/nunoplopes/alive
	- http://blog.regehr.org/archives/1170
	- https://www.cs.utah.edu/~regehr/papers/pldi15.pdf
	- http://llvm.org/devmtg/2014-10/Slides/Menendez-Alive.pdf
* Automatic Feedback Directed Optimizer (AutoFDO)
	- https://gcc.gnu.org/wiki/AutoFDO
	- https://github.com/google/autofdo
* Compiler Optimizations for Reverse Engineers by Rolf Rolles
	- http://www.msreverseengineering.com/blog/2014/6/23/compiler-optimizations-for-reverse-engineers
	- http://www.msreverseengineering.com/s/Binary-Literacy-Static-6-Optimizations.ppt
* Compiler Optimization Options
	- GCC: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
	- Clang: http://clang.llvm.org/docs/CommandGuide/clang.html#cmdoption-O0 - https://stackoverflow.com/questions/15548023/clang-optimization-levels
	- Visual C++: https://msdn.microsoft.com/en-us/library/19z1t1wy.aspx
- [Devirtualization in C++](https://hubicka.blogspot.com/search/label/devirtualization)
- [GoingNative 50: New Visual C++ Code Optimizer](https://channel9.msdn.com/Shows/C9-GoingNative/GoingNative-50-New-Visual-C-Code-Optimizer)
- [Link time optimization (LTO)](https://hubicka.blogspot.com/search/label/link-time%20optimization)
- [Optimizations in C++ Compilers: A practical journey](https://queue.acm.org/detail.cfm?id=3372264), by Matt Godbolt; ACM Queue vol. 17, no. 5 (2019)

### CLang

* [Understanding the Clang AST](https://jonasdevlieghere.com/understanding-the-clang-ast/)

#### Escape analysis
Escape analysis is an optimization for identifying objects which do not escape the dynamic extent of a function; such objects can be stack-allocated, or 'flattened' so that usages of them are replaced with a series of local variables (the latter optimization is known as "scalar replacement").

	An overview of the escape analysis algorithm used in Factor's Optimizing compiler: http://factor-language.blogspot.com/2008/08/algorithm-for-escape-analysis.html http://en.wikipedia.org/wiki/Escape_analysis

#### Register allocation

* Linear scan: The linear scan algorithm sacrifices code quality for compilation speed; it only needs to make one or two passes over the intermediate representation to assign registers, and therefore runs in O(n) time; therefore it is much faster than graph coloring, which runs in O(n2) time.

	* Linear Scan Register Allocation, Massimiliano Poletto and Vivek Sarkar, http://www.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf

	* Linear Scan Register Allocation for the Java HotSpot Client Compiler, by Christian Wimmer, http://www.ssw.uni-linz.ac.at/Research/Papers/Wimmer04Master/

	* Quality and Speed in Linear-scan Register Allocation, by Omri Traub, Glenn Holloway, Michael D. Smith, http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.8435


* Graph coloring

	* Graph coloring is traditionally implemented by building an interference graph, attempting to color it, and if coloring fails, spilling some values and building the interference graph again. Building the graph is pretty expensive; if your program is in SSA form, it turns out you can perform spilling, build the graph and color it all in one shot. Register allocation for programs in SSA form using chordal graph coloring, Sebastian Hack, http://digbib.ubka.uni-karlsruhe.de/volltexte/documents/6532

#### Static Single Assignment (SSA)

* [Static Single Assignment (SSA) Book (PDF)](http://ssabook.gforge.inria.fr/latest/book-full.pdf) and [online](https://gforge.inria.fr/scm/viewvc.php/ssabook/book/)

#### Instruction selection

* [Instruction Selection: Principles, Methods, & Applications](http://kth.diva-portal.org/smash/record.jsf?pid=diva2:951540): Gabriel Hjort Blindell (2016)
* [Universal Instruction Selection](https://github.com/gablin/ghb-thesis/blob/master/ghb-thesis.pdf): 2018 PhD Dissertation; Gabriel Hjort Blindell [Github](https://github.com/gablin/ghb-thesis) and also [here](http://www.diva-portal.org/smash/record.jsf?pid=diva2:1185339)
* [Notes on Graph Algorithms Used in Optimizing Compilers](http://www.cs.umb.edu/~offner/files/flow_graph.pdf) - Carl Offner

### Superoptimization

- GNU Superoptimizer Version 2 - https://github.com/embecosm/gso2
- Souper - a superoptimizer for LLVM IR - https://github.com/google/souper
- Stochastic Superoptimization - http://blog.regehr.org/archives/923
- STOKE: A stochastic superoptimizer and program synthesizer - http://stoke.stanford.edu - https://github.com/StanfordPL/stoke
- Superoptimizing Compilers - http://superoptimization.org/wiki/Superoptimizing_Compilers
- Superoptimization - James Pallister - FOSDEM 2015 - https://archive.fosdem.org/2015/schedule/event/superoptimization/

### Scheduling languages

- Scheduling Languages: A Past, Present, and Future Taxonomy - https://arxiv.org/pdf/2410.19927
