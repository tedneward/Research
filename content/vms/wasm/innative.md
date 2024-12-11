title=inNative
tags=vm, wasm, linux, macos, windows
summary=An AOT (ahead-of-time) compiler for WebAssembly that creates C compatible binaries, either as sandboxed plugins you can dynamically load, or as stand-alone executables that interface directly with the operating system.
~~~~~~

[Source](https://github.com/innative-sdk/innative)

Implemented in C++ using LLVM. AOT and JIT compiled.

**Non-MVP features supported**: 

- Threads
- Multiple Result and Block Parameters
- Name Section
- Bulk Memory Operations
- Sign Extension Instructions
- Non-trapping Conversion Instructions

**Host APIs supported**: Custom
