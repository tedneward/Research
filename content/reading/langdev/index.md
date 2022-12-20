title=Language Development
tags=reading, langdev
summary=A collection of links and articles on building programming languages.
~~~~~~

## Books

[Crafting Interpreters](http://craftinginterpreters.com/) by Bob Nystrom ([Github](https://github.com/munificent/craftinginterpreters))

## Articles/Papers

["Three Things I Wish I Knew When I Started Designing Languages"](https://www.youtube.com/watch?v=oa0qq75i9oc)

["The Naked Truth About Writing a Programming Language"](https://www.digitalmars.com/articles/b90.html)

[Open, extensible object models](https://piumarta.com/software/cola/objmodel2.pdf): "The artificial distinction between implementation language and end-user language can be eliminated by implementing the language using only end-user objects and messages, making the implementation accessible for arbitrary modification by programmers. We show that three object types and five methods are sufficient to bootstrap an extensible object model and messaging semantics that are described entirely in terms of those same objects and messages."

[Intrinsically-Typed Definitional Interpreters for Linear, Session-Typed Languages](https://eelcovisser.org/publications/2020/RouvoetPKV20.pdf)

[Interview with Jesper Louis Andsersen](https://medium.com/@unbalancedparen/interview-with-jesper-louis-andersen-about-erlang-haskell-ocaml-go-idris-the-jvm-software-and-b0de06440fbd#.g4q9w4eqq) about a ton of languages.

["Less is more: language features"](http://blog.ploeh.dk/2015/04/13/less-is-more-language-features/)

["Languages I want to write"](https://blog.wesleyac.com/posts/language-todos)

["A wish list for a new programming language"](http://www.drmaciver.com/2015/07/a-wish-list/)

[The Super Tiny Compiler](https://github.com/jamiebuilds/the-super-tiny-compiler) (JS)

[Program Analysis](https://gist.github.com/MattPD/00573ee14bf85ccac6bed3c0678ddbef)

[Nanopass](http://www.cs.indiana.edu/~dyb/pubs/nano-jfp.pdf): A framework for compiler education

[Language Incubator](https://github.com/EarlGray/language-incubator): Repo of language experiments/explorations; "An incubator/sandbox for learning compilers, interpreters, code generation, virtual machines, assemblers, JITs, etc."

[Principles of Programming Languages (course)](https://bguppl.github.io/interpreters/practice_sessions/ps4.html) ([Source](https://github.com/bguppl/interpreters))

---

## Native/raw
[Build your own Lisp](http://www.buildyourownlisp.com/contents) teaches C by building a Lisp.

[luax](https://github.com/morrow1nd/luax): Lua-like programming language for studying compiler and interpreter courses.

[Square](https://github.com/square-lang/Square): A tiny programming language under 200kb.

---

## LLVM
[Writing your own toy language](https://gnuu.org/2009/09/18/writing-your-own-toy-compiler/) using flex, bison, LLVM; [code](https://github.com/lsegal/my_toy_compiler)

[Implementing a JIT Compiled Language with Haskell and LLVM](https://www.stephendiehl.com/llvm/)

[A Tutorial on How to Write a Compiler Using LLVM](https://tomassetti.me/a-tutorial-on-how-to-write-a-compiler-using-llvm/)

---

## CLR
[How to Design Worlds (PDF)](https://world.cs.brown.edu/1/htdw-v1.pdf)

[learn-programming-languages](https://github.com/jeanqasaur/learn-programming-languages): Resources for the working programmer to learn more about the fundamentals and theory of programming languages. (Jean Yang)

[Concatenative Thinking (wiki)](https://concatenative.org/wiki/view/Front%20Page): We are interested in both theoretical results and practical programming advice, especially as it pertains to any Concatenative language. We want to bring together disparate language communities and build a common knowledge repository that people can consult to learn more about this family of languages.

---

## JVM

[write_your_own_dynamic_language_runtime](https://github.com/forax/write_your_dynamic_language_runtime): How to write interpreters or dynamic compilers for dynamically typed languages on top of the JVM. This repository provides the basis to implement your own

* Abstract Syntax Tree Interpreter
* Stack based Interpreter
* Java Virtual Machine based Interpreter

of a dynamically typed language named smalljs which is almost a subset of JavaScript.

---

## Toy/experimental

[jtc](https://github.com/progschj/jtc): A toy programming language interpreter that has no dependencies and sits in a single C++ file. C++11 capable compilers should compile it without extra options other than enabling C++11.

[Maverick](https://github.com/willianscsilva/interpreter)

[Eval](https://github.com/tevelee/Eval): a lightweight interpreter framework written in Swift, evaluating expressions at runtime.

[Pointless](https://ptls.dev/) ([Source](https://github.com/pointless-lang/pointless)): a scripting language for learning and fun.

[IMP](https://github.com/jayconrod/imp-interpreter): A minimal interpreter for the toy language, IMP, used as an example for building interpreters.

[Dwarf](https://github.com/nicolasdilley/dwarf-interpreter): A very small scripting language written in Elixir.


### Monkey
This is the language described by the book ["Writing an Interpreter in Go"](https://interpreterbook.com/). Also has a paired book, ["Writing a Compiler in Go"](https://compilerbook.com/) which appears to include the creation of a virtual machine for executing the compiled code.

* [C++](https://github.com/zhuzilin/monkey)
* [C++](https://github.com/yhirose/monkey-cpp)
* [C++](https://github.com/Imymirror/mirror-monkey)
* [Haskell](https://github.com/hatashiro/monkey-hs)
* [Rust](https://github.com/Rydgel/monkey-rust)
* [Rust](https://github.com/wadackel/rs-monkey-lang)
* [Source](https://github.com/haifenghuang/monkey) (archived)
* [Gadget](https://github.com/vkandola/go-go-gadget): The 'Gadget' interpreter language, implemented in Go, using the Writing An Interpreter In Go book. This language is based off the Monkey interpreter language described in the book, and will be implemented as I progress through the book.

### Lox
From ["Crafting Interpreters"](http://www.craftinginterpreters.com/):

* C++: [CppLox](https://github.com/the-lambda-way/CppLox)
* Rust: [rlox](https://github.com/cwbriones/rlox)
* Swift: [slox](https://github.com/alexito4/slox)
