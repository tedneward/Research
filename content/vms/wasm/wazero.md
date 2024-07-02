title=Wazero
tags=vm, wasm, linux, macos, windows
summary=A WebAssembly 1.0 and 2.0 spec compliant runtime written in Go, with zero platform dependencies.
~~~~~~

[Source](https://wazero.io)

Implemented in Go. Interpreted and JIT compiled.

**Non-MVP features supported**: 

- Bulk Memory Operations
- Import/Export of Mutable Globals
- Sign-extension operators
- Multi-Value Returns
- Name Section
- Non-trapping float-to-int conversions
- Reference Types
- SIMD

**Host APIs supported**: 

- AssemblyScript
- WASI

**Non-web standards**: 

- WASI

**Used by**

- [dapr](https://github.com/dapr/dapr) - APIs that simplify microservice connectivity
- [trivy](https://github.com/aquasecurity/trivy) - vulnerability/misconfiguration/secret scanner for containers and other artifacts
- [wapc-go](https://github.com/wapc/wapc-go) - WebAssembly Host Runtime for waPC-compliant modules
