title=Web Assembly Tools
tags=platform, tool, web assembly
summary=A collection of Web Assembly tools.
~~~~~~

## Inspecting

- [WebAssembly Code Explorer](https://wasdk.github.io/wasmcodeexplorer/): A simple binary explorer with neat binary code highlighting.
- [Weave](https://evmar.github.io/weave): Another simple binary explorer.
- [wasm-opt](https://github.com/WebAssembly/binaryen) (part of Binaryen): 

    - Color output of s-expression format: `wasm-opt --print test.wasm`
    - Plot the callgraph using `Graphviz`: `wasm-opt --print-call-graph test.wasm | dot -Tpng -o callgraph.png`
    - Dump DWARF debug info sections: `wasm-opt --dwarfdump test.wasm`
    - Print function metrics: `wasm-opt --func-metrics test.wasm`

- [wasm-decompile](https://github.com/WebAssembly/wabt) (part of WABT) : `wasm-decompile` decompiles a wasm binary into readable code. It generates output that tries to look like a "very average programming language" while still staying close to the wasm it represents.
- [wasmdec](https://wwwg.github.io/web-wasmdec/) | [Source](https://github.com/wwwg/wasmdec): Converts WebAssembly binaries to C. Similar to `wasm2c`.
- [wasp](https://github.com/WebAssembly/wasp): Generate callgraphs, CFG and DFG graphs for wasm functions.
- [wasm-objdump](https://github.com/WebAssembly/wabt) (part of WABT): Print low-level details about a `.wasm` binary and each of its sections.
- [wasm-nm](https://github.com/fitzgen/wasm-nm): List the imported, exported, and private function symbols defined within a `.wasm` binary.

## Static analysis

- **Twiggy** | [repo](https://github.com/rustwasm/twiggy): Code size profiler, analyzes a binary's call graph.
- **Manticore** | [repo](https://github.com/trailofbits/manticore), [article](https://blog.trailofbits.com/2020/01/31/symbolically-executing-webassembly-in-manticore/): Symbolic execution of WebAssembly binaries.
- **Octopus** | [repo](https://github.com/pventuzelo/octopus): Security analysis framework for WebAssembly modules and Smart Contracts.
- **Wassail** | [repo](https://github.com/acieroid/wassail): A toolkit to perform both lightweight and heavyweight static analysis of WebAssembly modules.
- **wasm-opcodecnt** | part of [`WABT`](https://github.com/WebAssembly/wabt): Count wasm opcode usage statistics.


## Manipulating (optimization, transformation, instrumentation)

- **wasm-opt** | part of [`Binaryen`](https://github.com/WebAssembly/binaryen):
  - Transform binary for asynchronous execution (read more in [this article](https://kripken.github.io/blog/wasm/2019/07/16/asyncify.html)): `wasm-opt test.wasm --asyncify -O3 -o asyncified.wasm`
  - Instrument binary for dynamic execution tracing: `wasm-opt test.wasm --instrument-memory --instrument-locals --log-execution -o instrumetred.wasm`

- **wizer** | [repo](https://github.com/bytecodealliance/wizer): Don't wait for your Wasm module to initialize itself, pre-initialize it! Wizer instantiates your WebAssembly module, executes its initialization function, and then snapshots the initialized state out into a new WebAssembly module.
- **wasm2c** | part of [`WABT`](https://github.com/WebAssembly/wabt/blob/main/wasm2c/README.md): Takes a WebAssembly module and produces an equivalent (and runnable) C source and header.
- **wasm-snip** | [repo](https://github.com/rustwasm/wasm-snip): Replaces a WebAssembly function's body with an `unreachable`.
- **wasmonkey** | [repo](https://github.com/jedisct1/wasmonkey): Magically turns exported WASM functions into imported functions.
- **wasm-meter** | [npm](https://www.npmjs.org/package/wasm-metering), [repo](https://github.com/ewasm/wasm-metering): Injects metering into webassembly binaries. This counts computation time for a given program in units of `gas` (and allows limiting it).
- **CROW** | [repo](https://github.com/KTH/slumps/tree/master/crow): The Wasm superdiversifier. It takes C source code or LLVM bitcode as input and generates several functionally equivalent, but diverse Wasm binaries.  


## Dynamic analysis (tracing, profiling)

- **wasm3-strace** | [wapm](https://wapm.io/package/vshymanskyy/wasm3), [repo](https://github.com/wasm3/wasm3): Structured, seamless tracing of arbitrary WebAssembly/WASI execution.
- **Wasabi** | [home](http://wasabi.software-lab.org/), [repo](https://github.com/danleh/wasabi): "WebAssembly analysis using binary instrumentation", a dynamic analysis framework.
- **wasmsign2** | [repo](https://github.com/wasm-signatures/wasmsign2): A tool to add and verify digital signatures to/from WASM binaries.
- **swam** | [repo](https://github.com/satabin/swam/): A WASM interpreter with advanced tracing capabilities.

## Source-level debugging

- **wasminspect** | [repo](https://github.com/kateinoigakukun/wasminspect): An interactive and self-contained debugger for WebAssembly/WASI.

## Tool development

- **Tool Conventions** | [docs](https://github.com/WebAssembly/tool-conventions): Documents describing conventions useful for coordinating interoperability between wasm-related tools.
- **wasm2json, json2wasm** | [npm](https://www.npmjs.com/package/wasm-json-toolkit), [repo](https://github.com/ewasm/wasm-json-toolkit): A small toolkit for converting wasm binaries into json and back. Incredibly helpful for experimenting and creating your own transformations.
- **walrus** | [repo](https://github.com/rustwasm/walrus): Rust library for performing WebAssembly transformations in a robust and ergonomic fashion.
- **wasp** | [repo](https://github.com/WebAssembly/wasp): C++ library designed to make it easy to work with WebAssembly modules.
- **Binaryen.js** | [repo](https://github.com/AssemblyScript/binaryen.js): A port of Binaryen to the Web, allowing you to generate WebAssembly using JavaScript.
- **wasm-tools** | [repo](https://github.com/bytecodealliance/wasm-tools): Rust tooling for low-level manipulation of WebAssembly modules.

    `wasm-smith` test case generator is of particular interest.  
    `wasm-shrink` shrinks a Wasm file while preserving an interesting property (such as triggering a bug).

- **wasm-debug** | [repo](https://github.com/wasmerio/wasm-debug), [crate](https://crates.io/crates/wasm-debug): A runtime-independent Rust library that provides functionality to read, transform, and write DWARF section.
- **witx-codegen** | [repo](https://github.com/jedisct1/witx-codegen): A code generator to access WebAssembly standard APIs from different programming languages. Can also generate documentation.


## Reading

### Articles/Blogs/Essays

- [Fuzzers & Reducers as Productivity Tools](https://kripken.github.io/blog/binaryen/2019/06/11/fuzz-reduce-productivity.html)
- wasm2c: [wasmboxc](https://kripken.github.io/blog/wasm/2020/07/27/wasmboxc.html), [wasm2c](https://petersalomonsen.com/articles/wasm2c/wasm2c.html)  

#### Debugging

- https://developers.google.com/web/updates/2020/12/webassembly
- https://hacks.mozilla.org/2019/09/debugging-webassembly-outside-of-the-browser/
- [wasm-decompile](https://v8.dev/blog/wasm-decompile)

### Reference

- **WebAssembly Opcode Table** | [docs](https://pengowray.github.io/wasm-ops/)
