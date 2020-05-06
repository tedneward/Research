title=Frege
tags=language, jvm, functional, static
summary=A functional language heavily Haskell-inspired for the JVM.
~~~~~~

[Github](https://github.com/Frege/frege) | [Language reference](http://www.frege-lang.org/doc/Language.pdf) | [Real-World Frege](https://github.com/Dierk/Real_World_Frege/) | [Frege Goodness](http://dierk.gitbooks.io/fregegoodness)

Like any Haskell, it is purely functional, enjoys a strong static type system with global type inference and non-strict - also known as lazy - evaluation. Frege compiles to Java, runs on the JVM, and uses any Java library you want. It can be used inside any Java project.

Hello World:
```
module Hello where

greeting friend = "Hello, " ++ friend ++ "!"

main args = do
    println (greeting "World")
```

... creates a JVM `Hello.class` with a standard `main` and a `public static String greeting(String ...) {...}` method for JVM interoperability. The `greeting` function is pure, meaning it is stateless and free of side effects. Therefore, it is threadsafe and its results may be automatically cached since given the same argument, the result will always be the same. The `main` function is impure. It takes a list of Strings and does not return just "void" as in most other JVM languages but the type `IO ()`, telling that it may produce side effects like printing to the console. The Frege type system guarantees that any caller of main must also be of some IO type and is thus also marked as impure. That way, the lack of purity percolates up the whole call chain.

"Hello World" already shows the tenet of "islands of purity" (greeting) in a "sea of imperative code" (main).

Since the purity information is carried through the type system, the compiler can potentially use it for many optimizations such as pre-calculation, deferred execution, parallel execution, caching, and elimination of common subexpressions.

Frege is strongly and statically typed, even though we haven't declared any types in the code above. If not declared, the types are inferred. When declared, the given types are checked against the inferred ones.

