title=HLVM
tags=vm, functional
summary=High-Level Virtual Machine for statically-typed functional languages.
~~~~~~

[Website](https://forge.ocamlcore.org/projects/hlvm/) (not much there) | [Source](https://github.com/Tipoca/hlvm)

Welcome to the High-Level Virtual Machine (HLVM) project. This open source project is designed to provide a virtual machine to support modern statically-typed functional programming languages easily and with performance characteristics ideally suited to scientific computing.


HLVM currently sports the following features:

* Unit, bool, int and float primitive types.
* Tuples.
* Arrays.
* Union types.
* Function pointers.
* Tail call elimination of all tail calls.
* Generic printing.
* Foreign function interface to call C directly.
* POSIX threads.
* Mark and sweep garbage collector that allows threads to run in parallel.
* Incremental JIT compilation to high-performance native code suitable for a REPL.


HLVM aspires to provide the following features in the future:

* Closures.
* Parametric polymorphism.
* Global variables.
* Generic comparison, equality, hashing and serialization functions.
* A standard library.
