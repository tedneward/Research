title=C
tags=language, native
summary=General-purpose, imperative, supporting structured programming, lexical variable scope and recursion, while a static type system prevents many unintended operations.
~~~~~~

[C Specification](http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1124.pdf) (6 May 2005 Draft) | [C17 Standard Draft](http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2310.pdf)

Frequently conjoined with [C++](/languages/cplusplus).

Numerous languages seek to supplant or replace C as the ubiquitous system language. None so far have been successful.

### Implementations:

* [gcc](https://gcc.gnu.org/projects/cxx-status.html)
* [clang](http://clang.llvm.org/cxx_status.html) from [LLVM](/platforms/llvm.html)
* [lcc](https://drh.github.io/lcc/) ([Source](https://github.com/drh/lcc)): A retargetable C compiler
* [Emscripten](https://emscripten.org/)
* [TinyC](https://bellard.org/tcc/): [Website](http://savannah.nongnu.org/projects/tinycc) and [Git repo](https://repo.or.cz/w/tinycc.git) | [Single-page](http://www.iro.umontreal.ca/~felipe/IFT2030-Automne2002/Complements/tinyc.c)
* [OpenWatcom](http://www.openwatcom.org/)
* [Cheerp](https://leaningtech.com/pages/cheerp.html): C to WASM bytecode
* [PicoC](https://github.com/zsaleeba/picoc): Statically typed. Interprets a subset of C.
* [Dev-C++](http://www.bloodshed.net/) : Free IDE and compiler for the C and C++ languages. Delphi and C source code available.
* [SmallC](http://www.bloodshed.net/downloads/smallc22.zip) : Small C compiler written by J. E. Hendrix. C source code included.
* [Djgpp](http://www.delorie.com/djgpp/) : Free compiler for c, c++, forth, pascal and more including C sources.
* [lcc](http://www.cs.princeton.edu/software/lcc/index.html) : lcc is a retargetable compiler for ISO Standard C. It generates code for the ALPHA, SPARC, MIPS R3000, and Intel x86 and its successors.
* [LCC-Win32](https://lcc-win32.services.net/) : a free compiler system for Windows by Jacob Navia.
* [Pacific C for DOS](http://www.grifo.com/SOFT/Pacific/uk_pacific.html) : Freeware version for MSDOS of a professional C IDE/compiler shareware
* [Dev86 / BCC](https://github.com/lkundrak/dev86) : 8086 C/Assembler development tools (C compiler, assembler, linker). Open Source.
* [Extended C Development Kit](http://openecdk.sourceforge.net/)
* [CuikC](https://cuik.handmade.network/): The plan is a modern C11 compiler which can mostly work with Clang, GCC, and MSVC while also introducing some new ideas. Warning: unfinished
* [C compiler written in untyped lambda calculus](https://github.com/woodrush/lambda-8cc):
    * Compile C to:
        * x86 executable (a.out)
        * Lambda calculus term (runs on the same interpreter as lambda-8cc)
        * Binary lambda calculus program
        * SKI combinator calculus term (runnable as a Lazy K program)
        * ELVM assembly listing (example: rot13.s)
    * Compile ELVM assembly to:
        * x86/lambda calculus/BLC/SKI combinator calculus (all of the above)

[Cosmopolitan](https://github.com/jart/cosmopolitan) Libc: "makes C a build-once run-anywhere language, like Java, except it doesn't need an interpreter or virtual machine. Instead, it reconfigures stock GCC and Clang to output a POSIX-approved polyglot format that runs natively on Linux + Mac + Windows + FreeBSD + OpenBSD + NetBSD + BIOS with the best possible performance and the tiniest footprint imaginable."

---

## Relationship to other languages

* [C-rusted: The Advantages of Rust, in C, without the Disadvantages](https://arxiv.org/pdf/2302.05331.pdf)
* [CLangSharp](https://github.com/dotnet/ClangSharp): CLang bindings in [C#](/languages/dotnet/csharp)