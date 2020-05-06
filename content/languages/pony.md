title=Pony
tags=language, native, object capability
summary=A statically-compiled research language from Microsoft around actors and concurrency.
~~~~~~

[Website](https://www.ponylang.io/).

> Pony is an open-source, object-oriented, actor-model, capabilities-secure, high-performance programming language.

Reference capabilities:

> If you are like most people learning Pony, your biggest stumbling block is going to be reference capabilities. Reference capabilities look like a very foreign concept to most folks. This isn’t surprising as they are one of the ideas that make Pony unique. Lots of folks get frustrated while learning reference capabilities and end up thinking that Pony has “too much type system” or is “too hard”. While we don’t agree with such assessments, we will agree that they can be quite hard for some folks to get a handle on. ... Reference capabilities allow you the programmer to use the Pony type system to guarantee that you are safely handling data in your application. If you try to do something unsafe, your program won’t compile.

From the main page:

### The Pony Philosophy
In the spirit of Richard Gabriel, the Pony philosophy is neither “the-right-thing” nor “worse-is-better”. It is “get-stuff-done”.

### Correctness
Incorrectness is simply not allowed. It’s pointless to try to get stuff done if you can’t guarantee the result is correct.

### Performance
Runtime speed is more important than everything except correctness. If performance must be sacrificed for correctness, try to come up with a new way to do things. The faster the program can get stuff done, the better. This is more important than anything except a correct result.

### Simplicity
Simplicity can be sacrificed for performance. It is more important for the interface to be simple than the implementation. The faster the programmer can get stuff done, the better. It’s ok to make things a bit harder on the programmer to improve performance, but it’s more important to make things easier on the programmer than it is to make things easier on the language/runtime.

### Consistency
Consistency can be sacrificed for simplicity or performance. Don’t let excessive consistency get in the way of getting stuff done.

### Completeness
It’s nice to cover as many things as possible, but completeness can be sacrificed for anything else. It’s better to get some stuff done now than wait until everything can get done later.

The “get-stuff-done” approach has the same attitude towards correctness and simplicity as “the-right-thing”, but the same attitude towards consistency and completeness as “worse-is-better”. It also adds performance as a new principle, treating it as the second most important thing (after correctness)

