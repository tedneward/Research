title=Lys
tags=language, web assembly
summary=A language that compiles to WebAssembly.
~~~~~~

[Website](https://lys-lang.dev/) | [Source](https://github.com/lys-lang/lys)

### Types and overloads are created in the language itself
The compiler only knows how to emit functions and how to link function names. I did that so I had fewer things hardcoded into the compiler and allows me to write the language in the language.

To do that, I had to add either a %wasm { ... } code block, and a %stack { ... } type.

* `%wasm { ... }`: can only be used as a function body, not as an expression. It is literally the code that will be emited to WAST. The parameter names remain the same (prefixed with `$` as WAST indicates). Other symbols can be resolved with `fully::qualified::names`.

* `%stack { wasm="i32", size=4 }`: it is a type literal, it indicates how much memory should be allocated in structs (`size`) and what type to use in locals and function parameters (`wasm`, it needs a better name).
```
/** We first define the type `int` */
type int = %stack { wasm="i32", size=4 }

/** Implement some operators for the type `int` */
impl int {
  fun +(lhs: int, rhs: int): int = %wasm {
    (i32.add (get_local $lhs) (get_local $rhs))
  }
  fun -(lhs: int, rhs: int): int = %wasm {
    (i32.sub (get_local $lhs) (get_local $rhs))
  }
  fun >(lhs: int, rhs: int): boolean = %wasm {
    (i32.gt_s (get_local $lhs) (get_local $rhs))
  }
}

fun fibo(n: int, x1: int, x2: int): int = {
  if (n > 0) {
    fibo(n - 1, x2, x1 + x2)
  } else {
    x1
  }
}

#[export "fibonacci"] // "fibonacci" is the name of the exported function
fun fib(n: int): int = fibo(n, 0, 1)
```
