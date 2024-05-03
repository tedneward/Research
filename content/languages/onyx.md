title=Onyx
tags=language, wasm
summary=An efficient, procedural, and pragmatic programming language, compiling solely to WebAssembly.
~~~~~~

[Website](https://onyxlang.io/) | [Source](https://github.com/onyx-lang/onyx)

## Syntax

Modern syntax
```
use core { printf, iter }

main :: () {
    for i in 1 .. 10 {
        fact := factorial(i)
        printf("{}! = {}\n", i, fact)
    }
}

factorial :: (n: i32) -> i32 {
    return iter.as_iter(1 .. n)
        |> iter.fold(1, (x, y) => x * y)
}
```

Type Safety
```
use core { printf }

main :: () {
    // Inferred variable type
    x := 10

    // Function with entirely inferred types.
    change_value :: x => x + 10

    // Onyx figures out the types of
    // `change_value` when you call it.
    printf("Value: {}.\n", change_value(x))
}
```