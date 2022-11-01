title=Progrmming Language Implementation
tags=reading, languages
summary=Collection of material on how to build programming languages.
~~~~~~

[Open, extensible object models](https://piumarta.com/software/cola/objmodel2.pdf): "The artificial distinction between implementation language and end-user language can be eliminated by implementing the language using only end-user objects and messages, making the implementation accessible for arbitrary modification by programmers. We show that three object types and five methods are sufficient to bootstrap an extensible object model and messaging semantics that are described entirely in terms of those same objects and messages."

[Crafting Interpreters](http://craftinginterpreters.com/) by Bob Nystrom [Github](https://github.com/munificent/craftinginterpreters)

[The Super Tiny Compiler](https://github.com/jamiebuilds/the-super-tiny-compiler) (JS)

***Creating the Bolt Compiler (series):***

* Part 1: [How I wrote my own "proper" programming language](https://mukulrathi.com/create-your-own-programming-language/intro-to-compiler/)
* Part 2: So how do you structure a compiler project?
* Part 3: Writing a Lexer and Parser using OCamllex and Menhir
* Part 4: An accessible introduction to type theory and implementing a type-checker
* Part 5: A tutorial on liveness and alias dataflow analysis
* Part 6: Desugaring - taking our high-level language and simplifying it!
* Part 7: A Protobuf tutorial for OCaml and C++
* Part 8: A Complete Guide to LLVM for Programming Language Creators
* Part 9: Implementing Concurrency and our Runtime Library
* Part 10: Generics - adding polymorphism to Bolt
* Part 11: Adding Inheritance and Method Overriding to Our Language

***Let's Build an Interpreter (series)*** ([Github](https://github.com/hisystems/Interpreter/tree/master/Engine)): 

* [1](https://ruslanspivak.com/lsbasi-part1/)
* [2](https://ruslanspivak.com/lsbasi-part2/)
* [3](https://ruslanspivak.com/lsbasi-part3/)
* [4](https://ruslanspivak.com/lsbasi-part4/)
* [5](https://ruslanspivak.com/lsbasi-part5/)
* [6](https://ruslanspivak.com/lsbasi-part6/)
* [7](https://ruslanspivak.com/lsbasi-part7/)
* [8](https://ruslanspivak.com/lsbasi-part8/)
* [9](https://ruslanspivak.com/lsbasi-part9/)
* [10](https://ruslanspivak.com/lsbasi-part10/)
* [11](https://ruslanspivak.com/lsbasi-part11/)
* [12](https://ruslanspivak.com/lsbasi-part12/)
* [13](https://ruslanspivak.com/lsbasi-part13/)
* [14](https://ruslanspivak.com/lsbasi-part14/)
* [15](https://ruslanspivak.com/lsbasi-part15/)
* [16](https://ruslanspivak.com/lsbasi-part16/)
* [17](https://ruslanspivak.com/lsbasi-part17/)
* [18](https://ruslanspivak.com/lsbasi-part18/)
* [19](https://ruslanspivak.com/lsbasi-part19/)
* may be more...?

["Three Things I Wish I Knew When I Started Designing Languages"](https://www.youtube.com/watch?v=oa0qq75i9oc)

["The Naked Truth About Writing a Programming Language"](https://www.digitalmars.com/articles/b90.html)

[Program Analysis](https://gist.github.com/MattPD/00573ee14bf85ccac6bed3c0678ddbef)

[Nanopass](http://www.cs.indiana.edu/~dyb/pubs/nano-jfp.pdf): A framework for compiler education

---

## Native/raw
[Build your own Lisp](http://www.buildyourownlisp.com/contents) teaches C by building a Lisp.

---

## LLVM
[Writing your own toy language](https://gnuu.org/2009/09/18/writing-your-own-toy-compiler/) using flex, bison, LLVM; [code](https://github.com/lsegal/my_toy_compiler)

[Implementing a JIT Compiled Language with Haskell and LLVM](https://www.stephendiehl.com/llvm/)

[A Tutorial on How to Write a Compiler Using LLVM](https://tomassetti.me/a-tutorial-on-how-to-write-a-compiler-using-llvm/)

---

## CLR
[How to Design Worlds (PDF)](https://world.cs.brown.edu/1/htdw-v1.pdf)

[learn-programming-languages](https://github.com/jeanqasaur/learn-programming-languages)
	- Resources for the working programmer to learn more about the fundamentals and theory of programming languages.
	- Jean Yang

[Concatenative Thinking (wiki)](https://concatenative.org/wiki/view/Front%20Page): We are interested in both theoretical results and practical programming advice, especially as it pertains to any Concatenative language. We want to bring together disparate language communities and build a common knowledge repository that people can consult to learn more about this family of languages.

Immo Landwerth has done a collection of videos on building a language called Minsk, for the CLR platform, in a live-streaming style: [Source](https://github.com/terrajobst/minsk) | [Episode 1](https://www.youtube.com/watch?v=wgHIkdUQbp0&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y) | [Episode 2](https://www.youtube.com/watch?v=3XM9vUGduhk&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=2) | [Episode 3](https://www.youtube.com/watch?v=61dLQNgd9o8&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=3) | [Episode 4](https://www.youtube.com/watch?v=xF-8rWeqV1A&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=4) | [Episode 5](https://www.youtube.com/watch?v=EEzuO9XWmUY&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=5) | [Episode 6](https://www.youtube.com/watch?v=EEzuO9XWmUY&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=6) | [Episode 7](https://www.youtube.com/watch?v=SJE_gUnJl2Y&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=7) | [Episode 8](https://www.youtube.com/watch?v=PfpayNvfu20&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=8) | [Episode 9](https://www.youtube.com/watch?v=QwZuY1dExAc&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=9) | [Episode 10](https://www.youtube.com/watch?v=QwZuY1dExAc&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=10) | [Episode 11](https://www.youtube.com/watch?v=QwZuY1dExAc&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=11) | [Episode 12](https://www.youtube.com/watch?v=psTZi6xpTlM&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=12) | [Episode 13](https://www.youtube.com/watch?v=NvVc8erZpeI&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=13) | [Episode 14](https://www.youtube.com/watch?v=NvVc8erZpeI&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=14) | [Episode 15](https://www.youtube.com/watch?v=NvVc8erZpeI&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=15) | [Episode 16](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=16) | [Episode 17](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=17) | [Episode 18](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=18) | [Episode 19](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=19) | more are likely on the way

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

---

## Types
* [Type Theory and Functional Programming](https://www.cs.kent.ac.uk/people/staff/sjt/TTFP/) | [Crash Course on Notation in Programming Language Theory](http://siek.blogspot.com/2012/07/crash-course-on-notation-in-programming.html), Jeremy G. Siek; LambdaConf 2018 [Part 1](https://www.youtube.com/watch?v=vU3caZPtT2I), [Part 2](https://www.youtube.com/watch?v=MhuK_aepu1Y) [Slides](https://www.dropbox.com/s/joaq7m9v75blrw5/pl-notation-lambdaconf-2018.pdf?dl=1)

* [Types and Programming Languages](https://www.cis.upenn.edu/~bcpierce/tapl/): TAPL (rhymes with “apple”), as it’s better known, has a solid introduction to formal semantics in the first few chapters and would be my pick for a starting point on formal semantics. The remainder of the book deals with type systems, which form only one part of programming languages, but it’s the canonical reference if you’re looking to learn about types.

* [On the Relationship Between Static Analysis and Type Theory](https://semantic-domain.blogspot.com/2019/08/on-relationship-between-static-analysis.html)

* [Soundness and completeness: with precision](https://bertrandmeyer.com/2019/04/21/soundness-completeness-precision/)

* [What is soundness (in static analysis)?](http://www.pl-enthusiast.net/2017/10/23/what-is-soundness-in-static-analysis/)

* [What Type Soundness Theorem Do You Really Want to Prove?](https://blog.sigplan.org/2019/10/17/what-type-soundness-theorem-do-you-really-want-to-prove/) ([YouTube](https://www.youtube.com/watch?v=8Xyk_dGcAwk))
	- Milner Award Lecture: The Type Soundness Theorem That You Really Want to Prove (and now you can), POPL 2018; Derek Dreyer

* Type Theory Behind Glasgow Haskell Compiler Internals
	- LambdaConf 2018; Vitaly Bragilevsky
	- https://www.youtube.com/playlist?list=PLvPsfYrGz3wspkm6LVEjndvQqK6SkcXaT
	- https://github.com/bravit/tt-ghc-exercises/
	- https://github.com/lambdaconf/lambdaconf-2018/tree/master/LC18-slides



