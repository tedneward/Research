title=WAMR (WebAssembly Micro-Runtime)
tags=vm, web, wasm, native
summary=a lightweight standalone WebAssembly (WASM) runtime with small footprint, high performance and highly configurable features.
~~~~~~

[Source](https://github.com/bytecodealliance/wasm-micro-runtime)

It includes a few parts as below:

* The "iwasm" VM core to run WASM applications, supporting interpreter mode, AOT mode (Ahead-of-Time compilation) and JIT modes (Just-in-Time compilation, LLVM JIT and Fast JIT are supported)

* The "wamrc" AOT compiler to compile WASM file into AOT file for best performance and smaller runtime footprint, which is run by "iwasm" VM Core

* The application framework and the supporting APIs for the WASM applications

* The dynamic management of the WASM applications

