title=G#
tags=language, clr
summary=A modern .NET language with Go, Kotlin, and Swift ergonomics.
~~~~~~

[Website](https://davidobando.github.io/gsharp/) | [Source](https://github.com/DavidObando/gsharp) | [Specification](https://davidobando.github.io/gsharp/docs/ref/spec)

## Getting Started

### Start with the project template

The fastest path is the `Gsharp.Templates` package. It scaffolds a console app that uses `Gsharp.NET.Sdk` and can be built and run like any other .NET project.

```
dotnet new install Gsharp.Templatesdotnet new gsharp-console -n MyAppcd MyApp && dotnet build && dotnet run# -> Hello from GSharp!
```

The generated project includes a `.gsproj`, a starter `Program.gs`, a `NuGet.config` that enables optional local SDK side-loading, and a README.

### Author a project by hand

A minimal project file looks like this:

HelloWorld.gsproj

```
<Project Sdk="Gsharp.NET.Sdk">  <PropertyGroup>    <OutputType>Exe</OutputType>    <TargetFramework>net10.0</TargetFramework>    <RootNamespace>HelloWorld</RootNamespace>  </PropertyGroup></Project>
```

The SDK automatically includes `.gs` files in the project directory, forwards references and build settings to `gsc`, and supports regular commands such as:

```
dotnet builddotnet run
```

If you are developing the SDK itself and want to side-load a locally packed build, copy the package into the project's configured package source before building:

```
mkdir -p packagescp /path/to/Gsharp.NET.Sdk.VERSION.nupkg packages/dotnet build
```

See [SDK projects](https://davidobando.github.io/gsharp/docs/tooling/sdk-projects) for the full project-system walkthrough.

### Install the VS Code extension

The G# VS Code extension is published on the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=gsharplang.vscode-gsharp). It adds syntax highlighting, language-server features, build/run commands, and debugger configuration for `.gs` and `.gsproj` files. Install it from within VS Code (search for "G#" in the Extensions view) or from the command line:

```
code --install-extension gsharplang.vscode-gsharp
```

See [the VS Code extension reference](https://davidobando.github.io/gsharp/docs/tooling/vscode) for the full feature list and settings.

## Tour of G#

G# programs are organized into packages, can import CLR namespaces, and use `func` for executable code.

HelloWorld.gs

```
package HelloWorldimport Systemfunc Main() {
    Console.WriteLine("Hello, world!")
}
```

```
Hello, world!
```

`Console` comes from the .NET `System` namespace. The compiler also has an implicit `System` import by default; `/noimplicitimports` disables it.

## Variables and constants

G# has `var`, `let`, and `const` declarations. `var` is mutable and may be declared with an explicit type and no initializer, which gives it the type's zero value. `let` is for values that are initialized once, including deconstruction forms. `const` is for compile-time constants.

```
package Tour.Basics.Variables

import System

func Main() {
    var total = 0
    let name = "G#"
    const answer = 42
    total = total + answer
    Console.WriteLine(name)
    Console.WriteLine(total)
}
```

Zero values are useful when a variable will be assigned later:

ZeroValues.gs

```
package GSharp.Example.ZeroValues
import System
func Main() {
    var x int32
    var flag bool
    var text string
    Console.WriteLine("x=${x} flag=${flag} text=[${text}]")
    x = 42
    flag = true
    text = "set"
    Console.WriteLine("x=${x} flag=${flag} text=[${text}]")
}
```

```
x=0 flag=False text=[]
x=42 flag=True text=[set]
```

## Functions

Functions begin with `func`. Parameters are named, their types follow the names, and an optional return type follows the parameter list.

Arithmetic.gs

```
package GSharp.Example.Arithmetic
import System
func add(num1 int32, num2 int32) int32 {
    return num1 + num2}
func Main() {
    var sum = 0
    for i in 1 ... 5 {
        sum = sum + i
    }
    Console.WriteLine(add(2, 3))
    Console.WriteLine(sum)
}
```

```
510
```

### Variadic parameters

A parameter declared with an ellipsis between its name and its element type — `name ...T` — accepts any number of trailing arguments. Inside the body the parameter is a slice (`[]T`); the call site can pass either positional arguments or a single `[]T` value.

Variadic.gs

```
package GSharp.Example.Variadicimport Systemfunc sum(nums ...int32) int32 {    var total = 0    for v in nums {        total = total + v    }    return total}func Main() {    Console.WriteLine(sum(1, 2, 3, 4, 5))    Console.WriteLine(sum())    let arr = []int32{10, 20, 30}    Console.WriteLine(sum(arr))}
```

```
15060
```

The emitted method carries `[System.ParamArrayAttribute]` so it is consumable from C# / F# / VB as if it had been declared with `params T[]`.

## Basic types and strings[​](https://davidobando.github.io/gsharp/docs/tour/basics#basic-types-and-strings "Direct link to Basic types and strings")

The primitive names are explicit about width: `bool`, `int32`, `uint32`, `int64`, `uint64`, `float32`, `float64`, `decimal`, `char`, `string`, and `object` are common examples. Friendly aliases such as `int`, `long`, `byte`, `float`, and `double` resolve to their canonical width-bearing types.

Strings support sigil-free interpolation with `$name` and braced `${expr}` holes inside ordinary string literals. Holes may add an alignment and format clause, `${expr,alignment:format}`:

InterpolatedString.gs

```
package InterpolatedStringimport Systemfunc Main() {    let name = "world"    let n = 6    Console.WriteLine("Hello, $name!")    Console.WriteLine("answer = ${n * 7}")    Console.WriteLine("$$ stays literal")}
```

```
Hello, world!answer = 42$ stays literal
```

## Nullable fallback with `??`[​](https://davidobando.github.io/gsharp/docs/tour/basics#nullable-fallback-with- "Direct link to nullable-fallback-with-")

The null literal is `nil`. Nullable types use `?`, and the null-coalescing operator is `??`:

NullCoalescing.gs

```
package GSharp.Example.NullCoalescingimport Systemfunc displayName(name string?) string {    return name ?? "friend"}func Main() {    let given string? = "Ada"    let missing string? = nil    Console.WriteLine(displayName(given))    Console.WriteLine(displayName(missing))}
```

Use `??` for null-coalescing reads. `??=` remains the compound assignment form for writable nullable values.

# Tour: Types and values

G# has value-oriented structs, reference-oriented classes, data structs, data classes, arrays, slices, maps, tuples, sequences, channels, and function types. This chapter focuses on everyday aggregate and collection shapes.

## Structs and classes[​](https://davidobando.github.io/gsharp/docs/tour/types#structs-and-classes "Direct link to Structs and classes")

A `struct` is value-like. Assigning one struct variable to another copies the value.

Struct.gs

```
package GSharp.Example.Structimport Systemstruct Point {    var X int32    var Y int32}func Main() {    var p = Point{X: 3, Y: 4}    Console.WriteLine(p.X + p.Y)    p.X = 10    Console.WriteLine(p.X)    var q = p    q.X = 99    Console.WriteLine(p.X)    Console.WriteLine(q.X)    var origin = Point{}    Console.WriteLine(origin.X + origin.Y)}
```

```
71010990
```

A `class` is reference-like. Assigning a class value copies the reference, so both variables observe later field changes.

Class.gs

```
package Tour.Types.Classimport Systemclass Point {    var X int32    var Y int32}func Main() {    var p = Point{X: 3, Y: 4}    var q = p    q.X = 99    Console.WriteLine(p.X)}
```

## Data classes and data structs[​](https://davidobando.github.io/gsharp/docs/tour/types#data-classes-and-data-structs "Direct link to Data classes and data structs")

`data struct` and `data class` add ergonomic value-record behavior: structural equality, `with`\-copy, and deconstruction. `data struct` is value-typed; `data class` is reference-typed.

DataStruct.gs

```
package GSharp.Example.DataStructimport Systemdata struct Point {    var X int32    var Y int32}func Main() {    var p = Point{X: 3, Y: 4}    var q = Point{X: 3, Y: 4}    var r = Point{X: 3, Y: 5}    Console.WriteLine(p == q)    Console.WriteLine(p != r)    Console.WriteLine(q == r)}
```

```
TrueTrueFalse
```

The longer data-struct sample also shows `copy`, `with`, and deconstruction:

DataStructErgonomics.gs

```
package GSharp.Example.DataStructErgonomicsimport Systemdata struct Point {    var x int32    var y int32}func Main() {    let p = Point{x: 3, y: 4}    let same = p.copy()    let movedX = p.copy(x: 10)    let viaWith = p with { x = 10 }    let (px, py) = p    Console.WriteLine(p == same)    Console.WriteLine(movedX == viaWith)    Console.WriteLine(px + py)}
```

## Arrays and slices[​](https://davidobando.github.io/gsharp/docs/tour/types#arrays-and-slices "Direct link to Arrays and slices")

Fixed-size literals use `[N]T{...}`. Slice literals use `[]T{...}`. The 0.3 runtime allocation form `[n]T` creates a zero-initialized `[]T` of length `n`.

ArraysAndSlices.gs

```
package GSharp.Example.ArraysAndSlicesimport Systemfunc zeros(n int32) []int32 {    return [n]int32}func Main() {    let fixed = [3]int32{10, 20, 30}    let slice = []int32{1, 2, 3}    let runtime = zeros(4)    Console.WriteLine(fixed[0])    Console.WriteLine(slice.Length)    Console.WriteLine(runtime.Length)    Console.WriteLine(runtime[0])}
```

## CLR collection initializers[​](https://davidobando.github.io/gsharp/docs/tour/types#clr-collection-initializers "Direct link to CLR collection initializers")

CLR collections can be created with `List[T]{...}`, `HashSet[T]{...}`, and `Dictionary[K,V]{...}` initializers. Dictionary entries use `key: value`; use `[key] = value` when the key is an identifier expression.

CollectionInitializers.gs

```
package GSharp.Example.CollectionInitializersimport Systemimport System.Collections.Genericfunc Main() {    var primes = List[int32]{2, 3, 5, 7}    var seen = HashSet[string]{"red", "green", "blue"}    var counts = Dictionary[string, int32]{"gsharp": 1, "dotnet": 2}    primes.Add(11)    counts["gsharp"] = counts["gsharp"] + 1    Console.WriteLine(primes.Count)    Console.WriteLine(seen.Contains("red"))    Console.WriteLine(counts["gsharp"])}
```

Maps use `map[K,V]` for G# map literals, and CLR collections such as `Dictionary[string, int32]` are available through imports.

Maps.gs

```
package Tour.Types.Mapsimport Systemfunc Main() {    var counts = map[string,int32]{"gsharp": 1}    counts["gsharp"] = counts["gsharp"] + 1    Console.WriteLine(counts["gsharp"])}
```

## Anonymous objects[​](https://davidobando.github.io/gsharp/docs/tour/types#anonymous-objects "Direct link to Anonymous objects")

A field-only anonymous object is written `object { ... }`. Field types may be inferred, and fields are available through properties on the resulting value.

AnonymousObject.gs

```
package GSharp.Example.AnonymousObjectimport Systemfunc Main() {    let profile = object {        let Name = "Ada"        let Language = "G#"        let Score int32 = 99    }    Console.WriteLine(profile.Name)    Console.WriteLine(profile.Score)}
```

Use `data object { ... }` when you want value-style equality, `ToString`, deconstruction, and `with`\-copy support.

## Zero values[​](https://davidobando.github.io/gsharp/docs/tour/types#zero-values "Direct link to Zero values")

A composite literal with no fields uses the zero value for each field. A `var` declaration with an explicit type and no initializer also starts at the type's zero value: `0` for numeric types, `False` for `bool`, `nil` for reference types (including `string`), and `nil` for nullable values.

The same zero value can be spelled directly as `default(T)` for any type `T`. The bare `default` literal is accepted wherever the target type is known from context.

## A note on `nil` vs `null`[​](https://davidobando.github.io/gsharp/docs/tour/types#a-note-on-nil-vs-null "Direct link to a-note-on-nil-vs-null")

The null literal in G# is spelled `nil`, not `null`. Typing `null` in a value position reports `GS0273` and the binder treats it as `nil` so the rest of the expression still typechecks.

