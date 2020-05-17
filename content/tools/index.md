title=Tools
type=categorypage
category=tool
summary=A collection of software tools, more software development-related than not.
~~~~~~

Tools to break out into individual pages:

## DLL: Software

- Dependencies: An open-source modern Dependency Walker
	- https://lucasg.github.io/Dependencies/
	- https://github.com/lucasg/Dependencies
- Dependency Walker - http://www.dependencywalker.com/
- Detours - https://www.microsoft.com/en-us/research/project/detours/
- DetoursNT: Detours with just single dependency - NTDLL
	- https://github.com/wbenny/DetoursNT
- DLL Diagnostic Tools: Tools for diagnosing DLL dependency loading issues
	- https://github.com/adamrehn/dll-diagnostics
- DLL_to_EXE: Converts a DLL into a ready-to-use EXE. Supports both 32 and 64 bit DLLs
	- https://github.com/hasherezade/dll_to_exe
- EasyHook
	- https://easyhook.github.io/
	- https://github.com/EasyHook/EasyHook
- GNU Binary Utilities - https://sourceware.org/binutils/docs/binutils/
	- dlltool: Create files needed to build and use DLLs - https://sourceware.org/binutils/docs/binutils/dlltool.html
- InjectDLL: a Windows command line tool to inject DLLs into other processes - http://bytepointer.com/tools/index.htm#injectdll
- Koppeling: Adaptive DLL hijacking / dynamic export forwarding
	- https://github.com/monoxgas/Koppeling
- loadlibrary: Porting Windows Dynamic Link Libraries to Linux
	- https://github.com/taviso/loadlibrary
- MemoryModule: Library to load a DLL from memory
	- https://github.com/fancycode/MemoryModule
	- https://www.joachim-bauch.de/tutorials/loading-a-dll-from-memory/
- PESecInfo: A simple tool to view important DLL Characteristics and change DEP and ASLR
	- https://github.com/OsandaMalith/PESecInfo
	- https://osandamalith.com/2018/10/24/pe-sec-info-a-simple-tool-to-manipulate-aslr-and-dep-flags/
- Rattler: Automated DLL Enumerator
	- https://github.com/sensepost/rattler
	- Rattler: Identifying and Exploiting DLL Preloading Vulnerabilities
		- https://sensepost.com/blog/2016/rattleridentifying-and-exploiting-dll-preloading-vulnerabilities/
	- What the Dll? Finding and Exploiting DLL preloading vulnerabilities - Chris Le Roy
		- https://www.youtube.com/watch?v=xvluwoPM8v8
- Reflective DLL Injection with PowerShell - https://clymb3r.wordpress.com/2013/04/06/reflective-dll-injection-with-powershell/
- ReflectiveDLLInjection - https://github.com/stephenfewer/ReflectiveDLLInjection
- ReloadLibrary
	- ReloadLibrary is a quick-and-dirty anti-hook library. Given the name of a .dll, it will make a temporary copy of the .dll on disk, load the copy, and overwrite the import address table with corresponding function addresses in the cloned library.
	- https://github.com/nickcano/ReloadLibrary
- ThreadContinue: Reflective DLL injection using SetThreadContext() and NtContinue()
	- https://github.com/zerosum0x0/ThreadContinue
	- https://zerosum0x0.blogspot.com/2017/07/threadcontinue-reflective-injection.html

## DWARF: Software

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

## ELF: Software

- ABI Dumper - a tool to dump ABI of an ELF object containing DWARF debug info - https://github.com/lvc/abi-dumper
- abidiff - compares the Application Binary Interfaces (ABI) of two shared libraries in ELF format
	- https://sourceware.org/libabigail/manual/abidiff.html
	- Comparing ABIs for Compatibility with libabigail – Part 1 - https://developers.redhat.com/blog/2014/10/23/comparing-abis-for-compatibility-with-libabigail-part-1/
	- Comparing ABIs for Compatibility with libabigail – Part 2 - https://developers.redhat.com/blog/2014/10/28/comparing-abis-for-compatibility-libabigail-part-2/
	- Talk: Libabigail: How semantic analysis of C and C++ ELF binaries can be used to analyze ABI changes (openSUSE Conference 2017)
		- https://media.ccc.de/v/1234-libabigail-how-semantic-analysis-of-c-and-c-elf-binaries-can-be-used-to-analyze-abi-changes
		- https://www.youtube.com/watch?v=wxVBuZK8Dl0
