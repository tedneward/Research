title=Wasmer
tags=vm, wasm, linux, macos, windows, android
summary=A standalone WebAssembly runtime for running WebAssembly outside of the browser, supporting WASI and Emscripten.
~~~~~~

[Website](https://wasmer.io/) | [Source](https://github.com/wasmerio)

Implemented in C++ and Rust using Singlepass, Cranelift, and LLVM. JIT and AOT compiled.

**Interoperability with other languages**: 

- [Rust](https://github.com/wasmerio/wasmer)
- C
- C++
- [Python](https://github.com/wasmerio/wasmer-python)
- [Go](https://github.com/wasmerio/wasmer-go)
- [PHP](https://github.com/wasmerio/wasmer-php)
- Java
- [Ruby](https://github.com/wasmerio/wasmer-ruby)
- Postgres
- C#/.Net
- Elixir
- R
- D
- Swift

**Non-MVP features supported**: 

- Threads
- SIMD
- Multi Value returns
- Name Section
- Bulk Memory Operations
- Sign Extension Instructions

**Host APIs supported**:

- Emscripten
- WASI

**Non-web standards**:

- WASI
- wasm-c-api

**Used by**

- [Spacemesh Virtual Machine](https://github.com/spacemeshos/svm) - A Spacemesh smart contracts vm
- [CosmWasm](https://github.com/CosmWasm/cosmwasm) - A Cosmos-compatible library for running wasm smart contracts
- [NEAR Protocol](https://github.com/near/nearcore) - The reference client for NEAR protocol
- [Dprint](https://github.com/dprint/dprint) - Pluggable and configurable code formatting platform
