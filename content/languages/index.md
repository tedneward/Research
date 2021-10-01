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
- [Concurrency is not Parallelism](https://vimeo.com/49718712)
- ["Dimensional Analysis in Programming Languages: A survey of existing designs/implementations for automatic conversion and verification of units of measurement in computer programs"](https://gmpreussner.com/research/dimensional-analysis-in-programming-languages)

### Memory management

Reading: [*Garbage Collection Handbook*](https://gchandbook.org/), [*Garbage Collection*](https://www.cs.kent.ac.uk/people/staff/rej/gcbook/)

* **Static**: The compiler, at the time of compilation (or the program's startup, either approach can work) has knowledge of the desired allocations, and creates space for them out of somewhere in the process' available space. These locations are fixed throughout the lifetime of the program, and cannot be expanded or shrunk--they are literally static throughout the entirety of the application's life. This is how C/C++ handle `static`-modified variable declarations, for example. Most C/C++ globals fall into this category.

* **Stack**: The stack is a region of RAM that gets created on every thread that your application is running on. It works in a LIFO (Last In, First Out) manner, meaning that as soon as you allocate – or “push” – memory on to the stack, that chunk of memory will be the first to be deallocated – or “popped.” Every time a function declares a new variable, it is “pushed” onto the stack, and after that variable falls out of scope (such as when the function closes), that variable will be deallocated from the stack automatically. Once a stack variable is freed, that region of memory becomes available for other stack variables.

	Due to the pushing and popping nature of the stack, memory management is very logical and is able to be handled completely by the CPU; this makes it very quick, especially since each byte in the stack tends to be reused very frequently which means it tends to be mapped to the processor’s cache. However, there are some cons to this form of strict management. The size of the stack is a fixed value, and allocating more onto the stack than it can hold will result in a stack overflow. The size of the stack is decided when the thread is created, and each variable has a maximum size that it can occupy based on its data type; this prevents certain variables such as integers from ever growing beyond a certain value, and forces more complex data types such as arrays to specify their size prior to runtime since the stack won’t let them be resized. Variables allocated on the stack also are always local in nature because they are always next in line to be popped (unless more variables are pushed prior to the popping of earlier variables).

* **Heap**: The heap is a memory set aside for runtime/dynamic memory allocation. Allocation is handled at runtime, and therefore is up to the program to determine structure, means, etc. Once you allocate space, that space can be accessed at any point in time not only throughout just the thread, but throughout the application’s entire life. Deallocation must occur at some point, if the space is to be reused. Most operating systems will, once an application ends, reclaim that space. (Usually by tearing down the process entirely--we're long past the days where programs are obtaining exclusive access to physical addresses.)

	Interaction with the heap is usually through some form of reference; in languages that support direct access, these are ‘pointers,’ which are variables whose values are the address of another variable, such as a memory location. By creating a pointer, you ‘point’ at a memory location on the heap, which is what signifies the initial location of your variable and tells the program where to access the value. Due to the dynamic nature of the heap, it is completely unmanaged by the CPU aside from initial allocation and heap resizing; in non-garbage collected languages such as C and C++, this requires you as the developer to manage memory and to manually free memory locations when they are no longer needed. Failing to do so can create memory leaks and cause memory to become fragmented, which will cause reads from the heap to take longer and makes it difficult to continuously allocate more memory onto the heap.

* **Automated** (aka garbage collection):

	* **Allocate without reclamation**: Technically, this is a legal automatic memory management technique, though obviously it is optimized more for performance of allocation and reclamation (i.e., zero time spent reclamation) than longevity.

	* **Reference counting**: Each allocated object has a count associated with it indicating how many references are currently pointing to it. When the reference count drops to zero, the object is eligible for reclamation. Reference counts can either be managed automatically (as in, the language/runtime manage it without programmer intervention required) or manually (programmers must ensure they call some kind of `release` method or function to indicate a finished state of use). Reference counting is highly vulnerable to mutually-referencing objects (cyclic object graphs) as a source of memory leaks.

	* **Smart pointers**: Most smart pointers are small "wrappers" around native pointers, carrying a reference count that tries to be as automatic as possible. Most popular in C++ implementations, though some languages (Rust) look to incorporate smart-pointer-type semantics directly into the language.

	* **Reachability**: When moving beyond pointer/reference-based schemes, most automated memory systems need to know which objects are eligible for reclamation, and which aren't--in essence, which are still under the possibility of being used by code. (An automatic memory system should ***never*** deallocate an object that is in use.) This analysis is usually known as "reachability" analysis, that is, finding which objects are "reachable" by user code, and therefore unsafe to reclaim. Many systems have multiple possibilities of reachability: 
		* reachable (in use)
		* softly reachable: Softly-reachable objects are eligible for reclamation, but are not reclaimed except and until memory pressure is too great (in other words, the runtime will fail if space is not found). Useful for caching behavior.
		* weakly reachable: An object is weakly reachable when the garbage collector finds no strong or soft references, but at least one path to the object with a weak reference. Weakly reachable objects are finalized some time after their weak references have been cleared. The only real difference between a soft reference and a weak reference is that the garbage collector uses algorithms to decide whether or not to reclaim a softly reachable object, but always reclaims a weakly reachable object. Weak references work well in applications that need to, for example, associate extra data with an unchangeable object, such as a thread the application did not create. Systems with weak references usually have some form of notification system when the referent is cleared, such as Java's `ReferenceQueue` mechanic. If you make a weak reference to the thread with a reference queue, your program can be notified when the thread is no longer strongly reachable. Upon receiving this notification, the program can perform any required cleanup of the associated data object. This makes them useful for object-pooling kinds of behavior.
		* "f-reachable": an object queued by the runtime for reclamation but still requires its finalizer to run; thus it is reachable only by the finalizer thread/mechanism within the runtime.
		* phantom-reachable: An object is phantomly reachable when the garbage collector finds no strong, soft, or weak references, but at least one path to the object with a phantom reference. Phantomly reachable objects are objects that have been finalized, but not reclaimed. These are the hardest to use, but offer a mechanism by which to do cleanup after a finalizer has been executed, essentially providing another way to do resource cleanup.
		* unreachable (not in use)

		Reading: [Monica Pawlan's original article](http://pawlan.com/monica/articles/refobjs/) | [Java reference types](https://www.kdgregory.com/index.php?page=java.refobj)

	* **Mark-Sweep**: 

	* **Mark-Sweep-Compact**:

	* **Arena**:

	* **Copying**:

	* **Generational**:

	* **Finalizers**: Blocks of code to be run to assist with object reclamation efforts, for those situations in which just releasing the memory occupied is not sufficient to release all allocated resources (files, connections, locks, etc). These need to be run prior to the object's deallocation, since the variable state inside the object is often necessary as part of the resource-deallocation process, but this is usually running on a thread owned by the runtime, which means this is a scenario in which user code is being run on a runtime-owned thread, which raises all sorts of negative possibilities.

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

### [Type-checking](https://en.wikipedia.org/wiki/Type_system#Type_checking)

The existence of types is useless without a process of verifying that those types make logical sense in the program so that the program can be executed successfully. Type checking is the process of verifying and enforcing the constraints of types, and it can occur either at ahead-of-(execution-)time (i.e. statically) or at runtime/execution time (i.e. dynamically). Type checking is all about ensuring that the program will not encounter errors due to inappropriate or undefined intersection of types; a type error is an erroneous program behavior in which an operation occurs (or trys to occur) on a particular data type that it’s not meant to occur on.

When a program is considered not type-safe, there is no single standard course of action that happens upon reaching a type error. Many programming languages throw type errors which halt the runtime or compilation of the program, while other languages have built-in safety features to handle a type error and continue running (allowing developers to exhibit poor type safety).

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

### Runtime Introspection and Modification

Types can often be inspected at runtime regardless of the type-safe or type-checked nature of the language/platform; in many languages/platforms, the process of inspection is known as "reflection".


## Comparisons
["Bits of History, Words of Advice"](http://gbracha.blogspot.com/2020/05/bits-of-history-words-of-advice.html): The creator of [Newspeak](/languages/smalltalk/newspeak) and one of the core developers working on [Java](/languages/jvm/java) and the [JVM](/platforms/jvm) offers some advice about Smalltalk's lack of success in the mainstream.

## Implementation

[More reading](/reading/compilers)

[Crash Course on Notation in Programming Language Theory](http://siek.blogspot.com/2012/07/crash-course-on-notation-in-programming.html), Jeremy G. Siek; LambdaConf 2018 [Part 1](https://www.youtube.com/watch?v=vU3caZPtT2I), [Part 2](https://www.youtube.com/watch?v=MhuK_aepu1Y) [Slides](https://www.dropbox.com/s/joaq7m9v75blrw5/pl-notation-lambdaconf-2018.pdf?dl=1)

* **Type systems and type safety**

	* [Luca Cardelli: Type Systems](http://lucacardelli.name/Papers/TypeSystems.pdf)

	* [Type Safety in Three Easy Lemmas](https://siek.blogspot.com/2013/05/type-safety-in-three-easy-lemmas.html)

	* [Type Systems - Neel Krishnaswami](https://www.cl.cam.ac.uk/teaching/1819/Types/materials.html) ([Handout](https://www.cl.cam.ac.uk/teaching/1819/Types/handout.pdf))

* **Intermediate Representations**: 

	* [Intermediate Representations in Imperative Compilers: A Survey](http://dx.doi.org/10.1145/2480741.2480743) ([PDF](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.885.5223&rep=rep1&type=pdf)) (by James Stanier, Des Watson; ACM Computing Surveys, Vol. 45, No. 3, Article 26, 2013)

	* [Modern Intermediate Representations (IR)](https://llvm.org/devmtg/2017-06/1-Davis-Chisnall-LLVM-2017.pdf); Introduction to LLVM - David Chisnall (Cambridge University), [HPC Summer School 2017](https://llvm.org/devmtg/2017-06/)

	* [Testing Intermediate Representations for Binary Analysis](https://softsec.kaist.ac.kr/~soomink/paper/ase17main-mainp491-p.pdf) [Github](https://github.com/SoftSec-KAIST/MeanDiff), [Website](https://softsec-kaist.github.io/MeanDiff/)


---

[Lingua.NET](https://archive.codeplex.com/?p=lingua): Discontinued/archived CodePlex parser generator. Archived content copied locally [here](/languages/dotnet/lingua.zip).

---

## Fun
["History of Programming Languages"](http://thequickword.wordpress.com/2014/02/16/james-irys-history-of-programming-languages-illustrated-with-pictures-and-large-fonts/) by James Iry. Illustrated--pictures and large fonts. | ["Say something you dislike about a language you love"](https://lobste.rs/s/2cw6ov/say_something_you_dislike_about_language) | ["Say something nice about a language you dislike"](https://lobste.rs/s/hib1ui/say_something_nice_about_programming)
