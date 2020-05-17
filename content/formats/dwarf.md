title=DWARF
summary=Debugging format for ELF excutables
tags=format, native, elf, reading
~~~~~~

[Website](http://dwarfstd.org/) | [Wiki](http://wiki.dwarfstd.org/)

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
