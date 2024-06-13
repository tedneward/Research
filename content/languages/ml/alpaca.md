title=Alpaca
tags=language
summary=Functional programming inspired by ML for the Erlang VM.
~~~~~~

[Github](https://github.com/alpaca-lang/alpaca/)

Something that looks and operates a little bit like an ML on the Erlang VM with:

* Static typing of itself. We're deliberately ignoring typing of Erlang code that calls into Alpaca.
* Parametric polymorphism
* Infinitely recursive functions as a distinct and allowable type for processes looping on receive.
* Recursive data types
* Syntax somewhere between OCaml and Elm
* FFI to Erlang code that does not allow the return of values typed as term() or any()
* Simple test annotations for something like eunit, tests live beside the functions they test

The above is still a very rough and incomplete set of wishes. In future it might be nice to have dialyzer check the type coming back from the FFI and suggest possible union types if there isn't an appropriate one in scope.

## Example module
```
module simple_example

-- a basic top-level function:
let add2 x = x + 2

let something_with_let_bindings x =
  -- a function:
  let adder a b = a + b in
  -- a variable (immutable):
  let x_plus_2 = adder x 2 in
  add2 x

-- a polymorphic ADT:
type messages 'x = 'x | Fetch pid 'x

{- A function that can be spawned to receive `messages int`
    messages, that increments its state by received integers
    and can be queried for its state.
-}
let will_be_a_process x = receive with
    i -> will_be_a_process (x + i)
  | Fetch sender ->
    let sent = send x sender in
    will_be_a_process x

let start_a_process init = spawn will_be_a_process init
```
