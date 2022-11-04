title=Feral
tags=language
summary=Dynamically-typed, imperative, interpreted programming language revolving around minimalism.
~~~~~~

[Source](https://github.com/Feral-Lang/Feral) | [Book](https://feral-lang.github.io/Book)

Feral is a dynamically typed, imperative, interpreted language which revolves (to most extent) around the idea of minimalism.

The primary example being that the language syntax itself does not contain anything related to imports, structure, or enums. Instead, there are libraries/functions that allow the user to import modules, and create structures as well as enums.

For feral, all imports, structures, enums, and functions are variables. This makes all of them a first class citizen. One can pass and modify all of those around in functions, etc, just like a normal variable.

Do note that Feral is not an object oriented programming language, but does support one primary construct - the `dot` operator.
```py
variable.inside = 10;
let x = variable.func();
```
This makes the code a bit cleaner and easier to understand. See examples to understand its usage.

# Examples

## Hello World

```py
let io = import('std/io');
io.println('Hello World');
```

## Hello greeting using a function

```py
let io = import('std/io');

let hello_fn = fn(name) {
	io.println('Hello ', name);
};

hello_fn('Electrux'); # prints 'Hello Electrux`
```

## Simple factorial of 5 using a function
```py
let io = import('std/io');

let facto = fn(num) {
	let fact = 1;
	for i in range(num, 1, -1) {
		fact *= i;
	}
	return fact;
};

io.println('factorial of 5 is: ', facto(5));
```

## Creating an empty struct
```py
let lang = import('std/lang');
let struct_t = lang.struct(); # empty structure type (struct with no fields)
```

## Creating a struct with fields
```py
# fields `a` and `b` of type integers having default values `10`, and `20` respectively
let lang = import('std/lang');

let struct_t = lang.struct(a = 10, b = 20);
```
To create objects of this structure:
```py
# default values for struct fields
let struct_obj1 = struct_t(); # a = 10, b = 20

# overwrite first field's value (a)
let struct_obj2 = struct_t(30); # a = 30, b = 20

# overwrite using assigned argument
let struct_obj3 = struct_t(b = 30); # a = 10, b = 30
```
