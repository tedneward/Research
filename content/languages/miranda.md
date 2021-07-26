title=Miranda
tags=language, functional
summary=A pure, non-strict, polymorphic, higher order functional programming language that later inspired Haskell.
~~~~~~

[Website](https://www.cs.kent.ac.uk/people/staff/dat/miranda/) | [Manual](http://miranda.org.uk/manual)

Miranda is a modern functional programming language designed by David Turner of the University of Kent, with lazy evaluation, polymorphic strong typing, and a powerful module system. A program written in Miranda is typically 5 to 15 times shorter than the corresponding program in C or Java. The main features of Miranda are:
* purely functional - no side effects
* higher order - supports functional data
* lazy - supports non strict functions and infinite data objects
* list comprehensions
* polymorphic strong typing
* abstract data types and modules

The built in types of the language are numbers (unbounded size integers and double precision floating point), characters, lists, tuples, and functions. User defined types with arbitrary substructure can be introduced by writing type equations (so called 'algebraic data types'). The language also has abstract data types and a simple but powerful module system with type security across module boundaries.

By way of a very brief example of Miranda style, here is a definition of the list of all prime numbers (an infinite data structure) using the sieve of Eratosthenes

```
        primes = sieve [2..]
                 where
                 sieve (p:x) = p : sieve [n | n<-x ; n mod p > 0]
```

The expression in square brackets is a 'list comprehension' - it means list of n such that n drawn from x and n not divisible by p. The test for divisibility uses mod, the remainder operator.

The Miranda system provides a self-contained interactive programming environment. The Miranda compiler works in conjunction with a screen editor (which can be vi or another editor of the user's choice). The type system enables a high proportion of semantic errors to be detected at compile time.

Book: Chris Clack, Colin Myers & Ellen Poon, [Programming with Miranda](http://www0.cs.ucl.ac.uk/teaching/3C11/book/book.html)
