title=Mun
tags=language, vm, llvm
summary=A programming language empowering creation through iteration.
~~~~~~

[Website](https://mun-lang.org/) | [Source](https://github.com/mun-lang/mun) | [Book](https://docs.mun-lang.org/)

### Examples:
```
fn fibonacci(n: i32) -> i32 {
    if n <= 1 {
        n
    } else {
        fibonacci(n - 1) + fibonacci(n - 2)
    }
}

// Comments: functions marked as `pub` can be called outside the module
pub fn main() {
    // Native support for bool, f32, f64, i8, u8, u128, i128, usize, isize, etc
    let is_true = true;
    let var = 0.5;

    // Type annotations are not required when a variable's type can be deduced
    let n = 3;

    let result = fibonacci(n);

    // Adding a suffix to a literal restricts its type
    let lit = 15u128;

    let foo = record();
    let bar = tuple();
    let baz = on_heap();
}

// Both record structs and tuple structs are supported
struct Record {
    n: i32,
}

// Struct definitions include whether they are allocated by a garbage collector
// (`gc`) and passed by reference, or passed by `value`. By default, a struct
// is garbage collected.
struct(value) Tuple(f32, f32);

struct(gc) GC(i32);

// The order of function definitions doesn't matter
fn record() -> Record {
    // Mun allows implicit returns
    Record { n: 7 }
}

fn tuple() -> Tuple {
    // Mun allows explicit returns
    return Tuple(3.14, -6.28);
}

fn on_heap() -> GC {
    GC(0)
}
```
