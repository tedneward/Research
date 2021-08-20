title=Lush
tags=language, lisp, maths, native
summary=An object-oriented programming language designed for researchers, experimenters, and engineers interested in large-scale numerical and graphic applications; designed to be used in situations where one would want to combine the flexibility of a high-level, weakly-typed interpreted language, with the efficiency of a strongly-typed, natively-compiled language, and with the easy integration of code written in C, C++, or other languages.
~~~~~~

[Website](http://lush.sourceforge.net/) | [Source](https://sourceforge.net/projects/lush/)

Lush uses a very simple Lisp syntax. If the word "Lisp" sends shivers down your spine, be advised that the dialect of Lisp that Lush implements is extremely simple to learn, with possibly one the simplest syntaxes around. Most scientists, engineers, and software developers who have learned Lush have become proficient at it in a few days, even if they had no prior exposure to Lisp. It's very simple. Really. In fact, Lush has been used to teach programming to kids.

The Lush compiler has several interesting properties, and a few limitations. Its main advantage is that it generates very efficient C code which is then compiled with the best available C compiler for the machine considered and loaded dynamically. The C code produced does not simulate a virtual machine, it is real, low-level, bang-the-metal, no-runtime-check, don't-break-for-animals, C code, just like what you would write by hand. Its main disadvantage is that, although it compiles a Lisp-like language, it does no more for you than what a C compiler would (no automagic memory management, no garbage collection, no functional programming).


