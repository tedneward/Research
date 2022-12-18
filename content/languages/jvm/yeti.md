title=Yeti
tags=language, jvm, functional
summary=An ML-style functional language for the JVM.
~~~~~~

[Website](http://mth.github.io/yeti/) | [Github](https://github.com/mth/yeti) | [Tutorial](http://dot.planet.ee/yeti/intro.html) | [Reference](http://dot.planet.ee/yeti/reference.pdf)

"The goal of Yeti is to have a clean and minimal expressive language on the JVM that allows functional style programming, has static type inference and interfaces well with Java code.

"Some of the features:

* Type inference using the Hindley-Milner algorithm. The types are statically inferred at compile time without a need for explicit type declarations.
* Polymorphic structure and variant types. Using those resembles duck typing from the dynamic languages - for example, when a value is used as a structure having a field foo, which gives string value, then any structure with string field foo will be good enough.
* Property fields in structures (access goes through function calls).
* Lazy lists
* Pattern matching on values
* Comfortable string regex support
* Easy to call existing Java code
* Interactive REPL environment for experimenting
* Compiles directly to Java bytecode
* Fast compilation and quite fast execution

"The core language and existing standard library API should be fairly stable.
"The compiler development is now frozen to be bug-fix only (and writing documentation) until the 1.0 release."

