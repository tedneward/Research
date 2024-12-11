title=Extism
tags=vm, wasm, linux, macos, windows
summary=Goal is to make all software programmable, and is a flexible, embedded runtime to make it easy to extend your software with WebAssembly.
~~~~~~

[Source](https://github.com/extism/extism)

Implemented in Rust. JIT compiled.

SDKs to execute WebAssembly in:
- [`Browser`](https://extism.org/docs/integrate-into-your-codebase/browser-runtime-sdk/)
- [`C`](https://extism.org/docs/integrate-into-your-codebase/c-host-sdk/)
- [`C++`](https://extism.org/docs/integrate-into-your-codebase/cpp-host-sdk/)
- [`.NET`](https://extism.org/docs/integrate-into-your-codebase/dotnet-host-sdk)
- [`Elixir`](https://extism.org/docs/integrate-into-your-codebase/elixir-host-sdk/)
- [`Go`](https://extism.org/docs/integrate-into-your-codebase/go-host-sdk/)
- [`Haskell`](https://extism.org/docs/integrate-into-your-codebase/haskell-host-sdk/)
- [`Java`](https://extism.org/docs/integrate-into-your-codebase/java-host-sdk)
- [`Node`](https://extism.org/docs/integrate-into-your-codebase/node-host-sdk/)
- [`OCaml`](https://extism.org/docs/integrate-into-your-codebase/ocaml-host-sdk/)
- [`PHP`](https://extism.org/docs/integrate-into-your-codebase/php-host-sdk/)
- [`Python`](https://extism.org/docs/integrate-into-your-codebase/python-host-sdk/)
- [`Ruby`](https://extism.org/docs/integrate-into-your-codebase/ruby-host-sdk/)
- [`Rust`](https://extism.org/docs/integrate-into-your-codebase/rust-host-sdk/)
- [`Zig`](https://extism.org/docs/integrate-into-your-codebase/zig-host-sdk)

PDKs to create WebAssembly plug-ins in:
- [`Rust`](https://github.com/extism/rust-pdk)
- [`JavaScript`](https://extism.org/docs/write-a-plugin/js-pdk)
- [`Go`](https://github.com/extism/go-pdk)
- [`Haskell`](https://extism.org/docs/write-a-plugin/haskell-pdk)
- [`AssemblyScript`](https://github.com/extism/assemblyscript-pdk)
- [`C`](https://github.com/extism/c-pdk)
- [`C++`](https://github.com/extism/c-pdk)
- [`Zig`](https://extism.org/docs/write-a-plugin/zig-pdk)

**Host APIs supported**
    - module loading & linking via [`Manifest`](https://extism.org/docs/concepts/manifest)
    - WASI
    - non-WASI `http_request`
