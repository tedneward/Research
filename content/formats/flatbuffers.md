title=FlatBuffers
tags=format, binary, storage, library, serialization
summary=An efficient OSS cross platform serialization library for a lot of mainstream programming languages. It was originally created at Google for game development and other performance-critical applications.
~~~~~~

[Website](https://google.github.io/flatbuffers/) | [Source](http://github.com/google/flatbuffers) | [White paper](https://google.github.io/flatbuffers/flatbuffers_white_paper.html)

Languages: C++, C#, C, Go, Java, Kotlin, JavaScript, Lobster, Lua, TypeScript, PHP, Python, Rust and Swift.

## Why use FlatBuffers?

* **Access to serialized data without parsing/unpacking** - What sets FlatBuffers apart is that it represents hierarchical data in a flat binary buffer in such a way that it can still be accessed directly without parsing/unpacking, while also still supporting data structure evolution (forwards/backwards compatibility).
* **Memory efficiency and speed** - The only memory needed to access your data is that of the buffer. It requires 0 additional allocations (in C++, other languages may vary). FlatBuffers is also very suitable for use with mmap (or streaming), requiring only part of the buffer to be in memory. Access is close to the speed of raw struct access with only one extra indirection (a kind of vtable) to allow for format evolution and optional fields. It is aimed at projects where spending time and space (many memory allocations) to be able to access or construct serialized data is undesirable, such as in games or any other performance sensitive applications. See the benchmarks for details.
* **Flexible** - Optional fields means not only do you get great forwards and backwards compatibility (increasingly important for long-lived games: don't have to update all data with each new version!). It also means you have a lot of choice in what data you write and what data you don't, and how you design data structures.
* **Tiny code footprint** - Small amounts of generated code, and just a single small header as the minimum dependency, which is very easy to integrate. Again, see the benchmark section for details.
* **Strongly typed** - Errors happen at compile time rather than manually having to write repetitive and error prone run-time checks. Useful code can be generated for you.
* **Convenient to use** - Generated C++ code allows for terse access & construction code. Then there's optional functionality for parsing schemas and JSON-like text representations at runtime efficiently if needed (faster and more memory efficient than other JSON parsers). Java, Kotlin and Go code supports object-reuse. C# has efficient struct based accessors.
* **Cross platform code with no dependencies** - C++ code will work with any recent gcc/clang and VS2010. Comes with build files for the tests & samples (Android .mk files, and cmake for all other platforms).

