title=CLAIRE4
tags=language, static, dynamic, functional, object
summary=A general-purpose programming language, best suited to application software requiring sophisticated data modeling, rule processing or problem solving.
~~~~~~

[Source](https://github.com/ycaseau/CLAIRE4)

WebClaire adds extensions for fuller integration with the operating system and for programming web applications.

4. Why Claire ?
===============

The two presentations in the /docs directory will tell you more, but here is a short overview.

4.1 Why yet another language ?
------------------------------

4.1.1 CLAIRE is a functional object-oriented language
- CLAIRE is a full-fledged object-oriented language that inherits from SMALLTALK.
- CLAIRE is a functional language that inherits from LISP. Functional languages have regained popularity in the last 10 years, so
- CLAIRE inherits from CECILE - a specification language from the early 90s - with the aim of concision and preciseness. CLAIRE offers a higher level of abstraction than most object-oriented language

4.1.2 CLAIRE is both statically & dynamically typed with a rich type system
- CLAIRE is a fully polymorphic languages where methods may be overloaded in multiple ways, extending traditional single-inheritance class polymorphism
- CLAIRE is dynamically typed for fast prototyping and more expressive power  …A very large part of CLAIRE code fragments can be statically typed …
- CLAIRE supports second-order types

4.1.3 CLAIRE includes a number of features that makes it easier to write complex algorithms
- Set-based programming. This was more original 30 years ago than it is now, but sets and set-based expressions are first-class citizen of the CLAIRE language
- Rule-based programming. Although “production rules” have lost their appeal,
- Search tree primitives : CLAIRE provides “hypothetical reasoning”, that is the ability to create choice points and backtrack to a previous state.


4.2 Claire vs other interpreted language
---------------------------------------

4.2.1 Fast interpreter
CLAIRE4 is much faster than the previous CLAIRE 3.5 version. CLAIRE is now faster than Python (on average, based on a the set of performance benchmark that is included on GitHub)
The included Excel files gives an overview of the performance tests that are included in test/perf
This is ongoing work, the performance will stabilize once CLAIRE 4.0 reaches the beta status.

4.2.2 Fast compiler
CLAIRE 4.0 is also MUCH faster than CLAIRE 3.5 as a compiler.
Based on the preliminary results, CLAIRE is approximately twice slower than Go, C++ or Java, based on a weighted distribution of the performance benchmarks.

4.2.3 CLAIRE is a hybrid interpreted/compiled language: thanks to the reflective nature of CLAIRE (everything is reflexively described and is inspectable as such),

4.3 Claire vs Go
----------------

4.3.1 CLAIRE has interesting features that are missing from GO
- CLAIRE is interpreted 
- it supports "true" object-oriented programming
- it provides Full polymorphism
- Exception handling

4.3.2 microCLAIRE (the Go Kernel) has its own merit for anyone who plans to write an interpreter:
- Fast reflective addition to objects and functions (much faster than the mechanism provided by Go)
- Generic set objects (something that should be improved in the future when comparing with Java)
- Fast buffered character I/O
