title=Flix
tags=language, functional, jvm
summary=Next-generation reliable, safe, concise, and functional-first programming language.
~~~~~~

"Flix is a principled and flexible functional-, logic-, and imperative- programming language that takes inspiration from F#, Go, OCaml, Haskell, Rust, and Scala. Flix looks like Scala, but its type system is closer to that of OCaml and Haskell. Its concurrency model is inspired by Go-style processes and channels. Flix aims to offer a unique combination of features that no other programming language offers, including: algebraic data types and pattern matching (like Haskell, OCaml), extensible records (like Elm), type classes (like Haskell, Rust), higher-kinded types (like Haskell), local type inference (like Haskell, OCaml), channel and process-based concurrency (like Go), a polymorphic effect system (unique feature), first-class Datalog constraints (unique feature), and compilation to JVM bytecode (like Scala)."

[Website](https://flix.dev/#/) | [Source](https://github.com/flix/flix)

"Features at a Glance:"
* algebraic data types
* pattern matching
* first-class functions
* extensible records
* parametric polymorphism
* Hindley-Milner type inference
* opaque types and type aliases
* keyword-based syntax
* light-weight polymorphic effects
* CSP-style concurrency
* buffered & unbuffered channels
* first-class datalog constraints
* polymorphic datalog predicates
* constraints with lattice semantics
* stratified negation
* interoperability with Java
* unboxed primitives
* redundancy checks
* monadic let* expressions
* expressions holes
* compilation to JVM bytecode
* full tail call elimination
* core standard library
* parallel compiler architecture
* human friendly errors
* interactive mode

### Algebraic Data Types and Pattern Matching
```
/// An algebraic data type for shapes.
enum Shape {
    case Circle(Int32),          // circle radius
    case Square(Int32),          // side length
    case Rectangle(Int32, Int32) // height and width
}

/// Computes the area of the given shape using
/// pattern matching and basic arithmetic.
def area(s: Shape): Int32 = match s {
    case Circle(r)       => 3 * (r * r)
    case Square(w)       => w * w
    case Rectangle(h, w) => h * w
}

// Computes the area of a 2 by 4.
def main(_args: Array[String]): Int32 & Impure =
    println(area(Rectangle(2, 4)));
    0 // exit code
```

### Lists and List processing
```
/// We can easily construct and append lists:
def l(): List[Int32] =
    let l1 = 1 :: 2 :: 3 :: Nil;
    let l2 = 4 :: 5 :: 6 :: Nil;
    l1 ::: l2

/// We can use pattern matching to take a list apart:
def length(l: List[a]): Int32 = match l {
  case Nil     => 0
  case _ :: xs => 1 + length(xs)
}

/// The Flix library has extensive support for lists:
def main(_args: Array[String]): Int32 & Impure =
    let l1 = l();
    let l2 = List.intersperse(42, l1);
    let l3 = List.map(x -> x :: x :: Nil, l2);
    let l4 = List.flatten(l3);
    println(length(l4));
    0 // exit code
```

### Higher-Order Functions
```
/// Returns the sum of `x` and `y`.
def add(x: Int32, y: Int32): Int = x + y

/// Returns `x` plus one.
def inc(x: Int32): Int32 = add(x, 1)

/// Returns a function that applies `f` twice.
def twice(f: Int32 -> Int32): Int32 -> Int32 = x -> f(f(x))

/// Returns `x` plus two.
def two(x: Int32): Int32 = twice(inc)(x)

/// Returns 123 plus 4 = 127.
def main(_args: Array[String]): Int32 & Impure =
    println(twice(two)(123));
    0 // exit code
```

### Using Channels and Select
```
 /// Mooo's `n` times on channel `c`.
def mooo(c: Channel[String], n: Int32): Unit & Impure =
    match n {
        case 0 => ()
        case x => c <- "Mooo!"; mooo(c, x - 1)
    }

/// Meow's `n` times on channel `c`.
def meow(c: Channel[String], n: Int32): Unit & Impure =
    match n {
        case 0 => ()
        case x => c <- "Meow!"; meow(c, x - 1)
    }

/// Hiss'es `n` times on channel `c`.
def hiss(c: Channel[String], n: Int32): Unit & Impure =
    match n {
        case 0 => ()
        case x => c <- "Hiss!"; hiss(c, x - 1)
    }

/// Start the animal farm...
def main(_args: Array[String]): Int & Impure = {
    let c1 = chan String 1;
    let c2 = chan String 1;
    let c3 = chan String 1;
    spawn mooo(c1, 0);
    spawn meow(c2, 3);
    spawn hiss(c3, 7);
    select {
        case m <- c1 => m |> println
        case m <- c2 => m |> println
        case m <- c3 => m |> println
    };
    0 // exit code
}
```

### Using Datalog to solve a compiler puzzle
Another unique feature of Flix is its embedded Datalog support. Datalog, a powerful logic programming language in its own right, makes it simple and elegant to express many fixpoint problems (including various graph reachability problems). Datalog constraints are first-class which means that they may be passed to and returned from functions, stored in data structures, composed with other Datalog constraints, and solved. This makes it possible to express families of Datalog programs.

```
/// We can use Datalog constraints to solve the following problem:
/// Given a collection of compilers and interpreters, what source
/// languages can be compiled to what target languages?
def main(_args: Array[String]): Int32 & Impure =
    let facts = #{
        /// We have the following interpreters and compilers:
        Interpreter("x86").
        Compiler("Scala", "x86", "MiniScala").
        Compiler("MiniScala", "C++", "C++").
        Compiler("C++", "x86", "x86").
    };
    let rules = #{
        // Bootstrapping Compilation:
        // We have a compiler from src1 -> dst1 written in lang1.
        // We have a compiler that can compile lang1 to dst2.
        // Now we have a compiler from src1 to dst1 written in dst2.
        Compiler(src1, dst1, dst2) :-
            Compiler(src1, dst1, lang1),
            Compiler(lang1, dst2, lang2),
            Interpreter(lang2).
    
        // Transitive Compilation:
        // If we have a compiler from src -> intermediate and
        // we have a compiler from intermediate -> dst then
        // we can obtain a compiler from src -> dst.
        Compiler(src, dst, lang) :-
            Compiler(src, intermediate, lang),
            Compiler(intermediate, dst, lang),
            Interpreter(lang).
    };
    query facts, rules
        select (src, dst) from Compiler(src, _, dst) |> println;
    0 // exit code
```

