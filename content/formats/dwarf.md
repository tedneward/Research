title=DWARF
summary=Debugging format for ELF excutables
tags=format, native, elf, reading, dwarf
~~~~~~

[Website](http://dwarfstd.org/) | [Wiki](http://wiki.dwarfstd.org/)

## Tools/Software

* dareog: ORC meets DWARF - https://github.com/emersion/dareog
* Debug Frame Checking: Check `.eh_frame` and `.debug_frame` information
	+ https://github.com/francesco-zappa-nardelli/eh_frame_check
* DIVA - Debug Information Visual Analyzer
	+ DIVA is a command line tool that processes DWARF debug information contained within ELF files and prints the semantics of that debug information. The DIVA output is designed to be understandable by software programmers without any low-level compiler or DWARF knowledge; as such, it can be used to report debug information bugs to the compiler provider.
	+ https://github.com/SNSystems/DIVA
	+ 2017 EuroLLVM Developers’ Meeting lightning talk
		- video: https://www.youtube.com/watch?v=SwtpXaCk2bE
		- slides: http://llvm.org/devmtg/2017-03/assets/slides/diva_debug_information_visual_analyzer.pdf
* dsymutil - manipulate archived DWARF debug symbol files
	+ https://llvm.org/docs/CommandGuide/dsymutil.html
	+ https://github.com/llvm-mirror/llvm/tree/master/tools/dsymutil
* dwarfexport: Export dwarf debug information from IDA Pro - https://github.com/ALSchwalm/dwarfexport
* dwarfidl: Language, library and tools for DWARF-described interfaces - https://github.com/stephenrkell/dwarfidl
* dwgrep: a tool, an associated language (Zwerg), and a library (libzwerg) for querying Dwarf (debuginfo) graphs
	+ project: https://github.com/pmachata/dwgrep
	+ syntax: http://pmachata.github.io/dwgrep/syntax.html
	+ tutorial: http://pmachata.github.io/dwgrep/tutorial.html
	+ website: http://pmachata.github.io/dwgrep/
* dwz: DWARF optimization and duplicate removal tool
	+ https://sourceware.org/git/?p=dwz.git
	+ https://fedoraproject.org/wiki/Features/DwarfCompressor
	+ announcement (2012) - https://gcc.gnu.org/ml/gcc/2012-04/msg00686.html
* gimli: A lazy, zero-copy parser for the DWARF debugging format
	+ https://github.com/gimli-rs/gimli
	+ Speeding Up `dwarfdump` With Rust - https://robert.ocallahan.org/2018/03/speeding-up-dwarfdump-with-rust.html
* libbacktrace: A C library that may be linked into a C/C++ program to produce symbolic backtraces
	+ As of September 2016, libbacktrace only supports ELF and PE/COFF executables with DWARF debugging information. The library is written to make it straightforward to add support for other object file and debugging formats.
	+ https://github.com/ianlancetaylor/libbacktrace
	+ https://github.com/gcc-mirror/gcc/tree/master/libbacktrace
* libdwarf - DWARF debugging information - https://sourceforge.net/projects/libdwarf/
	+ Libdwarf And Dwarfdump - http://wiki.dwarfstd.org/index.php?title=Libdwarf_And_Dwarfdump
	+ Libdwarf: Library to provide access to DWARF debugging information
		- Libdwarf meta repository that combines libdwarf with its dependency libelf
		- https://github.com/avast-tl/libdwarf
* libdwarfpp: A high-level API for accessing DWARF debugging information in C++
	+ https://github.com/stephenrkell/libdwarfpp
* libdwarfw: A C library to write DWARF debugging information
	+ https://github.com/emersion/libdwarfw
* llvm-dwarfdump - dump and verify DWARF debug information
	+ https://llvm.org/docs/CommandGuide/llvm-dwarfdump.html
* llvm-locstats - calculate statistics on DWARF debug location
	+ https://llvm.org/docs/CommandGuide/llvm-locstats.html
* Pahole and the dwarves: Debugging Information Manipulation Tools
	+ https://git.kernel.org/pub/scm/devel/pahole/pahole.git/
	+ https://github.com/acmel/dwarves
	+ https://www.spinics.net/lists/dwarves/
	+ The 7 dwarves: debugging information beyond gdb - https://landley.net/kdocs/ols/2007/ols2007v2-pages-35-44.pdf
	+ Poke-a-hole and friends - https://lwn.net/Articles/335942/
	+ pahole and other DWARF2 utilities - https://lwn.net/Articles/206805/
	+ How to avoid wasting megabytes of memory a few bytes at a time - https://developers.redhat.com/blog/2016/06/01/how-to-avoid-wasting-megabytes-of-memory-a-few-bytes-at-a-time/
* structhole: Look for holes in structs by examining DWARF debugging output - https://github.com/cemeyer/structhole

## Readings

* Introduction to the DWARF Debugging Format - http://www.dwarfstd.org/doc/Debugging%20using%20DWARF.pdf
* The contents of DWARF sections - https://eli.thegreenplace.net/2011/12/26/the-contents-of-dwarf-sections
* Exploring the DWARF debug format information - https://www.ibm.com/developerworks/aix/library/au-dwarf-debug-format/index.html
* DWARF Package File Format - https://gcc.gnu.org/wiki/DebugFissionDWP
* An interesting tree serialization algorithm from DWARF - https://eli.thegreenplace.net/2011/09/29/an-interesting-tree-serialization-algorithm-from-dwarf
* David A's DWARF Page - https://www.prevanders.net/dwarf.html
* Debug Information is Huge and What to do About It - https://documentation.backtrace.io/dwarf/
* Debugging formats DWARF and STAB - https://www.ibm.com/developerworks/library/os-debugging/
* DWARF Extensions for Separate Debug Information Files - https://gcc.gnu.org/wiki/DebugFission
* From Debugging-Information Based Binary-Level Type Inference to CFG Generation
	+ Conference on Data and Application Security and Privacy (CODASPY) 2018
	+ D. Zeng and G. Tan
	+ http://www.cse.psu.edu/~gxt29/papers/cfgConsMeta.pdf
* How debuggers work: Part 3 - Debugging information - http://eli.thegreenplace.net/2011/02/07/how-debuggers-work-part-3-debugging-information
* Implementing a Debugger: The Fundamentals - https://backtrace.io/blog/debugger-internals/
* Improving C++ Builds with Split DWARF - https://www.productive-cpp.com/improving-cpp-builds-with-split-dwarf/
* Programmatic access to the call stack in C++ - https://eli.thegreenplace.net/2015/programmatic-access-to-the-call-stack-in-c/
* Querying DWARF For Fun And Profit - https://developers.redhat.com/blog/2015/01/22/querying-dwarf-for-fun-and-profit/
* Reliable and Fast DWARF-based Stack Unwinding
	+ OOPSLA 2019
	+ Théophile Bastian, Stephen Kell, Francesco Zappa Nardelli
	+ https://www.di.ens.fr/~zappa/projects/frdwarf/
	+ https://2019.splashcon.org/details/splash-2019-oopsla/30/Reliable-and-Fast-DWARF-based-Stack-Unwinding
* Using COMDAT Sections to Reduce the Size of DWARF Debug Information - https://gcc.gnu.org/wiki/DwarfSeparateTypeInfo
* Where are your symbols, debuginfo and sources? - https://gnu.wildebeest.org/blog/mjw/2016/02/02/where-are-your-symbols-debuginfo-and-sources/
* Writing a Linux Debugger Part 4: Elves and dwarves - https://blog.tartanllama.xyz/writing-a-linux-debugger-elf-dwarf/

---

## Talks

* 2018 - DWARF v5 Highlights - Why You Care
	+ 2018 LLVM Developers’ Meeting; Paul Robinson
	+ https://www.youtube.com/watch?v=2Pb00xz8uH8
* 2018 - FOSDEM 2018 - [Debugging Tools](https://fosdem.org/2018/schedule/track/debugging_tools/)
	+ DWARF Pieces And Other DWARF Location Woes - https://fosdem.org/2018/schedule/event/dwarfpieces/
	+ DWARF5 and GNU extensions - https://fosdem.org/2018/schedule/event/debugging_tools_dwarf5/
	+ Rust versus DWARF versus LLVM - https://fosdem.org/2018/schedule/event/debugging_tools_rust/
* 2017 - Consistent Views at Recommended Breakpoints (bis), GNU Tools Cauldron 2017
	+ https://slideslive.com/38902686/consistent-views-at-recommended-breakpoints-bis
	+ Related post: https://developers.redhat.com/blog/2017/07/11/statement-frontier-notes-and-location-views/
* 2017 - Build-ids, symbols and debuginfo tooling BoF, GNU Tools Cauldron 2017
	+ https://slideslive.com/38902681/buildids-symbols-and-debuginfo-tooling-bof
* 2017 - Debugging Debug Information - Francesco Zappa Nardelli - [Workshop on Software Correctness and Reliability 2017](http://www.srl.inf.ethz.ch/workshop2017.php)
	+ https://www.youtube.com/watch?v=lBJIrGgEP1A
	+ Tales from Binary Formats ([ENTROPY 2018](https://entropy2018.sciencesconf.org/resource/page/id/1) slides) - https://entropy2018.sciencesconf.org/data/nardelli.pdf
* 2016 - Debugging debuggers!! (Symbolic Debugging with DWARF)
	- !!Con 2016; Samy Al Bahra
	- https://www.youtube.com/watch?v=OEa0EfJja_Y
	- https://backtrace.io/blog/backtrace/symbolic-debugging-with-dwarf/
	- https://backtrace.io/wp-content/uploads/2017/06/slides.pdf
	- https://www.slideshare.net/sbahra/symbolic-debugging-with-dwarf
* 2016 - Cheap generation of debugging information - http://pauillac.inria.fr/~xleroy/talks/Compilation-2016.pdf
* 2016 - Fixing LTO Debug Information - GNU Tools Cauldron 2016 - https://gcc.gnu.org/wiki/cauldron2016?action=AttachFile&do=view&target=Cauldron2016-LTOEarlyDebug.pdf - https://www.youtube.com/watch?v=xtm7DxDG5js
* 2015 - What is new in DWARF5 - Hafiz Abid Qadeer, GNU Tools Cauldron 2015
	+ https://www.youtube.com/watch?v=Q04ScFDCmyQ&gl=CA
	+ https://gcc.gnu.org/wiki/cauldron2015?action=AttachFile&do=view&target=Hafiz+Abid+Qadeer_+What+is+new+in+DWARF5.pdf
* 2013 - DWARF What Should GCC Tell GDB - GNU Tools Cauldron 2013 - https://www.youtube.com/watch?v=2aWmp5FXLb0
* 2012 - Dwarf Oriented Programming - Overwriting the Exception Handling Cache Pointer - DEFCON 20
	+ https://www.youtube.com/watch?v=FjjTZatJ3ao
	+ https://www.defcon.org/images/defcon-20/dc-20-presentations/Branco-Oakley-Bratus/DEFCON-20-Branco-Oakley-Bratus-Dwarf-Oriented-Programming.pdf
* 2011 - Exploiting the hard-working DWARF: Trojan and Exploit Techniques With No Native Executable Code
	+ http://www.cs.dartmouth.edu/~sergey/battleaxe/
	+ Slides: http://www.cs.dartmouth.edu/~sergey/battleaxe/hackito_2011_oakley_bratus.pdf
	+ Report: http://www.cs.dartmouth.edu/reports/TR2011-688.pdf
	+ Paper: https://www.usenix.org/legacy/event/woot11/tech/final_files/Oakley.pdf
	+ Video (WOOT'11): https://www.usenix.org/conference/woot11/exploiting-hard-working-dwarf-trojan-and-exploit-techniques-no-native-executable
	+ Video (Shmoocon 2011): https://www.youtube.com/watch?v=nLH7ytOTYto

