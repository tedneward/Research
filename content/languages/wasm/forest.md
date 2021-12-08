title=Forest
tags=language, wasm, functional
summary=Multi-syntax functional programming language that compiles to WebAssembly.
~~~~~~

[Source](https://github.com/forest-lang) ([Compiler source](https://github.com/forest-lang/forest-compiler))

No updates for 2 years

Features:

* Statically typed
* Pattern matching
* Immutable datastructures (with mutable optimizations for common cases)
* Ref-counted, incremental cleanup that can be scheduled. No automatic stop the world GC.
* Multiple syntaxes, users can create and customize syntaxes, and project between.
* Automatic code formatting
* Dev virtual filesystem powered by FUSE to project code into desired syntax.
* Visual editor

Most interesting concept: multiple syntaxes.

"Since Forest supports multiple syntaxes, it might look very different to different developers. The first syntax in development is inspired by Haskell and Elm. 

"For example, here is fibonacci implemented in Forest:

```
fib i =
  case i of
    0 -> 1
    1 -> 1
    i -> fib (i - 2) + fib (i - 1)
```

"This could just as easily be written using another syntax more comparable to JavaScript:

```
function fib(i) {
  switch (i) {
    case 0: 1;
    case 1: 1;
    case i: fib(i - 2) + fib(i - 1);
  }
}
```

"Notice that while the syntax in these examples differs, the underlying semantics are the same (implicit returns, pattern matching)."

"**If every dev can use different syntax, what do we store in the repo?** You only need to store a single representation of the syntax in source control, which we'll call the canonical representation. The syntax for this representation would be agreed by the project's collaborators, but is largely unimportant.

"**What's the point of having different syntaxes?** Syntax is polarising. I know people who love Ruby's syntax, and people who hate it. I know people who love Haskell syntax, and people who hate it. The syntax of your language immediately alienates a large swathe of the community. Beyond languages, the arguments go on. Tabs vs spaces? Whitespace sensitive or curly braces? Semicolons or not? If everyone can use the syntax they desire, we don't need to have those arguments anymore. How much time does your team spend talking style? In current languages, new syntax is headline news. Some of the best parts of ES2015 were simply syntactic sugar. If we push syntax to userland, each developer can have their preferred sugar and we can iterate without the need for major version changes to languages. Additionally, having a variety of different syntaxes might aid beginners in learning the language and contributing to projects. Maybe the maintainers of a project personally like the Haskell syntax with the sweet unicode greek alphabet generics, but perhaps a new contributor is more accustomed to a Python style syntax. Why shouldn't they be able to work together?"
[Source](https://github.com/forest-lang/forest-compiler)

Design principles

* Ease of collaboration outweighs all other priorities.
* For the sake of collaboration, we agree on structure and semantics, and agree to disagree on syntax.
* Forest will be fast enough to make complex games, so normal web apps will be blazing fast.
* Testing aids collaboration, so it should be as painless as possible.
* Since we want to write tests, effect execution and logic should be separate.
* What if everything was a dataflow graph?
