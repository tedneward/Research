title=DotNext
tags=library, language, clr
summary=A collection of .NET libraries intended to fill in gaps left by the CLR and standard library.
~~~~~~

[Website](https://sakno.github.io/dotNext/index.html) | [Github](https://github.com/sakno/dotNext)

### DotNext
This library is the core of .NEXT which extends .NET Standard API with

* Value Delegates as allocation-free and lightweight alternative to regular .NET delegates
* Enum API to work with arbitrary enum types
* Thread-safe advanced atomic operations to work with int, long, bool, double, float, IntPtr, arbitrary reference and value types
* Unified representation of various synchronization primitives in the form of the lock
* Generic specialization with constant values
* Generation of random strings
* Low-level methods to work with value types
* Fast comparison of arrays
* Ad-hoc user data associated with arbitrary object

### DotNext.Reflection
.NET Reflection is slow because relies on late-bound calls when every actual argument should be validated. There is alternative approach: dynamic code generation optimized for every member call. Reflection library from .NEXT family provides provides fully-featured fast reflection using dynamic code generation. Invocation cost is comparable to direct call. Check Benchmarks to see how it is fast. Additionally, the library provides support of Type Classes. You don't need to wait C# language of version X to obtain this feature.

### DotNext.Metaprogramming
This library provides a rich API to write and execute code on-the-fly. It extends C# Expression Tree programming model with ordinary things for C# such as foreach loop, for loop, while loop, using statement, lock statement, string interpolation and even asynchronous lambda expressions with full support of async/await semantics.

### DotNext.Unsafe
This library provides a special types to work with unmanaged memory in safe manner:

* Structured access to unmanaged memory
* Unmanaged memory pool
* Interop with unmanaged memory via Memory value type
* CLS-compliant generic pointer type for .NET languages without direct support of such type. Use this feature to work with pointers from VB.NET or F#.
* Atomic thread-safe operations applicable to data placed into unmanaged memory: increment, decrement, compare-and-set etc, volatile access
* Calling unmanaged functions by pointer

### DotNext.Threading
The library allows you to reuse experience of blocking synchronization with help of ReaderWriteLockSlim, AsyncCountdownEvent and friends in asynchronous code using their alternatives such as asynchronous locks.

### DotNext.IO
Extending streams and I/O pipelines with methods for reading and writing typed values including strings asynchronously. Arbitrary character encodings are supported. Now encoding or decoding data using pipes is much easier and comparable with BinaryWriter or BinaryReader.

### DotNext.Net.Cluster
Provides rich framework for building clustered microservices based on network consensus and distributed messaging. It includes transport-agnostic implementation of Raft Consensus Algoritm that can be adopted for any communication protocol and high-performance persistent Write Ahead Log suitable for general-purpose usage.

### DotNext.AspNetCore.Cluster
Allows to build clustered microservices which rely on network consensus and distributed messaging with ASP.NET Core framework. This library contains HTTP-based implementation of Raft Consensus Algorithm, HTTP-based distributed messaging across cluster nodes, cluster leader detection, automatic redirection to leader node and many other things.

### DotNext.Augmentation
.NEXT Augmentations extends compilation pipeline with tricks and optimizations not available in Roslyin Compiler out-of-the-box. It is actually not a library, but IL code weaver implemented as Fody add-in.
