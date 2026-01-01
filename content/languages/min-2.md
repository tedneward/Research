title=min
tags=language, functional
summary=A functional, concatenative programming language with a minimalist syntax, a small but practical standard library, and an advanced REPL.
~~~~~~

[Website](https://min-lang.org/) | [Source](https://github.com/h3rald/min)

## Features

* Entirely written in Nim. It can be easily embedded in other Nim programs.
* Follows the functional and concatenative programming paradigms.
* Provides a wide range of combinators for advanced stack manipulation and dequoting.
* Provides a minimal set of data types: integer, floats, strings, booleans, dictionaries, and quotations (lists).
* Homoiconic, code can be accessed as data.
* Includes an advanced REPL with auto-completion and history management.
* Provides a lightweight module system.
* Provides sigils as syntactic sugar to access environment variables, quoting, defining and binding data, etc.
* Includes a small but useful standard library for practical tasks.
* Self-contained, statically compiled into single file.

## Examples
The following example shows how to find recursively all files in the current folder that were modified in the last hour:

```
sys.pwd sys.ls-r 
(fs.mtime time.now 3600 - >) 
filter
```

The following example shows how to calculate the factorial of 5 using the linrec combinator:

```
5 
(stack.dup 0 ==) (1 +) 
(stack.dup 1 -) (*) linrec
```

