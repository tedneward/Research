title=Hylo
tags=language
summary=A programming language that leverages mutable value semantics and generic programming for high-level systems programming.
~~~~~~

[Website](https://www.hylo-lang.org/) | [Source](https://github.com/hylo-lang/hylo) | [Language Tour](https://docs.hylo-lang.org/language-tour/) | [Language Specificaiton](https://github.com/hylo-lang/specification/blob/main/spec.md) | [IR Specification](https://docs.hylo-lang.org/hylo-ir/)

Hylo was formerly known as [Val](./val).

Hylo aims to be:

* **Fast by definition:** Hylo is compiled ahead-of-time to machine code and relies on its type system to support in-place mutation and avoid unnecessary memory allocations. Hylo avoids hidden costs such as implicit copies and therefore avoids heavy dependence on an optimizer for basic performance.
* **Safe by default:** Hylo’s foundation of mutable value semantics ensures that ordinary code is memory safe, typesafe, and data-race-free. By explicit, auditable opt-in, programmers can use unsafe constructs for performance where necessary, and can build safe constructs using unsafe ones.
* **Simple:** Hylo borrows heavily from Swift which has demonstrated a user-friendly approach to generic programming and deep support for value semantics. Hylo’s programming model strengthens and extends this support, while de-emphasizing reference semantics and avoiding the complexities that result from trying to make it statically safe (e.g., memory regions, lifetime annotations, etc.).

Our goals overlap substantially with that of Rust and other commendable efforts, such as Zig or Vale. Besides, other programming languages have value semantics (e.g., R or Whiley) and/or provide excellent support for generic programming (e.g., Swift or Haskell). What sets Hylo apart in the current landscape is its focus on mutable value semantics for the purpose of writing efficient, generic code. Hylo is a zero-cost abstraction language that fully acknowledges the physical constraints of computer architecture. Yet, it presents a user model that marries these constraints with the benefits of value-oriented programming.

Example (may not compile?):
```
subscript longer_of(_ a: inout String, _ b: inout String): String {
  if b.count() > a.count() { yield &b } else { yield &a }
}

fun emphasize(_ z: inout String, strength: Int = 1) {
  z.append(repeat_element("!", count: strength))
}

public fun main() {
  var (x, y) = ("Hi", "World")
  emphasize(&longer_of[&x, &y])
  print("${x} ${y}") // "Hi World!"
}
```

