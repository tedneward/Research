title=WASM3
tags=vm, web assembly, windows, linux, macos, android
summary=A high performance WebAssembly interpreter.
~~~~~~

[Source](https://github.com/wasm3/wasm3)

Implemented in C. Interpreted.

* [Wasm3 on WAPM](https://wapm.io/package/vshymanskyy/wasm3) - WAPM package.

**Why use a "slow interpreter" versus a "fast JIT"?**

In many situations, speed is not the main concern. Runtime executable size, memory usage, startup latency can be improved with the interpreter approach. Portability and security are much easier to achieve and maintain. Additionally, development impedance is much lower. A simple library like Wasm3 is easy to compile and integrate into an existing project. (Wasm3 builds in a just few seconds). Finally, on some platforms (i.e. iOS and WebAssembly itself) you can't generate executable code pages in runtime, so JIT is unavailable.

**Why would you want to run WASM on embedded devices?**

Wasm3 started as a research project and remains so by any means. Evaluating the engine in different environments is part of the research. Given that we have `Lua`, `JS`, `Python`, `Lisp`, `...` running on MCUs, `WebAssembly` is a promising alternative. It provides toolchain decoupling as well as a completely sandboxed, well-defined, predictable environment. Among practical use cases we can list `edge computing`, `scripting`, `plugin systems`, running `IoT rules`, `smart contracts`, etc.

**Interoperability with other languages**: 

- Python
- C/C++
- Rust
- Go
- Zig
- Swift
- C#/.Net

**Non-MVP features supported**: Multi-Value, Bulk Memory Operations, Sign-extension operators, Non-trapping conversions, Name Section

**Host APIs supported**: WASI, Custom

**Non-web standards**: WASI, Gas Metering

**Used by**

- [wasmcloud](https://wasmcloud.dev/) - A platform for writing portable business logic
- [Shareup](https://shareup.app/) - Fast, private sharing for everyone
- [WowCube](https://wowcube.com/) - An nnovative console and the gaming platform
- [txiki.js](https://github.com/saghul/txiki.js) -A small and powerful JavaScript runtime
