title=Wasm-tools
tags=tool, platform, language, wasm
summary=A collection of tools for WebAssembly modules and components.
~~~~~~

[Source](https://github.com/bytecodealliance/wasm-tools)

# Installation

Installation can be confirmed with:

```
$ wasm-tools --version
```

Subcommands can be explored with:

```
$ wasm-tools help
```

# Examples

Basic validation/printing/parsing:

```sh
# Validate a WebAssembly file
$ wasm-tools validate foo.wasm

# Validate a WebAssembly module in the text format, automatically converting to
# binary.
$ wasm-tools validate foo.wat

# Validate a WebAssembly file enabling an off-by-default feature
$ wasm-tools validate foo.wasm --features=exception-handling

# Validate a WebAssembly file with a default-enabled feature disabled
$ wasm-tools validate foo.wasm --features=-simd

# Print the text format of a module to stdout
$ wasm-tools print foo.wasm

# Convert a binary module to text
$ wasm-tools print foo.wasm -o foo.wat

# Convert a text module to binary
$ wasm-tools parse foo.wat -o foo.wasm
```

Simple mutation as well as piping commands together:

```sh
# Mutate a WebAssembly module and print its text representation to stdout
$ wasm-tools mutate foo.wasm -t

# Mutate a WebAssembly module with a non-default seed and validate that the
# output is a valid module.
$ wasm-tools mutate foo.wasm --seed 192 | wasm-tools validate

# Demangle Rust/C++ symbol names in the `name` section, strip all other custom
# sections, and then print out what binary sections remain.
$ wasm-tools demangle foo.wasm | wasm-tools strip | wasm-tools objdump
```

Working with components:

```sh
# Print the WIT interface of a component
$ wasm-tools component wit component.wasm

# Convert WIT text files to a binary-encoded WIT package, printing the result to
# stdout
$ wasm-tools component wit ./wit -t

# Convert a WIT document to JSON
$ wasm-tools component wit ./wit --json

# Round trip WIT through the binary-encoded format to stdout.
$ wasm-tools component wit ./wit --wasm | wasm-tools component wit

# Convert a core WebAssembly binary into a component. Note that this requires
# WIT metadata having previously been embedded in the core wasm module.
$ wasm-tools component new my-core.wasm -o my-component.wasm

# Convert a core WebAssembly binary which uses WASI to a component.
$ wasm-tools component new my-core.wasm -o my-component.wasm --adapt wasi_snapshot_preview1.reactor.wasm
```

### CLI Conventions

There are a few conventions that all CLI commands adhere to:

* All subcommands print "short help" with `-h` and "long help" with `--help`.
* Input is by default read from stdin if no file input is specified (when applicable).
* Output is by default sent to stdout if a `-o` or `--output` flag is not provided. Binary WebAssembly is not printed to a tty by default, however.
* Commands which output WebAssembly binaries all support a `-t` or `--wat` flag to generate the WebAssembly text format instead.
* A `-v` or `--verbose` flag can be passed to enable log messages throughout the tooling. Verbosity can be turned up by passing the flag multiple times such as `-vvv`.
* Color in error messages and console output is enabled by default for TTY based outputs and can be configured with a `--color` argument.

# Tools included

The `wasm-tools` binary internally contains a number of subcommands for working with wasm modules and component. Many subcommands also come with Rust crates that can be use programmatically as well:

| CLI | Rust Crate | Playground | Description |
|------|------|--------|------------|
| `wasm-tools validate` | [wasmparser] |  | Validate a WebAssembly file |
| `wasm-tools parse` | [wat] and [wast] | [parse](https://bytecodealliance.github.io/wasm-tools/parse) | Translate the WebAssembly text format to binary |
| `wasm-tools print` | [wasmprinter] | [print](https://bytecodealliance.github.io/wasm-tools/print) | Translate the WebAssembly binary format to text |
| `wasm-tools smith` | [wasm-smith] |  | Generate a valid WebAssembly module from an input seed |
| `wasm-tools mutate` | [wasm-mutate] |  | Mutate an input wasm file into a new valid wasm file |
| `wasm-tools shrink` | [wasm-shrink] |  | Shrink a wasm file while preserving a predicate |
| `wasm-tools dump` |   |  | Print debugging information about the binary format |
| `wasm-tools objdump` |   |  | Print debugging information about section headers |
| `wasm-tools strip` |   |  | Remove custom sections from a WebAssembly file |
| `wasm-tools demangle` |   |  | Demangle Rust and C++ symbol names in the `name` section |
| `wasm-tools compose` | [wasm-compose] |  | Compose wasm components together (*deprecated*) |
| `wasm-tools component new` | [wit-component] |  | Create a component from a core wasm binary |
| `wasm-tools component wit` |  |  | Extract a `*.wit` interface from a component |
| `wasm-tools component embed` |  |  | Embed a `component-type` custom section in a core wasm binary |
| `wasm-tools component unbundle` |  |  | Extract core wasm modules from a component |
| `wasm-tools metadata show` |  [wasm-metadata] |  | Show name and producer metadata in a component or module |
| `wasm-tools metadata add` |  |  | Add name or producer metadata to a component or module |
| `wasm-tools addr2line` |  |  | Translate wasm offsets to filename/line numbers with DWARF |
| `wasm-tools completion` |  |  | Generate shell completion scripts for `wasm-tools` |
| `wasm-tools json-from-wast` |  |  | Convert a `*.wast` file into JSON commands |
| `wasm-tools wast` |  |  | Validate the structure of a `*.wast` file |

[wasmparser]: https://crates.io/crates/wasmparser
[wat]: https://crates.io/crates/wat
[wast]: https://crates.io/crates/wast
[wasmprinter]: https://crates.io/crates/wasmprinter
[wasm-smith]: https://crates.io/crates/wasm-smith
[wasm-mutate]: https://crates.io/crates/wasm-mutate
[wasm-shrink]: https://crates.io/crates/wasm-shrink
[wit-component]: https://crates.io/crates/wit-component
[wasm-compose]: https://crates.io/crates/wasm-compose
[wasm-metadata]: https://crates.io/crates/wasm-metadata

The `wasm-tools` CLI contains useful tools for debugging WebAssembly modules and components. The various subcommands all have `--help` explainer texts to describe more about their functionality as well.

# Language support

## JavaScript Tooling

[WebAssembly][mdn-wasm] was originally developed as a technology for running non-JavaScript workloads in the browser at near-native speed.

JavaScript WebAssembly component model support is provided by a combination of tools:

- [StarlingMonkey][sm] a WebAssembly component aware Javascript engine
- [`componentize-js`][componentize-js] a tool for building WebAssembly components from Javascript files
- [`jco`][jco] a multi-tool for componentizing, type generation, and running components in NodeJS and browser contexts

Note that [Typescript][ts] can *also* be used, given that it is transpiled to JS first by relevant tooling (`tsc`). `jco` generates [type declaration files (`.d.ts`)][ts-decl-file] by default, and also has a `jco types` subcommand which generates typings that can be used with a Typescript codebase.

> [!WARNING]
> While popular projects like [`emscripten`][emscripten] also build WebAssembly modules, those modules are not Component Model aware.
>
> Core WebAssembly modules do not contain the advanced features (rich types, structured language interoperation, composition) that the component model makes available.

[emscripten]: https://emscripten.org/
[ts]: https://typescriptlang.org
[mdn-wasm]: https://developer.mozilla.org/en-US/docs/WebAssembly
[jco]: https://github.com/bytecodealliance/jco
[componentize-js]: https://github.com/bytecodealliance/componentize-js
[sm]: https://github.com/bytecodealliance/StarlingMonkey

## Installing `jco`

Installing [`jco`][jco] (which uses [`componentize-js`][componentize-js] can be done via standard NodeJS project tooling:

```console
npm install -g @bytecodealliance/jco
```

> [!NOTE]
> `jco` and `componentize-js` can be installed in a project-local manner with `npm install -D`

## Overview of Building a Component with JavaScript

Building a WebAssembly component with JavaScript often consists of:

1. Determining which interface our functionality will target (i.e. a [WebAssembly Interface Types ("WIT")][wit] world)
2. Writing JavaScript that satisfies the interface
3. Compiling the interface-compliant JavaScript to WebAssembly

### What is WIT?

[WebAssembly Interface Types ("WIT")][wit] is a featureful Interface Definition Language ("IDL") for defining functionality, but most of the time, you shouldn't need to write WIT from scratch. Often, it's sufficient to download a pre-existing interface that defines what your component should do.

The [`adder` world][adder-world] contains an interface with a single `add` function that sums two numbers:

```wit
{{#include ../../exmaples/tutorial/wit/adder/world.wit}}
```

> [!NOTE]
> `export`ing the `add` interface means that environments that interact with the resulting WebAssembly component
> will be able to *call* the `add` function (fully qualified: `docs:adder/add.add@0.1.0`).
>
> To learn more about the WIT syntax, check out the [WIT explainer][wit-explainer]

[adder-world]: https://github.com/bytecodealliance/component-docs/tree/main/component-model/examples/tutorial/wit/adder/world.wit
[wit-example-world]: https://github.com/bytecodealliance/component-docs/tree/main/component-model/examples/example-host/add.wit
[wit-explainer]: https://component-model.bytecodealliance.org/design/wit.html

## Implementing a JS WebAssembly Component

To implement the [`adder` world][adder-world], we can write a [JavaScript ES module][mdn-js-module]:

```js
export const add = {
    add(x, y) {
        return x + y;
    }
};
```

> [!WARNING]
> When building your JavaScript project, ensure to set the `"type":"module"` option in `package.json`, as `jco` works exclusively with JavaScript modules.

In the code above:

- The `adder` world is analogous to the JavaScript module (file) itself
- The exported `add` object mirrors the `export`ed `add` interface in WIT
- The `add` function mirrors the `add` function inside the `add` interface

With the WIT and JavaScript in place, we can use [`jco`][jco] to create a WebAssembly component from the JS module, using `jco componentize`.

> [!NOTE]
> You can also call `componentize-js` directly -- it supports both API driven usage and has a CLI.

Our component is *so simple* (reminiscent of [Core WebAssembly][wasm-core], which deals only in numeric values) that we're actually *not using* any of the [WebAssembly System Interface][wasi] (access to files, network, etc). This means that we can `--disable` all unneeded WASI functionality when we invoke `jco componentize`:

```console
jco componentize \
    --wit path/to/adder/world.wit \
    --world-name example \
    --out adder.wasm \
    --disable all \
    path/to/adder.js
```

> [!NOTE]
> If you're using `jco` as a project-local dependency, you can run `npx jco`

You should see output like the following:

```
OK Successfully written adder.wasm.
```

> [!WARNING]
> By using `--disable all`, your component won't get access to any WASI interfaces that might be useful for debugging or logging.
>
> For example, you can't `console.log(...)` or `console.error(...)` without `stdio`; you can't use `Math.random()` without `random`; and you can't use `Date.now()` or `new Date()` without `clocks`.
>
> Please note that calls to `Math.random()` or `Date.now()` will return seemingly valid outputs, but without actual randomness or timestamp correctness.

[mdn-js-module]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules

### Running the Component in the `example-host`

To run the component we've built, we can use the [`example-host` project][example-host]:

```console
cd component-model/examples/example-host
cargo run --release -- 1 2 ../path/to/adder.wasm
1 + 2 = 3
```

> [!WARNING]
> The [`example-host` Rust project][example-host] uses the [Rust toolchain][rust-toolchain], in particular [`cargo`][cargo],
> so to run the code in this section you may need to install some more dependencies (like the Rust toolchain).

While the output isn't exciting, the code contained in `example-host` does a lot to make it happen:

- Loads the WebAssembly binary at the provided path (in the command above, `../path/to/adder.wasm`)
- Calls the `export`ed `add` function inside the `add` interface with arguments
- Prints the result

The important Rust code looks something like this:

```rust
let component = Component::from_file(&engine, path).context("Component file not found")?;

let (instance, _) = Example::instantiate_async(&mut store, &component, &linker)
    .await
    .context("Failed to instantiate the example world")?;

instance
    .call_add(&mut store, x, y)
    .await
    .context("Failed to call add function")
```

A quick reminder on the power and new capabilities afforded by WebAssembly -- we've written, loaded,
instantiated and executed JavaScript from Rust with a strict interface, without the need
for [FFI][ffi], subprocesses or a network call.

[rust-toolchain]: https://www.rust-lang.org/tools/install
[example-host]: https://github.com/bytecodealliance/component-docs/tree/main/component-model/examples/example-host
[wit]: https://github.com/WebAssembly/component-model/blob/main/design/mvp/WIT.md
[nodejs]: https://nodejs.org/en
[cargo]: https://doc.rust-lang.org/cargo
[wasi]: https://wasi.dev/
[wasm-core]: https://webassembly.github.io/spec/core/
[ffi]: https://en.wikipedia.org/wiki/Foreign_function_interface

### Running a Component from JavaScript Applications (including the Browser)

While JavaScript runtimes available in browsers can execute WebAssembly core modules, they cannot yet execute WebAssembly *components*, so WebAssembly components (JavaScript or otherwise) must be "transpiled" into a JavaScript wrapper and one or more [WebAssembly core modules][wasm-core-module] which *can* be run by available WebAssembly engines.

Given an existing WebAssembly component (e.g. `adder.wasm` which implements the [`adder` world][adder-world]), we can "transpile" the WebAssembly component into runnable JavaScript by using `jco transpile`:

```console
jco transpile adder.wasm -o dist/transpiled
```

You should see output similar to the following:

```
  Transpiled JS Component Files:

 - dist/transpiled/adder.core.wasm                   10.1 MiB
 - dist/transpiled/adder.d.ts                         0.1 KiB
 - dist/transpiled/adder.js                          1.57 KiB
```

> [!NOTE]
> To follow along, see the [`jco` example `adder` component](https://github.com/bytecodealliance/jco/tree/main/examples/components/adder).
>
> With the project pulled locally, you also run `npm run transpile` which outputs to `dist/transpiled`


Thanks to `jco` transpilation, you can import the resulting `dist/transpiled/adder.js` file and run it from any JavaScript application using a runtime that supports the [core WebAssembly specification][core-wasm] as implemented for JavaScript.

To use this component from [NodeJS][nodejs], you can write code like the following:

```mjs
import { add } from "./dist/transpiled/adder.js";

console.log("1 + 2 = " + add(1, 2));
```

You can execute the JavaScript module with `node` directly:

```console
node run.js
```

You should see output like the following:

```
1 + 2 = 3
```

This is directly comparable to the Rust host code mentioned in the previous section. Here, we are able to use NodeJS as a host for running WebAssembly, thanks to `jco`'s ability to transpile components.

With `jco transpile` any WebAssembly binary (compiled from any language) can be run in JavaScript natively.

[wasm-core-module]: https://webassembly.github.io/spec/core/binary/modules.html
[core-wasm]: https://webassembly.github.io/spec/core/

### Building Reactor Components with `jco`

Reactor components are WebAssembly components that are long running and meant to be called repeatedly over time. They're analogous to libraries of functionality rather than an executable (a "command" component).

Components expose their interfaces via [WebAssembly Interface Types][docs-wit], hand-in-hand with the [Component Model][docs-component-model] which enables components to use higher level types interchangeably.

[docs-wit]: ../design/wit.md
[docs-component-model]: ../design/why-component-model.md

#### Exporting WIT Interfaces with `jco`

Packaging reusable functionality into WebAssembly components isn't useful if we have no way to *expose* that functionality.

This section offers a slightly deeper dive into the usage of WIT in WebAssembly components that can use the Component Model.

As in the previous example, `export`ing WIT interfaces for other components (or a WebAssembly host) to use is fundamental to developing WebAssembly programs.

Let's examine a [`jco` example project called `string-reverse`][jco-examples-string-reverse] that exposes functionality for reversing a string.

To build a project like `string-reverse` from the ground up, first we'd start with a WIT like the following:

```wit
package example:string-reverse@0.1.0

@since(version = 0.1.0)
interface reverse {
    reverse-string: func(s: string) -> string;
}

world string-reverse {
    export reverse;
}
```

As a slightly deeper crash course on [WIT][wit], here's what the above code describes:

- We've defined a namespace called `example`
- We've defined a package called `string-reverse` inside the `example` namespace
- This WIT file corresponds to version `0.1.0` of `example:string-reverse` package
- We've defined an interface called `reverse` which contains *one* function called `reverse-string`
- We specify that the `reverse` interface has existed *since* the `0.1.0` version
- The `reverse-string` function (AKA. `example:reverse-string/reverse.reverse-string`) takes a string and returns a string
- We've defined a `world` called `string-reverse` which exports the functionality provided by the `reverse` interface

> [!WARNING]
> How do we *know* that `reverse` actually reverses a string?
>
> Unfortunately, that problem is not really solvable at this level -- this is between you and the writer of the component that implements the WIT interface.
>
> Of course, with WebAssembly, you *can* enforce static checks if you're so inclined, *before* you run any given binary.

OK now let's see what the JS code looks like to *implement* the `component` world:

```js
/**
 * This module is the JS implementation of the `string-reverse` WIT world
 */

/**
 * This JavaScript will be interpreted by `jco` and turned into a
 * WebAssembly binary with a single export (this `reverse` function).
 */
function reverseString(s) {
  return s.reverse();
}

/**
 * The JavaScript export below represents the export of the `reverse` interface,
 * which which contains `reverse-string` as it's primary exported function.
 */
export const reverse = {
    reverseString,
};
```

> [!NOTE]
> To view the full code listing along with instructions, see the [`examples/tutorials/jco/string-reverse` folder][jco-examples-string-reverse]

To use `jco` to compile this component, you can run the following from the `string-reverse` folder:

```console
npx jco componentize \
    --wit wit/component.wit \
    --world-name component \
    --out string-reverse.wasm \
    --disable all \
    string-reverse.mjs
```

> [!NOTE]
> Like the previous example, we're not using any of the advanced [WebAssembly System Interface][wasi] features, so we `--disable` all of them
>
> Rather than typing out the `jco componentize` command manually, you can also run
> the build command with [`npm run build` from the `string-reverse` folder](https://github.com/bytecodealliance/jco/blob/main/examples/components/string-reverse/package.json#L6).

You should see output like the following:

```
OK Successfully written string-reverse.wasm.
```

Now that we have a WebAssembly binary, we can *also* use `jco` to run it in a native JavaScript context by *transpiling* the WebAssembly binary (which could have come from anywhere!) to a JavaScript module.

```console
npx jco transpile string-reverse.wasm -o dist/transpiled
```

You should see the following output:

```
  Transpiled JS Component Files:

 - dist/transpiled/interfaces/example-string-reverse-reverse.d.ts   0.1 KiB
 - dist/transpiled/string-reverse.core.wasm                        10.1 MiB
 - dist/transpiled/string-reverse.d.ts                             0.15 KiB
 - dist/transpiled/string-reverse.js                               2.55 KiB
```

> [!TIP]
> A gentle reminder that, transpilation *does* produce [Typescript declaration file][ts-decl-file], for use in Typescript projects.

Now that we have a transpiled module, we can run it from any JavaScript context that supports core WebAssembly (whether NodeJS or the browser).

For NodeJS, we can use code like the following:

```mjs
// If this import listed below is missing, please run `npm run transpile`
import { reverse } from "./dist/transpiled/string-reverse.mjs";

const reversed = reverse.reverseString("!dlroW olleH");

console.log(`reverseString('!dlroW olleH') = ${reversed}`);
```

> [!NOTE]
> In the `jco` example project, you can run `npm run transpiled-js` to build the existing code.

Assuming you have the `dist/transpiled` folder populated (by running `jco transpile` in the previous step), you should see output like the following:

```
reverseString('!dlrow olleh') = hello world!
```

While it's somewhat redundant in this context, what we've done from NodeJS demonstrates the usefulness of WebAssembly and the `jco` toolchain. With the help of `jco`, we have:

- Compiled JavaScript to a WebAssembly module (`jco compile`), adhering to an interface defined via WIT
- Converted the compiled WebAssembly module (which could be from *any* language) to a module that can be used from any compliant JS runtime (`jco transpile`)
- Run the transpiled WebAssembly component from a JavaScript native runtime (NodeJS)

[repo]: https://github.com/bytecodealliance/component-docs
[jco-examples-string-reverse]: https://github.com/bytecodealliance/jco/tree/main/examples/components/string-reverse
[ts-decl-file]: https://www.typescriptlang.org/docs/handbook/declaration-files/deep-dive.html#declaration-file-theory-a-deep-dive

#### Advanced: Importing and Reusing WIT Interfaces via Composition

Just as `export`ing functionality is core to building useful WebAssembly components, and similarly `import`ing and reusing functionality is key to using the strengths of WebAssembly.

Restated, **WIT and the Component Model enable WebAssembly to *compose***. This means we can build on top of functionality that already exists and `export` *new* functionality that depends on existing functionality.

Let's say in addition to the reversing the string (in the previous example) we want to build shared functionality that *also* upper cases the text it receives.

We can reuse the reversing functionality *and* export a new interface which enables us to reverse and upper-case.

Let's examine a [`jco` example project called `string-reverse-upper`][jco-examples-string-reverse-upper] that exposes functionality for reversing *and* upper-casing a string.

Here's the WIT one might write to enable this functionality:

```wit
package example:string-reverse-upper@0.1.0;

@since(version = 0.1.0)
interface reversed-upper {
    reverse-and-uppercase: func(s: string) -> string;
}

world revup {
    //
    // NOTE, the import below translates to:
    // <namespace>:<package>/<interface>@<package version>
    //
    import example:string-reverse/reverse@0.1.0;

    export reversed-upper;
}
```

This time, the `world` named `revup` that we are building *relies* on the interface `reverse` in the package `string-reverse` from the namespace `example`.

We can make use of *any* WebAssembly component that matches that interface, as long as we *compose* their functionality with the component that implements the `revup` world.

The `revup` world `import`s (and makes use) of `reverse` in order to `export` (provide) the `reversed-upper` interface, which contains the `reverse-and-uppercase` function (in JS, `reverseAndUppercase`).

> [!NOTE]
> Functionality is imported via the `interface`, *not* the `world`. `world`s can be included/used, but the syntax is slightly different for that.

The JavaScript to make this work ([`string-reverse-upper.mjs` in `jco/examples`](https://github.com/bytecodealliance/jco/blob/main/examples/components/string-reverse-upper/string-reverse-upper.mjs)) looks like this:

```js
/**
 * This module is the JS implementation of the `revup` WIT world
 */

/**
 * The import here is *virtual*. It refers to the `import`ed `reverse` interface in component.wit.
 *
 * These types *do not resolve* when the first `string-reverse-upper` component is built,
 * but the types are relevant for the resulting *composed* component.
 */
import { reverseString } from 'example:string-reverse/reverse@0.1.0';

/**
 * The JavaScript export below represents the export of the `reversed-upper` interface,
 * which which contains `revup` as it's primary exported function.
 */
export const reversedUpper = {
  /**
   * Represents the implementation of the `reverse-and-uppercase` function in the `reversed-upper` interface
   *
   * This function makes use of `reverse-string` which is *imported* from another WebAssembly binary.
   */
  reverseAndUppercase() {
    return reverseString(s).toLocaleUpperCase();
  },
};
```

We can build the component with `jco componentize`:

```console
npx jco componentize \
    string-reverse-upper.mjs \
    --wit wit/ \
    --world-name revup \
    --out string-reverse-upper.incomplete.wasm \
    --disable all
```

While we've successfully built a WebAssembly component, unlike the other examples, ours is *not yet complete*.

We can see that if we print the WIT of the generated component by running `jco wit`:

```console
npx jco wit string-reverse-upper.incomplete.wasm
```

You should see output like the following:

```
package root:component;

world root {
  import example:string-reverse/reverse@0.1.0;

  export example:string-reverse-upper/reversed-upper@0.1.0;
}
```

This tells us that the component still has *unfulfilled `import`s* -- we *use* the `reverseString` function that's in `reverse` as if it exists, but it's not yet a real part of the WebAssembly component (hence we've named it `.incomplete.wasm`.

To compose the two components (`string-reverse-upper/string-reverse-upper.incomplete.wasm` and `string-reverse/string-reverse.wasm` we built earlier), we'll need the [WebAssembly Composition tool (`wac`)][wac]. We can use `wac plug`:

```console
wac plug \
    -o string-reverse-upper.wasm \
    --plug ../string-reverse/string-reverse.wasm \
    string-reverse-upper.incomplete.wasm
```

> [!NOTE]
> You can also run this step with `npm run compose`.

A new component `string-reverse-upper.wasm` should now be present, which is a "complete" component -- we can check the output of `jco wit` to ensure that all the imports are satisfied:

```wit
package root:component;

world root {
  export example:string-reverse-upper/reversed-upper@0.1.0;
}
```

It's as-if we never imported any functionality at all -- the functionality present in `string-reverse.wasm` has been *merged into* `string-reverse-upper.wasm`, and it now simply `export`s the advanced functionality.

We can run this completed component with in any WebAssembly-capable native JavaScript environment by using a the transpiled result:

```console
npx jco transpile string-reverse-upper.wasm -o dist/transpiled
```

> [!NOTE]
> In the example project, you can run `npm run transpile` instead, which will also change the extension on `dist/transpiled/string-reverse-upper.js` to `.mjs`

You should see output like the following:

```
  Transpiled JS Component Files:

 - dist/transpiled/interfaces/example-string-reverse-upper-reversed-upper.d.ts  0.12 KiB
 - dist/transpiled/string-reverse-upper.core.wasm                               10.1 MiB
 - dist/transpiled/string-reverse-upper.core2.wasm                              10.1 MiB
 - dist/transpiled/string-reverse-upper.d.ts                                    0.19 KiB
 - dist/transpiled/string-reverse-upper.js                                      6.13 KiB
```

> [!TIP]
> Notice that there are *two* core WebAssembly files? That's because two core WebAssembly modules were involved
> in creating the ultimate functionality we needed.

To run the transpiled component, we can write code like the following:

```mjs
/**
 * If this import listed below is missing, please run
 *
 * ```
 * npm run build && npm run compose && npm run transpile`
 * ```
 */
import { reversedUpper } from "./dist/transpiled/string-reverse-upper.mjs";

const result = reversedUpper.reverseAndUppercase("!dlroW olleH");

console.log(`reverseAndUppercase('!dlroW olleH') = ${result}`);
```

> [!NOTE]
> In the [`jco` example project](https://github.com/bytecodealliance/jco/tree/main/examples/components/string-reverse-upper), you can run `npm run transpiled-js`

You should see output like the following:

```
reverseAndUppercase('!dlroW olleH') = HELLO WORLD!
```

[wac]: https://github.com/bytecodealliance/wac
[jco-examples-string-reverse-upper]: https://github.com/bytecodealliance/jco/tree/main/examples/components/string-reverse-upper

[!TIP]: #
[!NOTE]: #
[!WARNING]: #

## C/C++ Tooling

WebAssembly components can be built from C and C++ using [`clang`][clang], the C language family frontend for [LLVM][llvm].

[`wit-bindgen`](https://github.com/bytecodealliance/wit-bindgen) is a tool to generate guest language bindings from a
given `.wit` file.

Although `wit-bindgen` is a standalone tool (whereas some languages have more integrated toolchains like Rust's [`cargo-component`][cargo-component]),
`wit-bindgen` can generate source-level bindings for `Rust`, `C`, `Java (TeaVM)`, and `TinyGo`, with the ability for more
language generators to be added in the future.

`wit-bindgen` can be used to build C applications that can be compiled directly to Wasm modules using [`clang`][clang] with a [`wasm32-wasi`][clang-tgt-wasm32-wasi] target.

[clang]: https://clang.llvm.org/
[clang-tgt-wasm32-wasi]: https://clang.llvm.org/docs/ClangCommandLineReference.html#webassembly
[llvm]: https://llvm.org/
[wasi]: https://wasi.dev/
[cargo-component]: https://crates.io/crates/cargo-component

### 1. Download dependencies

First, install the CLI for [`wit-bindgen`](https://github.com/bytecodealliance/wit-bindgen#cli-installation), [`wasm-tools`](https://github.com/bytecodealliance/wasm-tools), and the [`WASI SDK`](https://github.com/webassembly/wasi-sdk).

The WASI SDK will install a local version of `clang` configured with a wasi-sysroot. Follow [these instructions](https://github.com/WebAssembly/wasi-sdk#use) to configure it for use. Note that you can also use your installed system or emscripten `clang` by building with `--target=wasm32-wasi` but you will need some artifacts from WASI SDK to enable and link that build target (more information is available in WASI SDK's docs).

### 2. Generate program skeleton from WIT

Start by generating a C skeleton from `wit-bindgen` using the [sample `adder/world.wit` file](https://github.com/bytecodealliance/component-docs/tree/main/examples/tutorial/wit/adder/world.wit):

```
> wit-bindgen c path/to/adder/world.wit
Generating "adder.c"
Generating "adder.h"
Generating "adder_component_type.o"
```

This has generated several files:

1.`adder.h` (based on the `adder` world) with the prototype of the `add` function (prefixed by `exports_`) - `uint32_t exports_docs_adder_add_add(uint32_t x, uint32_t y);`.
2. `adder.c` that interfaces with the component model ABI to call your function.
3. `adder_component_type.o` which contains object code referenced in `adder.c` from an `extern` that must be linked via `clang`.

### 3. Write program code

Next, create an `component.c` that implements the `adder` world (i.e. the interface defined in `adder.h`):

```c
#include "adder.h"

uint32_t exports_docs_adder_add_add(uint32_t x, uint32_t y)
{
	return x + y;
}
```

### 4. Compile a WebAssembly module (P1) with `clang`

Now, you can compile the function into a Wasm module via clang:

```console
clang component.c adder.c adder_component_type.o -o adder.wasm -mexec-model=reactor
```

> Use the `clang` included in the WASI SDK installation, for example at `<WASI_SDK_PATH>/bin/clang`.
>
> Alternatively, you can also use the published [`ghcr.io/webassembly/wasi-sdk` container images][wasi-sdk-images]
> for performing builds.
>
> For example, to enter a container with `wasi-sdk` installed:
>
> ```
> docker run --rm -it --mount type=bind,src=path/to/app/src,dst=/app ghcr.io/webassembly/wasi-sdk:wasi-sdk-25
> ```
>
> See also: [`Dockerfile` in `wasi-sdk`][wasi-sdk-dockerfile]

[wasi-sdk-images]: https://github.com/WebAssembly/wasi-sdk/pkgs/container/wasi-sdk
[wasi-sdk-dockerfile]: https://github.com/WebAssembly/wasi-sdk/blob/main/docker/Dockerfile

### 5. Convert the P1 component to a P2 component with `wasm-tools`

Next, we need to transform the P1 component to a P2 component. To do this, we can use `wasm-tools component new`:

```console
wasm-tools component new ./adder.wasm -o adder.component.wasm
```

> [!NOTE]
> The `.component.` extension has no special meaning -- `.wasm` files can be either modules or components.

### 6. (optional) Build a WASI-enabled WebAssembly (P2) component with `wasm-tools`

Do note `wasm-tools component new` may fail if your code references any [WASI][wasi] APIs that must be imported, for
example via standard library imports like `stdio.h`.

Using WASI interfaces requires an additional step as the WASI SDK still references `wasi_snapshot_preview1` APIs that are not compatible directly with components.

For example, modifying the above to reference `printf()` would compile:

```c
#include "adder.h"
#include <stdio.h>

uint32_t exports_docs_adder_add_add(uint32_t x, uint32_t y)
{
	uint32_t result = x + y;
	printf("%d", result);
	return result;
}
```

However, the module would fail to transform to a component:

```
>wasm-tools component new ./adder.wasm -o adder.component.wasm
error: failed to encode a component from module

Caused by:
    0: failed to decode world from module
    1: module was not valid
    2: module requires an import interface named `wasi_snapshot_preview1`
```

To build a P2 component that uses [WASI][wasi] interfaces from a P1 component, we'll need to make use of adapter modules.

Install the appropriate reactor adapter module [as documented here](https://github.com/bytecodealliance/wit-bindgen#creating-components-wasi).

You can either get [the linked release][wasmtime-releases] of `wasi_snapshot_preview1.reactor.wasm` and rename it to `wasi_snapshot_preview1.wasm`, or build it directly from source in `wasmtime` following the [instructions here](https://github.com/bytecodealliance/wasmtime/tree/main/crates/wasi-preview1-component-adapter) (make sure you `git submodule update --init` first).

Now, you can adapt preview1 to preview2 to build a component:

```console
wasm-tools component new adder.wasm --adapt wasi_snapshot_preview1.wasm -o adder.component.wasm
```

[wasmtime-releases]: https://github.com/bytecodealliance/wasmtime/releases

### 7. Inspect the built component

Finally, you can inspect the embedded wit to see your component (including any WASI imports if necessary):

```
>wasm-tools component wit adder.component.wasm
package root:component;

world root {
  import wasi:io/error@0.2.2;
  import wasi:io/streams@0.2.2;
  import wasi:cli/stdin@0.2.2;
  import wasi:cli/stdout@0.2.2;
  import wasi:cli/stderr@0.2.2;
  import wasi:cli/terminal-input@0.2.2;
  import wasi:cli/terminal-output@0.2.2;
  import wasi:cli/terminal-stdin@0.2.2;
  import wasi:cli/terminal-stdout@0.2.2;
  import wasi:cli/terminal-stderr@0.2.2;
  import wasi:clocks/wall-clock@0.2.2;
  import wasi:filesystem/types@0.2.2;
  import wasi:filesystem/preopens@0.2.2;

  export add: func(x: s32, y: s32) -> s32;
}
...
```

### 8. Running the component from the example host

> [!WARNING]
> You must be careful to use a version of the adapter (`wasi_snapshot_preview1.wasm`) that is compatible with the version of
> `wasmtime` that will be used, to ensure that WASI interface versions (and relevant implementation) match.

This repository contains an [example WebAssembly host][example-host] written in Rust that can run components that implement the `adder` world.

> [!NOTE]
> When hosts run components that use WASI interfaces, they must *explicitly* [add WASI to the linker][add-to-linker] to run the built component.

A successful run should show the following output:

```
cargo run --release -- 1 2 adder.component.wasm
   Compiling example-host v0.1.0 (/path/to/component-docs/component-model/examples/example-host)
    Finished `release` profile [optimized] target(s) in 7.85s
     Running `target/debug/example-host 1 2 /tmp/docs/c/adder.component.wasm`
1 + 2 = 3
```

If *not* configured correctly, you may see errors like the following:

```
cargo run --release -- 1 2 adder.component.wasm
   Compiling example-host v0.1.0 (/path/to/component-docs/component-model/examples/example-host)
    Finished `release` profile [optimized] target(s) in 7.85s
     Running `target/release/example-host 1 2 adder.component.wasm`
Error: Failed to instantiate the example world

Caused by:
    0: component imports instance `wasi:io/error@0.2.2`, but a matching implementation was not found in the linker
    1: instance export `error` has the wrong type
    2: resource implementation is missing
```

This kind of error normally indicates that the host in question does not contain satisfy WASI imports.

[host]: https://github.com/bytecodealliance/component-docs/tree/main/component-model/examples/example-host
[add-to-linker]: https://docs.wasmtime.dev/api/wasmtime_wasi/fn.add_to_linker_sync.html
[example-host]: https://github.com/bytecodealliance/component-docs/tree/main/component-model/examples/example-host

### 9. Running a Component from C/C++ Applications

It is not yet possible to run a WebAssembly Component using the C API of `wasmtime` `c-api`. See [`wasmtime` issue #6987](https://github.com/bytecodealliance/wasmtime/issues/6987) for more details.

The c-api is preferred over directly using the example host Rust crate in C++.

However, C/C++ language guest components can be composed with components written in any other language and run by their toolchains, or even composed with a C language command component and run via the `wasmtime` CLI or any other host.

See the [Rust Tooling guide](../language-support/rust.md#running-a-component-from-rust-applications) for instructions on how to run this component from the Rust `example-host` (replacing the path to `add.wasm` with your `add-component` above).

[!NOTE]: #
[!WARNING]: #

## C# Tooling

WebAssembly components in C# can be built with [componentize-dotnet][componentize-dotnet], a a NuGet package that can be used to create a fully AOT-compiled component, giving .NET developers a component experience comparable to those in Rust and TinyGo.

[componentize-dotnet]: https://github.com/bytecodealliance/componentize-dotnet

### Building a Component with `componentize-dotnet`

[`componentize-dotnet`][componentize-dotnet] serves as a one-stop shop, wrapping several tools into one:

- [NativeAOT-LLVM](https://github.com/dotnet/runtimelab/tree/feature/NativeAOT-LLVM) (compilation)
- [wit-bindgen](https://github.com/bytecodealliance/wit-bindgen) (WIT imports and exports)
- [wasm-tools](https://github.com/bytecodealliance/wasm-tools) (component conversion)
- [WASI SDK](https://github.com/WebAssembly/wasi-sdk) (SDK used by NativeAOT-LLVM)
- [Wac](https://github.com/bytecodealliance/wac) (used to compose components)

First, install the .NET SDK. For this walkthrough, we’ll use the [.NET 10 SDK preview][dotnet-sdk].
You should also have [wasmtime](https://wasmtime.dev/) installed so you can run the binary that you produce.

[dotnet-sdk]: https://dotnet.microsoft.com/en-us/download/dotnet/10.0
[wasmtime]: https://wasmtime.dev/

### 1. Create a new project

Once you have the .NET SDK installed, create a new project:

```sh
dotnet new install BytecodeAlliance.Componentize.DotNet.Templates
dotnet new componentize.wasi.cli -o adder
cd adder
```

### 2. Create or download your WIT world

Next, create or download the WIT world you would like to target.

For this example we will use the [`adder` world][adder-world], with an `add` function (e.g. to `wit/component.wit`):

```wit
package docs:adder@0.1.0;

interface add {
    add: func(x: u32, y: u32) -> u32;
}

world adder {
    export add;
}
```

In the `adder.csproj` project file, add a new `<ItemGroup>`:

```xml
<ItemGroup>
    <Wit Update="wit/component.wit" World="adder" />
</ItemGroup>
```

Since this component will only export a function dotnet considers this a library project.
Let's update the `<OutputType>` to be a library in the `adder.csproj`:

```diff
- <OutputType>Exe</OutputType>
+ <OutputType>Library</OutputType>
```

And remove the automatically generated `Program.cs` file:

```bash
rm Program.cs
```

[adder-world]: https://github.com/bytecodealliance/component-docs/tree/main/component-model/examples/tutorial/wit/adder/world.wit

### 3. Write the implementation for the `adder` world

If you try to build the project with `dotnet build`, you'll get an error like the following:

```
➜ dotnet build
Restore complete (8.6s)
You are using a preview version of .NET. See: https://aka.ms/dotnet-support-policy
  adder failed with 1 error(s) (25.6s)
    /path/to/adder/obj/Debug/net10.0/wasi-wasm/wit_bindgen/AdderWorld.wit.exports.docs.adder.v0_1_0.AddInterop.cs(15,19): error CS0103: The name 'AddImpl' does not exist in the current context

Build failed with 1 error(s) in 34.6s
```

This is because we've promised an implementation, but haven't yet written one for the `adder` world.

To fix this, add the following code to your in a file called `Component.cs`:

```csharp
namespace AdderWorld;

public class AddImpl : IAdderWorld
{
    public static uint Add(uint x, uint y)
    {
        return x + y;
    }
}
```

Then, we can build our component:

```sh
dotnet build
```

The component will be available at `bin/Debug/net10.0/wasi-wasm/native/adder.wasm`.

### 4. (optional) the component from the example host

> [!WARNING]
> You must be careful to use a version of the adapter (`wasi_snapshot_preview1.wasm`) that is compatible with the version of
> `wasmtime` that will be used, to ensure that WASI interface versions (and relevant implementation) match.

This repository contains an [example WebAssembly host][example-host] written in Rust that can run components that implement the `adder` world.

> [!NOTE]
> When hosts run components that use WASI interfaces, they must *explicitly* [add WASI to the linker][add-to-linker] to run the built component.

A successful run should show the following output:

```
cargo run --release -- 1 2 adder.component.wasm
   Compiling example-host v0.1.0 (/path/to/component-docs/component-model/examples/example-host)
    Finished `release` profile [optimized] target(s) in 7.85s
     Running `target/debug/example-host 1 2 /tmp/docs/c/adder.component.wasm`
1 + 2 = 3
```

If *not* configured correctly, you may see errors like the following:

```
cargo run --release -- 1 2 adder.component.wasm
   Compiling example-host v0.1.0 (/path/to/component-docs/component-model/examples/example-host)
    Finished `release` profile [optimized] target(s) in 7.85s
     Running `target/release/example-host 1 2 adder.component.wasm`
Error: Failed to instantiate the example world

Caused by:
    0: component imports instance `wasi:io/error@0.2.2`, but a matching implementation was not found in the linker
    1: instance export `error` has the wrong type
    2: resource implementation is missing
```

This kind of error normally indicates that the host in question does not contain satisfy WASI imports.

[host]: https://github.com/bytecodealliance/component-docs/tree/main/component-model/examples/example-host
[add-to-linker]: https://docs.wasmtime.dev/api/wasmtime_wasi/fn.add_to_linker_sync.html
[example-host]: https://github.com/bytecodealliance/component-docs/tree/main/component-model/examples/example-host

### Building a component that exports an interface

The previous example uses a WIT file that exports a function. However, you'll often prefer to export an interface, either to comply with an existing specification or to capture a set of functions and types that tend to go together. Let's expand our `example` world to export an interface rather than directly export the function. We are also adding the `hostapp` world to our WIT file which we will implement in [the next section](#building-a-component-that-imports-an-interface) to demonstrate how to build a component that *imports* an interface.

```wit
// adder/world.wit
package example:component;

interface add {
    add: func(x: u32, y: u32) -> u32;
}

world example {
    export add;
}

world hostapp {
    import add;
}
```

If you peek at the bindings, you'll notice that we now implement a class for the `add` interface rather than for the `example` world -- this is a consistent pattern. As you export more interfaces from your world, you implement more classes.

Our `Component.cs` example gets the slight update of:

```csharp
namespace ExampleWorld.wit.exports.example.component;

public class AddImpl : IAdd
{
    public static uint Add(uint x, uint y)
    {
        return x + y;
    }
}
```

Once again, compile an application to a Wasm component using `dotnet build`:

```sh
$ dotnet build
Restore complete (0.4s)
You are using a preview version of .NET. See: https://aka.ms/dotnet-support-policy
  adder succeeded (1.1s) → bin/Debug/net10.0/wasi-wasm/adder.dll

Build succeeded in 2.5s
```

The component will be available at `bin/Debug/net10.0/wasi-wasm/native/adder.wasm`.

### Building a component that imports an interface

So far, we've been dealing with library components. Now we will be creating a command component that implements the `hostapp` world. This component will import the `add` interface that is exported from our `adder` component and call the `add` function. We will later compose this command component with the `adder` library component we just built.

Now we will be taking the `adder` component and executing it from another WebAssembly component.

`dotnet new componentize.wasi.cli` creates a new project that creates an executable.

Back out of the current project and create a new one:

```sh
cd ..
dotnet new componentize.wasi.cli -o host-app
cd host-app
```

Copy the same WIT file as before into your project:

```wit
// adder/world.wit
package example:component;

interface add {
    add: func(x: u32, y: u32) -> u32;
}

world example {
    export add;
}

world hostapp {
    import add;
}
```

Add it to your `host-app.csproj` project file as a new `ItemGroup`:

```xml
<ItemGroup>
    <Wit Update="adder/add.wit" World="hostapp" />
</ItemGroup>
```

Notice how the `World` changed from `example` to `hostapp`. The previous examples focused on implementing the class library for this WIT file - the `export` functions. Now we'll be focusing on the executable side of the application - the `hostapp` world.

Modify `Program.cs` to look like this:

```csharp
// Pull in all imports of the `hostapp` world, namely the `add` interface.
// example.component refers to the package name defined in the WIT file.
using HostappWorld.wit.imports.example.component;

uint left = 1;
uint right = 2;
var result = AddInterop.Add(left, right);
Console.WriteLine($"{left} + {right} = {result}");
```

Once again, compile your component with `dotnet build`:

```sh
$ dotnet build
Restore complete (0.4s)
You are using a preview version of .NET. See: https://aka.ms/dotnet-support-policy
  host-app succeeded (1.1s) → bin/Debug/net10.0/wasi-wasm/host-app.dll

Build succeeded in 2.5s
```

At this point, you'll have two Webassembly components:

1. A component that implements the `example` world.
2. A component that implements the `hostapp` world.

Since the `host-app` component depends on the `add` function which is defined in the `example` world, it needs to be composed the first component. You can compose your `host-app` component with your `adder` component by running [`wac plug`](https://github.com/bytecodealliance/wac):

```sh
wac plug \
    bin/Debug/net10.0/wasi-wasm/native/host-app.wasm \
    --plug ../adder/bin/Debug/net10.0/wasi-wasm/native/adder.wasm \
    -o main.wasm
```

You can also automate the process by adding the following to your `host-app.csproj`:

```xml
<Target Name="ComposeWasmComponent" AfterTargets="Publish">
    <PropertyGroup>
        <EntrypointComponent>bin/$(Configuration)/$(TargetFramework)/wasi-wasm/native/host-app.wasm</EntrypointComponent>
        <DependencyComponent>../adder/bin/$(Configuration)/$(TargetFramework)/wasi-wasm/native/adder.wasm</DependencyComponent>
    </PropertyGroup>
    <MakeDir Directories="dist" />
    <Exec Command="$(WacExe) plug $(EntrypointComponent) --plug $(DependencyComponent) -o dist/main.wasm" />
</Target>
```

Run `dotnet build` again you will have a composed component in `./dist/main.wasm`

Then you can run the composed component:

```sh
wasmtime run ./dist/main.wasm
1 + 2 = 3
```

Check out the [componentize-dotnet docs][componentize-dotnet-docs] for more configurations options.

[componentize-dotnet-docs]: https://github.com/bytecodealliance/componentize-dotnet

[!NOTE]: #
[!WARNING]: #

---

# Building a Component with `wasm-tools`

`wasm-tools` can be used to create a component from WebAssembly Text (WAT). This walks through creating a component from WAT that implements the [`adder` world](https://github.com/bytecodealliance/component-docs/blob/main/component-model/examples/tutorial/wit/adder/world.wit) and simply adds two numbers.

1. Install
2. The `add` function is defined inside the following `world` world:

   ```wit
   package docs:adder@0.1.0;

   interface add {
       add: func(x: u32, y: u32) -> u32;
   }

   world adder {
       export add;
   }
   ```

3. Define an `add` core module in WAT that exports an `add` function that adds two parameters:

   ```wat
   (module
     (func $add (param $lhs i32) (param $rhs i32) (result i32)
         local.get $lhs
         local.get $rhs
         i32.add)
     (export "docs:adder/add@0.1.0" (func $add))
   )
   ```

4. Use `wasm-tools` to create a component from the core module, first embedding component metadata
   inside the core module and then encoding the WAT to a Wasm binary.

   ```sh
   $ wasm-tools component embed adder/world.wit add.wat -o add.wasm
   $ wasm-tools component new add.wasm -o add.component.wasm
   ```

### Running a Component with Wasmtime

You can "run" a component by calling one of its exports. Hosts and runtimes often only support running components with certain exports. The [`wasmtime`](https://github.com/bytecodealliance/wasmtime) CLI can only run "command" components, so in order to run the `add` function above, it first must be composed with a primary "command" component that calls it. See [documentation on running components](./creating-and-consuming/running.md) for more details.

## Useful links

The following references are helpful in understanding the Component Model and related ecosystem/projects.

- [WebAssembly Composition tool (`wac`)][wac]
- [WebAssembly package tools (notably `wkg`)][wkg]
- [WASI Preview 2][wasi-p2]
- [Component Model internals][wasm-cm-repo]
  - [Component Model AST][ast-explainer]
  - [Canonical ABI][canonical-abi]

[wasm-cm-repo]: https://github.com/WebAssembly/component-model
[wasi-p2]: https://github.com/WebAssembly/WASI/tree/main/wasip2
[ast-explainer]: https://github.com/WebAssembly/component-model/blob/main/design/mvp/Explainer.md
[canonical-abi]: https://github.com/WebAssembly/component-model/blob/main/design/mvp/CanonicalABI.md
[wac]: https://github.com/bytecodealliance/wac
[wkg]: https://github.com/bytecodealliance/wasm-pkg-tools

