title=CUE (Configure Unify Execute) Language
tags=distribution, language
summary=Validate, define, and use dynamic and text-based data.
~~~~~~
[Website](https://cuelang.org/) | [Source](https://github.com/cuelang/cue)

> CUE is an open-source data validation language and inference engine with its roots in logic programming. Although the language is not a general-purpose programming language, it has many applications, such as data validation, data templating, configuration, querying, code generation and even scripting. The inference engine can be used to validate data in code or to include it as part of a code generation pipeline.

> A key thing that sets CUE apart from its peer languages is that it merges types and values into a single concept. Whereas in most languages types and values are strictly distinct, CUE orders them in a single hierarchy (a lattice, to be precise). This is a very powerful concept that allows CUE to do many fancy things. It also simplifies matters. For instance, there is no need for generics and enums, sum types and null coalescing are all the same thing.

## Notes
CUE looks a lot like JSON; all valid JSON is CUE (but not vice versa).

C-style comments are allowed. Field names without special characters don’t need to be quoted. Commas after a field are optional (and are usually omitted). Commas after the final element of a list are allowed. The outermost curly braces in a CUE file are optional. JSON objects are called structs or maps in CUE. JSON arrays are called lists. Object members are called fields, which link their name, or label, to a *value*.

Types are values. (Everything is a value.)

A field can be specified with:

* a concrete value such as "foo", 42, or true - something that could be represented in JSON,
* a type such as int or string,
* or something in between the two such as >=500, or !="foo" - not concrete, but more specific than a basic type.

CUE schema
```
municipality: {
	name:    string
	pop:     int
	capital: bool
}
```

CUE constraint
```
largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}
```

Concrete values
```
kinshasa: {
	name:    "Kinshasa"
	pop:     16.32M
	capital: true
}
```

With CUE, we generally start with a broad definition of a schema describing all possible instances and then progressively narrow down these definitions for a particular use case until a concrete data instance remains.

Constraints specify what values are allowed. Constraints are values because **all types are values**. Constraints can reduce boilerplate and simplify the specification of data. If a constraint specifies a field then the field and its value are present everywhere the constraint is unified, and don’t need to be repeated.

In this example, the cue export output includes the data that Viola is a human. This is because the viola field is specified as the unification of a struct which declares Viola’s name and age, and the person constraint which additionally declares the human field. This specification uses the explicit unification operator: &.


file.cue
```
person: {
	name:  string
	age:   int & >=0
	human: true // People are always humans
}

viola: person & {
	name: "Viola"
	age:  38
}
```

TERMINAL
```
$ cue export file.cue -e viola
{
    "name": "Viola",
    "age": 38,
    "human": true
}
```
Unification succeeds because person’s name field constraint of string doesn’t conflict with the concrete value "Viola", and age’s unified constraint of int & >=0 doesn’t conflict with the value 38.

