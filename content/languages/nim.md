title=Nim
tags=language, native, object, functional, web assembly
summary=A compiled, garbage-collected systems programming language with a design that focuses on efficiency, expressiveness, and elegance (in that order of priority).
~~~~~~

[Website](https://nim-lang.org/) | [Source](https://github.com/nim-lang/Nim) | [Docs](https://nim-lang.org/documentation.html)

Nim is a statically typed compiled systems programming language. It combines successful concepts from mature languages like Python, Ada and Modula.

* Efficient
    * Nim generates native dependency-free executables, not dependent on a virtual machine, which are small and allow easy redistribution.
    * The Nim compiler and the generated executables support all major platforms like Windows, Linux, BSD and macOS.
    * Nim's memory management is deterministic and customizable with destructors and move semantics, inspired by C++ and Rust. It is well-suited for embedded, hard-realtime systems.
    * Modern concepts like zero-overhead iterators and compile-time evaluation of user-defined functions, in combination with the preference of value-based datatypes allocated on the stack, lead to extremely performant code.
    * Support for various backends: it compiles to C, C++ or JavaScript so that Nim can be used for all backend and frontend needs.
* Expressive
    * Nim is self-contained: the compiler and the standard library are implemented in Nim.
    * Nim has a powerful macro system which allows direct manipulation of the AST, offering nearly unlimited opportunities.
* Elegant
    * Macros cannot change Nim's syntax because there is no need for it — the syntax is flexible enough.
    * Modern type system with local type inference, tuples, generics and sum types.
    * Statements are grouped by indentation but can span multiple lines.

## Implementations

* [nlvm](https://github.com/arnetheduck/nlvm) - LLVM-based compiler for Nim with a WebAssembly target supported out of the box
* [nwasm](https://github.com/stisa/nwasm) - a webassembly backend for nim.
* [Nim wasm helpers](https://github.com/Feneric/nim-wasm-helpers) - a helper to set up a VM configured to build WebAssembly code using Nim.


## Examples

If...else, Case/switch:
```
var conditional = 42

if conditional < 0:
  echo "conditional < 0"
elif conditional > 0:
  echo "conditional > 0"
else:
  echo "conditional == 0"

var ternary = if conditional == 42: true else: false

var another =
  if conditional == 0:
    "zero"
  elif conditional mod 2 == 0:
    "even"
  else:
    "odd"


# Case switch.
var letter = 'c'

case letter
of 'a':
  echo "letter is 'a'"
of 'b', 'c':
  echo "letter is 'b' or 'c'"
of 'd'..'h':
  echo "letter is between 'd' and 'h'"
else:
  echo "letter is another character"
```

Comprehensions:
```
import std/[sugar, tables, sets, sequtils, strutils]

let variable0 = collect(newSeq):
  for item in @[-9, 1, 42, 0, -1, 9]:
    item * 2

assert variable0 == @[-18, 2, 84, 0, -2, 18]

let variable1 = collect(initTable):
  for key, value in @[0, 5, 9]:
    {key: value div 2}

assert variable1 == {0: 0, 1: 2, 2: 4}.toTable

let variable2 = collect(initHashSet):
  for item in @[-9, 1, 42, 0, -1, 9]:
    {item + item}

assert variable2 == [2, 18, 84, 0, -18, -2].toHashSet

assert toSeq(1..15).mapIt(
    if it mod 15 == 0:  "FizzBuzz"
    elif it mod 5 == 0: "Buzz"
    elif it mod 3 == 0: "Fizz"
    else: $it
  ).join(" ").strip == "1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz"
```

Simple: 
```
import std/strformat

type
  Person = object
    name: string
    age: Natural # Ensures the age is positive

let people = [
  Person(name: "John", age: 45),
  Person(name: "Kate", age: 30)
]

for person in people:
  # Type-safe string interpolation,
  # evaluated at compile time.
  echo(fmt"{person.name} is {person.age} years old")


# Thanks to Nim's 'iterator' and 'yield' constructs,
# iterators are as easy to write as ordinary
# functions. They are compiled to inline loops.
iterator oddNumbers[Idx, T](a: array[Idx, T]): T =
  for x in a:
    if x mod 2 == 1:
      yield x

for odd in oddNumbers([3, 6, 9, 12, 15, 18]):
  echo odd


# Use Nim's macro system to transform a dense
# data-centric description of x86 instructions
# into lookup tables that are used by
# assemblers and JITs.
import macros, strutils

macro toLookupTable(data: static[string]): untyped =
  result = newTree(nnkBracket)
  for w in data.split(';'):
    result.add newLit(w)

const
  data = "mov;btc;cli;xor"
  opcodes = toLookupTable(data)

for o in opcodes:
  echo o
```

---

[Prologue](https://github.com/planety/prologue): Full-Stack Web Framework written in Nim. [Website](planety.github.io/prologue)

## Books

* [Computer Programming with the Nim Programming Language](http://ssalewski.de/nimprogramming.html) - Dr. Stefan Salewski
* [Nim Basics](https://narimiran.github.io/nim-basics) - narimiran
* [Nim by Example](https://nim-by-example.github.io) - Flaviu Tamas
* [Nim Days](https://xmonader.github.io/nimdays) - Ahmed Thabet
