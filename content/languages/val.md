title=Val
tags=language, archived
summary=A programming language that leverages mutable value semantics and generic programming for high-level systems programming.
~~~~~~

***This is now [Hylo](./hylo)***

[Website](https://www.val-lang.dev/) | [Source](https://github.com/val-lang/val) | [Language tour](https://tour.val-lang.dev/)

Val is an open source, general-purpose programming language designed around on the concept of (mutable) value semantics. The language aims to be safe and efficient, yet expressive enough to support multiple programming paradigms and implement concurrent algorithms safely and efficiently.

## Examples
Simple program:

```
subscript longer_of(_ a: inout String, _ b: inout String): String {
  if b.count() > a.count() { yield &b } else { yield &a }
}

fun emphasize(_ z: inout String, strength: Int = 1) {
  z.append(repeat_element("!", count: strength)))
}

public fun main() {
  var (x, y) = ("Hi", "World")
  emphasize(&longer_of[&x, &y])
  print("${x} ${y}") // "Hi World!"
}
```

## Articles

* ["Meet Val: A New Language Alternative to C++, Rust"](https://thenewstack.io/meet-val-a-new-language-alternative-to-c-rust/)

