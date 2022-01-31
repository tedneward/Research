title=Modern Compiler Implementation
tags=language, reading, book
summary=This book covers compiler theory, design, and implementation.
~~~~~~

[ML](https://www.cs.princeton.edu/~appel/modern/ml/) | [Java](https://www.cs.princeton.edu/~appel/modern/java) | [C](https://www.cs.princeton.edu/~appel/modern/c)

It is a textbook in two parts, each of about 12 chapters. Part I covers the implementation of ``basic, hi-tech, modern'' compilers, and is suitable for a one-semester undergraduate course. Part II will cover advanced material, and is suitable for a second semester course or a graduate course. The preliminary edition, published in 1997, contains only five chapters of Part II.

A compiler is organized into a series of modules, and the organization of Part I follows the organization of a compiler. Each chapter covers one module of the compiler, and the basic algorithms, data structures, and interfaces are described in detail. Because the interfaces are clearly and concretely described, I have organized the book to outline a student compiler implementation project, with each chapter describing one or two weeks' work. Thus the book serves as its own laboratory manual.

Algorithms can often be described independently of the programming language in which they are implemented, but I think it is important to describe interfaces very concretely in a real programming language. Thus, each edition of the book is tied to a particular programming language, and outlines a compiler for a simple Algol-like language with heap-allocated records that is easily extensible to be functional, object-oriented, or both.

