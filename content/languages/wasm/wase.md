title=Wase
tags=language, wasm
summary=WebAssembly made easy
~~~~~~

[Source](https://github.com/area9innovation/wase)

The language is strongly typed, lexically scoped, and provides direct access to memory through load/stores. This is a low-level language without real data structures, lambdas/closures, nor memory management, but those can be written in this language.

The language is designed to expose the low-level flexibility of Wasm directly but in a friendly manner, which hides most of the complexity of the Wasm format.

It is intended to be used as for low-level Wasm programs, such as language runtimes (incl. memory allocators and gcs) for higher-level languages, or as a target for languages that want to compile directly to Wasm. It also helps explain how Wasm works by hiding some of the low-level details so the structure and semantics are clarified.

