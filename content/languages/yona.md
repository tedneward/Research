title=Yona
tags=language, functional, strongly-typed
summary=A minimalistic, (strongly) dynamically typed, parallel and non-blocking, polyglot, strict, functional programming language, with ML-like syntax.
~~~~~~

[Website](https://yona-lang.org/) | [Source](https://github.com/yona-lang/yona/)

Part of GraalVM.

Yona abstract users from dealing with non-blocking asynchronous computations and parallelism. While these features are commonly available in other languages nowadays, they are almost exclusively non-native solutions that come in forms of libraries or frameworks and are difficult to integrate with existing codebases. On top of that, dealing with these additional libraries requires a conscious effort of the programmer to choose/learn/integrate these libraries into their mindset when writing new code.

Goals & Priorities

* Excellent readability - simple syntax, few keywords, virtually no boilerplate.
* Few types of expressions - module, import, function(function does not need a keyword, it is defined by a name and arguments - patterns), case, if, let, do, with and try/catch + raise.
* Simple module system - ability to expose functions for use in other modules, and ability to import them from other modules. Modules are first level values and can be created dynamically.
* Single expression principle - program is always one expression - this enables simpler evaluation and syntax, allows writing simple scripts as well as complex applications.
* Powerful and efficient built-in immutable data structures with full support for pattern matching, including Sequence, Dictionary and Set.
* Custom data types re presentable as records.
* Built-in runtime level non-blocking asynchronous IO.
* Simple concurrency, built-into runtime, no need for any abstractions such as Futures, Channels or Actors.
* Advanced concurrency provided by built-in Software Transactions Memory (STM) module.
* Polyglot language - interoperability with other languages via GraalVM.
* Powerful resource management - automatically manage resources using built-in context manager infrastructure.

