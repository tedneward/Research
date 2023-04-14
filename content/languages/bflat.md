title=Bflat
tags=language, native, clr, object
summary=A native compiler for C# that comes with everything you need to build C# apps for any of the supported platforms.
~~~~~~

[Website](https://flattened.net/) | [Source](https://github.com/bflattened/bflat) | [Runtime source](https://github.com/bflattened/runtime) (a regularly updated fork of the dotnet/runtime repo that contains non-upstreamable bflat-specific changes and produces compiler and runtime binaries that this repo consumes.)

bflat is a concoction of Roslyn - the "official" C# compiler that produces .NET executables - and NativeAOT (née CoreRT) - the ahead of time compiler for .NET based on CoreCLR. Thanks to this, you get access to the latest C# features using the high performance CoreCLR GC and native code generator (RyuJIT).

bflat merges the two components together into a single ahead of time crosscompiler and runtime for C#.

bflat can currently target:

* x64/arm64 glibc-based Linux (2.17 or later on x64 (~CentOS 7), or 2.27 or later on arm64 (~Ubuntu 18.04))
* arm64 bionic-based Linux (Android API level 21)
* x64/arm64 Windows (Windows 7 or later)
* x64 UEFI (only with --stdlib:zero)

Support for musl-based Linux is in the works.

bflat can either produce native executables, or native shared libraries that can be called from other languages through FFI.

