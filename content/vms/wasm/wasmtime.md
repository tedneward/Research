title=Wasmtime
tags=vm, wasm, linux, macos, windows
summary=A standalone wasm-only runtime for WebAssembly, using the Cranelift JIT.
~~~~~~

[Website](https://wasmtime.dev/) | [Source](https://github.com/bytecodealliance/wasmtime)

Implemented in Rust using Cranelift. JIT compiled. Interops with Python.

**Non-MVP features supported**: Interface types

**Host APIs supported**: WASI

**Non-web standards**: WASI, wasm-c-api

**Used by**

- [Wasmi](https://github.com/paritytech/wasmi): an efficient WebAssembly interpreter that is used by [Substrate](https://github.com/paritytech/substrate), a next-generation framework for blockchain innovation.
