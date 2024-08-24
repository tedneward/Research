title=Types and type systems (reading)
tags=reading, language, language development
summary=Reading and notes about types and type systems in programming languages (and related).
~~~~~~

A [type](https://en.wikipedia.org/wiki/Type_system), also known as a data type, is a classification identifying one of various types of "things" used within a programming language or platform. More prosaically, a type describes the possible values of a "thing" (such as a variable), the semantic meaning of that "thing", and how the values of that "thing" can be stored in memory.

A type system is a collection of rules that assign a property called type to various constructs in a computer program, such as variables, expressions, functions or modules, with the end goal of reducing the number of bugs by verifying that data is represented properly throughout a program. 

> See ["What is a type system, anyway"](https://lambdaland.org/posts/2023-01-17_what_is_a_type_system_really/): "Type systems provide a way of writing down properties of our programs that we would like to be true, and then mechanically checking that those properties hold. Type systems come in all shapes and sizes; some are more expressive than others. Types are also a great tool to use when actually writing code. Static type systems provide strong guarantees about program behavior at the expense of some friction in programming: dynamic languages make it easy to throw together a prototype, but can become unwieldy or difficult to maintain once the codebase grows. Gradual typing is an increasingly popular method to get the best of both worlds."

Most types break out into the following categories:

* **Primitives**: the atoms of the programming language; usually things like integers, strings, booleans, and so on. The internal representation of a primitive is usually entirely opaque to the programmer without significant effort (like taking memory addresses and poking around). 

	* **Booleans**: true/false values
	* **Integrals**: non-fractional/whole numbers, often using the first bit to indicate sign (positive or negative). Using twos-complement math, this gives a fairly large range of integral numbers, depending on how many bytes are used for the integral:

		* 1-byte/8-bit: -128 to +127/0 to 255
		* 2-byte/16-bit: -32k to +32k/0 to 64k
		* 4-byte/32-bit: -2,147,483,648 to +2,147,483,647/0 to 4gb
		* 8-byte/64-bit: if you have to ask...
		* 16-byte/128-bit: if you have to ask...
		* "word" or "natural" sized, which is the natural "size" of the CPU (typically, in 2021, this is 64 bits)
		
	* **Floating-points**: fractional numbers, usually represented in [IEEE 754](https://ieeexplore.ieee.org/document/8766229) ([Wikipedia](https://en.wikipedia.org/wiki/IEEE_754)) format.
	* **Pointers**: One common primitive type is a pointer to a memory location (whether directly manipulable by the programmer or not); Java, for example, talks about `Object o = new Object();` as allocating an object `o`, but in truth `o` is a reference to the object created, not the object itself. The reference `o` is allocated on the stack, whereas the object `o` points to is allocated out of the heap. Pointers/references are almost always word/natural-sized.

* **Composite**: these are the various "structures" that a programmer can build up out of primitives. Some are built within the language (arrays within C/C++/Java/C#, etc), some are built using language constructs (`class` or `struct` within C++/Java/C#/etc). I tend to break these into "simple composite types" (composites provided by the language itself) and "complex composite types" (composites defined by the developer), also sometimes known as "user-defined types" (UDTs).

* **Abstract data types**: these are types that do not have specific implementation, and could thus be represented by multiple concrete types. ADTs are usually defined by `interface`s in Java/C#, but one does not need an interface keyword to have an ADT.

* **Nominal typing**: types are unique based on their declared name

* **Structural typing**: types are unique based on the structure that makes up their definition, such that two declared types with the same structure are considered the same type, even if they are declared with different names.

* **Dependent types**: "Dependent types allow types to depend on values; i.e. you can have a type for "list with three integers". Dependent typing, as I understand it, opens up complete programmability of the type system, at the cost of type checking becoming undecidable. These type systems allow you describe the behavior of your programs with incredible precision." (from https://lambdaland.org/posts/2023-01-17_what_is_a_type_system_really/ )

### [Type-checking](https://en.wikipedia.org/wiki/Type_system#Type_checking)

The existence of types is useless without a process of verifying that those types make logical sense in the program so that the program can be executed successfully. Type checking is the process of verifying and enforcing the constraints of types, and it can occur either at ahead-of-(execution-)time (i.e. statically) or at runtime/execution time (i.e. dynamically). Type checking is all about ensuring that the program will not encounter errors due to inappropriate or undefined intersection of types; a type error is an erroneous program behavior in which an operation occurs (or trys to occur) on a particular data type that it’s not meant to occur on.

When a program is considered not type-safe, there is no single standard course of action that happens upon reaching a type error. Many programming languages throw type errors which halt the runtime or compilation of the program, while other languages have built-in safety features to handle a type error and continue running (allowing developers to exhibit poor type safety).

- ["Basic type checking"](./BasicTypechecking.pdf)

[What to know before debating type systems](https://cdsmith.wordpress.com/2011/01/09/an-old-article-i-wrote/)

* [Static](/tags/static): A language is statically-typed if the type of a variable is known at ahead-of-(execution-)time instead of at runtime. Since most ahead-of-time checking is considered compilation, most statically-type-checked languages are compilation-based languages, though certainly nothing stops an interpreter from statically-type-checking a program when it is first loaded. Consequences include:

	* Many type errors, because they are often programmer mental mistakes, can be caught early in the development cycle and thus never appear to the user.
	* Static typing information can be used to optimize compiled code that executes more quickly because when the compiler knows the exact data types that are in use, it can produce better machine code (i.e. faster and/or using less memory).
	* A static type-checker will quickly detect type errors in rarely used code paths. Without static type checking, even code coverage tests with 100% coverage may be unable to find such type errors.
	* Static type-checkers make it nearly impossible to manually raise a type error in code because even if that code block hardly gets called, the type-checker would almost always find a situation/codepath that will yield the possibility of that type error occurring at runtime and thus prevent compilation/execution (because a type error was raised).
	* Many/most static type checkers evaluate only the type information that can be determined at compile time, but are able to verify that the checked conditions hold for all possible executions of the program, which eliminates the need to repeat type checks every time the program is executed; this can also yield faster startup times.

* [Dynamic](/tags/dynamic): Dynamic type checking is the process of verifying the type safety of a program at runtime.

	Most type-safe languages include some form of runtime/dynamic type checking, even if they also have a static type checker; many useful features or properties are difficult or impossible to verify statically. Languages frequently want to allow a programmer to assert (cast) that a given returned value is, in fact, of a different type; the assumption is that the programmer has awareness of how the code will execute at runtime that the compiler cannot verify. However, humans are fallible creatures, and blindly accepting the cast could yield significant error or corruption. Therefore, a dynamic check is needed to verify that the operation is safe. Consequences:
	
	* In contrast to static type checking, dynamic type checking may cause a program to fail at runtime due to type errors.

	* In some programming languages, it is possible to anticipate and recover from these failures – either by error handling or blindly carrying on assuming everything will work out. In others, type checking errors are considered fatal. Because type errors are more difficult to determine in dynamic type checking, it is a common practice to supplement development in these languages with unit testing.

	* Dynamic type checking typically results in less optimized code than does static type checking. (Modern runtimes and JIT compilers can offset this, but usually by doing static type analysis at runtime and then generating/compiling code for direct execution--in essence, just pushing the compilation process to the last possible moment before execution.)

	* Dynamic type checking forces runtime checks to occur for every execution of the program (instead of just at compile-time).

	* It opens up the doors for more powerful language features and makes certain other development practices significantly easier. For example, metaprogramming – especially when using `eval` functionality – is not impossible in statically-typed languages, but it is much, much easier to work with in dynamically-typed languages.

Note that while these terms usually are applied most directly to programming languages, there's a strong case to be made that they apply to other areas of programming, too, like storage. A relational database, for example, could be said to be a strongly-type-safe (because it insists on only integers in INTEGER columns) and statically-type-checked (since it parses SQL and does type-checking).

### Type-safety

* Strong: A strongly-typed language is one in which variables are bound to specific data types, and will result in type errors if types to not match up as expected in the expression. A simple way to think of strong typing is to consider it to be a guarantor of high degrees of type safety. 

* Weak: A weakly-typed language on the other hand is a language in which variables are not bound to a specific data type; they still have a type, but type safety constraints are lower compared to strongly-typed languages. 

Note that while these terms usually are applied most directly to programming languages, there's a strong case to be made that they apply to other areas of programming, too, like storage. A relational database, for example, could be said to be a strongly-type-safe (because it insists on only integers in INTEGER columns) and statically-type-checked (since it parses SQL and does type-checking).

## Type inference

## Type theory

* ["Lambda cube"](https://en.wikipedia.org/wiki/Lambda_cube): In mathematical logic and type theory, the λ-cube (also written lambda cube) is a framework introduced by Henk Barendregt[1] to investigate the different dimensions in which the calculus of constructions is a generalization of the simply typed λ-calculus. Each dimension of the cube corresponds to a new kind of dependency between terms and types. Here, "dependency" refers to the capacity of a term or type to bind a term or type. The respective dimensions of the λ-cube correspond to:

	* x-axis: types that can bind terms, corresponding to dependent types.
	* y-axis: terms that can bind types, corresponding to polymorphism.
	* z-axis: types that can bind types, corresponding to (binding) type operators.

	The different ways to combine these three dimensions yield the 8 vertices of the cube, each corresponding to a different kind of typed system. The λ-cube can be generalized into the concept of a pure type system.

## Code/implementations

[From PLZoo](https://github.com/cdiggins/type-inference): Type Inference Library written in TypeScript (used in [Heron](/languages/heron) and [Cat](/languages/cat)).

## Reading

* [Type Systems for Memory Safety](https://borretti.me/article/type-systems-memory-safety): "Manual memory management and memory safety used to be incompatible. But it is possible to design programming languages and type systems that provide memory safety at compile time, combining the safety of high-level languages with the performance and low-level control of languages like C." ... "Memory safety is a bundle of things: *Null Safety*: dereferencing a NULL pointer is bad. This causes a segfault or a NullPointerException or undefined is not a function, depending on your language. This is the easiest one to solve and arguably isn’t about memory at all. *Buffer Overflow*: indexing past the end of a contiguous chunk of memory. This is solved by storing the length of arrays and checking it. *No Use-After-Free*: using a chunk of memory after it has been deallocated. This is a source of too many security vulnerabilities to count. *Leak Freedom*: all memory that is allocated is freed. *Data Race Freedom*: memory can be used by multiple threads without complex runtime access checks (locks, mutexes etc.) Null safety and buffer overflows are solved by quotidian solutions: option types and range checks. Use-after-free and leak freedom are harder to enforce, and require potentially a lot more compile time machinery."

* ["How to Write a type checker/type inferrer with good error message"](https://lambdaland.org/posts/2022-07-27_how_to_write_a_type_checker/) ([Source](https://git.sr.ht/~ashton314/type-error-research))

* Creating the Bolt Compiler: [Part 4: An accessible introduction to type theory and implementing a type-checker](https://mukulrathi.com/create-your-own-programming-language/intro-to-type-checking/): This post is split into 2 halves: the first half explains the theory behind type-checkers, and the second half gives you a detailed deep-dive into how it’s implemented in our compiler for our language Bolt. Even if you aren’t interested in writing your own language, the first half is useful if you’ve ever heard about type systems and want to know how they even work!

* [Type Theory and Functional Programming](https://www.cs.kent.ac.uk/people/staff/sjt/TTFP/) | [Crash Course on Notation in Programming Language Theory](http://siek.blogspot.com/2012/07/crash-course-on-notation-in-programming.html), Jeremy G. Siek; LambdaConf 2018 [Part 1](https://www.youtube.com/watch?v=vU3caZPtT2I), [Part 2](https://www.youtube.com/watch?v=MhuK_aepu1Y) [Slides](https://www.dropbox.com/s/joaq7m9v75blrw5/pl-notation-lambdaconf-2018.pdf?dl=1)

* [Types and Programming Languages](https://www.cis.upenn.edu/~bcpierce/tapl/): TAPL (rhymes with “apple”), as it’s better known, has a solid introduction to formal semantics in the first few chapters and would be my pick for a starting point on formal semantics. The remainder of the book deals with type systems, which form only one part of programming languages, but it’s the canonical reference if you’re looking to learn about types.

* ["Building a Typechecker from scratch"](http://dmitrysoshnikov.com/courses/typechecker/): Untyped programs are often prone to errors, runtime exceptions, and can make debugging much harder. That’s why many production languages implement a static typechecker — an extra module, which is aimed to increase programs safety and make development simpler.

* [Basic Type checking](./BasicTypechecking.pdf) (PDF)

* Subtype Inference by Example: 

	* [Part 1: Introducing CubiML](https://blog.polybdenum.com/2020/07/04/subtype-inference-by-example-part-1-introducing-cubiml.html)
	* [Part 2: Parsing and Biunification](https://blog.polybdenum.com/2020/07/11/subtype-inference-by-example-part-2-parsing-and-biunification.html)
	* [Part 3: The Typechecker Frontend](https://blog.polybdenum.com/2020/07/18/subtype-inference-by-example-part-3-the-typechecker-frontend.html)
	* [Part 4: The Typechecker Core](https://blog.polybdenum.com/2020/07/25/subtype-inference-by-example-part-4-the-typechecker-core.html)
	* [Part 5: Incremental Reachability](https://blog.polybdenum.com/2020/08/01/subtype-inference-by-example-part-5-incremental-reachability.html)
	* [Part 6: Numeric Types and Operators](https://blog.polybdenum.com/2020/08/08/subtype-inference-by-example-part-6-numeric-types-and-operators.html)
	* [Part 7: Spanned Error Messages](https://blog.polybdenum.com/2020/08/15/subtype-inference-by-example-part-7-spanned-error-messages.html)
	* [Part 8: Mutability](https://blog.polybdenum.com/2020/08/22/subtype-inference-by-example-part-8-mutability.html)
	* [Part 9: Match Wildcards, Record Extension, and Row Polymorphism](https://blog.polybdenum.com/2020/08/29/subtype-inference-by-example-part-9-nonexhaustive-matching-record-extensions-and-row-polymorphism.html)
	* [Part 10: Let Polymorphism](https://blog.polybdenum.com/2020/09/05/subtype-inference-by-example-part-10-let-polymorphism.html)
	* [Part 11: The Value Restriction and Polymorphic Recursion](https://blog.polybdenum.com/2020/09/19/subtype-inference-by-example-part-11-the-value-restriction.html)
	* [Part 12: Flow Typing and Mixed Comparison Operators](https://blog.polybdenum.com/2020/09/26/subtype-inference-by-example-part-12-flow-typing-and-mixed-comparison-operators.html)
	* [Part 13: Conditional Flow Constraints, Presence Polymorphism, and Type Level Computation](https://blog.polybdenum.com/2020/10/03/subtype-inference-by-example-part-13-conditional-flow-types-and-type-level-computation.html)
	* [Part 14: Type Annotations -- what are they good for?](https://blog.polybdenum.com/2020/10/10/subtype-inference-by-example-part-14-type-annotation.html)
	* [Part 15: Monomorphic Type Annotations](https://blog.polybdenum.com/2020/10/17/subtype-inference-by-example-part-15-type-annotations.html)

* [What are GADTs (generic abstract data types) and why do they make type inference sad?](https://blog.polybdenum.com/2024/03/03/what-are-gadts-and-why-do-they-make-type-inference-sad.html)

* [On the Relationship Between Static Analysis and Type Theory](https://semantic-domain.blogspot.com/2019/08/on-relationship-between-static-analysis.html)

* [Soundness and completeness: with precision](https://bertrandmeyer.com/2019/04/21/soundness-completeness-precision/)

* [What is soundness (in static analysis)?](http://www.pl-enthusiast.net/2017/10/23/what-is-soundness-in-static-analysis/)

* [What Type Soundness Theorem Do You Really Want to Prove?](https://blog.sigplan.org/2019/10/17/what-type-soundness-theorem-do-you-really-want-to-prove/) ([YouTube](https://www.youtube.com/watch?v=8Xyk_dGcAwk))
	- Milner Award Lecture: The Type Soundness Theorem That You Really Want to Prove (and now you can), POPL 2018; Derek Dreyer

* [Type Theory Behind Glasgow Haskell Compiler Internals](https://github.com/lambdaconf/lambdaconf-2018/tree/master/LC18-slides) ([video](https://www.youtube.com/playlist?list=PLvPsfYrGz3wspkm6LVEjndvQqK6SkcXaT)): LambdaConf 2018; Vitaly Bragilevsky - https://github.com/bravit/tt-ghc-exercises/

* Reconstructing TypeScript: I've been building a "document development environment" called Programmable Matter that supports live code embedded in documents, with a simple TypeScript-like programming language. It's been fun figuring out how to implement it—the type system in TypeScript is unusual and very cool! I want to dig into what's cool and unusual about TypeScript by presenting a type checker for a fragment of this language (written in actual TypeScript). I'll start with a tiny fragment and build it up over several posts. In this first post I'll give some background to help make sense of the code.
	
	* [Part 0: Intro and Background](https://jaked.org/blog/2021-09-07-Reconstructing-TypeScript-part-0)
	* [Part 1: bidirectional type checking](https://jaked.org/blog/2021-09-15-Reconstructing-TypeScript-part-1)
	* [Part 2: functions and function calls](https://jaked.org/blog/2021-09-27-Reconstructing-TypeScript-part-2)
	* [Part 3: operators and singleton types](https://jaked.org/blog/2021-10-06-Reconstructing-TypeScript-part-3)
	* [Part 4: union types](https://jaked.org/blog/2021-10-14-Reconstructing-TypeScript-part-4)
	* [Part 5: intersection types](https://jaked.org/blog/2021-10-28-Reconstructing-TypeScript-part-5)
	* [Part 6: narrowing](https://jaked.org/blog/2021-11-11-Reconstructing-TypeScript-part-6)

* "lambda-me/blog", type inference:

	* 2023-09-30 - [Implementing kind inference](https://gilmi.me/blog/post/2023/09/30/kind-inference)
	* 2021-04-13 - [Typing polymorphic variants in Giml](https://gilmi.me/blog/post/2021/04/13/giml-typing-polymorphic-variants)
	* 2021-04-10 - [Typing extensible records in Giml](https://gilmi.me/blog/post/2021/04/10/giml-typing-records)
	* 2021-04-06 - [Giml's type inference engine](https://gilmi.me/blog/post/2021/04/06/giml-type-inference)

* ["Evolving Languages Faster with Type Tailoring"](https://lambdaland.org/posts/2024-07-15_type_tailoring/)

* ["Implementing Type Systems with Macros"](https://lambdaland.org/posts/2023-08-14_types_with_macros/), which works off of...

* ["Type Systems as Macros"](https://doi.org/10.1145/3009837.3009886) Cited as Chang, S., Knauth, A. and Greenman, B. 2017. Type systems as macros. Proceedings of the 44th ACM SIGPLAN Symposium on Principles of Programming Languages - POPL 2017 (Paris, France, 2017), 694–705.

## Research

- [Algebraic Subtyping](https://www.cs.tufts.edu/~nr/cs257/archive/stephen-dolan/thesis.pdf): A new type inference system with full subtyping support.
- [A brief introduction to type theory and the univalence axiom](https://math.uchicago.edu/~may/REU2015/REUPapers/Macor.pdf)
- [A Taste of Type Theory](https://www.youtube.com/watch?v=--2jJwdQ5js)
- [A Type System From Scratch](https://www.youtube.com/watch?v=IbjoA5xVUq0)
- [An accessible introduction to type theory and implementing a type-checker](https://mukulrathi.com/create-your-own-programming-language/intro-to-type-checking)
- [Bootstrapping a Type System](http://journal.stuffwithstuff.com/2010/10/29/bootstrapping-a-type-system)
- [Bringing Types to Elixir by Giuseppe Castagna and Guillaume Duboc](https://www.youtube.com/watch?v=gJJH7a2J9O8&ab_channel=CodeSync)
- [Building a Typechecker from scratch](https://www.udemy.com/course/typechecker)
- [Discrete Math — Dr. Trefor Bazett](https://www.youtube.com/playlist?list=PLHXZ9OQGMqxersk8fUxiUMSIx0DBqsKZS)
- [Gradual Type Theory](https://www.youtube.com/watch?v=EGKeWg2ES0A&ab_channel=POPL2019)
- [Gradual Typing: A New Perspective](https://www.youtube.com/watch?v=JuwHDskX7Qg&ab_channel=POPL2019)
- [Gradual Typing from Theory to Practice](https://blog.sigplan.org/2019/07/12/gradual-typing-theory-practice)
- Hindley-Milner:

    - [A reckless introduction to Hindley-Milner type inference](https://www.lesswrong.com/posts/vTS8K4NBSi9iyCrPo/a-reckless-introduction-to-hindley-milner-type-inference)
    - [Hindley-Milner Type Inference — Part 1](https://www.youtube.com/watch?v=cQf_6NsLp80&ab_channel=AdamDoup%C3%A9)
    - [Hindley-Milner Type Inference — Part 2](https://www.youtube.com/watch?v=xJXcZp2vgLs&list=PLK06XT3hFPzilgF1mi_hHqcXO1-o_8OEe&index=37&ab_channel=AdamDoup%C3%A9)
    - [Hindley-Milner Type Checking AST](https://adamdoupe.com/teaching/classes/cse340-principles-of-programming-languages-f15/slides/Hindley-MilnerTypeChecking-Mohsen-Zohrevandi.pdf)
    - [The Hindley-Milner Type System](https://www.youtube.com/watch?v=OyrByPkiX7s&ab_channel=NicolasLaurent)

- [How should I read type system notation?](https://langdev.stackexchange.com/questions/2692/how-should-i-read-type-system-notation/2693#2693)
- [How to Evaluate the Performance of Gradual Type Systems](https://www.youtube.com/watch?v=7d6iJdSRFtQ&ab_channel=CambridgeUniversityPress)
- [How to evaluate the performance of gradual type systems](https://users.cs.utah.edu/~blg/publications/pe4gt/gtnffvf-jfp-2019.pdf)
- [Introduction to Type Theory](https://www.cs.uoregon.edu/research/summerschool/summer22/topics.php)
- [Let's build a typesystem in Haskell!](https://www.youtube.com/watch?v=aZFWY6DxX54)
- [MyPy TypeChecker](https://github.com/python/mypy/wiki/Type-Checker)
- [Optimizing and Evaluating Transient Gradual Typing](https://dl.acm.org/doi/pdf/10.1145/3359619.3359742)
- [Propositions as Types](https://www.youtube.com/watch?v=IOiZatlZtGU) - by Philip Wadler
- [Programming and Programming Languages: Type Inference](https://papl.cs.brown.edu/2018/Type_Inference.html)
- [Propositions as types: explained](https://lawrencecpaulson.github.io/2023/08/23/Propositions_as_Types.html)
- [Putting gradual types to work](https://arxiv.org/pdf/2101.12299.pdf)
- Python internals:

    - [Symbol tables, part 1](https://eli.thegreenplace.net/2010/09/18/python-internals-symbol-tables-part-1)
    - [Symbol tables, part 2](https://eli.thegreenplace.net/2010/09/20/python-internals-symbol-tables-part-2)

- [Safe & Efficient Gradual Typing for TypeScript](https://www.cs.umd.edu/~aseem/safets.pdf)
- [Strong arrows: a new approach to gradual typing](https://elixir-lang.org/blog/2023/09/20/strong-arrows-gradual-typing)
- [Thinking with Types](https://www.youtube.com/playlist?list=PLE-CSy3N6yEeYY5tx1u5IP3d_2xZOmpKO)
- [Type Checking If Expressions](http://journal.stuffwithstuff.com/2023/01/03/type-checking-if-expressions)
- [Type inference under the hood](https://www.aleksandra.codes/type-inference)
- [Type Systems - The Good, Bad and Ugly](https://www.youtube.com/watch?v=SWTWkYbcWU0&t=2s&ab_channel=StrangeLoopConference)
- [Type Systems](http://lucacardelli.name/papers/typesystems.pdf) - by Luca Cardelli, Microsoft Research
- [Type Theory Workshop](https://functionalcs.github.io/curriculum/typetheory.html)
- [Types and Programming Languages Book club](https://www.youtube.com/playlist?list=PLlw1FcLpWd42E0AMWz9fY-oXa_m3DA3SW)
- [Types are like the Weather, Type Systems are like Weathermen](https://www.youtube.com/watch?v=XTl7Jn_kmio&ab_channel=ClojureTV)
- [Typing the Untyped: Soundness in Gradual Type Systems](https://www.youtube.com/watch?v=uJHD2xyv7xo)
- [What is Decidable about Gradual Types?](https://www.youtube.com/watch?v=rPZ7HhyGPh4&ab_channel=ACMSIGPLAN)
- [Why Static Typing Came Back](https://www.youtube.com/watch?v=Tml94je2edk&ab_channel=GOTOConferences)
- [What Is Decidable about Gradual Types?](https://dl.acm.org/doi/pdf/10.1145/3371097)
- [What is Gradual Typing](https://wphomes.soic.indiana.edu/jsiek/what-is-gradual-typing)
- [Understanding types as sets](https://portal.gitnation.org/contents/understanding-types-as-sets)

