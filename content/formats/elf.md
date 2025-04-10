title=Executable and Linkable Format (ELF)
tags=format, linux, elf, dwarf
summary=Executable file format.
~~~~~~

[ELF and ABI Standards](http://refspecs.linuxfoundation.org/elf/) | [Executable and Linkable Format specification](https://formats.kaitai.io/elf/) | [ELF File Format](http://resources.infosecinstitute.com/elf-file-format/)

Introduction to the ELF Format
	- Part I: The ELF Header - https://blog.k3170makan.com/2018/09/introduction-to-elf-format-elf-header.html
	- Part II: Understanding Program Headers - https://blog.k3170makan.com/2018/09/introduction-to-elf-format-part-ii.html
	- Part III: The Section Headers - https://blog.k3170makan.com/2018/09/introduction-to-elf-file-format-part.html
	- Part IV: Exploring Section Types and Special Sections - https://blog.k3170makan.com/2018/10/introduction-to-elf-format-part-iv.html
	- Part V: Understanding C start up .init_array and .fini_array sections - https://blog.k3170makan.com/2018/10/introduction-to-elf-format-part-v.html
	- Part VI(1): The Symbol Table and Relocations - https://blog.k3170makan.com/2018/10/introduction-to-elf-format-part-vi.html
	- Part VI(2): The Symbol Table and Relocations - https://blog.k3170makan.com/2018/10/introduction-to-elf-format-part-vi_18.html
	- Part VI(3): More Relocation tricks - r_addend execution - https://blog.k3170makan.com/2018/10/introduction-to-elf-format-part-vi-more.html
	- Part VII: Dynamic Linking / Loading and the .dynamic section - https://blog.k3170makan.com/2018/11/introduction-to-elf-format-part-vii.html

[The 101 of ELF Binaries on Linux](https://linux-audit.com/elf-binaries-on-linux-understanding-and-analysis/)

[linux-re-101](https://github.com/michalmalik/linux-re-101) -- [online](https://libraries.io/github/michalmalik/linux-re-101)

Executable and Linkable Format 101
	+ Part 1: Sections and Segments - http://www.intezer.com/executable-linkable-format-101-part1-sections-segments/
	+ Part 2: Symbols - http://www.intezer.com/executable-linkable-format-101-part-2-symbols/
	+ Part 3: Relocations - https://www.intezer.com/executable-and-linkable-format-101-part-3-relocations/
	+ Part 4: Dynamic Linking - https://www.intezer.com/executable-linkable-format-101-part-4-dynamic-linking/

[References](http://www.skyfree.org/linux/references/references.html)

## Tools/Software

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

## Readings

* [ELF101 a Linux executable walkthrough](https://speakerdeck.com/ange/booklet-elf101-a-linux-executable-walkthrough)
* A Whirlwind Tutorial on Creating Really Teensy ELF Executables for Linux
	+ http://www.muppetlabs.com/~breadbox/software/tiny/teensy.html
	+ https://github.com/abraithwaite/teensy
* About ELF Auxiliary Vectors - http://articles.manugarg.com/aboutelfauxiliaryvectors
* Analyzing ELF Binaries with Malformed Headers
	- Part 1 - Emulating Tiny Programs
		- https://binaryresearch.github.io/2019/09/17/Analyzing-ELF-Binaries-with-Malformed-Headers-Part-1-Emulating-Tiny-Programs.html
	- Part 2 - Mapping Program Logic with Qiling and Graphviz
		- https://binaryresearch.github.io/2019/12/11/Analyzing-ELF-Binaries-with-Malformed-Headers-Part-2-Mapping-Program-Logic-with-Qiling-and-Graphviz.html
	- Part 3 - Automatically Solving a Corrupted Keygenme with angr
		- https://binaryresearch.github.io/2020/01/15/Analyzing-ELF-Binaries-with-Malformed-Headers-Part-3-Solving-A-Corrupted-Keygenme.html
* Anatomy of an ELF core file - https://www.gabriel.urdhr.fr/2015/05/29/core-file/
* Armouring the ELF: Binary encryption on the UNIX platform - scut & grugq - Phrack Magazine #58 (2001-12-28) - http://www.phrack.org/issues/58/5.html
* Building an ELF Parser with Frida - https://versprite.com/og/frida/
* Cheating the ELF: Subversive Dynamic Linking to Libraries - https://grugq.github.io/docs/subversiveld.pdf
* Computer Science from the Bottom Up - https://www.bottomupcs.com/
	+ Behind the process - https://www.bottomupcs.com/chapter07.xhtml
	+ Dynamic Linking - https://www.bottomupcs.com/chapter08.xhtml
* Constructing the ELF - A Magnetized Needle and a Steady Hand - http://nullprogram.com/blog/2016/11/17/
* Custom ELF program headers—what, why and how - http://www.cl.cam.ac.uk/~srk31/blog/2017/02/14/
	+ Rag-bag of utilities and scripts that do strange things with ELF files - https://github.com/stephenrkell/elftin/
* Dynamic Linking in ELF - http://dandylife.net/blog/archives/660
* ELF - No Section Header? No Problem - https://em386.blogspot.com/2006/10/elf-no-section-header-no-problem.html
* ELF Binary Mangling
	+ Part 1: Concepts - https://medium.com/@dmxinajeansuit/elf-binary-mangling-part-1-concepts-e00cb1352301
	+ Part 2: Golfin’ - https://medium.com/@dmxinajeansuit/elf-binary-mangling-pt-2-golfin-7e5c82bb482c
	+ Part 3: Weaponization - https://medium.com/@dmxinajeansuit/elf-binary-mangling-part-3-weaponization-6e11971108b3
* ELF Hello World Tutorial
	+ http://www.cirosantilli.com/elf-hello-world/
	+ https://github.com/cirosantilli/cirosantilli.github.io/blob/master/elf-hello-world.md
* ELF introspection, robustly and portably - http://www.cl.cam.ac.uk/~srk31/blog/devel/elf-introspection.html
* ELF loading and dynamic linking - https://www.gabriel.urdhr.fr/2015/01/22/elf-linking/
* ELF Parsing Bugs by Example with Melkor Fuzzer
	+ https://ioactive.com/pdfs/IOActive_ELF_Parsing_with_Melkor.pdf
	+ http://blog.ioactive.com/2014/11/elf-parsing-bugs-by-example-with-melkor.html
* ELF shared library injection forensics - https://backtrace.io/blog/elf-shared-library-injection-forensics/
* ELF symbol lookup
	+ ELF: symbol lookup via DT_HASH - https://flapenguin.me/2017/04/24/elf-lookup-dt-hash/
	+ ELF: better symbol lookup via DT_GNU_HASH - https://flapenguin.me/2017/05/10/elf-lookup-dt-gnu-hash/
* ELF symbol visibility and the perils of name clashing
	- http://www.fcollyer.com/2013/01/04/elf-symbol-visibility-and-the-perils-of-name-clashing/
* ELFs are dorky, Elves are cool - Sergey Bratus and Julian Bangert - PoC||GTFO 00 - https://greatscottgadgets.com/pocorgtfo/pocorgtfo00.pdf
* ELF: From The Programmer's Perspective (1995) - http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.37.8698
* ELF, libelf, compressed sections and elfutils - https://gnu.wildebeest.org/blog/mjw/2016/01/13/elf-libelf-compressed-sections-and-elfutils/
* Eli Bendersky - Linkers and loaders - http://eli.thegreenplace.net/tag/linkers-and-loaders
	+ Load-time relocation of shared libraries - https://eli.thegreenplace.net/2011/08/25/load-time-relocation-of-shared-libraries
	+ Position Independent Code (PIC) in shared libraries - https://eli.thegreenplace.net/2011/11/03/position-independent-code-pic-in-shared-libraries
	+ Position Independent Code (PIC) in shared libraries on x64 - https://eli.thegreenplace.net/2011/11/11/position-independent-code-pic-in-shared-libraries-on-x64
	+ How statically linked programs run on Linux - https://eli.thegreenplace.net/2012/08/13/how-statically-linked-programs-run-on-linux
	+ Library order in static linking - https://eli.thegreenplace.net/2013/07/09/library-order-in-static-linking
* Exploiting ELF Expansion Variables - https://backtrace.io/blog/exploiting-elf-expansion-variables/
* Generating executable files from scratch - https://github.com/cameronswinoga/yabfc/wiki/Generating-executable-files-from-scratch
* GNU Hash ELF Sections
	+ https://blogs.oracle.com/ali/gnu-hash-elf-sections
	+ http://www.linker-aliens.org/blogs/ali/entry/gnu_hash_elf_sections/
* Good Practices in Library Design, Implementation, and Maintenance - https://www.akkadia.org/drepper/goodpractice.pdf
* Have fun with LIEF and Executable Formats - Play with ELF symbols - Part 2 (renaming dynamic symbols) - https://blog.quarkslab.com/have-fun-with-lief-and-executable-formats.html#elf
* How is a binary executable organized? Let's explore it! - https://jvns.ca/blog/2014/09/06/how-to-read-an-executable/
* How programs get run: ELF binaries - https://lwn.net/Articles/631631/
* How To Write Shared Libraries - https://www.akkadia.org/drepper/dsohowto.pdf
* I/O patterns on ELF binary initialization - https://glandium.org/blog/?p=1016
* Improving binary layout for progressive decompression (2011) - https://glandium.org/blog/?p=2320
* In-Memory-Only ELF Execution (Without tmpfs) - https://magisterquis.github.io/2018/03/31/in-memory-only-elf-execution.html
* In the lands of corrupted elves: Breaking ELF software with Melkor fuzzer - https://www.blackhat.com/docs/us-14/materials/arsenal/us-14-Hernandez-Melkor-Slides.pdf
* Inside ELF Symbol Tables
	+ https://blogs.oracle.com/ali/inside-elf-symbol-tables
	+ http://www.linker-aliens.org/blogs/ali/entry/inside_elf_symbol_tables/
* Learning Linux Binary Analysis (2016) - Ryan O'Neill - http://www.bitlackeys.org/#research
* Linux Internals - Dynamic Linking Wizardry - https://0x00sec.org/t/linux-internals-dynamic-linking-wizardry/1082
* Linux Internals - The Art Of Symbol Resolution - https://0x00sec.org/t/linux-internals-the-art-of-symbol-resolution/1488
* Linux x86 Program Start Up (dynamically loaded x86 ELF files) - http://dbp-consulting.com/tutorials/debugging/linuxProgramStartup.html
* Making our own executable packer
	- What's in a Linux executable? - https://fasterthanli.me/blog/2020/whats-in-a-linux-executable/
	- Running an executable without exec - https://fasterthanli.me/blog/2020/running-an-executable-without-exec/
	- Position-independent code - https://fasterthanli.me/blog/2020/position-independent-code/
	- ELF relocations - https://fasterthanli.me/blog/2020/elf-relocations/
	- The simplest shared library - https://fasterthanli.me/blog/2020/the-simplest-shared-library/
	- Loading multiple ELF objects - https://fasterthanli.me/blog/2020/loading-multiple-elf-objects/
	- Dynamic symbol resolution - https://fasterthanli.me/blog/2020/dynamic-symbol-resolution/
	- Dynamic linker speed and correctness - https://fasterthanli.me/blog/2020/dynamic-linker-speed-and-correctness/
	- GDB scripting and Indirect functions - https://fasterthanli.me/blog/2020/gdb-scripting-and-indirect-functions/
	- Safer memory-mapped structures - https://fasterthanli.me/blog/2020/safer-memory-mapped-structures/
	- More ELF relocations - https://fasterthanli.me/blog/2020/more-elf-relocations/
	- A no_std Rust binary - https://fasterthanli.me/blog/2020/a-no-std-rust-binary/
	- Thread-local storage - https://fasterthanli.me/blog/2020/thread-local-storage/
* Position Independent Executables - https://blog.fpmurphy.com/2008/06/position-independent-executables.html
* Programming With Ones and Zeros
	+ Part 1 - http://www.hanshq.net/ones-and-zeros.html
	+ Ones and Zeros, Part 2: Making Executable Files - http://www.hanshq.net/making-executables.html
* RE a 64bit ELF binary - Devil’s swapper write-up - https://0x00sec.org/t/re-a-64bit-elf-binary-devils-swapper-write-up/2379
* Relocations in ELF Toolchains - https://www.sifive.com/blog/2017/08/21/all-aboard-part-2-relocations/
* Resolving ELF Relocation Name / Symbols - https://em386.blogspot.com/2006/10/resolving-elf-relocation-name-symbols.html
* Secure Code Partitioning With ELF binaries (SCOP) - http://bitlackeys.org/papers/secure_code_partitioning_2018.txt
* Smallest x86 ELF Hello World - http://timelessname.com/elfbin/
* Special sections in Linux binaries - https://lwn.net/Articles/531148/
* Targeting File Parsers with S2E and Kaitai Struct - targeted symbolic execution of readelf - https://adrianherrera.github.io/post/kaitai-s2e/
* The Anatomy of an Executable - dissection of a simple "hello world" ELF binary - https://github.com/mewrev/dissection
* The Cerberus ELF Interface - http://phrack.org/issues/61/8.html
* The Cost Of ELF Symbol Hashing
	+ https://blogs.oracle.com/ali/the-cost-of-elf-symbol-hashing
	+ http://www.linker-aliens.org/blogs/ali/entry/the_cost_of_elf_symbol/
* The ELF Object File Format by Dissection (1995) - http://www.linuxjournal.com/article/1060
* The Executable and Linkable Format (ELF)
	+ https://publicclu2.blogspot.com/2013/05/executable-and-linkable-format-elf.html
	+ https://www.cs.stevens.edu/%7Ejschauma/631A/elf.html
	+ http://web.archive.org/web/20120415084409/http://www.acsu.buffalo.edu:80/~charngda/elf.html
* The missing link: explaining ELF static linking, semantically - Stephen Kell, Dominic P. Mulligan, Peter Sewell - OOPSLA 2016
	+ http://www.cl.cam.ac.uk/~pes20/rems/papers/oopsla-elf-linking-2016.pdf
	+ https://bitbucket.org/Peter_Sewell/linksem/
* Uncovering a few SIGSEGVs in binutils' BFD and GLIBC
	+ https://chatsubo-labs.blogspot.com/2017/05/uncovering-few-sigsegvs-in-binutils-bfd.html
	+ http://brainoverflow.org/papers/BFD-GLIBC_Fuzzing/0%20Uncovering%20a%20few%20SIGSEGVs%20in%20binutils'%20BFD%20and%20GLIBC.pdf
* Understanding Linux ELF RTLD internals - http://s.eresi-project.org/inc/articles/elf-rtld.txt
* Understanding the Memory Layout of Linux Executables - https://gist.github.com/CMCDragonkai/10ab53654b2aa6ce55c11cfc5b2432a4
* 'Weird Machine' patterns - https://www.researchgate.net/publication/283630248_%27Weird_Machine%27_patterns
* Writing shared libraries - http://plan99.net/~mike/writing-shared-libraries.html

### Thread Local Storage (TLS)

- A Deep dive into (implicit) Thread Local Storage
	- https://chao-tic.github.io/blog/2018/12/25/tls
- Android ELF TLS
	- https://android.googlesource.com/platform/bionic/+/HEAD/docs/elf-tls.md
- ELF Handling For Thread-Local Storage
	- https://www.akkadia.org/drepper/tls.pdf
- Thread Local Storage (ELF Thread Local Storage ABI)
	- https://fuchsia.dev/fuchsia-src/development/threads/tls
- TLS Examples
	- https://github.com/stffrdhrn/tls-examples
	- ELF Binaries and Relocation Entries
		- http://stffrdhrn.github.io/hardware/embedded/openrisc/2019/11/29/relocs.html
	- Thread Local Storage
		- https://stffrdhrn.github.io/hardware/embedded/openrisc/2020/01/19/tls.html

### Transformation

- A Technique for Hooking Internal Functions of Dynamically-Linked ELF Binaries
	- https://binaryresearch.github.io/2019/08/29/A-Technique-for-Hooking-Internal-Functions-of-Dynamically-Linked-ELF-Binaries.html
- Honey, I Shrunk the ELFs: Lightweight Binary Tailoring of Shared Libraries
	- EMSOFT 2019
	- ACM Transactions on Embedded Computing Systems (TECS) 18, 5s, Article 102 (October 2019)
	- Andreas Ziegler, Julian Geus, Bernhard Heinloth, Timo HÖnig, Daniel Lohmann
	- https://dl.acm.org/citation.cfm?id=3358222
	- https://www4.cs.fau.de/Publications/2019/ziegler_19_emsoft.pdf
- How To Strip An ELF Object Without Fully Understanding It
	- http://www.linker-aliens.org/blogs/ali/entry/how_to_strip_an_elf/
	- https://blogs.oracle.com/ali/how-to-strip-an-elf-object-without-fully-understanding-it
- Inserting Debugging Instrumentation into an Internal Function Using Redirect-to-PLT
	- https://binaryresearch.github.io/2019/09/07/Inserting-Debugging-Instrumentation-Into-an-Internal-Function-using-Redirect-to-PLT.html
- Tweaking binaries with elfedit
	- https://ptribble.blogspot.com/2017/06/tweaking-binaries-with-elfedit.html

## ELF: Talks

### ELF: Talks (2019)

- ELF Crafting: Uncovering Advanced Anti-analysis techniques for the Linux Platform
	- r2con2019; Nacho Sanmillan (ulexec)
	- https://www.youtube.com/watch?v=adYOSO0tn9M
	- https://github.com/radareorg/r2con2019/tree/master/talks/elf_crafting
- Executable Code Golf: Making Tiny Binaries for Constrained Systems
	- linux.conf.au 2019; Nathan Egge
	- https://www.youtube.com/watch?v=J5WX-wN_RKY
	- https://2019.linux.conf.au/schedule/presentation/160/
	- XLINK compressing linker
		- https://github.com/negge/xlink
- Objtool: A Hidden Gem of Executable Parsing
	- DevConf.US 2019; Matt Helsley
	- https://www.youtube.com/watch?v=I7srCw-Ns7Y

### ELF: Talks (2018)

- C++ in Elvenland
	- CppCon 2018; Serge Guelton
	- https://www.youtube.com/watch?v=CVg7CYVV3KI
	- http://serge-sans-paille.github.io/talks/cppcon2018/elvenland/elf/
	- https://github.com/serge-sans-paille/talks/blob/master/cppcon2018/elvenland/elf.rst
- The Bits Between the Bits: How We Get to main()
	- CppCon 2018; Matt Godbolt
	- https://www.youtube.com/watch?v=dOfucXtyEsU
	- Slides: https://mattgodbolt.github.io/cppcon-bits-between-bits/

### ELF: Talks (2017)

- ELF linking: what it means and why it matters
	- 2017; Stephen Kell
	- https://www.cl.cam.ac.uk/~srk31/research/talks/kell17elf-slides.pdf
- Everything You Always Wanted to Know About "Hello, World"* (*But Were Afraid To Ask)
	- FOSDEM 2017; Brooks Davis
	- https://archive.fosdem.org/2017/schedule/event/hello_world/
	- https://people.freebsd.org/~brooks/talks/fosdem2017-helloworld/?C=M&O=D
- LLD from a user's perspective
	- FOSDEM 2017; Peter Smith
	- https://archive.fosdem.org/2017/schedule/event/lld/
	- https://archive.fosdem.org/2017/schedule/event/lld/attachments/slides/1446/export/events/attachments/lld/slides/1446/FosdemLLD2017.pdf

### ELF: Talks (2016)

- Intra-Process Memory Protection for Applications on ARM and X86: Leveraging the ELF ABI
	- BlackHat USA 2016; Sergey Bratus & Maxwell Koo & Julian Bangert
	- https://www.youtube.com/watch?v=YXh2aIc9u64
	- Slides: http://www.cs.dartmouth.edu/~sergey/io/elfbac/bh16-elfbac-slides.pdf
	- Whitepaper: http://www.cs.dartmouth.edu/~sergey/io/elfbac/bh16-elfbac-whitepaper.pdf
- New LLD linker for ELF
	- 2016 EuroLLVM Developers' Meeting; Rui Ueyama
	- https://www.youtube.com/watch?v=CYCRqjVa6l4
	- https://llvm.org/devmtg/2016-03/Presentations/EuroLLVM%202016-%20New%20LLD%20linker%20for%20ELF.pdf

### ELF: Talks (2015)

- Dark Side of the ELF
	- DEF CON 23 (2015); Alessandro Di Federico, Yan Shoshitaishvili
	- https://www.youtube.com/watch?v=aGoDYa7Kbec
- How the ELF Ruined Christmas
	- USENIX Security Symposium 2015
	- Alessandro Di Federico, Amat Cama, Yan Shoshitaishvili, Christopher Kruegel, Giovanni Vigna
	- https://www.usenix.org/conference/usenixsecurity15/technical-sessions/presentation/di-frederico
	- https://sites.cs.ucsb.edu/~chris/research/doc/usenix15_elf.pdf
	- leakless: Function redirection via ELF tricks
		- https://github.com/ucsb-seclab/leakless

### ELF: Talks (2014)

- ABIs, linkers and other animals
	- 2014; Stephen Kell
	- https://www.cl.cam.ac.uk/~srk31/research/talks/kell14abis-slides.pdf

### ELF: Talks (2013)

- ELF Eccentricities
	- CONFidence 2013; Julian Bangert, Sergey Bratus
	- https://www.youtube.com/watch?v=4LU6N6THh2U
	- https://infocon.org/cons/CONFidence/CONFidence%202013/presentations/julian_bangert_sergey_bratus.pdf
- Any Input Is a Program Weird Machines in ABI
	- CONFidence 2013; Rebecca Bx Shapiro, Julian Bangert, Sergey Bratus 
	- https://www.youtube.com/watch?v=crt5gxOoUuM
	- https://infocon.org/cons/CONFidence/CONFidence%202013/presentations/julian_bangert_rebecca_shapiro_sergey_bratus.pdf
- "Weird Machines" in ELF: A Spotlight on the Underappreciated Metadata
	- USENIX  Workshop on Offensive Technologies (WOOT) 2013
	- Rebecca Shapiro, Sergey Bratus, Sean W. Smith
	- https://www.usenix.org/conference/woot13/workshop-program/presentation/shapiro
	- http://www.cs.dartmouth.edu/~sergey/wm/woot13-shapiro.pdf
	- https://www.youtube.com/watch?v=6xbirzvr-mQ

### ELF: Talks (2012)

- Programming Weird Machines with ELF Metadata
	- DEF CON 20 (2012); Rebecca "bx" Shapiro, Sergey Bratus 
	- https://www.youtube.com/watch?v=V5KsUm1KfZE
	- https://www.youtube.com/watch?v=YgtxxLCVD-o
	- http://cs.dartmouth.edu/~bx/elf-bf-tools/slides/elf-defcon20.pdf
- The Care and Feeding of Weird Machines Found in Executable Metadata
	- 29C3 (2012); Rebecca “bx” Shapiro, Sergey Bratus
	- https://media.ccc.de/v/29c3-5195-en-executable_metadata_h264
	- https://www.youtube.com/watch?v=57UtbZGEEQA
	- http://www.cs.dartmouth.edu/~bx/elf-bf-tools/slides/ELF-29c3.pdf
