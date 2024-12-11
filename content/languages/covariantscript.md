title=CovariantScript
tags=language
summary=An open source, cross-platform programming language. 
~~~~~~

[Website](http://covscript.org.cn/) | [Source](https://github.com/covscript/covscript)

High-performance runtime environment. Self-developed efficient compilation system. Powerful and bloat-free extension system

## Features ##

+ Cross-platform, supporting most mainstream Operating Systems
    + Compatible with legacy compilers -- written in C++ 14
    + Apple macOS: Universal binary with x86_64 and arm64
    + Linux and Unix: x86, ARM, MIPS, LoongArch
    + Microsoft Windows: x86
+ Powerful and bloat-free extension system
    + C/C++ Native Interface(CNI) System: translate invoking from both C/C++ and Covariant Script
    + Interpreter Bootstrap: A portable way to access the Covariant Script Runtime from C++
    + CNI Composer Macro: Combined the extension system and CNI system organically
    + CFFI Support: Directly calling functions from shared library written in C
+ Self-developed efficient compilation system
    + Dependency-free and efficient compiler front-end
    + Unicode support optimized for Chinese
    + Support compile-time optimization
    + Exportable compilation results
+ High-performance runtime environment
    + Stackful asymmetric coroutine
    + Hotspot optimization algorithm
    + Efficient memory management system
    + Reference count garbage collection system

