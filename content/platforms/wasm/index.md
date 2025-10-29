title=WebAssembly
tags=platform, vm, browser
summary=A portable multi-environment-targeting bytecode format for the Web.
~~~~~~

[Website](https://webassembly.org/) | [Bytecode Alliance](https://bytecodealliance.org/)

[Specifications page](https://webassembly.github.io/spec/) ([Source](https://github.com/WebAssembly/spec/)):

* [Core](https://webassembly.github.io/spec/core/_download/WebAssembly.pdf)
* [JavaScript Embedding](https://webassembly.github.io/spec/js-api/index.html)
* [Web Embedding](https://webassembly.github.io/spec/web-api/index.html)
* [Proposals](https://github.com/WebAssembly/proposals)
* [Component model](https://component-model.bytecodealliance.org/introduction.html) | [Source](https://github.com/WebAssembly/component-model)

    * IDL (WIT: Wasm Interface Type): https://github.com/WebAssembly/component-model/blob/main/design/mvp/WIT.md (reproduced below)
    * text format: https://github.com/WebAssembly/component-model/blob/main/design/mvp/Explainer.md
    * binary format: https://github.com/WebAssembly/component-model/blob/main/design/mvp/Binary.md
    * concurrency model: https://github.com/WebAssembly/component-model/blob/main/design/mvp/Async.md
    * canonical ABI: https://github.com/WebAssembly/component-model/blob/main/design/mvp/CanonicalABI.md

* [WebAssembly System Interface](https://wasi.dev/) | [Source](https://github.com/WebAssembly/WASI/tree/main)
* [Common WebAssembly](https://github.com/CommonWA/cwa-spec)
* Announcements [2.0](https://webassembly.org/news/2025-03-20-wasm-2.0/), [3.0](https://webassembly.org/news/2025-09-17-wasm-3.0/)

## Tools

- [WebAssembly Binary Toolkit (wabt)](https://github.com/WebAssembly/wabt) | [binaryen](https://github.com/WebAssembly/binaryen)

## Examples

- [Chip-8 Emulator](https://emuchip.com/) [Source](https://github.com/Timmoth/EmuChip): A lightweight interpreted virtual machine originally designed for 8-bit microcomputers. It features a 4K memory space, 16 8-bit registers, a 64×32 monochrome display, a stack for subroutines, and simple timers for delay and sound. This emulator replicates the CHIP-8 architecture in software, written in C# and compiled into WebAssembly for execution directly in the browser.

Features:

* 3.0

  * **64-bit address space.** Memories and tables can now be declared to use i64 as their address type instead of just i32. That expands the available address space of Wasm applications from 4 gigabytes to (theoretically) 16 exabytes, to the extent that physical hardware allows. While the web will necessarily keep enforcing certain limits — on the web, a 64-bit memory is limited to 16 gigabytes — the new flexibility is especially interesting for non-web ecosystems using Wasm, as they can support much, much larger applications and data sets now.
  * **Multiple memories.** Contrary to popular belief, Wasm applications were always able to use multiple memory objects — and hence multiple address spaces — simultaneously. However, previously that was only possible by declaring and accessing each of them in separate modules. This gap has been closed, a single module can now declare (define or import) multiple memories and directly access them, including directly copying data between them. This finally allows tools like wasm-merge, which perform “static linking” on two or more Wasm modules by merging them into one, to work for all Wasm modules. It also paves the way for new uses of separate address spaces, e.g., for security (separating private data), for buffering, or for instrumentation.
  * **Garbage collection.** In addition to expanding the capabilities of raw linear memories, Wasm also adds support for a new (and separate) form of storage that is automatically managed by the Wasm runtime via a garbage collector. Staying true to the spirit of Wasm as a low-level language, Wasm GC is low-level as well: a compiler targeting Wasm can declare the memory layout of its runtime data structures in terms of struct and array types, plus unboxed tagged integers, whose allocation and lifetime is then handled by Wasm. But that’s it. Everything else, such as engineering suitable representations for source-language values, including implementation details like method tables, remains the responsibility of compilers targeting Wasm. There are no built-in object systems, nor closures or other higher-level constructs — which would inevitably be heavily biased towards specific languages. Instead, Wasm only provides the basic building blocks for representing such constructs and focuses purely on the memory management aspect.
  * **Typed references.** The GC extension is built upon a substantial extension to the Wasm type system, which now supports much richer forms of references. Reference types can now describe the exact shape of the referenced heap value, avoiding additional runtime checks that would otherwise be needed to ensure safety. This more expressive typing mechanism, including subtyping and type recursion, is also available for function references, making it possible to perform safe indirect function calls without any runtime type or bounds check, through the new call_ref instruction.
  * **Tail calls.** Tail calls are a variant of function calls that immediately exit the current function, and thereby avoid taking up additional stack space. Tail calls are an important mechanism that is used in various language implementations both in user-visible ways (e.g., in functional languages) and for internal techniques (e.g., to implement stubs). Wasm tail calls are fully general and work for callees both selected statically (by function index) and dynamically (by reference or table).
  * **Exception handling.** Exceptions provide a way to locally abort execution, and are a common feature in modern programming languages. Previously, there was no efficient way to compile exception handling to Wasm, and existing compilers typically resorted to convoluted ways of implementing them by escaping to the host language, e.g., JavaScript. This was neither portable nor efficient. Wasm 3.0 hence provides native exception handling within Wasm. Exceptions are defined by declaring exception tags with associated payload data. As one would expect, an exception can be thrown, and selectively be caught by a surrounding handler, based on its tag. Exception handlers are a new form of block instruction that includes a dispatch list of tag/label pairs or catch-all labels to define where to jump when an exception occurs.
  * **Relaxed vector instructions.** Wasm 2.0 added a large set of vector (SIMD) instructions, but due to differences in hardware, some of these instructions have to do extra work on some platforms to achieve the specified semantics. In order to squeeze out maximum performance, Wasm 3.0 introduces “relaxed” variants of these instructions that are allowed to have implementation-dependent behavior in certain edge cases. This behavior must be selected from a pre-specified set of legal choices.
  * **Deterministic profile.** To make up for the added semantic fuzziness of relaxed vector instructions, and in order to support settings that demand or need deterministic execution semantics (such as blockchains, or replayable systems), the Wasm standard now specifies a deterministic default behavior for every instruction with otherwise non-deterministic results — currently, this includes floating-point operators and their generated NaN values and the aforementioned relaxed vector instructions. Between platforms choosing to implement this deterministic execution profile, Wasm thereby is fully deterministic, reproducible, and portable.
  * **Custom annotation syntax.** Finally, the Wasm text format has been enriched with generic syntax for placing annotations in Wasm source code. Analogous to custom sections in the binary format, these annotations are not assigned any meaning by the Wasm standard itself, and can be chosen to be ignored by implementations. However, they provide a way to represent the information stored in custom sections in human-readable and writable form, and concrete annotations can be specified by downstream standards.
  
  In addition to these core features, embeddings of Wasm into JavaScript benefit from a new extension to the JS API:

  * **JS string builtins.** JavaScript string values can already be passed to Wasm as externrefs. Functions from this new primitive library can be imported into a Wasm module to directly access and manipulate such external string values inside Wasm.

  With these new features, Wasm has much better support for compiling high-level programming languages. Enabled by this, we have seen various new languages popping up to target Wasm, such as [Java](https://github.com/google/j2cl/blob/master/docs/getting-started-j2wasm.md), [OCaml](https://dune.readthedocs.io/en/stable/wasmoo.html), [Scala](https://www.scala-js.org/doc/project/webassembly.html), [Kotlin](https://kotlinlang.org/docs/wasm-overview.html), [Scheme](https://spritely.institute/hoot/), or [Dart](https://dart.dev/web/wasm), all of which use the new GC feature. On top of all these goodies, Wasm 3.0 also is the first version of the standard that has been produced with the new [SpecTec](https://webassembly.org/news/2025-03-27-spectec/) tool chain. We believe that this makes for an even more reliable specification.


[Awesome WASM languages](https://github.com/appcypher/awesome-wasm-langs):

* [AssemblyScript](/languages/wasm/assemblyscript): An assembler for WebAssembly.
* [Astro](/languages/wasm/astro): a fun safe language for rapid prototyping and high performance applications.
* [Cheerp](/languages/cplusplus/cheerp): an open-source, commercial C/C++ compiler for Web applications. It can compile virtually any C/C++ code (up to C++14) to WebAssembly, JavaScript, asm.js or a combination thereof.
* [Duktape](https://github.com/svaarala/duktape): embeddable JS engine capable of being run in the browser via WebAssembly
* [SwiftWASM](https://swiftwasm.org/) ([Source](https://github.com/swiftwasm/swift)): SwiftWasm compiles your [Swift](/languages/swift) code to WebAssembly.
* [wasmlink](https://github.com/bytecodealliance/wit-bindgen/tree/main/crates/wasmlink):  a CLI that allows us to statically link a module and its dependencies using [module linking](https://github.com/WebAssembly/module-linking) and the [Canonical Interface Types ABI](https://github.com/WebAssembly/interface-types/pull/140).

CLR:

- [.NET WebAssembly](https://github.com/RyanLamansky/dotnet-webassembly): Create, read, modify, write and execute WebAssembly (WASM) files from .NET-based applications.
- ["Running .NET in the browser without Blazor"](https://andrewlock.net/running-dotnet-in-the-browser-without-blazor/)

[Wasm Debugger](https://github.com/wasm3/wasm-debug): Direct, source-level WebAssembly debugger

[An introduction to WebAssembly components](https://radu-matei.com/blog/intro-wasm-components/)

[WebAssembly friendly programming with C/C++](https://github.com/3dgen/cppwasm-book/tree/master/en) - Ending, Chai Shushan, Yushih (HTML, [examples](https://github.com/3dgen/cppwasm-book/tree/master/examples))

---

## Component Model Concepts

* A WebAssembly Component is the next evolution of core WebAssembly binaries.

    * WebAssembly components are nestable -- they may contain one or more core modules and/or sub-components composed together.
    * Logically, components are containers for modules - or other components - which express their interfaces and dependencies via WIT.
    * Conceptually, components are self-describing units of code that interact only through interfaces instead of shared memory.
    * Physically, a component is a specially-formatted WebAssembly file. Internally, the component could include multiple traditional ("core") WebAssembly modules, and sub-components, composed via their imports and exports.

    The external interface of a component - its imports and exports - corresponds to a world. The component, however, internally defines how that world is implemented.

* The Component Model extends core WebAssembly by introducing higher level types and interface-driven development

    * WebAssembly Interface Types (WIT) is the IDL (Interface Definition Language) used to formally define functionality for WebAssembly modules.
    * With WIT, WebAssembly components gain the ability to conform an language-agnostic and encode that support, so any WebAssembly component binary can be interrogated and executed.
    * An Interface describes the types and functions used for a specific, focused bit of functionality. They are defined using WIT.

        * An interface describes a single-focus, composable contract, through which components can interact with each other and with hosts. Interfaces describe the types and functions used to carry out that interaction. For example:
        * A "receive HTTP requests" interface might have only a single "handle request" function, but contain types representing incoming requests, outgoing responses, HTTP methods and headers, and so on.
        * A "wall clock" interface might have two functions, one to get the current time and one to get the granularity of the timer. It would also include a type to represent an instant in time.

    * A World assembles interfaces to express what features a component offers, and what features it depends on. A WIT world is a higher-level contract that describes a component's capabilities and needs.

        On one hand, a world describes the shape of a component - it says which interfaces the component exposes for other code to call (its exports), and which interfaces the component depends on (its imports). A world only defines the surface of a component, not the internal behaviour. If you're an application or library developer creating a component, you'll specify the world your component targets. This world describes the functionality your component exposes and declares the functionality your component depends on in order to be able to run. Your component may target a custom world definition you have created with a unique set of imports and exports tailored just for your use case, or it may target an existing world definition that someone else has already specified.

        On the other hand though, a world defines a hosting environment for components (i.e., an environment in which a component can be instantiated and its functionality can be invoked). An environment supports a world by providing implementations for all of the imports and by optionally invoking one or more of the exports.

        For example, WASI (the WebAssembly System Interface) defines a "command line" world which imports interfaces that command line programs typically expect to have available to them such as file I/O, random number generation, clocks and so on. This world has a single export for running the command line tool. Components targeting this world must provide an implementation for this single export, and they may optionally call any of the imports. On the other hand, environments supporting this world must provide implementations for all of the imports and may invoke the single export.

        A world is composed of interfaces, but each interface is directional - it indicates whether the interface is available for outside code to call (an "export"), or whether outside code must fulfill the interface for the component to call (an "import"). These interfaces strictly bound the component. A component cannot interact with anything outside itself except by having its exports called, or by it calling its imports. This provides very strong sandboxing; for example, if a component does not have an import for a secret store, then it cannot access that secret store, even if the store is running in the same process.

        For a component to run, its imports must be fulfilled, by a host or by other components. Connecting up some or all of a component's imports to other components' matching exports is called composition.

        Example Worlds

        * A (trivial) "HTTP proxy" world would export a "handle HTTP requests" interface, and import a "send HTTP requests" interface. A host, or another component, would call the exported "handle" interface, passing an HTTP request; the component would forward it on via the imported "send" interface. To be a useful proxy, the component may also need to import interfaces such as I/O and clock time - without those imports the component could not perform, for example, on-disk caching.
        * A "regex parser" world would export a "parse regex" function, and would import nothing. This declares not only that the component implementing this world can parse regular expressions, but also that it calls no other APIs. A user of such a parser could know, without looking at the implementation, that is does not access the file system, or send the user's regexes to a network service.

    * A Package is a set of WIT files containing a related set of interfaces and worlds.

        A WIT package is a set of one or more WIT (Wasm Interface Type) files containing a related set of interfaces and worlds. WIT is an IDL (interface definition language) for the Component Model. Packages provide a way for worlds and interfaces to refer to each other, and thus for an ecosystem of components to share common definitions.

        A WIT package is not a world. It's a way of grouping related interfaces and worlds together for ease of discovery and reference, more like a namespace.

        The WebAssembly System Interface (WASI) defines a number of packages, including one named `wasi:clocks`. Our HTTP proxy world could import the wall-clock interface from the `wasi:clocks` package, rather than having to define a custom clock interface.

* The Component Model introduces the idea of a "platform" to core WebAssembly -- enabling the structured, standardized use of "host" functionality for WebAssembly "guest"s.

    * The WebAssembly System Interface (WASI) defines in WIT a family of interfaces for common system-level functions.
    * WASI defines common execution environments such as the command line (wasi:cli) or a HTTP server (wasi:http).

* The Component Model makes core WebAssembly composable -- components that provide functionality and those that use them can be composed together into one resulting component

---

