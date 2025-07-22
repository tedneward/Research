title=Monte
tags=language, object capability
summary=A nascent dynamic programming language reminiscent of Python and E; it is based upon The Principle of Least Authority (POLA), which governs interactions between objects, and a capability-based object model, which grants certain essential safety guarantees to all objects.
~~~~~~

Monte is designed for agoric systems, promotes secure distributed computation, and is focused on readability and clarity.

[Website](http://www.monte-language.org/)

Monte's design incorporates:

* Guard-based Type System
* Values are typed according to guards, which are objects that describe the behavior of values.
* Readable & Auditable Syntax
* Python-inspired syntax includes customizeable pattern matching and object literals, while semantic features like static lexical scoping and left-to-right evaluation aid code review.
* Builtin Concurrency
* First-class promises and syntax for eventual message passing facilitate a natural and simple set of idioms for highly concurrent systems.

Additional boons of Monte include:

* Quasiliteral syntax, including quasiliteral patterns and an extensible interface
* Composition-based inheritance
* Immutable and persistent core data structures
* Parameterized modules
 Audition-based proving of customized object behaviors

Example syntax:
```
def x :Int := 5 + 7
traceln(`x = $x`)
def isEven(i :Int) :Bool:
    return i % 2 == 0
var wondrous :Int := 27
while (wondrous != 1):
    traceln(`wondrous = $wondrous`)
    wondrous := if (isEven(wondrous)) {wondrous // 2} else {wondrous * 3 + 1}
def greeting :Str := "This string is in Monte (/ˈmɔːntiː/)"
def `This @thing is in @{language :Str}` := greeting
[thing, language]
```