- binception: Generate hash values for functions within an ELF binary - https://github.com/enferex/binception
- binch: a light BINary patCH tool - https://github.com/tunz/binch
- core2ELF64: Recover 64 bit ELF executables from memory dump
	- https://github.com/enbarberis/core2ELF64
- dnload: Minimal binary generator for \*nix operating systems
	- dnload.py is a script for generating minimal ELF binaries from C code. It serves no practical real-world use case, but can be utilized to aid in the creation of size-limited demoscene productions.
	- https://github.com/faemiyah/dnload
- dress: add symbols back into a stripped ELF binary (~strip)
	- http://van.prooyen.com/projects/#dress
	- https://github.com/docileninja/dress
- dt_infect: ELF Shared library injector using DT_NEEDED precedence infection. Acts as a permanent LD_PRELOAD
	- https://github.com/elfmaster/dt_infect
- DynELFSymbols: Helps to create backdoor/MitM shared-object files
	- https://github.com/magisterquis/dynelfsymbols
	- https://github.com/magisterquis/dynelfsymbols/blob/master/QUICKSTART.md
	- https://github.com/magisterquis/dynelfsymbols/blob/master/THEORY.md
- dynStruct: a tool using dynamoRio to monitor memory accesses of an ELF binary via a data gatherer, and use this data to recover structures of the original code
	- https://github.com/ampotos/dynStruct
	- dynStruct: An automatic reverse engineering tool for structure recovery and memory use analysis - Daniel Mercier - Master Thesis (2017)
		- https://kar.kent.ac.uk/58461/
	- dynStruct: An automatic reverse engineering tool for structure recovery and memory use analysis - Mercier, Daniel and Chawdhary, Aziem and Jones, Richard E. (2017), IEEE 24th International Conference on Software Analysis, Evolution and Reengineering (SANER)
		- https://kar.kent.ac.uk/63700/
- ECFS: extended core file snapshot format
	- https://github.com/elfmaster/ecfs
	- DEF CON 23 - Ryan Oneill - Advances in Linux Process Forensics Using ECFS - https://www.youtube.com/watch?v=fCJJnJ84MSE
	- an extension to the existing ELF core file format in Linux. Its job is to intercept the Linux core-dump handler, catch the core-dump before it is written to disk, and carefully reconstruct it into an ecfs-core file.
	- execute memory snapshots so they can start running where they left off - https://github.com/elfmaster/ecfs_exec
- elf-bf-tools - https://github.com/bx/elf-bf-tools
	- This project contains tools that can be used to coerce the gcc's runtime loader into performing interesting operations using only valid relocation entries and symbols.
- elf-parser: identifying/extracting various sections of an ELF file
	- https://github.com/TheCodeArtist/elf-parser
- elf-strings: The better strings utility for the reverse engineer - https://github.com/LloydLabs/elf-strings
- ELF/PaX Utilities - https://github.com/gentoo/pax-utils
	- https://en.wikibooks.org/wiki/Grsecurity/Additional_Utilities
	- scanelf - Prints out information specific to the ELF structure of a binary - https://wiki.gentoo.org/wiki/Hardened/PaX_Utilities#Extracting_ELF_information_from_binaries
	- dumpelf - Converts a ELF file into human readable C code that defines a structure with the same image as the original ELF file - https://wiki.gentoo.org/wiki/Hardened/PaX_Utilities#Programming_with_ELF_files
