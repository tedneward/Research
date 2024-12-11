title=Wizard
tags=vm, wasm, linux, macos, jvm
summary=Research WebAssembly Engine.
~~~~~~

[Source](https://github.com/titzer/wizard-engine) | 

The Wizard Engine is a lightweight WebAssembly virtual machine designed for teaching and research. Its implementation is designed to be flexible and easy to grasp, ideal for experimentation and modification. Built with the future in mind, it is written in a fast and lightweight safe, garbage-collected programming language, Virgil.

Implemented in Virgil. Interpreted and JIT compiled.

**Non-MVP features supported**: 

- Bulk Memory Operations
- Import/Export of Mutable Globals
- Sign-extension operators
- Multi-Value Returns
- Name Section
- Non-trapping float-to-int conversions
- Reference Types
- SIMD
- Tail-call
- GC
- Exception Handling

**Host APIs supported**: Wave, WASI

**Non-web standards**: WASI
