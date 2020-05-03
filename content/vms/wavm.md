title=WebAssembly Virtual Machine
type=page
tags=vms
status=published
summary=WebAssembly virtual machine designed for use in non-web applications.
~~~~~~

[Github](https://github.com/WAVM/WAVM) | [Website](https://wavm.github.io/)

From the Github page:

WAVM fully supports WebAssembly 1.0, plus many proposed extensions to it:

* WASI
* 128-bit SIMD
* Threads
* Reference types
* Multiple results and block parameters
* Bulk memory operations
* Non-trapping float-to-int conversions
* Sign-extension instructions
* Exception handling
* Extended name section
* Multiple memories

WAVM uses LLVM to compile WebAssembly code to machine code with close to native performance. It can even beat native performance in some cases, thanks to the ability to generate machine code tuned for the exact CPU that is running the code. WAVM also leverages virtual memory and signal handlers to execute WebAssembly's bounds-checked memory accesses at the same cost as a native, unchecked memory access.
