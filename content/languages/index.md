title=Languages
category=language
type=categorypage
summary=A collection of links about programming languages.
tags=language
~~~~~~

Programming languages are (generally) human-friendly means of getting a computer to do something interesting on a human's behalf. Some languages may be friendlier than others; where opinions will genuinely differ as to which are friendlier, there are some that deliberately seek to be as obtuse and unreadable as possible, and those are usually called "esoteric" programming languages and fit into their own category of madness.

[CS 7194 - Great works in Programming Languages](https://www.cs.cornell.edu/courses/cs7194/2019sp/): A course on examining the "great works" (written) about programming languages

[Great Works in Programming Languages](https://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) Collected by Benjamin C. Pierce

See also [Language Places](/places/languages) and [PLZoo](/places/plzoo)


## Language concepts

(Some of this derives from [here](https://thecodeboss.dev/2015/11/programming-concepts-static-vs-dynamic-type-checking/) and [here](https://thecodeboss.dev/2016/02/programming-concepts-type-introspection-and-reflection/) and [here](https://thecodeboss.dev/2015/07/programming-concepts-compiled-and-interpreted-languages/), and others from that series, although there *are some incorrect statements in those articles*, IMHO.)

### Syntax/paradigms
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

* [Object-oriented](/tags/object): Characterized by the union of state and behavior into a first-class concept, either at compile-time, run-time, or both.

* [Functional](/tags/functional): Characterized by mathematics-inspired functions as first-class concepts. Preference for expressions over statements, lazy execution, immutable values, and so on. | [Wikipedia](https://en.wikipedia.org/wiki/Functional_programming) | Some [reading](/reading/functional) | Functional programming brought us [monads](/reading/monads) and all the fun that goes with that. Frequently cites/builds off of the [lambda calculus](http://en.wikipedia.org/wiki/Lambda_calculus).

* [Metaprogramming](/tags/metaobject) (aka MetaObject Protocol): Characterized by the idea that we can elevate "above" the object concept, in a variety of different ways: source generation, semantic macros, parametric polymorphism, and so on. Many MOPs allow for the runtime manipulation of object instances or types without requiring recompilation.

* [Probabalistic Programming](http://probabilistic-programming.org/wiki/Home?imm_mid=0e7ab9&cmp=em-prog-na-na-newsltr_20160910)
"Make it easier to to probabilistic inference in custom models." | [Probabalistic Models of Cognition](https://probmods.org/) | ["TOWARDS COMMON-SENSE REASONING VIA CONDITIONAL SIMULATION: LEGACIES OF TURING IN ARTIFICIAL INTELLIGENCE"](https://arxiv.org/pdf/1212.4799v2.pdf)

	Some [slides](https://tminka.github.io/papers/mlss2009/WinnMinka-ProbabilisticProgramming-slides.pdf) on the concept; they mention a Microsoft Research language, Csoft, that does not appear in Google, and reference [InferNET](/libraries/infernet.html) as being close to what Csoft was supposed to offer.

### Memory management

Reading: [*Garbage Collection Handbook*](https://gchandbook.org/), [*Garbage Collection*](https://www.cs.kent.ac.uk/people/staff/rej/gcbook/)

* **Static**: The compiler, at the time of compilation (or the program's startup, either approach can work) has knowledge of the desired allocations, and creates space for them out of somewhere in the process' available space. These locations are fixed throughout the lifetime of the program, and cannot be expanded or shrunk--they are literally static throughout the entirety of the application's life. This is how C/C++ handle `static`-modified variable declarations, for example. Most C/C++ globals fall into this category.

* **Stack**: The stack is a region of RAM that gets created on every thread that your application is running on. It works in a LIFO (Last In, First Out) manner, meaning that as soon as you allocate – or “push” – memory on to the stack, that chunk of memory will be the first to be deallocated – or “popped.” Every time a function declares a new variable, it is “pushed” onto the stack, and after that variable falls out of scope (such as when the function closes), that variable will be deallocated from the stack automatically. Once a stack variable is freed, that region of memory becomes available for other stack variables.

	Due to the pushing and popping nature of the stack, memory management is very logical and is able to be handled completely by the CPU; this makes it very quick, especially since each byte in the stack tends to be reused very frequently which means it tends to be mapped to the processor’s cache. However, there are some cons to this form of strict management. The size of the stack is a fixed value, and allocating more onto the stack than it can hold will result in a stack overflow. The size of the stack is decided when the thread is created, and each variable has a maximum size that it can occupy based on its data type; this prevents certain variables such as integers from ever growing beyond a certain value, and forces more complex data types such as arrays to specify their size prior to runtime since the stack won’t let them be resized. Variables allocated on the stack also are always local in nature because they are always next in line to be popped (unless more variables are pushed prior to the popping of earlier variables).

* **Heap**: The heap is a memory set aside for runtime/dynamic memory allocation. Allocation is handled at runtime, and therefore is up to the program to determine structure, means, etc. Once you allocate space, that space can be accessed at any point in time not only throughout just the thread, but throughout the application’s entire life. Deallocation must occur at some point, if the space is to be reused. Most operating systems will, once an application ends, reclaim that space. (Usually by tearing down the process entirely--we're long past the days where programs are obtaining exclusive access to physical addresses.)

	Interaction with the heap is usually through some form of reference; in languages that support direct access, these are ‘pointers,’ which are variables whose values are the address of another variable, such as a memory location. By creating a pointer, you ‘point’ at a memory location on the heap, which is what signifies the initial location of your variable and tells the program where to access the value. Due to the dynamic nature of the heap, it is completely unmanaged by the CPU aside from initial allocation and heap resizing; in non-garbage collected languages such as C and C++, this requires you as the developer to manage memory and to manually free memory locations when they are no longer needed. Failing to do so can create memory leaks and cause memory to become fragmented, which will cause reads from the heap to take longer and makes it difficult to continuously allocate more memory onto the heap.

* **Automated** (aka garbage collection):

	* Allocate without reclamation:

	* Smart pointers:

	* Reference counting:

	* Mark-Sweep:

	* Mark-Sweep-Compact:

	* Copying:

	* Generational:

	Reading: [Memory Management Reference (site)](https://www.memorymanagement.org/), [CS 4120/5120 Lecture notes](https://www.cs.cornell.edu/courses/cs4120/2018sp/lectures/39gc/lec39-sp18.pdf) (Andrew Myers), [Plumbr Handbook Java GC](https://plumbr.io/java-garbage-collection-handbook), [Python GC](https://stackify.com/python-garbage-collection/), [CPython GC](https://devguide.python.org/garbage_collector/), [Memory Mgmt and GC in Python](https://towardsdatascience.com/memory-management-and-garbage-collection-in-python-c1cb51d1612c)

### Language execution types

* **Compiled**: Source is ahead-of-time transformed into a binary output ready for "direct" execution--it can be loaded and run without additional help. (Note that normally this means that it's an executable file on an operating system, but certain factors could change this up. For example, a Mach-O binary can be directly executed on macOS, but on Windows it would require an adapter or VM; likewise, a JVM class file requires a VM normally, but on a JVM-based OS it would be a native executable.) Most compilers do some form of validity-checking, usually making use of type-checking, to ensure the program will run correctly.

* **Transpiled**: Source is ahead-of-time transformed into another source format. Term became popular with languages that transpiled into ECMAScript, but technically this has been around since long before then. (When I was taking ECS 140A at UCDavis in 1991, we had an assignment to write a language that transpiled into C, for example.) [C](../c) has long been the preferred target of transpilers before ECMAScript, given its original goal of being a "higher-level assembly language".

* **Interpreted**: Generally this means that source is not pre-examined until the moment it is asked to run. At that point, validity-checking is done, whether "just" syntactical verification or an additional deeper type-based analysis.

* **Bytecode**: This is usually a binary output format that is some level of abstraction higher than native CPU assembly language, but not much more. The intent is to provide an easier format for either direct execution or transformation into native assembly (Just-In-Time compilation) within a virtual machine. Some bytecode formats are well-documented and "external" (like the JVM and CLR formats). In many cases, however, an interpreter is actually doing an on-the-fly compilation of source to an internal bytecode format at runtime, since most bytecode formats are easier to JIT, and/or the bytecode provides a layer of abstraction from the language syntax to the underlying runtime.

### Types

A [type](https://en.wikipedia.org/wiki/Type_system), also known as a data type, is a classification identifying one of various types of "things" used within a programming language or platform. More prosaically, a type describes the possible values of a "thing" (such as a variable), the semantic meaning of that "thing", and how the values of that "thing" can be stored in memory. 

A type system is a collection of rules that assign a property called type to various constructs in a computer program, such as variables, expressions, functions or modules, with the end goal of reducing the number of bugs by verifying that data is represented properly throughout a program. 

Most types break out into the following categories:

* **Primitives**: the atoms of the programming language; usually things like integers, strings, booleans, and so on. The internal representation of a primitive is usually entirely opaque to the programmer without significant effort (like taking memory addresses and poking around). 
	* **Booleans**: true/false values
	* **Integrals**: non-fractional/whole numbers, often using the first bit to indicate sign (positive or negative). Using twos-complement math, this gives a fairly large range of integral numbers, depending on how many bytes are used for the integral:
		* 1-byte/8-bit: 
	* **Floating-points**: fractional numbers, usually represented in [IEEE 754](https://ieeexplore.ieee.org/document/8766229) ([Wikipedia](https://en.wikipedia.org/wiki/IEEE_754)) format.
	* **Pointers**: One common primitive type is a pointer to a memory location (whether directly manipulable by the programmer or not); Java, for example, talks about `Object o = new Object();` as allocating an object `o`, but in truth `o` is a reference to the object created, not the object itself. The reference `o` is allocated on the stack, whereas the object `o` points to is allocated out of the heap.

* **Composite**: these are the various "structures" that a programmer can build up out of primitives. Some are built within the language (arrays within C/C++/Java/C#, etc), some are built using language constructs (`class` or `struct` within C++/Java/C#/etc). I tend to break these into "simple composite types" (composites provided by the language itself) and "complex composite types" (composites defined by the developer), also sometimes known as "user-defined types" (UDTs).

* **Abstract data types**: these are types that do not have specific implementation, and could thus be represented by multiple concrete types. ADTs are usually defined by `interface`s in Java/C#, but one does not need an interface keyword to have an ADT.

### [Type-checking](https://en.wikipedia.org/wiki/Type_system#Type_checking)

[What to know before debating type systems](https://cdsmith.wordpress.com/2011/01/09/an-old-article-i-wrote/)

* [Static](/tags/static):

* [Dynamic](/tags/dynamic):

Note that while these terms usually are applied most directly to programming languages, there's a strong case to be made that they apply to other areas of programming, too, like storage. A relational database, for example, could be said to be a strongly-type-safe (because it insists on only integers in INTEGER columns) and statically-type-checked (since it parses SQL and does type-checking).

### Type-safety

* Strongly:

* Weakly:

Note that while these terms usually are applied most directly to programming languages, there's a strong case to be made that they apply to other areas of programming, too, like storage. A relational database, for example, could be said to be a strongly-type-safe (because it insists on only integers in INTEGER columns) and statically-type-checked (since it parses SQL and does type-checking).


## Comparisons
[Syntax across languages](http://rigaux.org/language-study/syntax-across-languages.html): One large page of comprehensive syntax across languages | [Quick comparison of ten non-mainstream languages](http://www.h3rald.com/articles/10-programming-languages/) | [List of multiparadigm languages](http://en.wikipedia.org/wiki/List_of_multi-paradigm_programming_languages) | [Hostiness: List of languages targeting an existing host platform](http://blog.fogus.me/2012/10/09/hostiness/) | [Advanced programming languages](http://matt.might.net/articles/best-programming-languages/) -- thoughts on [Haskell](../haskell), Scala, [Scheme](../lisp/scheme), SML, [OCaml](../ocaml) | ["Six programming paradigms that will change how you think about coding"](https://www.ybrikman.com/writing/2014/04/09/six-programming-paradigms-that-will/) | ['A Language a Day'](https://andrewshitov.com/2019/11/25/a-language-a-day-advent-calendar-2019/) | ["Dimensional Analysis in Programming Languages: A survey of existing designs/implementations for automatic conversion and verification of units of measurement in computer programs"](https://gmpreussner.com/research/dimensional-analysis-in-programming-languages)

["Bits of History, Words of Advice"](http://gbracha.blogspot.com/2020/05/bits-of-history-words-of-advice.html): The creator of [Newspeak](../smalltalk/newspeak) and one of the core developers working on [Java](../jvm/java) and the [JVM](/platforms/jvm) offers some advice about Smalltalk's lack of success in the mainstream.

## Implementation

[Crash Course on Notation in Programming Language Theory](http://siek.blogspot.com/2012/07/crash-course-on-notation-in-programming.html), Jeremy G. Siek; LambdaConf 2018 [Part 1](https://www.youtube.com/watch?v=vU3caZPtT2I), [Part 2](https://www.youtube.com/watch?v=MhuK_aepu1Y) [Slides](https://www.dropbox.com/s/joaq7m9v75blrw5/pl-notation-lambdaconf-2018.pdf?dl=1)

[Brown CS: CSCI 1730: Programming Languages](http://cs.brown.edu/courses/csci1730/2012/) [Videos](http://cs.brown.edu/courses/cs173/2012/Videos/)

[OPLSS (Oregon Programming Languages Summer School)](https://cs.uoregon.edu/research/summerschool/)
	- 2019-2017, 2003: https://www.youtube.com/channel/UCDe6N9R7U-RYWA57wzJQ2SQ/playlists
	- 2016-2015: https://www.youtube.com/channel/UCsON_8vogp4nCQFTnfu43kA/playlists
	- free video lectures available, including the introductory ones based on Practical Foundations for Programming Languages: http://www.cs.cmu.edu/~rwh/pfpl/

[Programming Language Implementation Summer School (PLISS)](https://pliss2019.github.io/talks.html) [YouTube](https://www.youtube.com/channel/UCofC5zis7rPvXxWQRDnrTqA/playlists)

[*Programming Languages: Application and Interpretation*](http://cs.brown.edu/~sk/Publications/Books/ProgLangs/) by Shriram Krishnamurthi

[Principles of Programming Languages](https://felleisen.org/matthias/4400-s20/lectures.html)

* **Type systems and type safety**

	* [Luca Cardelli: Type Systems](http://lucacardelli.name/Papers/TypeSystems.pdf)

	* [Type Safety in Three Easy Lemmas](https://siek.blogspot.com/2013/05/type-safety-in-three-easy-lemmas.html)

	* [On the Relationship Between Static Analysis and Type Theory](https://semantic-domain.blogspot.com/2019/08/on-relationship-between-static-analysis.html)

	* [Soundness and completeness: with precision](https://bertrandmeyer.com/2019/04/21/soundness-completeness-precision/)

	* [What is soundness (in static analysis)?](http://www.pl-enthusiast.net/2017/10/23/what-is-soundness-in-static-analysis/)

	* [Type Systems - Neel Krishnaswami](https://www.cl.cam.ac.uk/teaching/1819/Types/materials.html) ([Handout](https://www.cl.cam.ac.uk/teaching/1819/Types/handout.pdf))

	* [What Type Soundness Theorem Do You Really Want to Prove?](https://blog.sigplan.org/2019/10/17/what-type-soundness-theorem-do-you-really-want-to-prove/) ([YouTube](https://www.youtube.com/watch?v=8Xyk_dGcAwk))
		- Milner Award Lecture: The Type Soundness Theorem That You Really Want to Prove (and now you can), POPL 2018; Derek Dreyer

	* Type Theory Behind Glasgow Haskell Compiler Internals
		- LambdaConf 2018; Vitaly Bragilevsky
		- https://www.youtube.com/playlist?list=PLvPsfYrGz3wspkm6LVEjndvQqK6SkcXaT
		- https://github.com/bravit/tt-ghc-exercises/
		- https://github.com/lambdaconf/lambdaconf-2018/tree/master/LC18-slides

* **Intermediate Representations**: 

	* [Intermediate Representations in Imperative Compilers: A Survey](http://dx.doi.org/10.1145/2480741.2480743) ([PDF](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.885.5223&rep=rep1&type=pdf)) (by James Stanier, Des Watson; ACM Computing Surveys, Vol. 45, No. 3, Article 26, 2013)

	* [Modern Intermediate Representations (IR)](https://llvm.org/devmtg/2017-06/1-Davis-Chisnall-LLVM-2017.pdf); Introduction to LLVM - David Chisnall (Cambridge University), [HPC Summer School 2017](https://llvm.org/devmtg/2017-06/)

	* [Testing Intermediate Representations for Binary Analysis](https://softsec.kaist.ac.kr/~soomink/paper/ase17main-mainp491-p.pdf) [Github](https://github.com/SoftSec-KAIST/MeanDiff), [Website](https://softsec-kaist.github.io/MeanDiff/)


* **Escape analysis**: Escape analysis is an optimization for identifying objects which do not escape the dynamic extent of a function; such objects can be stack-allocated, or 'flattened' so that usages of them are replaced with a series of local variables (the latter optimization is known as "scalar replacement").

	An overview of the escape analysis algorithm used in Factor's Optimizing compiler:

	http://factor-language.blogspot.com/2008/08/algorithm-for-escape-analysis.html
	http://en.wikipedia.org/wiki/Escape_analysis

* **Register allocation**

    * Linear scan: The linear scan algorithm sacrifices code quality for compilation speed; it only needs to make one or two passes over the intermediate representation to assign registers, and therefore runs in O(n) time; therefore it is much faster than graph coloring, which runs in O(n2) time.

        * Linear Scan Register Allocation, Massimiliano Poletto and Vivek Sarkar, http://www.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf

        * Linear Scan Register Allocation for the Java HotSpot Client Compiler, by Christian Wimmer, http://www.ssw.uni-linz.ac.at/Research/Papers/Wimmer04Master/

        * Quality and Speed in Linear-scan Register Allocation, by Omri Traub, Glenn Holloway, Michael D. Smith, http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.8435

	* Graph coloring

    	* Graph coloring is traditionally implemented by building an interference graph, attempting to color it, and if coloring fails, spilling some values and building the interference graph again. Building the graph is pretty expensive; if your program is in SSA form, it turns out you can perform spilling, build the graph and color it all in one shot. Register allocation for programs in SSA form using chordal graph coloring, Sebastian Hack, http://digbib.ubka.uni-karlsruhe.de/volltexte/documents/6532

* Static Single Assignment (SSA):

	* [SSA book](http://ssabook.gforge.inria.fr/latest/)



* http://jschuster.org/blog/2016/11/29/getting-started-in-programming-languages/

* [SIGPLAN Awards](http://www.sigplan.org/Awards/)

* [10PL: 10 papers that all PhD students in programming languages ought to know, for some value of 10](https://github.com/nuprl/10PL) from Northeastern University Programming Research Lab 

* [Best of PLDI 2004](https://dblp.uni-trier.de/db/conf/pldi/pldi2004best.html)

* [Classic Papers in Programming Languages and Logic](https://www.cs.cmu.edu/~crary/819-f09/) by Karl Crary


*  [learn-programming-languages](https://github.com/jeanqasaur/learn-programming-languages)
	- Resources for the working programmer to learn more about the fundamentals and theory of programming languages.
	- Jean Yang

[Lingua.NET](https://archive.codeplex.com/?p=lingua): Discontinued/archived CodePlex parser generator. Archived content copied locally [here](../dotnet/lingua.zip).

## Fun
["History of Programming Languages"](http://thequickword.wordpress.com/2014/02/16/james-irys-history-of-programming-languages-illustrated-with-pictures-and-large-fonts/) by James Iry. Illustrated--pictures and large fonts. | ["Say something you dislike about a language you love"](https://lobste.rs/s/2cw6ov/say_something_you_dislike_about_language) | ["Say something nice about a language you dislike"](https://lobste.rs/s/hib1ui/say_something_nice_about_programming)
