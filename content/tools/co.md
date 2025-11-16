title=Co
tags=language, langdev, parsing, haskell, concurrency
summary=Let’s explore some of these concepts in detail by implementing a programming language with support for coroutines and Go-style channels.
~~~~~~

[Part 1](https://abhinavsarkar.net/posts/implementing-co-1/) | [Part 2](https://abhinavsarkar.net/posts/implementing-co-2/) | [Part 3](https://abhinavsarkar.net/posts/implementing-co-3/) | [Part 4](https://abhinavsarkar.net/posts/implementing-co-4/)

Co has these basic features that are found in many programming languages:

* Dynamic and strong typing.
* Null, boolean, string and integer literals, and values.
* Addition, subtraction, multiplication and integer division arithmetic operations.
* String concatenation operation.
* Equality and inequality checks on booleans, strings and numbers.
* Less-than and greater-than comparison operations on numbers.
* Variable declarations, usage and assignments.
* if and while statements.
* Function declarations and calls, with support for recursion.
* First class functions and anonymous functions.
* Mutable closures.

It also has these special features:

* yield statement to yield the current thread of computation (ToC).
* spawn statement to start a new ToC.
* First class channels with operators to send and receive values over them.
* sleep function to sleep the current ToC for a given number of milliseconds.
