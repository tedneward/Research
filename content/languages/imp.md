title=Imp
tags=language
summary=Imp is a simple, incomplete, interpreted, imperative programming language.
~~~~~~

[Source](https://github.com/nandor/utcn-imp)

The interpreter bundled here consists of a lexer and parser producing an abstract syntax tree, following by a simple code generator lowering it to stack-based bytecode.

In its current form, Imp provides only minimal functionality, as highlighted by the following example:

```
func print_int(a: int): int = "print_int"
func read_int(): int = "read_int"

func add(a: int, b: int): int {
  return a + b
}

while (read_int()) {
  print_int(add(read_int(), read_int()))
}
```

