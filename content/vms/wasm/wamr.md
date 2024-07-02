title=WAMR (WebAssembly Micro-Runtime)
tags=vm, web, wasm, native, linux, macos, windows, android
summary=a lightweight standalone WebAssembly (WASM) runtime with small footprint, high performance and highly configurable features.
~~~~~~

[Source](https://github.com/bytecodealliance/wasm-micro-runtime)

Implemented in C. Interpreted, AOT, and JIT compiled.

It includes a few parts as below:

* The "iwasm" VM core to run WASM applications, supporting interpreter mode, AOT mode (Ahead-of-Time compilation) and JIT modes (Just-in-Time compilation, LLVM JIT and Fast JIT are supported)

* The "wamrc" AOT compiler to compile WASM file into AOT file for best performance and smaller runtime footprint, which is run by "iwasm" VM Core

* The application framework and the supporting APIs for the WASM applications

* The dynamic management of the WASM applications

**Non-MVP features supported**

- [Non-trapping float-to-int conversions](https://github.com/WebAssembly/nontrapping-float-to-int-conversions)
- [Sign-extension operators](https://github.com/WebAssembly/sign-extension-ops)
- [Bulk memory operations](https://github.com/WebAssembly/bulk-memory-operations)
- [Shared memory](https://github.com/WebAssembly/threads/blob/main/proposals/threads/Overview.md#shared-linear-memory)
- [Multi-value](https://github.com/WebAssembly/multi-value)
- [Tail-call](https://github.com/WebAssembly/tail-call)


**Host APIs supported**

- [wasm-c-api](https://github.com/WebAssembly/wasm-c-api)

**Non-web standards**

- [x] WASI
