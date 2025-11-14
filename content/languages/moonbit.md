title=Moonbit
tags=language, web assembly, browser
summary=Functional-ish language designed for use in web-based AI IDE, compiling to browser-centric targets (JS, WASM, native).
~~~~~~

[Website](https://www.moonbitlang.com/) | [Source](https://github.com/moonbitlang) | [Docs](https://docs.moonbitlang.com/en/latest/) | [Core library](https://github.com/moonbitlang/core) - open-sourced standard library, compiler source code is not available yet.

MoonBit is an end-to-end programming language toolchain for cloud and edge computing using WebAssembly. The language is like Rust with GC support. The fast compiler is optimized to produce very compact WASM binaries. 

## Getting Started
As of 6 Oct 2025, installation is via VSCode extension ("Moonbit Language") or manual (via `curl`): `curl -fsSL https://cli.moonbitlang.com/install/unix.sh | bash` (macOS/Linux) or `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser; irm https://cli.moonbitlang.com/install/powershell.ps1 | iex` (POSH)

## Examples

```
///|
fn main {
  // explicit type annotation
  let a1 : Int = 10
  println((10 : Int))

  // Variable with type inference (Int inferred from value 20)
  let b = 20
  println("a + b = \{a1 + b}")

  // Mutable variable - can be modified
  let mut c = 10
  println("c before: \{c}")
  c = c + 1
  println("c after: \{c}")

  // Immutable variable - cannot be modified
  let d = 20
  println("d = \{d}")
  // d = d + 1  // Uncommenting this line will cause a compilation error
}
```

## Language Tour

* Type annotations (and inferred if not present)
* `let` bindings immutable; `mut` bindings mutable
* Basic types: `Int`, `Double`, `Bool`, `Char` (Unicode), `String` (immutable), `Unit`
* Escape sequences, `\u{...}` for Unicode
* String interpolation via `\{variable}`
* Functions
    * use `fn` keyword
    * parens to designate parameters; `->` for return type (`Unit` assumed if not present)
    * parameters 
        * must be type-annotated
        * names suffixed with `~` are labeled, and callers must use param name
        * names suffixed with `?` have default value, and callers must use param name
        * labeled/optional arguments can be passed in any order
    * return value designated via `return` or final expression
* Block
    * namespace/binding scope
    * an expression
    * containing sequence of statements and an optional expression
    * yields final expression or `Unit` (`()`) result
* Array
    * homogenous
    * literal syntax: `[1, 2, 3]`
    * `Array::make` function; `Array::make(4,1)` == `[1, 1, 1, 1]`
    * `..arrayname` is "array spread"; expands the array's contents in-place
    * `array[start:end]` obtains a view of the array from index `start` to index `end` (exclusive); reference
    * elements inside the array are implicitly mutable
* Tuple
    * accessed via indexed field names: `tuple.0`, `tuple.1`, etc
    * destructured via `let (a, b) = tuple`
* Map
    * key-value pairs; mutable collection
    * `{"key1": value1, "key2" : value2}`
    * `Map::of` function; `Map::of([("key1", 1), ("key2", 2), ("key3", 3)])` == `{"key1":1, "key2":2, "key3":3}`
    * accessed via `map[key]`




