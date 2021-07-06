title=ReasonML
tags=language, functional
summary=
~~~~~~

[Website](https://reasonml.github.io/) [Source](https://github.com/facebook/reason)

Direct derivative of [OCaml](../ocaml). "Reason is a programming language powered by OCaml's strong type system, and has a syntax designed to feel familiar to people coming from JavaScript or C-family languages. Note: Reason can be translated back and forth to OCaml using refmt. Anything possible in Reason is also possible with OCaml and vice versa."

Example from homepage:
```
type schoolPerson = Teacher | Director | Student(string);

let greeting = person =>
  switch (person) {
  | Teacher => "Hey Professor!"
  | Director => "Hello Director."
  | Student("Richard") => "Still here Ricky?"
  | Student(anyOtherName) => "Hey, " ++ anyOtherName ++ "."
  };
```

"There are several projects that allow Reason (and OCaml) to be used in different environments.

* **Native Executables**: Using the standard compiler native executables can be built and run directly on your machine.
    * Tools: [dune](https://dune.build/), [esy](https://github.com/esy/esy)
* **Browsers**: There are several projects that will compile Reason to equivalent JavaScript code that can be run in the browser.
    * [ReScript](https://rescript-lang.org/) (formerly BuckleScript)
    * [Js_of_ocaml](https://ocsigen.org/js_of_ocaml/)

Considers itself a peer to [Rust](../rust), [Elm](../elm), [PureScript](../ecmascript/purescript), F# via Fable, ClojureScript, [Swift](../swift), and [Haxe](../haxe).