title=Temper
tags=language, jvm, clr, ecmascript, python, native, literate
summary=A programming language for libraries translated to all the others.
~~~~~~

[Website](https://temperlang.dev/) | [Source](https://github.com/temperlang/temper) | [Playground](https://play.temperlang.dev/)

## Getting Started
To start a library, do the following:

1. Create an empty directory somewhere called "hello".
2. In that directory, run: `temper init`

This creates the following files under the "src/" directory:

`config.temper.md` - A library configuration file.
`hello.temper.md` - A file to start writing your library code.

The file "src/hello.temper.md" looks like this:

        # Implementation for Hello

        Library discussion goes here.

            // Library implementation code goes here.

        Additional documentation and code blocks may follow.

Temper supports literate programming, where your Temper source is embedded in Markdown. It goes inside temper code blocks, where the default language is temper, so you can leave that off or even just use indented code blocks, as in the example above. Any markdown outside such blocks is a comment section ignored by the Temper compiler. If you prefer, you can also use plain .temper files.

For now, replace this comment:

        // Library implementation code goes here.

With this code (still indented):

        export let greetingFor(name: String): String {
        // The following expression is the return value,
        // if we leave off the trailing semicolon.
        "Hello, ${name}!"
        }

Congratulations! You've now written your first library in Temper.

Now that we have a library, we can build it: `temper build`

This command creates several output files, including the following:

        # C#
        ./temper.out/csharp/hello/src/Hello.csproj
        ./temper.out/csharp/hello/src/Hello/HelloGlobal.cs

        # Java
        ./temper.out/java/hello/pom.xml
        ./temper.out/java/hello/src/main/java/hello/hello/HelloGlobal.java

        # JS
        ./temper.out/js/hello/package.json
        ./temper.out/js/hello/hello.js

        # Lua
        ./temper.out/lua/hello/hello-dev-1.rockspec
        ./temper.out/lua/hello/hello.lua

        # Python
        ./temper.out/py/hello/pyproject.toml
        ./temper.out/py/hello/hello/hello.py

        # Rust
        ./temper.out/rust/hello/Cargo.toml
        ./temper.out/rust/hello/src/mod.rs

Default backends are C#, Java 17, JS, Lua 5.1, Python, and Rust. These are identified by backend names "csharp", "java", "js", "lua", "py", and "rust".

## Examples

Person
```
export class Person(
  public birthDate: Date,
) {
  public ageAt(date: Date): Int {
    // Or support other definitions of age.
    Date.yearsBetween(birthDate, date)
  }
}
```

Interfaces
```
export interface Shape {
  public perimeter(): Float64;
}

export class Rectangle(
  public width: Float64,
  public height: Float64,
) extends Shape {
  public perimeter(): Float64 { 2.0 * (width + height) }
}

let tau = 2.0 * Float64.pi;

export class Circle(
  public radius: Float64,
) extends Shape {
  public perimeter(): Float64 { tau * radius }
}
```

When
```
export let area(shape: Shape): Float64 {
  when (shape) {
    is Rectangle -> shape.width * shape.height;
    is Circle -> do {
      let { radius } = shape;
      0.5 * tau * radius * radius
    }
    else -> NaN; // needed until exhaustiveness checks
  }
}
```

Test
```
test("age") {
  let person = new Person(new Date(1987, 6, 5));
  let age = person.ageAt(new Date(2023, 2, 1));
  // You can give a custom failure message callback.
  assert(age == 35) { "Bad age: ${age}" }
  // Or just use automatic messaging.
  // Reports "expected age == (36) not (35)"
  assert(age == 36);
}
```

Document
```
## Circle

Tau (τ) is a full turn in radians, rather than the half turn of pi (π).

    let τ = 2.0 * Float64.pi;

    export class Circle(
      public radius: Float64,
    ) {

Using `τ` rather than `π` simplifies some calculations and complicates
others.

      public perimeter(): Float64 { τ * radius }
    }
```

