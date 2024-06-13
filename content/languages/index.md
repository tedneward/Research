title=Languages
category=language
type=categorypage
summary=A collection of links about programming languages.
tags=language
~~~~~~
Programming languages are (generally) human-friendly means of getting a computer to do something interesting on a human's behalf. Some languages may be friendlier than others; where opinions will genuinely differ as to which are friendlier, there are some that deliberately seek to be as obtuse and unreadable as possible, and those are usually called "esoteric" programming languages and fit into their own category of madness.

* [Language Places](/places/languages)
* [PLZoo](/places/plzoo)
* [language reading](/reading/languages)
* [language development](/reading/langdev)

### Programming Language collections

* [History of Programming Languages](http://hopl.info) - HOPL: Online Historical Encyclopaedia of Programming Languages.
* [Wikipedia's List of Programming Languages](https://en.wikipedia.org/wiki/List_of_programming_languages).
* [List of GitHub programming languages](https://github.com/collections/programming-languages) - A list of programming languages that are actively developed on GitHub.
* [PL catalog](https://github.com/prathyvsh/pl-catalog) - A catalog of programming languages.
* [Programming languages](https://github.com/learn-anything/programming-languages) - Awesome Programming Languages.
* [Programming Language Design](https://proglangdesign.net/) - Programming Language Design is dedicated to the theory, design and implementation of programming languages.
* [PLE](https://github.com/rtoal/ple): A collection of illustrative examples in close to 100 programming languages, including every code snippet used in the book [Programming Language Explorations](https://rtoal.github.io/ple/).
* A [Programming Language Database](https://pldb.pub/) ([Source](https://github.com/breck7/pldb)) with query capabilities (though it doesn't seem like it works at the moment?)

### Specific Languages Lists

* [Awesome Basic](https://github.com/JohnBlood/awesome-basic) - A curated list of awesome BASIC dialects, IDEs, and tutorials.
* [Awesome Lisp languages](https://github.com/dundalek/awesome-lisp-languages) - A list of Lisp-flavored programming languages.
* [Lua languages](https://github.com/hengestone/lua-languages) - Languages that compile to Lua.
* [Awesome Scheme](https://github.com/schemedoc/awesome-scheme) - A curated list of awesome Scheme libraries and resources.
* [Awesome low level programming languages](https://github.com/robertmuth/awesome-low-level-programming-languages)
* [List of languages that compile to JS](https://github.com/jashkenas/coffeescript/wiki/List-of-languages-that-compile-to-JS) - List of languages that compile to JavaScript and many other transpilers.
* [Lox implementations](https://github.com/munificent/craftinginterpreters/wiki/Lox-implementations) - Lots implementations of Lox language written in many programming languages.
* [Langs written in Rust](https://github.com/alilleybrinker/langs-in-rust) - A list of programming languages implemented in Rust, for inspiration. This is a (probably incomplete) list of languages implemented in Rust. It is intended as a source of inspiration and comparison, and as a directory of potentially interesting projects in this vein.

It may be fair to suggest that any language is a transformation, but there is a special meaning to the term "program transformation" -- see [here](https://www.program-transformation.org/) for more details. [Spoofax](../tools/spoofax.md) is one of these.

---

> "Every configuration file becomes a Turing-complete language eventually." --James Gosling

[Every simple language will eventually end up Turing complete](https://solutionspace.blog/2021/12/04/every-simple-language-will-eventually-end-up-turing-complete/)

## Language concepts

["The 7 ur-languages"](https://madhadron.com/programming/seven_ur_languages.html), captured [here](/content/reading/languages): ALGOL, Lisp, ML, Self, Forth, APL, Prolog

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

* **Assembly/Machine**: Characterized by little-to-no abstraction over the target platform.
* **Imperative** (Steps taken to achieve a certain result. Von Neumann machines.) vs **Declarative** (Statements about what should exist, not how it comes into being)
* **Procedural**: Characterized by imperative execution statements with well-defined entry and exit points.
* [**Object-oriented**](/tags/object.html): Characterized by the union of state and behavior into a first-class concept, either at compile-time, run-time, or both. Ontological/categorical relationships between objects are often (though not always) possible, usually capturing some form of additive reuse, aka "inheritance". Objects are usually broken into two different kinds of object systems, typically depending on whether they are ahead-of-(execution-)time type-checked or not:

	* **"Class"-based object languages**: The more "traditional" OOP systems in which an object is forged out of a template/"cookie-cutter" expression known as a *class*. Typically these languages are compiled and strongly-type-checked, and if runtime inspection facilites (reflection) are available, they will be read-only. Objects obtained as part of the runtime inspection facilities are generally read-only, and often cached/singletonized/memoized.

	* **"Prototype"-based object languages**: Most popularized by [ECMAScript](/languages/ecmascript), prototype-based object languages have long existed, going as far back as CLOS, Self, Smalltalk, and others. Here, inheritance is a runtime relationship understood by the runtime (an object is cloned from a prototype "class" object, and as part of that cloning process a well-known pointer/reference is established back to the "class" object for "class"-level properties/methods), and is often malleable. Most prototype-object languages are dynamically-typed and often weakly-typechecked, since the runtime doesn't have *a priori* knowledge of how the various relationships are set up after the program has begun execution.

	Note that any language which supports [records](http://research.tedneward.com/languages/paradigms-for-dummies) (4.1) and [lexical function closures](http://research.tedneward.com/languages/paradigms-for-dummies) (4.2) can build objects "by hand", and even support inheritance by defining a runtime convention of a particularly-named-slot in a record to hold a reference to a prototype object. Given that functional languages often support both, this often leads to (a) functional-object hybrid languages with varying degrees of support for both, or (b) functional language zealots to insist that objects are unnecessary.

	Most object languages are imperative when defining methods, though this is not a requirement.

* [**Functional**](/tags/functional.html): Characterized by mathematics-inspired functions as first-class concepts. Preference for expressions over statements, lazy execution, immutable values, and so on. | [Wikipedia](https://en.wikipedia.org/wiki/Functional_programming) | Some [reading](/reading/functional.html) | Functional programming brought us [monads](/reading/monads) and all the fun that goes with that. Frequently cites/builds off of the [lambda calculus](http://en.wikipedia.org/wiki/Lambda_calculus).
* [**Metaprogramming**](/tags/metaobject.html) (aka [MetaObject Protocol](/reading/languages/metaobjectprotocol)): Characterized by the idea that we can elevate "above" the object concept, in a variety of different ways: source generation, semantic macros, parametric polymorphism, and so on. Many MOPs allow for the runtime manipulation of object instances or types without requiring recompilation. This is not quite the same as dynamic languages that allow us to build objects out of data and functions-as-values, but it's not too far away, either.
* [**Probabalistic**](http://probabilistic-programming.org/wiki/Home?imm_mid=0e7ab9&cmp=em-prog-na-na-newsltr_20160910)
"Make it easier to to probabilistic inference in custom models." | [Probabalistic Models of Cognition](https://probmods.org/) | ["TOWARDS COMMON-SENSE REASONING VIA CONDITIONAL SIMULATION: LEGACIES OF TURING IN ARTIFICIAL INTELLIGENCE"](https://arxiv.org/pdf/1212.4799v2.pdf)
	Some [slides](https://tminka.github.io/papers/mlss2009/WinnMinka-ProbabilisticProgramming-slides.pdf) on the concept; they mention a Microsoft Research language, Csoft, that does not appear in Google, and reference [InferNET](/libraries/infernet.html) as being close to what Csoft was supposed to offer.

"Programming Language Explorations" suggested tags: declarative, imperative, applicative, functional, logic, von Neumann, object-oriented, expression-oriented, persistent, concurrent, reactive, dataflow, stack, free-form, curly brace, visual, compiled, interpreted, very high-level, system, scripting, glue, intermediate, esoteric, toy, educational, domain-specific

* JavaScript: imperative, functional, dynamic, prototypal
* CoffeeScript: functional, expression-oriented, dynamic
* Lua: Imperative, prototypal, scripting
* Python: imperative, glue, dynamic, scripting

### [Memory management](/reading/software/memory-management.html)
Languages often break down to automatically-managed memory vs. manually-managed, but most of the time that means heap management; static and stack allocation are (almost?) always automatically managed by virtue of their allocation schemes.

### Language execution types

* **Compiled**: Source is ahead-of-time transformed into a binary output ready for "direct" execution--it can be loaded and run without additional help. Most compilers do some form of validity-checking, usually making use of type-checking, to ensure the program will run correctly. Several "flavors" of compiled targets fall into different categories: 

	* **Native**: Source is compiled into binary format ready for direct execution by an operating system.

	* **Transpiled**: Source is ahead-of-time transformed into another source format. Term became popular with languages that transpiled into ECMAScript, but technically this has been around since long before then. (When I was taking ECS 140A at UCDavis in 1991, we had an assignment to write a language that transpiled into C, for example.) [C](../c) has long been the preferred target of transpilers before ECMAScript, given its original goal of being a "higher-level assembly language". [C--](../cminusminus) is a variant of C made specifically for transpilation/compilation purposes.

	* **Bytecode**: This is usually a binary output format that is some level of abstraction higher than native CPU assembly language, but not much more. The intent is to provide an easier format for either direct execution or transformation into native assembly (Just-In-Time compilation) within a virtual machine. Some bytecode formats are well-documented and "external" (like the JVM and CLR formats). In many cases, however, an interpreter is actually doing an on-the-fly compilation of source to an internal bytecode format at runtime, since most bytecode formats are easier to JIT, and/or the bytecode provides a layer of abstraction from the language syntax to the underlying runtime.

* **Interpreted**: Generally this means that source is not pre-examined until the moment it is asked to run. At that point, validity-checking is done, whether "just" syntactical verification or an additional deeper type-based analysis.

Note that the lines are significantly blurring; several "interpreted" languages internally compile the source into an AST or bytecode format for faster execution, and several "compiled" languages are available to run at the command-line a la shell scripts or REPLs by internally taking source through their compilation pipeline and executing the result.

In the long run, the key differentiator around "compiled vs interpreted" may be solely whether the tool/language does ahead-of-time error-checking.

### [Types](/reading/langdev/types-and-type-systems.html)

A type system (a system in which one can define and/or declare types) is the mechanism by which the language detects errors either ahead of time (during compilation) or at runtime.

### Runtime Introspection and Modification

Types can often be inspected at runtime regardless of the type-safe or type-checked nature of the language/platform; in many languages/platforms, the process of inspection is known as "reflection".

If the types can be manipulated/changed at runtime, then the language is often said to be a "[MetaObject Protocol](/reading/languages/metaobjectprotocol)" language, meaning that it can operate at a "meta-object" level. These tend to be dynamically-type-checked/weakly-type-safe interpreted languages, since it is hard to enforce type-safety when types changing up at runtime.

## Fun

- ["History of Programming Languages"](http://thequickword.wordpress.com/2014/02/16/james-irys-history-of-programming-languages-illustrated-with-pictures-and-large-fonts/) by James Iry. Illustrated--pictures and large fonts.
- ["Say something you dislike about a language you love"](https://lobste.rs/s/2cw6ov/say_something_you_dislike_about_language)
- ["Say something nice about a language you dislike"](https://lobste.rs/s/hib1ui/say_something_nice_about_programming)

---

- [Shen/C](https://github.com/otabat/shen-c) - C port of the Shen programming language.
- [Shen/Go](https://github.com/tiancaiamao/shen-go) - Go port of the Shen language.
