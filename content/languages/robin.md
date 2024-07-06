title=Robin
tags=language
summary=A functional programming language with eager evaluation, latent typing, and a homoiconic syntax (see Scheme), based on a radically simple core semantics (see Pixley) in which both functions and macros are defined in terms of a more basic abstraction, the fexpr. 
~~~~~~

[Source](https://catseye.tc/article/Languages.md#robin) | [Reference distribution](https://catseye.tc/distribution/Robin_distribution)

Expressions in Robin are referentially transparent; programs interact with the outside world through an event-oriented framework.

Sample program:

```
(require multiply)

(define fact (fun (self n)
  (multiply n
    (if (gt? n 1)
      (self self (subtract n 1)) 1))))
(display (fact fact 5))
```

Robin is a functional programming language with eager evaluation, latent typing, and a homoiconic syntax (see Scheme), based on a radically simple core semantics (see Pixley) in which both functions and macros are defined in terms of a more basic abstraction, the fexpr.

Expressions in Robin are referentially transparent; programs interact with the outside world through an event-oriented framework.

Robin was originally a design for a Pixley-based operating system (or something similar to an operating system) which was heavily resource-oriented; almost everything, including every concurrent process, was a virtual device which must be acquired from a central resource arbiter. This arbiter could satisfy the constraints specified when requesting a device any way it saw fit; so the operating environment potentially had a lot of influence over exactly what any given program does.

Not a lot of that idea remains, but it did influence the fact that Robin should be a purely functional language which nevertheless interacts with the rest of the world through some kind of framework. After much consideration, the framework arrived at is very similar to that used in The Elm Architecture.