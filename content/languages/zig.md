title=Zig
tags=language, native
summary=Robust, optimal, and clear programming language.
~~~~~~

[Website](https://ziglang.org/) | [Source](https://github.com/zig-lang/zig) | [Docs](https://ziglang.org/documentation/0.5.0/)

[Zig at a glance](https://andrewshitov.com/2019/12/22/zig-at-a-glance/)

[A review of Zig (2021)](https://www.duskborn.com/posts/2021-aoc-zig/)

### Installing and running Zig
You can build Zig from source files or install it using a package manager for your operating system. macOS: `$ brew install zig`

Zig is a compiled language; to compile a program, use the build-exe command:

```
$ zig build-exe helloworld.zig
$ ./helloworld
```

Alternative, compile and run in one go:

```
$ zig run helloworld.zig
Hello, World!
```

Let us see the two versions of the program. First, the one that prints to STDERR.

```
const warn = @import("std").debug.warn;

pub fn main() void {
    warn("Hello, World!\n");
}
```

The second program outputs to STDOUT.

```
const std = @import("std");

pub fn main() !void {
    const stdout_file = try std.io.getStdOut();
    try stdout_file.write("Hello, World!\n");
}
```

Notice that this time, you have to think about possible errors: there is a `try` when accessing the standard output and when writing to it. As this version of the main function can end up with an error, its return type is `!void`, not `void` (we’ll return to it later).

### Variables and constants
You define a constant with the `const` keyword, and variables with `var`. The type specifier is expected after a semicolon (Pascal-style).

```
const warn = @import("std").debug.warn;

pub fn main() void {
    const name = "John";
    var age: i32 = 32;

    warn("{} is {} years old.\n", name, age);
}
```

### Functions
Functions are declared with the `fn` keyword. Mark it as `pub`, otherwise it will be left private; public functions are visible to `@import` declarations elsewhere. The type of the arguments is specified after the colon as in variable declaration.

Here is an example of a function that does string concatenation and returns a new string.

```
const warn = @import("std").debug.warn;
const fmt = @import("std").fmt;

var buf: [100]u8 = undefined;

fn greet(name: []const u8) ![]const u8 {
    return fmt.bufPrint(buf[0..], "Hello, {}!", name);
}

pub fn main() void {
    warn("{}\n", greet("John"));
}
```

To concatenate strings, you have to provide the program with a buffer big enough to keep the string. This is a point where an error can happen. If you set the buffer size fixed, you can get an error when you pass a long name. Exceeding the buffer size will end the program with a runtime error: `error.BufferTooSmall`.

Notice that in the current solution, the buffer is reused every time the function is called (and thus, the previous value is lost). Alternatively, you can compute the length needed at runtime and allocate the space, which is another source of a potential error (out of memory).

The return type of the function is `![]const u8`, where an exclamation mark indicates that the function can end up with an error.

### A Factorial example
Here is a program that computes and prints factorials:

```
const warn = @import("std").debug.warn;

fn factorial(n: i32) i32 {
    if (n < 2) return 1
    else return n * factorial(n - 1);
}

pub fn main() void {
    warn("{}\n", factorial(1)); // 1
    warn("{}\n", factorial(5)); // 120
    warn("{}\n", factorial(7)); // 5040
}
```

### Compile-time evaluation
When it is possible to evaluate an expression at compile time, you can mark it with `comptime`. For example, it is possible to modify the factorial example to precompute all the values.

```
const warn = @import("std").debug.warn;
const assert = @import("std").debug.assert;

fn factorial(n: i32) i32 {  
    assert(n > 0);
    if (n < 2) return 1
    else return n * factorial(n - 1);
}

pub fn main() void {
    warn("{}\n", comptime factorial(1)); // 1
    warn("{}\n", comptime factorial(5)); // 120
    warn("{}\n", comptime factorial(7)); // 5040
}
```

Additionally, this program checks if the argument passed to the factorial function is positive. You can try passing a negative number from the main function, and you will get a compile, not a runtime error.

### Catching errors
In some of the previous examples, we saw an exclamation sign in the return type of the functions. Let us dig here a bit deeper by looking at the following example.

```
const warn = @import("std").debug.warn;

fn div(n: i32) !i32 { // Error Union Type
    if (n == 0) return error.BadValue
    else return @divFloor(42, n);
}

pub fn main() !void {
    var x: i32 = 2;
    warn("42 / {} = {}\n", x, try div(x));

    x = 0;
    warn("42 / {} = {}\n", x, try div(x));

    warn("Done.\n");
}
```

In this program, the `div` function can either return an integer or an error. The `!i32` construct is called an *error union type*. The `if` check decides whether it is possible to compute a result; otherwise it returns an error.

In the main function, the call of the `div` function is prefixed with `try`, which is transparent for the result value when there is no error, and propagates an error when it happens.

```
$ zig run div-zero.zig
42 / 2 = 21
error: BadValue
/Users/ash/test/advent-2019/Zig/div-zero.zig:4:17: 0x1036784d8 in _div (run.o)
    if (n == 0) return error.BadValue
                ^
/Users/ash/test/advent-2019/Zig/div-zero.zig:13:31: 0x1036782f5 in _main.0 (run.o)
    warn("42 / {} = {}\n", x, try div(x));
```

Notice that if you remove try, then the output will be completely different, and the program continues after the error:

```
$ zig run div-zero.zig
42 / 2 = 21
42 / 0 = error.BadValue
Done.
```

### Structs
Zig offers C-like structs, which can also have methods, like in C++. In the following program, we create a `Person` structure, then a variable of this type, and then call the info method on the variable.

```
const warn = @import("std").debug.warn;

const Person = struct {
    name: []const u8,
    age: i32,

    pub fn info(self: Person) void {
        warn("{} is {} years old.\n", self.name, self.age);
    }
};

pub fn main() void {
    const p = Person {
        .name = "John",
        .age = 42,
    };

    p.info(); // John is 42 years old.
}
```


https://github.com/ziglang/zig
General-purpose programming language and toolchain for maintaining robust, optimal, and reusable software.
