title=Theta
tags=language, functional, web assembly
summary=A modern, general purpose, functional programming language with a strong type system, expressive syntax, a modular design and supports pattern matching, function overloading, and other goodies.
~~~~~~

[Website](https://theta-lang.org/) | [Source](https://github.com/alexdovzhanyn/ThetaLang) | [Docs](https://docs.theta-lang.org/)

```
capsule Math {
  add<Function<Number, Number, Number>> = (
    a<Number>,
    b<Number>
  ) -> a + b

  square<Function<Number, Number>> = (n<Number>) -> n * n

  divideByTwo<Function<Number, Number>> = (
    n<Number>
  ) -> n / 2

  fancyMath<Function<Number>> = () ->
    5 => add(3) => square() => divideByTwo() // returns 32
}
```
