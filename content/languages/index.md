title=Languages
category=language
type=categorypage
summary=A collection of links about programming languages.
tags=language
~~~~~~

Programming languages are (generally) human-friendly means of getting a computer to do something interesting on a human's behalf. Some languages may be friendlier than others; where opinions will genuinely differ as to which are friendlier, there are some that deliberately seek to be as obtuse and unreadable as possible, and those are usually called "esoteric" programming languages and fit into their own category of madness.

See also [Language Places](/places/languages) and [PLZoo](/places/plzoo)

---

> "Every configuration file becomes a Turing-complete language eventually." --James Gosling

[Every simply language will eventually end up Turing complete](https://solutionspace.blog/2021/12/04/every-simple-language-will-eventually-end-up-turing-complete/)

## Language concepts

### Syntax/paradigms
[Toward a better programming](https://www.chris-granger.com/2014/03/27/toward-a-better-programming/)

["Programming Paradigms for Dummies: What Every Programmer Should Know"](../paradigms-for-dummies); includes a [chart of the major programming paradigms](http://www.info.ucl.ac.be/people/PVR/paradigmsDIAGRAMeng108.pdf):

* Descriptive declarative programming **[XML](/formats/xml), [S-expression](/languages/s-expressions)**
* First-order functional programming
* Imperative programming **[Pascal](/languages/pascal), [C](/languages/c)**
* Imperative search programming **SNOBOL, [Icon](/languages/icon), [Prolog](/languages/prolog)**
* Functional programming **[Scheme](/languages/lisp/scheme), [ML](/languages/ml)**
* Deterministic logic programming
* Relational & logic programming **[Prolog](/languages/prolog), [SQL embeddings](/languages/sql)**
* Constraint (logic) programming **CLP, ILOG Solver**
* Concurrent constraint programming **LIFE, AKL**
* Lazy concurrent constraint programming **[Oz](/languages/oz), [Alice](/languages/alice), [Curry](/languages/curry)**
* Continuation programming **[Scheme](/languages/lisp/scheme), [ML](/languages/ml)**
* Lazy functional programming **[Haskell](/languages/haskell)**
* Monotonic dataflow programming
* Declarative concurrent programming **Pipes, MapReduce**
* Lazy dataflow programming
* Lazy dataflow concurrent programming **[Oz](/languages/oz), [Alice](/languages/alice), [Curry](/languages/curry)**
* ADT functional programming **[Haskell](/languages/haskell), [ML](/languages/ml), [E](/languages/e)**
* ADT imperative programming **CLU, [OCaml](/languages/ocaml), [Oz](/languages/oz)**
* Nonmonotonic dataflow programming
* Concurrent logic programming **[Oz](/languages/oz), [Alice](/languages/alice), [Curry](/languages/curry), Excel, AKL, FGHC, FCP**
* Functional reactive programming (FRP)
* Weak synchronous programming **FrTime, SL**
* Strong synchronous programming **[Esterel](/languages/esterel), Lustre, Signal**
* Multi-agent dataflow programming **[Oz](/languages/oz), [Alice](/languages/alice), AKL**
* Event-loop programming **[E in one val](/languages/e)**
* Multi-agent programming
* Message-passing concurrent programming **[Erlang](/languages/erlang), AKL**
* Active object programming
* Object capabilities programming **CSP, Occam, [E](/languages/e), [Oz](/languages/oz), [Alice](/languages/alice), publish/subscribe, tuple space (Linda)**
* Sequential object-oriented programming
* Stateful functional programming **[Java](/languages/jvm/java), [OCaml](/languages/ocaml)**
* Concurrent object-oriented programming
* Shared-state concurrent programming **[Smalltalk](/languages/smalltalk), [Oz](/languages/oz), [Java](/languages/jvm/java), [Alice](/languages/alice)**
* Software transactional memory **[SQL embeddings](/languages/sql)**

Declarative, imperative, functional, constraint, logic, relational, concurrent, dataflow, synchronous, mesage-passing, event-loop, object-oriented, stateful, shared-state

My ontology:

* Assembly/Machine: Characterized by little-to-no abstraction over the target platform.

* Imperative (Steps taken to achieve a certain result. Von Neumann machines.) vs Declarative ()

* Procedural: Characterized by imperative execution statements with well-defined entry and exit points.

* [Object-oriented](/tags/object): Characterized by the union of state and behavior into a first-class concept, either at compile-time, run-time, or both. Ontological/categorical relationships between objects are often (though not always) possible, usually capturing some form of additive reuse, aka "inheritance". Objects are usually broken into two different kinds of object systems, typically depending on whether they are ahead-of-(execution-)time type-checked or not:

	* "Class"-based object languages: The more "traditional" OOP systems in which an object is forged out of a template/"cookie-cutter" expression known as a *class*. Typically these languages are compiled and strongly-type-checked, and if runtime inspection facilites (reflection) are available, they will be read-only. Objects obtained as part of the runtime inspection facilities are generally read-only, and often cached/singletonized/memoized.

	* "Prototype"-based object languages: Most popularized by [ECMAScript](/languages/ecmascript), prototype-based object languages have long existed, going as far back as CLOS, Self, Smalltalk, and others. Here, inheritance is a runtime relationship understood by the runtime (an object is cloned from a prototype "class" object, and as part of that cloning process a well-known pointer/reference is established back to the "class" object for "class"-level properties/methods), and is often malleable. Most prototype-object languages are dynamically-typed and often weakly-typechecked, since the runtime doesn't have *a priori* knowledge of how the various relationships are set up after the program has begun execution.

	Note that any language which supports [records](http://research.tedneward.com/languages/paradigms-for-dummies) (4.1) and [lexical function closures](http://research.tedneward.com/languages/paradigms-for-dummies) (4.2) can build objects "by hand", and even support inheritance by defining a runtime convention of a particularly-named-slot in a record to hold a reference to a prototype object. Given that functional languages often support both, this often leads to (a) functional-object hybrid languages with varying degrees of support for both, or (b) functional language zealots to insist that objects are unnecessary.

	Most object languages are imperative when defining methods, though this is not a requirement.

* [Functional](/tags/functional): Characterized by mathematics-inspired functions as first-class concepts. Preference for expressions over statements, lazy execution, immutable values, and so on. | [Wikipedia](https://en.wikipedia.org/wiki/Functional_programming) | Some [reading](/reading/functional) | Functional programming brought us [monads](/reading/monads) and all the fun that goes with that. Frequently cites/builds off of the [lambda calculus](http://en.wikipedia.org/wiki/Lambda_calculus).

* [Metaprogramming](/tags/metaobject) (aka MetaObject Protocol): Characterized by the idea that we can elevate "above" the object concept, in a variety of different ways: source generation, semantic macros, parametric polymorphism, and so on. Many MOPs allow for the runtime manipulation of object instances or types without requiring recompilation.

* [Probabalistic Programming](http://probabilistic-programming.org/wiki/Home?imm_mid=0e7ab9&cmp=em-prog-na-na-newsltr_20160910)
"Make it easier to to probabilistic inference in custom models." | [Probabalistic Models of Cognition](https://probmods.org/) | ["TOWARDS COMMON-SENSE REASONING VIA CONDITIONAL SIMULATION: LEGACIES OF TURING IN ARTIFICIAL INTELLIGENCE"](https://arxiv.org/pdf/1212.4799v2.pdf)

	Some [slides](https://tminka.github.io/papers/mlss2009/WinnMinka-ProbabilisticProgramming-slides.pdf) on the concept; they mention a Microsoft Research language, Csoft, that does not appear in Google, and reference [InferNET](/libraries/infernet.html) as being close to what Csoft was supposed to offer.

Lists:

- [Quick comparison of ten non-mainstream languages](http://www.h3rald.com/articles/10-programming-languages/): [Haskell](/languages/haskell), [Erlang](/languages/erlang), [Io](/languages/io), [PLT Scheme](/languages/lisp/scheme), [Clojure](/languages/clojure), [Squeak](/languages/smalltalk/squeak), [OCaml](/languages/ocaml), [Factor](/languages/factor), [Lua](/languages/lua), [Scala](/languages/scala)
- [List of multiparadigm languages](http://en.wikipedia.org/wiki/List_of_multi-paradigm_programming_languages)
- [Hostiness: List of languages targeting an existing host platform](http://blog.fogus.me/2012/10/09/hostiness/)
- [Advanced programming languages](http://matt.might.net/articles/best-programming-languages/) -- thoughts on [Haskell](/languages/haskell), [Scala](/languages/jvm/scala), [Scheme](/languages/lisp/scheme), [SML](/languages/ml), [OCaml](/languages/ocaml)
- ["Six programming paradigms that will change how you think about coding"](https://www.ybrikman.com/writing/2014/04/09/six-programming-paradigms-that-will/): Concurrent by default ([ANI](/languages/ani), [Plaid](/languages/plaid)), Dependent types ([Idris](/languages/idris), [Agda](/languages/agda), [Coq](/languages/coq)), Concatenative languages ([Forth](/languages/forth), [cat](/languages/cat), [Joy](/languages/joy)), Declarative languages ([Prolog](/languages/prolog), [SQL](/languages/sql)), Symbolic programming ([Aurora](/languages/aurora)), Knowledge-based programming ([Wolfram](/languages/wolfram))
- ['A Language a Day' Advent Calendar 2019](https://andrewshitov.com/2019/11/25/a-language-a-day-advent-calendar-2019/)

Reading:

- [Syntax across languages](http://rigaux.org/language-study/syntax-across-languages.html): One large page of comprehensive syntax across languages
- [Hyperpolyglot](https://hyperpolyglot.org/): commonly used features in a side-by-side format
- [Concurrency is not Parallelism](https://vimeo.com/49718712)
- ["Dimensional Analysis in Programming Languages: A survey of existing designs/implementations for automatic conversion and verification of units of measurement in computer programs"](https://gmpreussner.com/research/dimensional-analysis-in-programming-languages)
- [CS 7194 - Great works in Programming Languages](https://www.cs.cornell.edu/courses/cs7194/2019sp/): A course on examining the "great works" (written) about programming languages
- [Great Works in Programming Languages](https://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) Collected by Benjamin C. Pierce
- [Flow based Programming](http://jpaulmorrison.com/fbp/) - J Paul Morrison
- [Introduction to Functional Programming](http://www.cl.cam.ac.uk/teaching/Lectures/funprog-jrh-1996/) - J. Harrison
- [Making Sense of Stream Processing](https://assets.confluent.io/m/2a60fabedb2dfbb1/original/20190307-EB-Making_Sense_of_Stream_Processing_Confluent.pdf) - Martin Kleppmann (PDF)
- [Mostly Adequate Guide to Functional Programming](https://mostly-adequate.gitbooks.io/mostly-adequate-guide/content/) - Mostly Adequate Core Team
- [The Pure Function Pipeline Data Flow v3.0 ---- the Grand Unified Programming Theory](https://github.com/linpengcheng/PurefunctionPipelineDataflow) - Lin Pengcheng
- [ProLaLa2022](https://github.com/dsyme/ProLaLa2022): "Archival material for "Programming Languages and the Law" 2022 Keynote" (DSyme); [@dsymetweets](https://twitter.com/dsymetweets/status/1482835211582906374): "Before I ever programmed in a functional language, while still a student, I worked as a C and Prolog programmer on a set of tools called STATUTE for modelling and automating adminstrative law. STATUTE eventually became Oracle Policy Modelling now Oracle Intelligent Advisor today / STATUTE made key design decisions about using limited natural language to achieve "practical isomorphism" between legislation/policy structure and the rules that form the implementation as a program. / This decision - made in a garage in Australia in 1989 by David Mead - cut programmers out of the loop, creating a form of end-user programming for those trained in law and policy. / This decision - made in a garage in Australia in 1989 by David Mead - cut programmers out of the loop, creating a form of end-user programming for those trained in law and policy. / If you feel like you're a PL guru and you've "seen it all" in how programming+logic can be delivered as a usable tool, I'd encourage you to watch Davin's demo from [the keynote](https://youtu.be/bLob9Ah1004). Conceptually it opens up a different kind of tooling for domains dominated by language and policy."


### [Memory management](/reading/garbage-collection)
Languages often break down to automatically-managed memory vs. manually-managed, but most of the time that means heap management; static and stack allocation are (almost?) always automatically managed by virtue of their allocation schemes.

### Language execution types

* **Compiled**: Source is ahead-of-time transformed into a binary output ready for "direct" execution--it can be loaded and run without additional help. (Note that normally this means that it's an executable file on an operating system, but certain factors could change this up. For example, a Mach-O binary can be directly executed on macOS, but on Windows it would require an adapter or VM; likewise, a JVM class file requires a VM normally, but on a JVM-based OS it would be a native executable.) Most compilers do some form of validity-checking, usually making use of type-checking, to ensure the program will run correctly.

* **Transpiled**: Source is ahead-of-time transformed into another source format. Term became popular with languages that transpiled into ECMAScript, but technically this has been around since long before then. (When I was taking ECS 140A at UCDavis in 1991, we had an assignment to write a language that transpiled into C, for example.) [C](../c) has long been the preferred target of transpilers before ECMAScript, given its original goal of being a "higher-level assembly language".

* **Interpreted**: Generally this means that source is not pre-examined until the moment it is asked to run. At that point, validity-checking is done, whether "just" syntactical verification or an additional deeper type-based analysis.

* **Bytecode**: This is usually a binary output format that is some level of abstraction higher than native CPU assembly language, but not much more. The intent is to provide an easier format for either direct execution or transformation into native assembly (Just-In-Time compilation) within a virtual machine. Some bytecode formats are well-documented and "external" (like the JVM and CLR formats). In many cases, however, an interpreter is actually doing an on-the-fly compilation of source to an internal bytecode format at runtime, since most bytecode formats are easier to JIT, and/or the bytecode provides a layer of abstraction from the language syntax to the underlying runtime.

### [Types](/reading/languages/types)

### Runtime Introspection and Modification

Types can often be inspected at runtime regardless of the type-safe or type-checked nature of the language/platform; in many languages/platforms, the process of inspection is known as "reflection".

If the types can be manipulated/changed at runtime, then the language is often said to be a "MetaObject Protocol" language, meaning that it can operate at a "meta-object" level. These tend to be dynamically-type-checked/weakly-type-safe interpreted languages, since it is hard to enforce type-safety when types changing up at runtime.

## Comparisons
["Bits of History, Words of Advice"](http://gbracha.blogspot.com/2020/05/bits-of-history-words-of-advice.html): The creator of [Newspeak](/languages/smalltalk/newspeak) and one of the core developers working on [Java](/languages/jvm/java) and the [JVM](/platforms/jvm) offers some advice about Smalltalk's lack of success in the mainstream.

## Implementation

- [Writing your own toy language](https://gnuu.org/2009/09/18/writing-your-own-toy-compiler/) using flex, bison, LLVM; [code](https://github.com/lsegal/my_toy_compiler)
- [How to Create a Programming Language Using ANTLR4](https://progur.com/2016/09/how-to-create-language-using-antlr4.html)
- [DSL Engineering: Designing, Implementing and Using Domain-Specific Languages](http://dslbook.org) - Markus Voelter
- ["Three Things I Wish I Knew When I Started Designing Languages"](https://www.youtube.com/watch?v=oa0qq75i9oc)
- [Type Theory and Functional Programming](https://www.cs.kent.ac.uk/people/staff/sjt/TTFP/)

[More compilers reading](/reading/languages/compilers)

Lots of these languages run on top of [virtual machines](/vms), and so will obey semantics defined there.

[Crash Course on Notation in Programming Language Theory](http://siek.blogspot.com/2012/07/crash-course-on-notation-in-programming.html), Jeremy G. Siek; LambdaConf 2018 [Part 1](https://www.youtube.com/watch?v=vU3caZPtT2I), [Part 2](https://www.youtube.com/watch?v=MhuK_aepu1Y) [Slides](https://www.dropbox.com/s/joaq7m9v75blrw5/pl-notation-lambdaconf-2018.pdf?dl=1)

* **Type systems and type safety**

	* [Luca Cardelli: Type Systems](http://lucacardelli.name/Papers/TypeSystems.pdf)

	* [Type Safety in Three Easy Lemmas](https://siek.blogspot.com/2013/05/type-safety-in-three-easy-lemmas.html)

	* [Type Systems - Neel Krishnaswami](https://www.cl.cam.ac.uk/teaching/1819/Types/materials.html) ([Handout](https://www.cl.cam.ac.uk/teaching/1819/Types/handout.pdf))

* **Intermediate Representations**: 

	* [Intermediate Representations in Imperative Compilers: A Survey](http://dx.doi.org/10.1145/2480741.2480743) ([PDF](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.885.5223&rep=rep1&type=pdf)) (by James Stanier, Des Watson; ACM Computing Surveys, Vol. 45, No. 3, Article 26, 2013)

	* [Modern Intermediate Representations (IR)](https://llvm.org/devmtg/2017-06/1-Davis-Chisnall-LLVM-2017.pdf); Introduction to LLVM - David Chisnall (Cambridge University), [HPC Summer School 2017](https://llvm.org/devmtg/2017-06/)

	* [Testing Intermediate Representations for Binary Analysis](https://softsec.kaist.ac.kr/~soomink/paper/ase17main-mainp491-p.pdf) [Github](https://github.com/SoftSec-KAIST/MeanDiff), [Website](https://softsec-kaist.github.io/MeanDiff/)

* **Runtime Semantics**:

	* ["Open, Extensible Object Models"](https://www.piumarta.com/software/cola/objmodel2.pdf): "We show that three object types and five methods are sufficient to bootstrap an extensible object model and messaging semantics that are described entirely in terms of those same objects and messages." ([Source](https://www.piumarta.com/oopsla07/))

---

## Implementation tools

[Lingua.NET](https://archive.codeplex.com/?p=lingua): Discontinued/archived CodePlex parser generator. Archived content copied locally [here](/languages/dotnet/lingua.zip).

---

## Fun

- ["History of Programming Languages"](http://thequickword.wordpress.com/2014/02/16/james-irys-history-of-programming-languages-illustrated-with-pictures-and-large-fonts/) by James Iry. Illustrated--pictures and large fonts.
- ["Say something you dislike about a language you love"](https://lobste.rs/s/2cw6ov/say_something_you_dislike_about_language)
- ["Say something nice about a language you dislike"](https://lobste.rs/s/hib1ui/say_something_nice_about_programming)
