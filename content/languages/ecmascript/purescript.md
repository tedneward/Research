title=PureScript
tags=language, functional, strongly-typed, nodejs, browser
summary=A strongly-typed language that transpiles to JavaScript.
~~~~~~

[Website](https://www.purescript.org/) | [Source](https://github.com/purescript/purescript) | [Book](https://github.com/paf31/purescript-book)

* Compile to readable JavaScript and reuse existing JavaScript code easily
* An extensive collection of libraries for development of web applications, web servers, apps and more
* Excellent tooling and editor support with instant rebuilds
* An active community with many learning resources
* Build real-world applications using functional techniques and expressive types, such as:
    * Algebraic data types and pattern matching
    * Row polymorphism and extensible records
    * Higher kinded types
    * Type classes with functional dependencies
    * Higher-rank polymorphism

Hello world:
```
import Prelude
import Effect.Console (log)

greet :: String -> String
greet name = "Hello, " <> name <> "!"

main = log (greet "World")
```
