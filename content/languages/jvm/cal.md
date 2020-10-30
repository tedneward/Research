title=CAL / OpenQuark
tags=language, jvm, functional, platform
summary=A lazy functional programming framework and language for the JVM.
~~~~~~

"Open Quark is a programming framework that enables lazy functional programming on the Java platform.

"The original motivation for Open Quark was similar to the drive behind Microsoft's LINQ within C#: a way to express data transformation in composable algebraic terms within an application written in an OO language. Open Quark differs from the approach taken by Microsoft in that we did not attempt to extend the Java language per se, but rather we created Java libraries for compilation and evaluation of functions, under Java control. Open Quark has also expanded beyond some of these initial ambitions and has become a rather general-purpose functional programming framework for the Java platform.

"A key feature of the Open Quark is its native language CAL. CAL is a full functional language in the style of Haskell, Clean, Miranda etc. Open Quark provides a compiler and tools for the CAL language. The compiler has pluggable back-ends, but the default target runtime "LECC" compiles functions directly to Java byte code. Various tools allow the creation of JAR files from CAL modules, and so it is possible to use CAL as a standalone programming language without the need to code a Java 'wrapper' to launch your CAL application.

"Open Quark was designed from the outset to allow programmatic control of function creation and evaluation. Modules can be created using the Open Quark SDK, which also allows full control of evaluation. Evaluation can entail passing of values between the CAL runtime and regular Java code, including function 'suspensions'. In this way, the execution of regular Java and CAL functions can be intertwined as necessary.

"CAL supports parallel evaluation. This feature must be enabled with a system property, which then allows a library of 'parallel' functions to be used."

[Github](https://github.com/levans/Open-Quark) | [Website](http://openquark.org/) (currently resolves to a 403 error)

Github shows no activity for over a decade.


