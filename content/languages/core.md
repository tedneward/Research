title=Core
tags=language
summary=A modern, minimal programming language. 
~~~~~~

[Website](https://core-lang.dev/) | [Source](https://github.com/core-lang/core)

In a world in which languages add features until they collapse under their own weight, build a language that is content with itself.

```
class Cat(let name: String, let lives: Int64)
class Dog(let name: String, let years: Int64)
union Pet of Cat, Dog

fun describe(pet: Pet): String = if pet
  ... is Cat(let name, let lives) { "cat $name has $lives lives" }
  ... is Dog(let name, let years) { "dog $name is $years of age" }

List(Cat("Lila", 7), Dog("Fenton", 6), Cat("Molly", 9))
  .retain(|p| p.name.size > 5)
  .map   (|p| describe(p))
  .each  (|d| println(d))
// → cat Molly has 9 lives
// → dog Fenton is 6 years of age
```

modern:
generics and traits
all values are objects
expressions, not statements

minimal: 
no modifiers
no exceptions
no null pointers
no static members
no collection literals
no implicit conversions
no method overloading

typed:
the compiler rejects ill-typed code
values do not have "magic" methods
all operations used need to be declared

accessible: 
safe
small
hackable
open source
