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

* [SwiftWASM](https://swiftwasm.org/) ([Source](https://github.com/swiftwasm/swift)): SwiftWasm compiles your [Swift](/languages/swift) code to WebAssembly.
* [wasmlink](https://github.com/bytecodealliance/wit-bindgen/tree/main/crates/wasmlink):  a CLI that allows us to statically link a module and its dependencies using [module linking](https://github.com/WebAssembly/module-linking) and the [Canonical Interface Types ABI](https://github.com/WebAssembly/interface-types/pull/140).
* .NET

    * [Mono](https://github.com/mono/mono/tree/master/sdks/wasm) - an open source implementation of Microsoft's .NET Framework based on the ECMA standards for C# and the Common Language Runtime. For a real-work example, see this repository which contains the [Windows 10 calculator](https://github.com/nventive/calculator). The application is built using standard C++ 11 and C++/CX, with a calculation engine that dates back from 1995. Made by possible with mono via [Uno Platform](https://platform.uno/a-piece-of-windows-10-is-now-running-on-webassembly-natively-on-ios-and-android/).
    * [Blazor](https://dotnet.microsoft.com/apps/aspnet/web-apps/blazor) - a web UI framework using C#/Razor and HTML, running client-side via WebAssembly. Source is maintained on [ASP.Net Core](https://github.com/dotnet/aspnetcore) repo.
    * [Bolero](https://fsbolero.io/) - Bolero brings Blazor to F# developers with an easy to use Model-View-Update architecture, HTML combinators, hot reloaded templates, type-safe endpoints, advanced routing and remoting capabilities, and more.
    * [NativeAOT-LLVM](https://github.com/dotnet/runtimelab/tree/feature/NativeAOT-LLVM) - an experimental fork of the CoreCLR .NET runtime that compiles .NET applications into single-file executables, with the primary target being WASM

* Ada

    * [adawebpack](https://github.com/godunko/adawebpack) - GNAT-LLVM compiler for WebAssembly target, GNAT Run Time Library and AdaWebPack bindings for Web API.
    * [adagl](https://github.com/godunko/adagl) - Multiplatform Ada/OpenGL bindings (ported to native/OpenGL, A2JS/WebGL and WASM/WebGL).
    * [adawebui](https://github.com/godunko/adawebui) - GUI based on adawebpack.\

* [AssemblyScript](/languages/wasm/assemblyscript): An assembler for WebAssembly.
* [Astro](/languages/wasm/astro): a fun safe language for rapid prototyping and high performance applications.
* [Ballerina](/languages/jvm/ballerina) - [Main repository](https://github.com/ballerina-platform/nballerina/tree/wasm) - Ballerina-to-wasm compiler 
* [BASIC](/languages/basic)
* Berry: an ultra-lightweight dynamically typed embedded scripting language. It's designed for lower-performance embedded devices, fast, multi-paradigm, simple, flexible, and has very small RAM footprint.

    * [berry](https://github.com/berry-lang/berry) - main repo.
    * [berry_web](https://github.com/berry-lang/berry_web/) - Berry web playground. The project contains port of the Berry to Emscripten platform.

* Brainfuck 

    * [BrainfuckWebassembly](https://github.com/serprex/brainwebfuckassembly) - a simple Brainfuck-to-wasm compiler in one function.
    * [Brainfuck2Wasm](https://github.com/verdie-g/brainfuck2wasm) - a Brainfuck-to-wasm compiler and playground.
    * [BrainfuckRsWasm](https://github.com/shritesh/brainfuck-rs-wasm) - a Brainfuck interpreter written in Rust and compiled to WebAssembly.
    * [Brainfuck Wa-lang](https://github.com/wa-lang/wa/tree/master/waroot/examples/brainfuck) - a Brainfuck interpreter written in [凹语言/Wa-lang](https://github.com/wa-lang/wa) and compiled to WebAssembly.
    * [bfwasm](https://github.com/surma/bfwasm) - A non-optimizing Brainf_ck to WebAssembly compiler with WASI support.

* C

    * [Emscripten](/languages/wasm/emscripten) - an LLVM-to-JavaScript/Webassembly compiler. It takes LLVM bitcode - which can be generated from C/C++, using llvm-gcc (DragonEgg) or clang, or any other language that can be converted into LLVM - and compiles that into JavaScript or wasm.
    * [Cheerp](/languages/wasm/cheerp): an open-source, commercial C/C++ compiler for Web applications. It can compile virtually any C/C++ code (up to C++14) to WebAssembly, JavaScript, asm.js or a combination thereof.

* [c4wa](https://github.com/kign/c4wa) - main repository.

* [Clean](/languages/clean) - a general purpose, state-of-the-art, pure and lazy functional programming language designed for making real-world applications.

* [Co](/languages/co): A programming language similar to Go and TypeScript. [main repo](https://github.com/rsms/co)

* [COBOL](/languages/cobol)

* [Crystal](/languages/crystal)

* [Cyber](/languages/cyber) - Fast, efficient, and concurrent scripting. Dynamic and gradual types; Concurrency with fibers; Multithreaded; Memory safe; FFI and Embeddable.

* [D](/languages/d) - D is a general-purpose programming language with static typing, systems-level access, and C-like syntax.

* [Dart](/languages/dart) - An approachable, portable, and productive language for high-quality apps on any platform

    * [sdk](https://github.com/dart-lang/sdk) - The Dart SDK, including the VM, dart2js, core libraries, and more.
    * [language](https://github.com/dart-lang/language) - Design of the Dart language
    * [Use via Flutter](https://flutter.dev/wasm) - How to compile Dart to WebAssembly for a Flutter Web application

* [Duktape](/languages/ecmascript): embeddable JS engine capable of being run in the browser via WebAssembly

* [Eclair](/languages/eclair): Eclair is a minimal, fast Datalog implementation that compiles to LLVM IR and WASM.

* [Eel](/languages/eel)

* [Elixir](/languages/elixir)

* [F#](/languages/dotnet/fsharp): F# is a mature, open source, cross-platform, functional-first programming language. It empowers users and organizations to tackle complex computing problems with simple, maintainable and robust code. WebAssembly support is achieved through [Bolero](https://fsbolero.io/), a set of free and open-source libraries and tools built on top of [Blazor](https://dotnet.microsoft.com/apps/aspnet/web-apps/blazor).

* [Faust](/languages/faust) - Faust (Functional Audio Stream) is a functional programming language specifically designed for real-time signal processing and synthesis. A distinctive characteristic of Faust is to be fully compiled.

* [Forest](/languages/forest) - a functional programming language that compiles to WebAssembly. The main repo contains the compiler and core syntaxes, currently implemented in Haskell.

* [Forth](/languages/forth) - an interactive, extensible, imperative, untyped, stack-based programming language.

* [Go](/languages/go) - a statically typed compiled language in the tradition of C, with memory safety, garbage collection, structural typing, and CSP-style concurrent programming features added.

* [Grain](/languages/grain) - a strongly-typed functional programming language built for the modern web.

* [Haskell](/languages/haskell) - a standardized, general-purpose purely functional programming language, with non-strict semantics and strong static typing. It is named after logician Haskell Curry. The latest standard of Haskell is Haskell 2010. As of May 2016, a group is working on the next version, Haskell 2020.

* [Idris](/languages/idris) - a general purpose pure functional programming language with dependent types. Dependent types allow types to be predicated on values, meaning that some aspects of a program’s behaviour can be specified precisely in the type. It is compiled, with eager evaluation. Its features are influenced by Haskell and ML.

* [Janet](/languages/lisp/janet) - a good system scripting language, or a language to embed in other programs. 

* [Java](/languages/jvm/java)

* [JavaScript](/languages/ecmascript) - a high-level, interpreted programming language that conforms to the ECMAScript specification. It is a language that is also characterized as dynamic, weakly typed, prototype-based and multi-paradigm.

* [Julia](/languages/julia) - Julia was designed from the beginning for high performance. Julia programs compile to efficient native code for multiple platforms via LLVM.

* [KCL](/languages/kcl)

* [Kotlin](/languages/jvm/kotlin)

* [Kou](/languages/wasm/kou)

* LabVIEW is a development environment for the G dataflow graphical programming language used for data acquisition, instrument control, and industrial automation.

    * [G Web Development Software](https://www.ni.com/en/shop/electronic-test-instrumentation/programming-environments-for-electronic-test-and-instrumentation/what-is-g-web-development-software.html) - A standalone development environment implementing a subset of the G dataflow graphical programming language to create web-based user interfaces for test and measurement applications.
    * [Vireo](https://github.com/ni/vireosdk) - An open-source runtime capable of running the virtual instrument assembly representation of the G dataflow graphical programming language created by G Web Development Software.

* [Lisp](/languages/lisp) - Lisp (historically LISP) is a family of programming languages with a long history and a distinctive, fully parenthesized prefix notation.

* [Lobster](/languages/lobster) - a statically typed language with flow-sensitive type inference and specialization, compile time reference counting (lifetime analysis) that looks a bit like Python. It was originally intended specifically for games.

* [Lox](/languages/lox) - a language created by Bob Nystrom, used to teach compilers in the book Crafting Interpreters. It is dynamically typed, and supports classes, closures, and first-class functions.

* [Lua](/languages/lua) -  a lightweight, multi-paradigm programming language designed primarily for embedded systems and clients. Lua is cross-platform, since the interpreter is written in ANSI C, and has a relatively simple C API.

* [Lys](/languages/lys) - a typed functional language that compiles directly to WebAssembly.

--------------------

### <a name="moonbit"></a>MoonBit <sup>[top⇈](#contents)</sup>
> MoonBit is an end-to-end programming language toolchain for cloud and edge computing using WebAssembly. The language is like Rust with GC support. The fast compiler is optimized to produce very compact WASM binaries. 

* [MoonBit](https://www.moonbitlang.com) - main website. You can try the language out [here](https://try.moonbitlang.com/).
* [Core library](https://github.com/moonbitlang/core) - open-sourced standard library. Compiler source code is not available yet.

--------------------

### <a name="nelua"></a>Nelua <sup>[top⇈](#contents)</sup>
> Minimal, simple, efficient, statically typed, compiled, metaprogrammable, safe, and extensible systems programming language with a Lua flavor.
* [Nelua](https://github.com/edubart/nelua-lang/) - project repository
* [Nelua on the Web](https://github.com/edubart/nelua-lang/discussions/11) - Nelua-wasm discussion

--------------------

### <a name="nerd"></a>Nerd <sup>[top⇈](#contents)</sup>
> NerdLang is a substract of JS with some additions, focus on efficiency.
> Nerd is a JavaScript native compiler aiming to make JavaScript universal, Nerd is able to compile native apps for Windows, Mac, Linux, iOS, Android, Raspberry, STM32, Arduino, Web (including WASM), and more.
* [Nerd](https://github.com/NerdLang/nerd) - main repository.

--------------------

### <a name="never"></a>Never <sup>[top⇈](#contents)</sup>
> Never is a simple functional programming language. Technically it may be classified as syntactically scoped, strongly typed, call by value, functional programming language.
* [Never](https://github.com/never-lang/never) - project repository
* [Never on the Web](https://never-lang.readthedocs.io/en/latest/never-web/) - Never language demo

--------------------

### <a name="nim"></a>Nim <sup>[top⇈](#contents)</sup>
> A fringe language with some beautiful design patterns.
* [nlvm](https://github.com/arnetheduck/nlvm) - LLVM-based compiler for Nim with a WebAssembly target supported out of the box
* [nwasm](https://github.com/stisa/nwasm) - a webassembly backend for nim.
* [Nim wasm helpers](https://github.com/Feneric/nim-wasm-helpers) - a helper to set up a VM configured to build WebAssembly code using Nim.

--------------------

### <a name="ocaml"></a>Ocaml <sup>[top⇈](#contents)</sup>
> OCaml, originally named Objective Caml, is the main implementation of the programming language Caml, created by Xavier Leroy, Jérôme Vouillon, Damien Doligez, Didier Rémy, Ascánder Suárez and others in 1996. A member of the ML language family, OCaml extends the core Caml language with object-oriented programming constructs.
* [Ocaml](https://github.com/SanderSpies/ocaml/tree/wasm/wasmcomp) - a fork of main repo containing work on OCaml to wasm compilation.
* ~[OcamlRun](https://github.com/sebmarkbage/ocamlrun-wasm) - a build script for compiling OCaml bytecode interpreter to wasm using emscripten [Unmaintained]~

--------------------

### <a name="pascal"></a>Pascal <sup>[top⇈](#contents)</sup>
> Pascal is a general purpose imperative, procedural and object-oriented
> static typing programming language. The Free Pascal compiler targets many
> processor architectures, including wasm32; operating systems, including
> WASI; and embedded platforms.
* [Free Pascal](https://wiki.freepascal.org/WebAssembly) - Free Pascal compilation target and Pascal-to-Javascript runtime.

--------------------

### <a name="perl"></a>Perl <sup>[top⇈](#contents)</sup>
> Perl is a general-purpose programming language originally developed for text manipulation and now used for a wide range of tasks including system administration, web development, network programming, GUI development, and more.
* [WebPerl](https://github.com/haukex/webperl) - Perl 5 in the browser.

--------------------


### <a name="php"></a>PHP <sup>[top⇈](#contents)</sup>
> PHP is a general-purpose scripting language that is especially suited to server-side web development, in which case PHP generally runs on a web server. Any PHP code in a requested file is executed by the PHP runtime, usually to create dynamic web page content or dynamic images used on websites or elsewhere.
* [PIB](https://github.com/oraoto/pib) - a PHP runtime in the browser.
* [PHP WASM](https://github.com/soyuka/php-wasm) - maintained fork of PIB with PHP 8 support based on the work of [seanmorris](https://github.com/seanmorris/php-wasm).
* [WebAssembly Language Runtimes](https://github.com/vmware-labs/webassembly-language-runtimes) - up-to-date PHP (including php-cgi) prebuilt for WASI

--------------------

### <a name="plorth"></a>Plorth <sup>[top⇈](#contents)</sup>
> Plorth is stack based, concatenative, strongly typed functional scripting language which is easy to embed to applications written in C++. It's inspired by Forth and Factor programming languages.
* [Plorth](https://github.com/RauliL/plorth-webassembly) - main repository.

--------------------

### <a name="poetry"></a>Poetry <sup>[top⇈](#contents)</sup>
> Poetry is a poetically dynamic and simple programming language that compiles to WebAssembly. It has a minimalisting syntax akin to CoffeeScript and gives you full control over wasm imports and exports.
* [Poetry](https://github.com/FantasyInternet/poetry) - main repository.

--------------------

### <a name="python"></a>Python <sup>[top⇈](#contents)</sup>
> Python is an open source interpreted high-level programming language for general-purpose programming. Created by Guido van Rossum and first released in 1991, Python has a design philosophy that emphasizes code readability, notably using significant whitespace. It provides constructs that enable clear programming on both small and large scales.
* [Pyodide](https://github.com/iodide-project/pyodide) - a port of Python to WebAssembly that includes the core packages of the scientific Python stack (Numpy, Pandas, matplotlib).  Objects transparently convert and share between Python and Javascript.
* [MicroPython](https://github.com/micropython/micropython/tree/master/ports/webassembly) - a lean and efficient Python implementation for microcontrollers and constrained systems.
* [RustPython](https://github.com/RustPython/RustPython) - A Python 3 interpreter written in Rust. Check the demo [here](https://rustpython.github.io/demo/)
* [RPython](https://github.com/soIu/rpython) - A RPython (PyPy's Restricted Python) to WebAssembly compiler
* [TPython](https://github.com/soIu/tpython) - Pythonic++ (a "dialect" of C++) to WebAssembly compiler
* [micropython-wasm](https://github.com/rafi16jan/micropython-wasm) - MicroPython build which features wide JS interop, e.g. waiting for JS promises.
* [WebAssembly Language Runtimes](https://github.com/vmware-labs/webassembly-language-runtimes) - up-to-date CPython prebuilt for WASI

--------------------

### <a name="prolog"></a>Prolog <sup>[top⇈](#contents)</sup>

> Prolog is a general-purpose logic programming language associated with artificial intelligence and computational linguistics. Prolog has its roots in first-order logic, a formal logic, and unlike many other programming languages, Prolog is intended primarily as a declarative programming language: the program logic is expressed in terms of relations, represented as facts and rules. A computation is initiated by running a query over these relations.
* [SWI-Prolog port to WebAssembly](https://github.com/SWI-Prolog/swipl-wasm) - a port of SWI-Prolog to WebAssembly. SWI-Prolog is a free implementation of the programming language Prolog commonly used for teaching and semantic web applications.
* [Ciao Prolog](https://github.com/ciao-lang/ciao) - includes a WebAssembly compilation target based on Emscripten. Ciao Prolog is a modern Prolog implementation designed to be portable, extensible and modular. Check the playground [here](https://ciao-lang.org/playground).

--------------------

### <a name="r"></a>R <sup>[top⇈](#contents)</sup>

> R is a language and environment for statistical computing and graphics.

* [WebR](https://github.com/georgestagg/webR) - R in the Browser. You can try it out [here](https://webr.r-wasm.org/latest/)

--------------------

### <a name="rebol"></a>Rebol <sup>[top⇈](#contents)</sup>

> Homoiconic ("data is code" and vice-versa) dynamic programming language and data-format (representing data and metadata) language.
> 
> By its author, "Rebol rebels against the idea that modern software must be large and complex".

* [Ren-C](https://github.com/metaeducation/ren-c) - Ren-C is a deeply redesigned derivative of the Rebol 3 codebase. Features "user-friendly" API for C and JavaScript. It has WASM-powered [Ren-C's replpad-js](https://github.com/hostilefork/replpad-js) - interactive Web Console for Rebol language (Ren-C branch). 
* [Rye](https://github.com/refaktor/rye) - Rye is a high level, dynamic programming language based on ideas from Rebol, flavored by Factor, *nix shells and Golang. Implemented in Golang. You can try it out [here](https://ryelang.org/).

--------------------

### <a name="rego"></a>Rego <sup>[top⇈](#contents)</sup>

> Open Policy Agent (OPA) is an open source, general-purpose policy engine that unifies policy enforcement across the stack. Rego is a high-level declarative policy language purpose-built for expressing policies over complex hierarchical data structures.

* [OPA-Wasm](https://github.com/open-policy-agent/opa/tree/main/wasm) - Compilation and evaluation of Rego policies using Wasm.
* [npm-opa-wasm](https://github.com/open-policy-agent/npm-opa-wasm) - NPM module providing an SDK for using Wasm compiled OPA policies.
* [rust-opa-wasm](https://github.com/matrix-org/rust-opa-wasm) - A crate to use OPA policies compiled to Wasm.
* [dotnet-opa-wasm](https://github.com/christophwille/dotnet-opa-wasm) - Call OPA policies in Wasm from C# .NET Core.
* [python-opa-wasm](https://github.com/a2d24/python-opa-wasm) - OPA Wasm SDK for Python.
* [java-opa-wasm](https://github.com/sangkeon/java-opa-wasm) - OPA Wasm SDK for Java.

--------------------

### <a name="ring"></a>Ring <sup>[top⇈](#contents)</sup>

> Ring is a Simple, Small, and Flexible practical general-purpose multi-paradigm language. The supported programming paradigms are Imperative, Procedural, Object-Oriented, Functional, Metaprogramming, Declarative programming using nested structures, and Natural programming.
> The language is portable (MS-DOS, Windows, Linux, macOS, Android, WebAssembly, etc.) and can be used to create Console, GUI, Web, Games, and Mobile applications.
* [Ring](https://github.com/ring-lang/ring) - main repository. You can try it out [here](https://tio.run/#ring).
* [WASM apps in Ring](https://ring-lang.github.io/doc1.19/qtwebassembly.html#online-applications) - list of demo web applications implemented in Ring.

--------------------

### <a name="roc"></a>Roc <sup>[top⇈](#contents)</sup>

> A fast, friendly, functional language. Compiles to machine code or WASM. Roc is a direct descendant of the Elm programming language.

* [roc](https://github.com/roc-lang/roc) - main repository. You can try it out [here](https://www.roc-lang.org/#try-roc).
* [basic-cli](https://github.com/roc-lang/basic-cli) - a Roc [platform](https://github.com/roc-lang/roc/wiki/Roc-concepts-explained#platform) to work with files, commands, HTTP, TCP, command line arguments, etc.
* [basic-webserver](https://github.com/roc-lang/basic-webserver) - a basic Web Server for Roc.

--------------------

### <a name="ruby"></a>Ruby <sup>[top⇈](#contents)</sup>
> Ruby is an open source interpreted high-level programming language for general-purpose programming. Created by Matz. Ruby has a design philosophy that emphasizes code readability, notably using as few sigils (special chars`:.{}%[]&=>;`) as possible.
* [Wruby](https://github.com/pannous/wruby) Web ruby - a port of minimal ruby (mruby).
* [run.rb](https://github.com/jasoncharnes/run.rb) run.rb - allows you to run Ruby code in the browser
* [Artichoke](https://github.com/artichoke/artichoke/blob/f8e9881403a50c3ba7e2b1ffc16f205c0b5e0255/VISION.md#design-and-goals) - a Ruby implementation written in Rust and Ruby. You can try it out here: https://artichoke.run
* [ruby.wasm](https://github.com/ruby/ruby.wasm/) - a collection of "official" WebAssembly ports of the CRuby. You can
  try it out [here](https://try.ruby-lang.org/playground/#code=puts+RUBY_DESCRIPTION&engine=cruby-3.2.0)
* [rlang](https://github.com/ljulliar/rlang) Rlang - a (subset of) Ruby to WebAssembly compiler
* [cry-wasm](https://github.com/kojix2/cry-wasm) - speeds up Ruby code using Crystal. By applying simple type restrictions to Ruby code, convert it to Crystal code, compile it to WebAssembly, and call it with Wasmer or Wasmtime.
* [Ruvy](https://github.com/Shopify/ruvy) - toolchain for bundling ruby.wasm pre-initialized and bundled with Ruby code
* [WebAssembly Language Runtimes](https://github.com/vmware-labs/webassembly-language-runtimes) - up-to-date MRI Ruby prebuilt for WASI

--------------------

### <a name="rust"></a>Rust <sup>[top⇈](#contents)</sup>
> Rust is a systems programming language sponsored by Mozilla Research, which describes it as a "safe, concurrent, practical language,"supporting functional and imperative-procedural paradigms. Rust is syntactically similar to C++, but its designers intend it to provide better memory safety while maintaining performance.
* [Rust `wasm32-unknown-unknown` target](https://www.hellorust.com/setup/wasm-target/) - Rust compiler backend for WebAssembly (without the need for Emscripten).
* [Wargo](https://github.com/lord/wargo) - a simple npm package that makes compiling Rust to WebAssembly easy on macOS or Linux.
* [RustWasmLoader](https://github.com/ianjsikes/rust-wasm-loader) - A simple Webpack loader that shells out to cargo to build a Rust project targeting WebAssembly.
* [CargoWeb](https://github.com/koute/cargo-web) - This cargo subcommand aims to make it easy and convenient to build, develop and deploy client-side Web applications written in Rust.
* [Wasm-Bindgen](https://github.com/rustwasm/wasm-bindgen) - A library and a CLI for Rust that facilitate high-level interactions between wasm modules and JavaScript.
* [Woz](https://github.com/alexkehayias/woz) - Woz is a WebAssembly progressive web app (PWA) toolchain for building and deploying performant mobile apps with Rust. Distributing your app is as simple as sharing a hyperlink.

--------------------

### <a name="scheme"></a>Scheme <sup>[top⇈](#contents)</sup>
> Scheme is a programming language that supports multiple paradigms, including functional programming and imperative programming, and is one of the two main dialects of Lisp. Unlike Common Lisp, the other main dialect, Scheme follows a minimalist design philosophy specifying a small standard core with powerful tools for language extension..
* [Schism](https://github.com/schism-lang/schism) - Schism is an experimental self-hosting compiler from a subset of R6RS Scheme to WebAssembly. Development so far has focused on features necessary for self-hosting. The compiler itself is written in, and compiles, a very small subset of Scheme.
* [scheme.wasm](https://github.com/pollrobots/scheme) - An R7RS Scheme implemented in WebAssembly. You can try it out [here](https://pollrobots.com/scheme/).
* [Guile Hoot](https://gitlab.com/spritely/guile-hoot) - a Scheme to WebAssembly compiler backend for GNU Guile and a general purpose WASM toolchain.

--------------------

### <a name="speedyjs"></a>Speedy.js <sup>[top⇈](#contents)</sup>
> Speedy.js is a compiler for a well considered, performance pitfalls free subset of JavaScript targeting WebAssembly. Because WebAssembly is statically-typed, the project uses TypeScript as type-checker and to resolve the types of the program symbols.
* ~[Speedy.js](https://github.com/MichaReiser/speedy.js) - main repository.~ `Unmaintained`

--------------------

### <a name="swift"></a>Swift <sup>[top⇈](#contents)</sup>
> Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. for iOS, macOS, watchOS, tvOS, Linux, and z/OS.
* [SwiftWasm](https://github.com/swiftwasm) - GitHub organization.

--------------------

### <a name="tcl"></a>Tcl <sup>[top⇈](#contents)</sup>
> Tcl (Tool Command Language) is a very powerful but easy to learn dynamic programming language, mature but evolving, highly extensible and suitable for a very wide range of uses.
* [Wacl](https://github.com/ecky-l/wacl) - A Tcl distibution for WebAssembly or Javascript. Features JS/DOM bindings. You can try it out [here](https://ecky-l.github.io/wacl/).

--------------------

### <a name="theta"></a>Theta <sup>[top⇈](#contents)</sup>
> Theta is a modern, general purpose, functional programming language with a strong type system and expressive syntax. It features a modular design and supports pattern matching, function overloading, and other goodies.
* [ThetaLang](https://github.com/alexdovzhanyn/ThetaLang) - main repository.

--------------------

### <a name="turboscript"></a>TurboScript <sup>[top⇈](#contents)</sup>
> TurboScript is an experimental programming language for parallel programming for web which compiles to JavaScript (asm.js) and WebAssembly (targeting post-MVP). The syntax is similar to TypeScript and the compiler is open source and written in TypeScript. TurboScript has zero dependencies.
* [TurboScript](https://github.com/01alchemist/TurboScript) - main repository.

--------------------

### <a name="typescript"></a>TypeScript <sup>[top⇈](#contents)</sup>
> TypeScript is an open-source programming language developed and maintained by Microsoft. It is a strict syntactical superset of JavaScript, and adds optional static typing to the language.
* See [AssemblyScript](#assemblyscript)

--------------------

### <a name="v"></a>V <sup>[top⇈](#contents)</sup>

> V is a statically typed compiled programming language designed for building maintainable software.

* [V](https://github.com/vlang/v) - main repository. You can try it out [here](https://play.vlang.io/)

--------------------

### <a name="virgil"></a>Virgil <sup>[top⇈](#contents)</sup>

> A fast and lightweight safe, garbage-collected systems programming language. Its compiler produces optimized, standalone native executables, WebAssembly modules, or JARs for the JVM.

* [Virgil](https://github.com/titzer/virgil) - main repository.

--------------------

### <a name="wa"></a>Wa <sup>[top⇈](#contents)</sup>

> Wa is a general-purpose programming language designed for developing robustness and maintainability WebAssembly software. Instead of requiring complex toolchains to set up, you can simply go install it - or run it in a browser.

> 凹语言™（凹读音“Wa”）是 针对 WASM 平台设计的的通用编程语言，支持 Linux、macOS 和 Windows 等主流操作系统和 Chrome 等浏览器环境，同时也支持作为独立Shell脚本和被嵌入脚本模式执行。

* [Wa/凹语言(English)](https://wa-lang.github.io/) - Design for WebAssembly.
* [Wa/凹语言(简体中文)](https://wa-lang.org/) - 凹语言 - 为 WebAssembly 而生.
* [Wa/凹语言(仓库)](https://github.com/wa-lang/wa) - main repository.

--------------------

### <a name="wah"></a>Wah <sup>[top⇈](#contents)</sup>
> Wah is a slightly higher level language that is a superset of WebAssembly. It aims to make WebAssembly's text format slightly more friendly to humans, without introducing new syntax or datatypes.
* ~[Wah](https://github.com/tmcw/wah) - main repository.~ `Unmaintained`

--------------------

### <a name="walt"></a>WAlt <sup>[top⇈](#contents)</sup>
> WAlt is an alternative syntax for WebAssembly text format. It's an experiment for using JavaScript syntax to write to as 'close to the metal' as possible. It's JavaScript with rules. .walt files compile directly to WebAssembly binary format.
* ~[Walt](https://github.com/ballercat/walt) - main repository.~ `Unmaintained`

--------------------

### <a name="wam"></a>Wam <sup>[top⇈](#contents)</sup>
> WebAssembly Macro language: Wam syntax is a near superset of wast syntax that is more convenient for human developers to write directly.
* ~[Wam](https://github.com/kanaka/wam) - main repository.~ `Unmaintained`

--------------------

### <a name="wase"></a>Wase <sup>[top⇈](#contents)</sup>
> WASE: WebAssembly made easy. Wase is a language, which tries to make WASM easy to write. The language maps closely to WebAssembly, and compiles directly to Wasm bytecode. Has strong typing with type inference.
* [Wase](https://github.com/area9innovation/wase) - main repository.

--------------------

### <a name="webassembly"></a>WebAssembly <sup>[top⇈](#contents)</sup>
> Yes, WebAssembly. `Wasm3` is the fastest WebAssembly interpreter, that enables WebAssembly self-hosting.
* [Wasm3](https://github.com/wasm3/wasm3) - main repository.
* [Wasm3 on WAPM](https://wapm.io/package/vshymanskyy/wasm3) - WAPM package.

--------------------

### <a name="wonkey"></a>Wonkey <sup>[top⇈](#contents)</sup>
> Wonkey is an easy to learn, object-oriented, modern and cross-platform programming language for creating cross-platform video games, highly inspired by the "BlitzBasic" range of languages.
* [Wonkey](https://github.com/wonkey-coders/wonkey) - main repository. Check the demo games [here](https://wonkey-coders.github.io/examples/).

--------------------

### <a name="wracket"></a>Wracket <sup>[top⇈](#contents)</sup>
> A lisp-like language that compiles to WebAssembly, written in racket
* ~[Wracket](https://github.com/sschauss/wracket) - main repository.~ `Unmaintained`

--------------------

### <a name="xcc"></a>xcc <sup>[top⇈](#contents)</sup>
> Toy C compiler for x86-64 and wasm
* [xcc](https://github.com/tyfkda/xcc) - main repository.
* [Online demo](https://tyfkda.github.io/xcc/).

--------------------

### <a name="zig"></a>Zig <sup>[top⇈](#contents)</sup>
> Zig is a general-purpose programming language designed for robustness, optimality, and maintainability.
* [Zig WebAssembly](https://ziglang.org/documentation/master/#WebAssembly) - documentation on WebAssembly

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

