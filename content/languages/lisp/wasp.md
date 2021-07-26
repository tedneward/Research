title=Wasp Lisp
tags=language, vm, functional, dynamic
summary=A member of the Lisp-1 family, borrowing principles from R5RS Scheme, Python and Erlang. It is a pragmatic language, designed to provide developers with tools to rapidly build network applications that require sophisticated logic and quick turnarounds between prototype and production. 
~~~~~~

[Source](https://github.com/swdunlop/WaspVM)

The Wasp Lisp Virtual Machine, Associated Libraries, and MOSREF.

Wasp Lisp provides the following features inherited from Mosquito Lisp:

  - Compact Implementation
  - Cooperative Lightweight Threads
  - Unique, efficient I/O model

Beyond the functionality provided by Mosquito Lisp, Wasp Lisp provides the ability to extend Wasp Lisp with modules written in ANSI C and refinement of many of Mosquito's features based on feedback by the Lisp community.

### WHAT IS THIS PACKAGE?

This Wasp Lisp source code package consists of the source code for four key components of the Wasp Lisp environment:

 - WaspDoc, the Wasp documentation tool which provides a way to view and update
   documentation associated with Wasp Lisp.

 - WaspVM, a compact interpreter written in ANSI C for programs written in 
   Wasp Lisp.

 - WaspC, the compiler for Wasp Lisp programs, written in Wasp Lisp itself.

 - Wasp, the Wasp interactive environment which provides interactive 
   programming and troubleshooting for Wasp Lisp programmers.

The particular version of Wasp Lisp containing this file is called "Wasp Rewind".
