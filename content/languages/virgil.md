title=Virgil
tags=language, native, jvm, web assembly
summary=Fast and lightweight native programming language designed for fast, dependency-free programs.
~~~~~~

[Source](https://github.com/titzer/virgil) | [Tutorial](https://github.com/titzer/virgil/blob/master/doc/tutorial/Overview.md)

Virgil is a programming language designed for building lightweight high-performance systems. Its design blends functional and object-oriented programming paradigms for expressiveness and performance. Virgil's compiler produces optimized, standalone native executables, WebAssembly modules, or JARs for the JVM. For quick turnaround in testing and debugging, programs can also be run directly on a built-in interpreter. It is well-suited to writing small and fast programs with little or no dependencies, which makes it ideal for the lowest level of software systems. On native targets, it includes features that allow building systems that talk directly to kernels, dynamically generate machine code, implement garbage collection, etc. It is currently being used for virtual machine and programming language research, in particular the development of a next-generation WebAssembly virtual machine, Wizard.

## Language Design
Virgil focuses on balancing these main features in a statically-typed language:

* Classes - for basic object-oriented programming
* Functions - for small-scale reuse of functionality
* Tuples - for efficient aggregation and uniform treatment of multi-argument functions
* Type parameters - for powerful and clean abstraction over types
* Algebraic data types - for easy building and matching of data structures
