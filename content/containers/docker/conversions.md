title=Docker/Container conversions
tags=platform, container
summary=a container-to-wasm image converter that enables to run the container on WASM.
~~~~~~

[Container2WASM](https://github.com/ktock/container2wasm): Convert container images to WASM

* Converts a container to WASM with emulation by Bochs (for x86_64 containers), TinyEMU (for riscv64 containers) and QEMU.
* Runs on WASI runtimes (e.g. wasmtime, wamr, wasmer, wasmedge, wazero)
* Runs on browser
* x86_64, riscv64 or AArch64 containers are recommended.
