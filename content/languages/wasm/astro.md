title=Astro
tags=language, native, wasm
summary=Multiparadigm language with Python-ish syntax compiling to WASM and native code
~~~~~~

[Website](https://astrolang.org/) | [Source](https://github.com/astrolang/astro)

## What is Astro?
Astro is a fun programming language designed for safe high-performance applications. It is essentially a statically-typed systems language that

* facilitates rapid prototyping,
* features high-level abstractions with zero overhead,
* ensures memory safety without a (tracing) Garbage Collector, and
* supports data-race-free concurrency.

## Why create yet another programming language?
The language creator had a set of requirements (listed above) not met by any language (Rust comes close). Although, the project started as an educational effort, it later shaped into a language designed to meet those requirements.

SIMD, threads and direct access to Web APIs are planned for WebAssembly. These and other proposals for GPU Compute will make the web a desirable HPC target in the near future. Astro is, for this reason, designed for high-performance apps that are expected to run on the server or in the browser.

In order to match up with the expressiveness and productivity of dynamic programming languages, Astro adds full type inference, structural typing, and some other high-level abstractions that reduce boilerplate code commonly associated with statically-typed languages. It feels like a scripting language for the most part.

**Python**
```
def times(a, b):
    sum = a
    for i in range(b):
        sum += sum
    return sum
```

**Astro**
```
fun times(a, b) {
    var sum = a
    for i in range(b) {
        sum += sum
    }
    return sum
}
```

Astro is supposed to be high-level enough to write python-like scripts but also low-level enough to write an operating system kernel. Therefore, it doesn't have a traditional garbage collector instead it relies on lifetime analysis at compile-time that free memory once they are no longer referenced.

