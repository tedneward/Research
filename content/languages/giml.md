title=Giml
tags=language, functional
summary=A functional programming language with emphasis on structural typing.
~~~~~~

[Website]() | [Source](https://gitlab.com/gilmi/giml-lang)

## Features

* First-class Functions
* Algebraic Data Types
* Pattern Matching
* Extensible Records
* Polymorphic Variants
* Higher Kinded Types
* Purely Functional
* Strict Evaluation
* Static Typing & Type Inference

Written in Haskell / Targets JavaScript

## Example:

```
-- linked list data type and map operation

main = ffi( "console.log", head (map (add 1) list) )

List a =
	| Nil
	| Cons { head : a, tail : List a }

list =
	Cons { head: 1, tail: Cons { head: 2, tail: Nil } }

head list =
	case list of
		| Cons { head: head } ->
			head

map f xs =
	case xs of
		| Nil -> Nil
		| Cons { head: x, tail: rest } ->
			Cons { head: f x, tail: map f rest }
```
