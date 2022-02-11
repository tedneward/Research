title=x86/x64 Assembly
tags=language, native, assembly, hardware
summary=The native assembly language of the Intel x86 family.
~~~~~~

## Tools

* Compiler Explorer: an interactive compiler
  - https://gcc.godbolt.org/
  - https://github.com/mattgodbolt/gcc-explorer
* Intel XED: The X86 Encoder Decoder
  - https://intelxed.github.io/
  - https://github.com/intelxed
* M/o/Vfuscator - the single instruction C compiler - https://github.com/xoreaxeaxeax/movfuscator
* Radare2
  - Radare project started as a forensics tool, a scriptable commandline hexadecimal editor able to open disk files, but later support for analyzing binaries, disassembling code, debugging programs, attaching to remote gdb servers, etc.
  - http://rada.re/
  - https://github.com/radare/radare2
* [Remill](https://github.com/trailofbits/remill): Remill is a static binary translator that translates machine code into LLVM bitcode. It translates x86 and amd64 machine code (including AVX and AVX512) into LLVM bitcode.
* STOKE - a stochastic optimizer for x86_64 assembly
  - https://github.com/StanfordPL/stoke
  - http://stoke.stanford.edu/
  + Talks:
    - STOKE: Search-Based Compiler Optimization - Alex Aiken (2016) - https://www.youtube.com/watch?v=rZFeTTFp7x4
    - Stochastic Optimization for x86 Binaries - Eric Schkufza (2015) - https://www.youtube.com/watch?v=aD9mZDJzb58

## Reading

* [A fundamental introduction to x86 assembly prorgamming](https://www.nayuki.io/page/a-fundamental-introduction-to-x86-assembly-programming) - Project Nayuki (HTML)

"The Art of Assembly Language", in several editions:
* [Windows](http://www.plantation-productions.com/Webster/www.artofasm.com/Windows/HTML/AoATOC.html) or [PDF](http://www.plantation-productions.com/Webster/www.artofasm.com/Windows/aoapdf.zip)
* [Linux](http://www.plantation-productions.com/Webster/www.artofasm.com/Linux/HTML/AoATOC.html) or [PDF](http://www.plantation-productions.com/Webster/www.artofasm.com/Linux/aoapdf.tar.gz)
* [DOS (16-bit)](http://www.plantation-productions.com/Webster/www.artofasm.com/DOS/AoADosIndex.html) or [PDF](http://www.plantation-productions.com/Webster/www.artofasm.com/DOS/pdf/0_AoAPDF.html)

* alternative link: [The Art of Assembly Language (2003)](https://web.archive.org/web/20120525102637/http://maven.smith.edu/~thiebaut/ArtOfAssembly/artofasm.html) - Randall Hyde (PDF)

["How to read assembly language"](https://wolchok.org/posts/how-to-read-assembly-language/)

[Collection of ASM resources](http://asm.sourceforge.net/resources.html) (source to some of the above; this page has non-x86 resources on it, as well, which I'd like to extract and put into other research notes pages)

["Metaprogramming in Flat Assembler"](https://gpfault.net/posts/asm-tut-1.txt.html): Demonstrating FASM (flat assembler) macros, which are pretty powerful, it seems.

### DOS

[Assembly tutorial for DOS](https://github.com/WindowsNT/asm) also available in a full list at [CodeProject: The Intel Assembly Manual](https://www.codeproject.com/Articles/1273844/The-Intel-Assembly-Manual)

### Linux

[Linux Assembly HOWTO](http://asm.sourceforge.net/howto.html) | [List of Linux/i386 system calls](http://www.lxhp.in-berlin.de/lhpsyscal.html) | [Another list of Linux/i386 system calls](http://asm.sourceforge.net/syscall.html) | [Linux Kernel Internals](http://www.tldp.org/LDP/lki/) | [Using the GNU Assembler](http://sourceware.org/binutils/docs-2.23.1/as/index.html)


* [x86-64 Assembly Language Programming with Ubuntu](http://www.egr.unlv.edu/~ed/x86.html) - Ed Jorgensen (PDF)
* [Software optimization resources](http://www.agner.org/optimize/) - A. Fog
* [Wizard Code, A View on Low-Level Programming](https://web.archive.org/web/20170712195930/http://vendu.twodots.nl/files/wizardcode4.pdf) - Tuomo Tuomo Venäläinen (PDF)

## Unfiltered

Assembler relaxation
http://eli.thegreenplace.net/2013/01/03/assembler-relaxation

Displaying all argv in x64 assembly  
http://eli.thegreenplace.net/2013/07/24/displaying-all-argv-in-x64-assembly

Gentle Introduction to x86-64 Assembly
http://www.x86-64.org/documentation/assembly.html

Introduction to x64 Assembly
https://software.intel.com/en-us/articles/introduction-to-x64-assembly

Processor Architecture
https://msdn.microsoft.com/en-us/library/windows/hardware/ff553442%28v=vs.85%29.aspx  
x86-32 and x86-64: Architecture, Instructions, Annotated Disassembly

Redundancy of x86 Machine Code
http://www.strchr.com/machine_code_redundancy

Stack frame layout on x86-64
http://eli.thegreenplace.net/2011/09/06/stack-frame-layout-on-x86-64

The x86 architecture is the weirdo
http://blogs.msdn.com/b/oldnewthing/archive/2004/09/14/229387.aspx

Trivia Questions for X86 Nerds  
http://www.msreverseengineering.com/blog/2015/6/9/x86-trivia-for-nerds  
Discussions:  
https://www.reddit.com/r/ReverseEngineering/comments/39gbxc/trivia_questions_for_x86_nerds/  
https://twitter.com/rolfrolles/status/608789071645691904

Understanding the x64 code models
http://eli.thegreenplace.net/2012/01/03/understanding-the-x64-code-models

Where the top of the stack is on x86  
http://eli.thegreenplace.net/2011/02/04/where-the-top-of-the-stack-is-on-x86

Windows x64 ABI  
Part 1: Intro to the Windows x64 calling convention   
http://www.gamasutra.com/view/news/171088/x64_ABI_Intro_to_the_Windows_x64_calling_convention.php  
Part 2: Stack frames  
http://www.gamasutra.com/view/news/178446/Indepth_Windows_x64_ABI_Stack_frames.php

## Books

- Assembly Language Succinctly
	- 2014; Christopher Rose
	- https://www.syncfusion.com/resources/techportal/details/ebooks/assemblylanguage
- Low-Level Programming
	- 2017; Igor Zhirkov
	- https://www.apress.com/us/book/9781484224021
	- https://github.com/Apress/low-level-programming
- Introduction to 64 Bit Assembly Language Programming for Linux and OS X
	- Ray Seyfarth
	- http://rayseyfarth.com/asm/
- Introduction to Computer Organization with x86-64 Assembly Language & GNU/Linux
	- Robert G. Plantz
	- http://bob.cs.sonoma.edu/IntroCompOrg-x64/book.html
- Modern X86 Assembly Language Programming
	- 2018; Daniel Kusswurm
	- Covers x86 64-bit, AVX, AVX2, and AVX-512
	- https://github.com/Apress/modern-x86-assembly-language-programming-2e
- Understanding Assembly Language
	- a.k.a. Reverse Engineering for Beginners; https://yurichev.com/blog/UAL/
	- https://beginners.re/
- x86-64 Assembly Language Programming with Ubuntu
	- Ed Jorgensen
	- http://www.egr.unlv.edu/~ed/x86.html
- Wikibooks
	- x86 Assembly - https://en.wikibooks.org/wiki/X86_Assembly
	- X86_Assembly: https://en.wikibooks.org/wiki/X86_Disassembly
- [Assemblers And Loaders (1993)](http://www.davidsalomon.name/assem.advertis/asl.pdf) - David Salomon (PDF)
- [Ralf Brown's Interrupt List](http://www.ctyme.com/rbrown.htm)
- [Run Down On x86 Intel Assembly Course](https://github.com/Ret2LC/x86-assembly) - Ret2LC
- [Zen of Assembly Language: Volume I, Knowledge (1990)](http://www.jagregory.com/abrash-zen-of-asm/) - Michael Abrash

### 32-bit

- Programming from the Ground Up Book  
	- An introduction to programming using Linux assembly language
	- https://savannah.nongnu.org/projects/pgubook/
	- http://programminggroundup.blogspot.com/
	- Download: http://download.savannah.gnu.org/releases/pgubook/
	- [PDF](https://download-mirror.savannah.gnu.org/releases/pgubook/ProgrammingGroundUp-1-0-booksize.pdf)
- PC Assembly Language Tutorial
	- [Github](http://pacman128.github.io/pcasm/) - P. A. Carter
	- http://web.archive.org/web/20150815073439/http://www.drpaulcarter.com/pcasm/

## Courses

- In-Depth: C/C++ Low Level Curriculum  
	- (defunct) http://www.altdevblogaday.com/author/alex-darby/
	- original location down; various mirrors available (follow the links to the previous parts):  
	- https://web.archive.org/web/20130810050325/http://www.altdevblogaday.com/author/alex-darby/  
	- https://www.gamasutra.com/search/?search_text=Alex+Darby
	- http://jahej.com/alt/2013_05_22_cc-low-level-curriculum-part-12-multiple-inheritance.html  

NASM Assembly Language Tutorials - asmtutor.com  
http://asmtutor.com/

Introductory Intel x86: Architecture, Assembly, Applications, & Alliteration  
http://opensecuritytraining.info/IntroX86.html  
YouTube: https://www.youtube.com/playlist?list=PL038BE01D3BAEFDB0

Intermediate Intel x86: Architecture, Assembly, Applications, & Alliteration  
http://opensecuritytraining.info/IntermediateX86.html  
YouTube: https://www.youtube.com/playlist?list=PL8F8D45D6C1FFD177

Introduction To Reverse Engineering Software  
http://opensecuritytraining.info/IntroductionToReverseEngineering.html  
YouTube: https://www.youtube.com/playlist?list=PL416CEDF4A931DB0D

Learning assembly for linux-x64
https://github.com/0xAX/asm
https://0xax.github.io/categories/assembly/

## Links

Assembly Language (x86) Resources
http://grail.cba.csuohio.edu/~somos/asmx86.html

Useful assembly links
http://www.agner.org/optimize/#links

## References

Agner Fog: Software optimization resources  
http://www.agner.org/optimize/  
1. Optimizing software in C++: An optimization guide for Windows, Linux and Mac platforms  
http://www.agner.org/optimize/optimizing_cpp.pdf  
2. Optimizing subroutines in assembly language: An optimization guide for x86 platforms  
http://www.agner.org/optimize/optimizing_assembly.pdf  
3. The microarchitecture of Intel, AMD and VIA CPUs: An optimization guide for assembly programmers and compiler makers  
http://www.agner.org/optimize/microarchitecture.pdf  
4. Instruction tables: Lists of instruction latencies, throughputs and micro-operation breakdowns for Intel, AMD and VIA CPUs  
http://www.agner.org/optimize/instruction_tables.pdf  
5. Calling conventions for different C++ compilers and operating systems  
http://www.agner.org/optimize/calling_conventions.pdf

AMD64 Application Binary Interface (ABI)  
http://www.x86-64.org/documentation.html  
http://www.x86-64.org/documentation_folder/abi.pdf

Assembly Optimization Tips
http://mark.masmcode.com/

Assembler x86 (FPU, MMX, SSE, SSE2, SSE3, SSSE3, SSE4, AVX, AVX2, AVX512)  
http://wm.ite.pl/articles/#assembler-x86-fpu-mmx-sse-sse2-sse3-ssse3-sse4-avx-avx2-avx512-new

Brennan's Guide to Inline Assembly  
http://www.delorie.com/djgpp/doc/brennan/brennan_att_inline_djgpp.html  
AT&T/UNIX syntax <-> Intel syntax

Chess Programming Wiki - Hardware: x86-64  
https://chessprogramming.wikispaces.com/x86-64

CPU: Intel® 64 and IA-32 Architectures Software Developer Manuals  
https://www-ssl.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html

CPU: Developer Guides, Manuals & ISA Documents  
http://developer.amd.com/resources/documentation-articles/developer-guides-manuals/

GCC-Inline-Assembly-HOWTO  
http://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html

Instruction latencies and throughput for AMD and Intel x86 processors  
https://gmplib.org/~tege/x86-timing.pdf

Inline assembly for x86 in Linux  
http://www.ibm.com/developerworks/linux/library/l-ia/

Inline assembly (linux-insides)  
https://0xax.gitbooks.io/linux-insides/content/Theory/asm.html

Intel Intrinsics Guide  
https://software.intel.com/sites/landingpage/IntrinsicsGuide/

Linux Assembly HOWTO  
http://asm.sourceforge.net/howto.html

OS Development Wiki  
http://wiki.osdev.org/

sandpile.org -- "The world's leading source for technical x86 processor information"  
http://www.sandpile.org/

Stack Overflow: 'x86' tag wiki  
https://stackoverflow.com/tags/x86/info

Stack Overflow: Documentation - Intel x86 Assembly Language & Microarchitecture  
http://stackoverflow.com/documentation/x86/topics

The Minimal 80x86 Instruction Set  
http://www.plantation-productions.com/Webster/www.writegreatcode.com/Vol2/wgc2_OA.pdf  
Appendix A of Write Great Code, Volume 2: https://www.nostarch.com/greatcode2.htm

The Netwide Assembler: NASM  
Chapter 11: Writing 64-bit Code (Unix, Win64)  
http://www.nasm.us/xdoc/2.11.09rc1/html/nasmdo11.html  
Links to the latest versions: http://www.nasm.us/docs.php

Wikipedia: x86 assembly topics  
https://en.wikipedia.org/wiki/Template:X86_assembly_topics

x86 Encoding Cheat Sheet  
https://www.akkadia.org/drepper/x86-opcode-structure.pdf

x86 Instruction Set Reference  
http://felixcloutier.com/x86/  
https://github.com/zneak/x86doc

x86 intrinsics cheat sheet  
A cheat sheet containing most x86 intrinsics, like SSE and AVX intrinsics, grouped in an intuitive fashion  
http://www3.in.tum.de/~finis/  
http://www3.in.tum.de/~finis/x86-intrin-cheatsheet-v2.2.pdf

x86, x64 Instruction Latency, Memory Latency and CPUID dumps  
http://users.atw.hu/instlatx64/

x86_64 NASM Assembly Quick Reference ("Cheat Sheet")  
https://www.cs.uaf.edu/2010/fall/cs301/support/x86_64/index.html

X86-64 Instruction Encoding  
http://wiki.osdev.org/X86-64_Instruction_Encoding

X86 Opcode and Instruction Reference  
http://ref.x86asm.net/

x86 Opcode Structure and Instruction Overview  
http://net.cs.uni-bonn.de/fileadmin/user_upload/plohmann/x86_opcode_structure_and_instruction_overview.pdf
 
x86 oddities  
http://x86.corkami.com 

### Slides

* Assembly: The mother of all languages - https://speakerdeck.com/takipiadmin/assembly-the-mother-of-all-languages
* Creating a language using only assembly language
  - https://speakerdeck.com/nineties/creating-a-language-using-only-assembly-language
  - https://github.com/nineties/amber
* Intro to x64 Reversing - Jon Larimer - SummerCon 2011
  - http://acmvm2.srv.mst.edu/wp-content/uploads/2014/07/Intro-to-x64-Reversing-Larimer-2011.pdf
  - http://codetastrophe.com/SummerCon%202011%20-%20Intro%20to%20x64%20Reversing.pdf
* x86 Assembly Primer for C Programmers
  - https://speakerdeck.com/vsergeev/x86-assembly-primer-for-c-programmers
  - https://github.com/vsergeev/apfcp
