title=Forest
tags=language, wasm
summary=A multi-syntax functional programming language that compiles to WebAssembly.
~~~~~~

[Source](https://github.com/forest-lang/forest-compiler)

Design principles

* Ease of collaboration outweighs all other priorities.
* For the sake of collaboration, we agree on structure and semantics, and agree to disagree on syntax.
* Forest will be fast enough to make complex games, so normal web apps will be blazing fast.
* Testing aids collaboration, so it should be as painless as possible.
* Since we want to write tests, effect execution and logic should be separate.
* What if everything was a dataflow graph?

Features
* Statically typed
* Pattern matching
* Immutable datastructures (with mutable optimizations for common cases)
* Ref-counted, incremental cleanup that can be scheduled. No automatic stop the world GC.
* Multiple syntaxes, users can create and customize syntaxes, and project between.
* Automatic code formatting
* Dev virtual filesystem powered by FUSE to project code into desired syntax.
* Visual editor