- ELF Tailoring (EMSOFT 2019)
	- see: [ELF](#elf): [Readings](https://github.com/MattPD/cpplinks/blob/master/executables.md#readings-3): "Honey, I Shrunk the ELFs: Lightweight Binary Tailoring of Shared Libraries"
	- https://gitlab.cs.fau.de/i4/pub/elftailor
	- ELF diet: Tool to shrink the tailored ELF files to a smaller size
		- https://gitlab.cs.fau.de/i4/pub/elftailor/elfdiet
	- remove_from_elf: Tool to remove functions from ELF library interfaces and to overwrite their implementation
		- https://gitlab.cs.fau.de/i4/pub/elftailor/remove_from_elf
	- librarytrader: Tool for static and dynamic analysis of dependencies between application(s) and shared libraries which allows us to determine unused functions
		- https://gitlab.cs.fau.de/i4/pub/elftailor/librarytrader
- ELF Tool Chain Project - https://sourceforge.net/projects/elftoolchain/
	- A BSD-licensed implementation of compilation tools (nm, ar, as, ld, etc.) for the ELF object format.
- ELFbac: runtime intent-level ABI-granular memory protection for Linux - http://elfbac.org/
- ELFen: Extract and spell check read-only strings within ELF binaries - https://github.com/enferex/ELFen
- Elfesteem: Executable file format parser/generator - https://github.com/serpilliere/elfesteem
- ElfFrag: Binary Debloating of ELF binaries
	- https://github.com/bingseclab/ElfFrag
- Elfhack: to optimize ELF binaries for size and cold startup speed - https://github.com/mozilla/positron/tree/master/build/unix/elfhack
- ELFIO - ELF (Executable and Linkable Format) reader and producer implemented as a header only C++ library
	- http://serge1.github.io/ELFIO 
	- https://github.com/serge1/ELFIO
- ELFkickers (ebfc, elfls, elftoc, infect, objres, rebind, sstrip) - http://www.muppetlabs.com/~breadbox/software/elfkickers.html
- Elfkit: Rust ELF parsing, manipulation, and (re)linking toolkit - https://github.com/aep/elfkit
- ELFManip: Modify ELF executables - https://github.com/schieb/ELFManip
- elfutils
	- a collection of utilities and libraries to read, create and modify ELF binary files, find and handle DWARF debug data, symbols, thread state and stacktraces for processes and core files on GNU/Linux
	- https://sourceware.org/elfutils/
- Exodus - a tool that makes it easy to successfully relocate Linux ELF binaries from one system to another
	- https://github.com/Intoli/exodus
- GNU Binary Utilities - https://sourceware.org/binutils/docs/binutils/
	- elfedit: Update the ELF header of ELF files - https://sourceware.org/binutils/docs/binutils/elfedit.html
	- nm: List symbols from object files - https://sourceware.org/binutils/docs/binutils/nm.html
	- objdump: Display information from object files - https://sourceware.org/binutils/docs/binutils/objdump.html
	- readelf: Display the contents of ELF format files - https://sourceware.org/binutils/docs/binutils/readelf.html
	- size: List section sizes and total size - https://sourceware.org/binutils/docs/binutils/size.html
		- examples:
			- https://mcuoneclipse.com/2012/09/24/code-size-information-with-gcc-for-armkinetis/
			- https://mcuoneclipse.com/2013/04/14/text-data-and-bss-code-and-data-size-explained/
			- http://www.geeksforgeeks.org/memory-layout-of-c-program/
			- http://cs-fundamentals.com/c-programming/memory-layout-of-c-program-code-data-segments.php#size-of-code-data-bss-segments
	- 9 essential GNU binutils tools - https://opensource.com/article/19/10/gnu-binutils
	- GNU Binutils: the ELF Swiss Army Knife - https://interrupt.memfault.com/blog/gnu-binutils
- HoloDec: Decompiler for x86 and x86-64 ELF binaries - https://github.com/cararasu/holodec
- Lepton: a Lightweight ELF Parsing Tool
	- designed specifically for analyzing and editing binaries with damaged or corrupted ELF headers
	- https://github.com/BinaryResearch/lepton
- Libelf - ELF object file access library - http://www.mr511.de/software/english.html
	- libelf-howto - http://chris.rohlf.googlepages.com/libelf-howto.c
	- Libelf.js: LibELF port for JavaScript - https://github.com/AlexAltea/libelf.js
- Libelfin: C++11 ELF/DWARF parser - a from-scratch C++11 library for reading ELF binaries and DWARFv4 debug information - https://github.com/aclements/libelfin
- libelfmaster: Secure ELF parsing library
	- https://github.com/elfmaster/libelfmaster
	- libelfmaster_examples - https://github.com/elfmaster/libelfmaster_examples
	- readelfmaster: A reimplementation of GNU readelf
		- https://github.com/Bowlslaw/readelfmaster
- Mandibule: Linux ELF injector for x86 / x86_64 / arm / arm64
	- Doesn't use `dlopen` and can inject into statically linked targets by mapping manually the ELF in memory from syscalls only
	- https://github.com/ixty/mandibule
- Melkor - An ELF File Format Fuzzer - https://github.com/IOActive/Melkor_ELF_Fuzzer
- objdump beautifier - https://github.com/diouziou/bod
	- Supported Targets: elf32-littlearm, elf32-tradlittlemips, elf32-i386, elf64-x86-64
- PatchELF: A small utility to modify the dynamic linker and RPATH of ELF executables
	- http://nixos.org/patchelf.html
	- https://github.com/nixos/patchelf
- patchkit - https://github.com/lunixbochs/patchkit
	- Patches an ELF binary using one or more simple Python scripts.
- pyelftools: Pure-python library for parsing ELF and DWARF - https://github.com/eliben/pyelftools
- smol: Shoddy minsize-oriented linker
	- https://github.com/Shizmob/smol
	- Intricacies of sizecoding on Linux - Revision 2019 Seminar
		- https://www.youtube.com/watch?v=a03HXo8a_Io
- Stasis: build static position-independant-executables without any runtime requirements (no libc or ldso)
	- https://github.com/korhalio/stasis
- syms2elf: a plugin to export the symbols recognized to the ELF symbol table 
	- Hex-Ray's IDA Pro and radare2 - https://github.com/danigargu/syms2elf
	- Binary Ninja - https://github.com/monosource/syms2elf
- The ERESI Reverse Engineering Software Interface: ELFsh (ELF shell), Embedded ELF Debugger (e2dbg)
	- http://www.eresi-project.org
	- https://github.com/thorkill/eresi
	- https://github.com/thorkill/eresi/wiki/EresiArticles
	- Next-Generation Debuggers For Reverse Engineering:
		- https://www.blackhat.com/presentations/bh-europe-07/ERSI/Presentation/bh-eu-07-ersi-apr19.pdf
		- https://www.blackhat.com/presentations/bh-europe-07/ERSI/Whitepaper/bh-eu-07-ersi-WP-apr19.pdf
		- https://www.ekoparty.org/archivo/2007/eko3-Julio%20Auto%20-%20Next-Generation%20Debuggers%20For%20Reverse%20Engineering.pdf
- Vtable-Dumper - a tool to list content of virtual tables in a C++ shared library - https://github.com/lvc/vtable-dumper

## Mach-O: Software

* cctools-port: Apple cctools port for Linux, \*BSD and Windows (Cygwin)
	+ https://github.com/tpoechtrager/cctools-port
* jtool: (Mach-O Analyzer) - http://www.newosxbook.com/tools/jtool.html
* MacDependency: shows all dependent libraries and frameworks of a given executable, dynamic library or framework on Mac OS X
	+ https://github.com/kwin/macdependency/
* mach_override: runtime function overriding for Mac OS X - https://github.com/rentzsch/mach_override
* MachoAnalysis: collection of analysis utils - https://github.com/eeeyes/macho_analysis
* macholibre: Mach-O & Universal Binary Parser - https://github.com/aaronst/macholibre
	+ Mach-O Libre: Pile Driving Apple Malware with Static Analysis, Big-Data, and Automation - https://www.first.org/resources/papers/conf2016/FIRST-2016-130.pdf
* machO-tools - https://github.com/bx/machO-tools
* MachOExplorer - https://github.com/everettjf/MachOExplorer
* Machotools - "a small set of tools built on top of macholib to retrieve and change informations about mach-o files. Think of it as a pure python, cross-platform implementation of install_name_tool"
	+ https://github.com/enthought/machotools
* MachOView: a visual Mach-O file browser - https://sourceforge.net/projects/machoview/
* MachOView fork: https://github.com/gdbinit/MachOView
* Maloader: userland Mach-O loader for Linux - https://github.com/shinh/maloader

## PDB: Software

- crunchersharp
	- analyses debugger information file (PDB, so Microsoft Visual C++ only) and presents info about user defined structures (size, padding, etc.)
	- https://github.com/msinilo/crunchersharp
	- http://msinilo.pl/blog2/post/p425/
- cv2pdb: converter of DMD CodeView/DWARF debug information to PDB files
	- https://github.com/rainers/cv2pdb
- Debug Interface Access SDK (DIA SDK) - provides access to debug information stored in PDB files - https://docs.microsoft.com/en-us/visualstudio/debugger/debug-interface-access/debug-interface-access-sdk
- drpdb: Convert from Microsoft PDB format into a MySQL database - https://github.com/briterator/drpdb
- LLVM Jit Pdb: Debugging LLVM JIT code inside Visual Studio with PDB
	- https://github.com/vlmillet/llvmjitpdb
- llvm-pdbutil - PDB File forensics and diagnostics - https://llvm.org/docs/CommandGuide/llvm-pdbutil.html - https://github.com/llvm-mirror/llvm/tree/master/tools/llvm-pdbutil
- llvm-symbolizer - convert addresses into source code locations - https://llvm.org/docs/CommandGuide/llvm-symbolizer.html - https://github.com/Microsoft/llvm/tree/master/test/tools/llvm-symbolizer/pdb
- MetadataTools:
Various tools and helpers to read assembly metadata - https://github.com/KirillOsenkov/MetadataTools
	- Pdb - extract .pdb information from a .dll/.exe debug directory (Pdb Guid, age, path to .pdb); download the .pdb from symbol server; determine if a .dll matches a .pdb; find a matching .pdb in a folder for a given .dll - https://github.com/KirillOsenkov/MetadataTools/tree/master/Pdb
- microsoft-pdb: Information from Microsoft about the PDB format - https://github.com/Microsoft/microsoft-pdb
- MSFViewer - viewing and understanding PDB Multi-Stream File (MSF) data - https://github.com/apoch/epoch-language/tree/master/Tools/MSFViewer
- pdbex: an utility for reconstructing structures and unions from the PDB into compilable C headers
	- https://github.com/wbenny/pdbex
- pdbinfo:  displays information about PDB symbol files (timestamp, GUID, and age) - https://github.com/randomascii/tools/tree/master/pdbinfo
- PDBparse - Python code to parse Microsoft PDB files - https://github.com/moyix/pdbparse
- PdbReader & PdbWriter - Common Compiler Infrastructure (CCI) - https://github.com/Microsoft/cci/tree/master/PDBReaderAndWriter
- PDBRipper: an utility to extract an information from PDB files
	- https://github.com/horsicq/PDBRipper
- SymDiff: Diff tool for comparing symbols in PDB files
	- https://github.com/WalkingCat/SymDiff
- Syzygy Transformation Toolchain - PDB Module - https://github.com/google/syzygy/tree/master/syzygy/pdb

## PE: Software

* Adlice PEViewer - https://www.adlice.com/download/roguekillerpe/
* bearparser: Portable Executable parsing library - https://github.com/hasherezade/bearparser
* CFF Explorer - http://www.ntcore.com/exsuite.php
* Corkami PE files corpus - https://github.com/corkami/pocs/tree/master/PE
* ExpDiff: Diff tool for comparing export tables in PE images - https://github.com/WalkingCat/ExpDiff
* Five PE Analysis Tools Worth Looking At - https://blog.malwarebytes.com/threat-analysis/2014/05/five-pe-analysis-tools-worth-looking-at/
* libpeconv: A small library for mapping and unmapping PE files
	+ https://github.com/hasherezade/libpeconv
	+ Demo: RunPE (Process Hollowing) - https://github.com/hasherezade/libpeconv/tree/master/run_pe
	+ pe_unmapper: Small tool to convert a PE from a virtual format into a raw format
	+ https://github.com/hasherezade/libpeconv/tree/master/pe_unmapper
* Malware-Analayzer PE Tools - http://www.malware-analyzer.com/pe-tools
* Manalyze, a static analyzer for PE executables - https://manalyzer.org/ - https://github.com/JusticeRage/Manalyze
* MiTeC EXE Explorer: Executable File Explorer for OS/2, NE, PE32, PE32+ and VxD file types
	+ https://www.mitec.cz/exe.html
* pefile: a Python module to read and work with PE (Portable Executable) files - https://github.com/erocarrera/pefile
* PeLib: PE file manipulation library - https://github.com/avast-tl/pelib
* PeRebuilder - https://github.com/AaLl86/retroware
	+ automatically reconstruct the PE, and save it in a form that the Windows Loader is able to run (fixing the file alignment, relocating each section, fixing the import address table, and so on...)
* pev: The PE file analysis toolkit
	+ http://pev.sf.net
	+ https://github.com/merces/pev
* PEview - http://wjradburn.com/software/
* PE Anatomist - PE files internals
	- https://rammerlabs.alidml.ru/index-eng.html
	- https://rammerlabs.alidml.ru/peanatomist-eng.html
* PE Insider - http://cerbero.io/peinsider/
* PE Tools - Portable executable (PE) manipulation toolkit 
	+ Process Viewer, PE files Editor, Dumper, Rebuilder, Comparator, Analyzer
	+ https://petoolse.github.io/petools/
	+ https://github.com/petoolse/petools
* PE-bear - https://hshrzd.wordpress.com/pe-bear/
* pe-parse - Principled, lightweight C/C++ PE parser - https://github.com/trailofbits/pe-parse 
* PE-sieve: a small tool for investigating inline hooks (and other in-memory code patches) 
	+ https://hshrzd.wordpress.com/pe-sieve/
	+ https://github.com/hasherezade/pe-sieve
* pe_recovery_tools: Helper tools for recovering dumped PE files - https://github.com/hasherezade/pe_recovery_tools
* pe_to_shellcode: Converts PE into a shellcode
	- https://github.com/hasherezade/pe_to_shellcode
* pedump - dump windows PE files using Ruby - http://pedump.me/ - https://github.com/zed-0xff/pedump
* pelook: PE/COFF dump and conversion tool - http://bytepointer.com/tools/index.htm#pelook
* pestudio - https://www.winitor.com/
* peupdate: update hidden PE and PDB information in Win32/64 executables - http://bytepointer.com/tools/index.htm#peupdate
* PortEx: Java library to analyse Portable Executable files with a special focus on malware analysis and PE malformation robustness
	+ https://github.com/katjahahn/PortEx/
	+ http://katjahahn.github.io/PortEx/
	+ Robust Static Analysis of Portable Executable Malware - Katja Hahn, Master Thesis - https://github.com/katjahahn/PortEx/tree/master/masterthesis
	+ Wiki - https://github.com/katjahahn/PortEx/wiki
	+ PE Visualizer - https://github.com/katjahahn/PortEx/wiki/PE-Visualizer
* PPEE: A Professional PE File Explorer - https://www.mzrst.com/
* Process Dump: Windows tool for dumping malware PE files from memory back to disk for analysis
	+ http://split-code.com/processdump.html
	+ https://github.com/glmcdona/Process-Dump
	+ An Introduction to Dumping Malware with Process Dump - https://www.youtube.com/watch?v=dCU7N-Oh3jg
* rcedit: Command line tool to edit resources of EXE file on Windows
	- https://github.com/electron/rcedit
* Reflective PE Unloader
	+ This is code that can be used within a PE file to allow it to reflectively reconstruct itself in memory at runtime. The result is a byte for byte copy of the original PE file. This can be combined with Reflective DLL Injection to allow code to reconstruct itself after being loaded through an arbitrary means.
	+ https://github.com/zeroSteiner/reflective-polymorphism
* ripPE - section extractor and profiler for PE file analysis - https://github.com/matonis/ripPE
* Sizer - Win32/64 executable size report utility
	+ https://github.com/aras-p/sizer
	+ http://aras-p.info/projSizer.html
* Sizer - Win32 executable size report utility - https://github.com/tsafin/pdb-sizer
* SymbolSort: A Utility for Measuring C++ Code Bloat
	+ https://github.com/adrianstone55/SymbolSort
	+ http://gameangst.com/?p=320

### PE: Software: Loaders

- DreamLoader: Simple 32/64-bit PEs loader
	- https://github.com/86hh/DreamLoader
- In-Memory PE Loader: A very simple PE loader for loading DLLs into memory without using LoadLibray
	- https://github.com/nettitude/SimplePELoader

### PE: Software: Packers

- Amber: Reflective PE packer
	- https://github.com/EgeBalci/Amber
- fasm_packer: PE Packer written in x86 assembly (FASM syntax)
	- https://github.com/DimitriFourny/resources/tree/master/fasm_packer
- pe_armor: Metamorphic PE packer generated and assembled by a Python code
	- https://github.com/DimitriFourny/resources/tree/master/pe_armor
- squishy: a modern pc 64k intro packer
	- http://logicoma.io/squishy/
	- modern 64k intro compression
		- Revision Online 2020 Seminar; jake "ferris" taylor / logicoma
		- https://www.youtube.com/watch?v=O5LfE_qNzes
