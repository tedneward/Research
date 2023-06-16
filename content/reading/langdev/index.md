title=Language Development
tags=reading, langdev
summary=A collection of links and articles on building programming languages.
~~~~~~

## Reading

* [Crafting Interpreters](http://craftinginterpreters.com/) by Bob Nystrom ([Github](https://github.com/munificent/craftinginterpreters))
* [CS6120: Advanced Compilers: The Self-Guided Online Course](https://www.cs.cornell.edu/courses/cs6120/2020fa/self-guided/): The work consists of reading papers and open-source hacking tasks, which use LLVM and an educational IR invented just for this class.
* [Dynamic Language Embedding](https://scg.unibe.ch/archive/phd/renggli-phd.pdf)
* [X-expressions in XMLisp: S-expressions and Extensible Markup Language Unite](https://home.cs.colorado.edu/~ralex/papers/PDF/X-expressions.pdf): "XMLisp unites S-expressions with XML into X-expressions that unify the notions of data sharing with computation. Using a combination of the Meta Object Protocol (MOP), readers and printers, X-expressions uniquely integrate XML at a language, not API level, into Lisp in a way that could not be done with other programming languages."

## DSLs

[Creating a DSL Step by Step, Part 1](https://www.youtube.com/watch?v=3sfMSHyjMHk)

[Create a programming language that the whole company can understand](https://www.youtube.com/watch?app=desktop&v=G2TxT0muOis)

[Creating a Ruby DSL: A Guide to Advanced Metaprogramming](https://www.toptal.com/ruby/ruby-dsl-metaprogramming-guide)

[Towards Dynamically Extensible Syntax](https://homepages.cwi.nl/~storm/publications/jh.pdf): introduces CherryLisp -- a Lisp dialect with dynamically user-definable syntax that suffers from neither of [drawbacks listed in the abstract].

## Articles/Papers

["Three Things I Wish I Knew When I Started Designing Languages"](https://www.youtube.com/watch?v=oa0qq75i9oc)

["The Naked Truth About Writing a Programming Language"](https://www.digitalmars.com/articles/b90.html)

["How Big Should a Programming Language Be?"](https://tratt.net/laurie/blog/2023/how_big_should_a_programming_language_be.html): "... a long-held opinion I have about programming language design: we have a tendency to keep adding features to a language until it becomes so big that its sheer size makes it difficult to use reliably." *Yes!*

[Open, extensible object models](https://piumarta.com/software/cola/objmodel2.pdf): "The artificial distinction between implementation language and end-user language can be eliminated by implementing the language using only end-user objects and messages, making the implementation accessible for arbitrary modification by programmers. We show that three object types and five methods are sufficient to bootstrap an extensible object model and messaging semantics that are described entirely in terms of those same objects and messages."

[Intrinsically-Typed Definitional Interpreters for Linear, Session-Typed Languages](https://eelcovisser.org/publications/2020/RouvoetPKV20.pdf)

[Interview with Jesper Louis Andsersen](https://medium.com/@unbalancedparen/interview-with-jesper-louis-andersen-about-erlang-haskell-ocaml-go-idris-the-jvm-software-and-b0de06440fbd#.g4q9w4eqq) about a ton of languages.

["Less is more: language features"](http://blog.ploeh.dk/2015/04/13/less-is-more-language-features/)

["Languages I want to write"](https://blog.wesleyac.com/posts/language-todos)

["A wish list for a new programming language"](http://www.drmaciver.com/2015/07/a-wish-list/)

[The Super Tiny Compiler](https://github.com/jamiebuilds/the-super-tiny-compiler) (JS)

[Program Analysis](https://gist.github.com/MattPD/00573ee14bf85ccac6bed3c0678ddbef)

[Nanopass](https://legacy.cs.indiana.edu/~dyb/pubs/nano-jfp.pdf): A framework for compiler education | [Source](https://github.com/nanopass/) in Racket or Scheme

[Language Incubator](https://github.com/EarlGray/language-incubator): Repo of language experiments/explorations; "An incubator/sandbox for learning compilers, interpreters, code generation, virtual machines, assemblers, JITs, etc."

[Principles of Programming Languages (course)](https://bguppl.github.io/interpreters/practice_sessions/ps4.html) ([Source](https://github.com/bguppl/interpreters))

[Flattening ASTs (and Other Compiler Data Structures)](https://www.cs.cornell.edu/~asampson/blog/flattening.html)

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

Video - [Creating a domain specific language for .NET Application](https://www.youtube.com/watch?app=desktop&v=64x29FGaoK4)

Presentation - [Write your own domain specific language with F#](https://www.youtube.com/watch?app=desktop&v=NoGyFQ99NgY)

---

## JVM

[write_your_own_dynamic_language_runtime](https://github.com/forax/write_your_dynamic_language_runtime): How to write interpreters or dynamic compilers for dynamically typed languages on top of the JVM. This repository provides the basis to implement your own

* Abstract Syntax Tree Interpreter
* Stack based Interpreter
* Java Virtual Machine based Interpreter

of a dynamically typed language named smalljs which is almost a subset of JavaScript.

[joeq: A Virtual Machine and Compiler Infrastructure](https://joeq.sourceforge.net/) ([PDF](https://suif.stanford.edu/~jwhaley/papers/ivme03.pdf)) ([Source](https://sourceforge.net/projects/joeq/)): entirely implemented in JavaTM, leading to greater reliability, portability, maintainability, and efficiency. It is also language-independent, so code from any supported language can be seamlessly compiled, linked, and executed --- all dynamically!

[Scripting and Dynamic Interaction in Java](http://alumni.media.mit.edu/~mt/skij/dynjava/dynjava.html)

[Video: Nashorn: implementing a dynamic language runtime on JVM](https://www.youtube.com/watch?v=KKaHkkpdHxg) (Attila Szegedi)

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
