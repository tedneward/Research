title=Starlark
tags=language
summary=Starlark is a dialect of Python intended for use as a configuration language.
~~~~~~

Like Python, it is an untyped dynamic language with high-level data types, first-class functions with lexical scope, and garbage collection. Unlike CPython, independent Starlark threads execute in parallel, so Starlark workloads scale well on parallel machines. Starlark is a small and simple language with a familiar and highly readable syntax. You can use it as an expressive notation for structured data, defining functions to eliminate repetition, or you can use it to add scripting capabilities to an existing application.

A Starlark interpreter is typically embedded within a larger application, and the application may define additional domain-specific functions and data types beyond those provided by the core language. For example, Starlark was originally developed for the Bazel build tool. Bazel uses Starlark as the notation both for its BUILD files (like Makefiles, these declare the executables, libraries, and tests in a directory) and for its macro language, through which Bazel is extended with custom logic to support new languages and compilers.

[Specification](https://github.com/google/starlark-go/blob/master/doc/spec.md)

### Implementations

* Go: [Starlark](https://github.com/google/starlark-go/)
* Java: [Starlark](https://github.com/bazelbuild/bazel/tree/master/src/main/java/net/starlark/java)
* Rust: [Starlark](https://github.com/google/starlark-rust/)
