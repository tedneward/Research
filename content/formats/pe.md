title=Portable Executable (PE)
summary=Win32 executable file format.
tags=format, native, windows, pdb, pe
~~~~~~

DLLs and EXEs differ by basically one byte in the PE file format, indicating whether this is executable (and therefore has a main()-style entry point) or not.

Traces ancestry directly back to [COFF](coff.html) files.

Uses [PDB](/formats/pdb.html) for debugging information.

## DLL: Readings

- Adaptive DLL Hijacking
	- https://silentbreaksecurity.com/adaptive-dll-hijacking/
- DLLs and Visual C++ run-time library behavior - https://docs.microsoft.com/en-us/cpp/build/run-time-library-behavior
- Dynamic-Link Library Best Practices - https://msdn.microsoft.com/library/windows/desktop/dn633971.aspx
- Everything You Never Wanted To Know About DLLs - http://blog.omega-prime.co.uk/2011/07/04/everything-you-never-wanted-to-know-about-dlls/
- GOTOHELL.DLL: Software Dependencies and the Maintenance of Microsoft Windows
	- The Maintainers 2016; Stephanie Dick, Dan Volmar
	- http://themaintainers.org/s/GOTOHELLDLL1.pdf
- How can I specify that my DLL should resolve a DLL dependency from the same directory that the DLL is in?
	- https://blogs.msdn.microsoft.com/oldnewthing/20171011-00/?p=97195
- How to turn a DLL into a standalone EXE - https://hshrzd.wordpress.com/2016/07/21/how-to-turn-a-dll-into-a-standalone-exe/
- Import by Hash in x64 Assembly - https://emsea.github.io/2017/12/04/import-by-hash/
- Isolating a plugin into its own directory
	- http://web.archive.org/web/20171011141708/https://blogs.msdn.microsoft.com/talagrand/2010/03/08/isolating-a-plugin-into-its-own-directory/
- Rpath emulation: absolute DLL references on Windows - http://blog.omega-prime.co.uk/2012/12/06/rpath-emulation-absolute-dll-references-on-windows/
- Shellcode: In-Memory Execution of DLL - https://modexp.wordpress.com/2019/06/24/inmem-exec-dll/
- Ten Process Injection Techniques: A Technical Survey of Common and Trending Process Injection Techniques
	- https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process
- What is so special about the instance handle 0x10000000? - https://blogs.msdn.microsoft.com/oldnewthing/20121227-00/?p=5713/
- Windows DLL Hijacking (Hopefully) Clarified
	- https://itm4n.github.io/windows-dll-hijacking-clarified/

## PE: Readings

* A smallest PE executable (x64) with every byte executed - https://drakopensulo.wordpress.com/2017/08/06/smallest-pe-executable-x64-with-every-byte-executed/
* An Analysis of the Windows PE Checksum Algorithm - https://www.codeproject.com/Articles/19326/An-Analysis-of-the-Windows-PE-Checksum-Algorithm
* An In-Depth Look into the Win32 Portable Executable File Format
	+ Part 1: http://reversingproject.info/wp-content/uploads/2009/05/an_in-depth_look_into_the_win32_portable_executable_file_format_part_1.pdf / http://www.delphibasics.info/home/delphibasicsarticles/anin-depthlookintothewin32portableexecutablefileformat-part1
	+ Part 2: http://reversingproject.info/wp-content/uploads/2009/05/an_in-depth_look_into_the_win32_portable_executable_file_format_part_2.pdf / http://www.delphibasics.info/home/delphibasicsarticles/anin-depthlookintothewin32portableexecutablefileformat-part2
* Binary offsets, virtual addresses and pefile - https://5d4a.wordpress.com/2017/09/21/binary-offsets-virtual-addresses-and-pefile/
* Calling Arbitrary Functions In EXEs: Performing Calls to EXE Functions Like DLL Exports
	- https://blog.vastart.dev/2020/04/calling-arbitrary-functions-in-exes.html
* Case studies in Rich Header analysis and hunting (2018-08-09) - http://ropgadget.com/posts/richheader_hunting.html
* Dynamic Reconstruction of Relocation Information for Stripped Binaries - http://www.cs.columbia.edu/~vpappas/papers/reloc.raid14.pdf
* Finding the Needle: A Study of the PE32 Rich Header and Respective Malware Triage
	+ https://www.sec.in.tum.de/i20/publications/finding-the-needle-a-study-of-the-pe32-rich-header-and-respective-malware-triage
	+ https://www.semanticscholar.org/paper/Finding-the-Needle-A-Study-of-the-PE32-Rich-Header-Webster-Kolosnjaji/44adfa896e6598b1723507060126125a0cad39a1
	+ Rich Header: a collection of the work performed investigating the PE32 Rich Header - https://github.com/HolmesProcessing/RichHeader-Service_Collection
* Fully undetectable backdooring PE files - https://haiderm.com/fully-undetectable-backdooring-pe-files/
* Introducing New Packing Method: First Reflective PE Packer Amber - https://pentest.blog/introducing-new-packing-method-first-reflective-pe-packer/
* Microsoft Portable Executable (PE) and Common Object File Format (COFF) Specification - https://msdn.microsoft.com/en-us/library/windows/desktop/ms680547.aspx
* Microsoft's Rich Signature (undocumented) - http://ntcore.com/Files/richsign.htm
* Modern PE Mangling
	- https://n0.lol/a/pemangle.html
* PE (corkami wiki) - https://corkamiwiki.github.io/PE - https://github.com/corkami/docs/blob/master/PE/PE.md
* Peering Inside the PE: A Tour of the Win32 Portable Executable File Format - https://msdn.microsoft.com/en-us/library/ms809762.aspx
* PeLib Resources about the PE format - http://www.pelib.com/resources.php
* Portable Executable File Corruption Preventing Malware From Running
	+ What types of obstructions and anomalies in the PE file can make the Windows Portable Executable Image Loader and other PE parsing programs fail to load the file or display an error message?
	+ https://toddcullumresearch.com/2017/07/16/portable-executable-file-corruption/
* Portable Executable File Format – A Reverse Engineer View - http://www.stonedcoder.org/~kd/lib/CBJ-2005-74.pdf
* Peering Inside the PE: A Tour of the Win32 Portable Executable File Format - https://msdn.microsoft.com/en-us/library/ms809762.aspx
* Resource Hacker: a resource editor for 32-bit and 64-bit Windows applications
	- http://www.angusj.com/resourcehacker/
* Resources: Microsoft Portable Executable and COFF (32-bit and 64-bit) Format - http://bytepointer.com/resources/
* Robust Static Analysis of Portable Executable Malware - Katja Hahn, Master Thesis - https://github.com/katjahahn/PortEx/tree/master/masterthesis
* The sad state of PE parsing - http://lucasg.github.io/2017/04/28/the-sad-state-of-pe-parsing/
* The Undocumented Microsoft "Rich" Header - http://bytepointer.com/articles/the_microsoft_rich_header.htm
* Tiny PE: Creating the smallest possible PE executable - http://www.phreedom.org/research/tinype/
* Undocumented PECOFF - https://media.blackhat.com/bh-us-11/Vuksan/BH_US_11_VuksanPericin_PECOFF_WP.pdf
* Why does a corrupted binary sometimes result in "Program too big to fit in memory"? - https://blogs.msdn.microsoft.com/oldnewthing/20060130-00/?p=32483
* Why is 0x00400000 the default base address for an executable? - https://blogs.msdn.microsoft.com/oldnewthing/20141003-00/?p=43923

## DLL: Talks

* 2017 - Everything You Ever Wanted to Know about DLLs
	+ CppCon; James McNellis
	+ https://www.youtube.com/watch?v=JPQWQfDhICA
	+ https://github.com/CppCon/CppCon2017/blob/master/Presentations/Everything%20You%20Ever%20Wanted%20to%20Know%20about%20DLLs/
* 2017 - Memory-Based Library Loading: Someone Did That Already
	+ Derbycon; Casey Rosini
	+ http://www.irongeek.com/i.php?page=videos/derbycon7/t108-memory-based-library-loading-someone-did-that-already-casey-rosini

## PE: Talks

* 2018 - Reflective PE Unloading
	+ BSides Cleveland 2018; Spencer McIntyre
	+ https://www.youtube.com/watch?v=GbCVVYMNUzA
	+ http://www.irongeek.com/i.php?page=videos/bsidescleveland2018/b00-reflective-pe-unloading-spencer-mcintyre
* 2018 - DEF CON 26 - Relocation Bonus
	+ A look into the Windows Portable Executable (PE) header and how it can be weaponized to destroy parsers, disassemblers, and other tools
	+ DEFCON-26-Nick-Cano-Relocation-Bonus-Attacking-the-Win-Loader.pdf
	+ https://media.defcon.org/DEF%20CON%2026/DEF%20CON%2026%20presentations/Nick%20Cano/
	+ https://github.com/nickcano/RelocBonus
	+ https://github.com/nickcano/RelocBonusSlides
* 2013 - 44Con 2013 - Exploring the Portable Executable format - Ange Albertini
	+ https://speakerdeck.com/ange/workshop-exploring-the-portable-executable-format
* 2013 - NoVA Hackers - 2013-03-11 - Joshua Pitts - Backdooring Win32 Portable Executables
	+ https://www.youtube.com/watch?v=SXaoVo_U7kA
* 2012 - Hack in Paris 2012 - Ange Albertini A Bit More of PE
	+ https://www.youtube.com/watch?v=3duSgr5b1yc
	+ https://www.youtube.com/watch?v=6HRfuN-fPwM
* 2012 - Hashdays 2012 - Byte-ing the PE that fails you - Ange Albertini
	+ https://www.youtube.com/watch?v=kibEcaG0zCk
	+ https://speakerdeck.com/ange/byte-ing-the-pe-that-fails-you
* 2011 - Berlinsides - x86 & PE - Ange Albertini - https://speakerdeck.com/ange/x86-and-pe
* 2011 - BlackHat 2011 - Constant Insecurity: Things you didn’t know about (PE) Portable Executable file format
	+ https://www.youtube.com/watch?v=uoQL3CE24ls
	+ https://www.reversinglabs.com/newsroom/blog/constant-insecurity-things-you-didnt-know-about-pe-portable-executable-file-format.html
	+ Paper - Undocumented PECOFF: https://media.blackhat.com/bh-us-11/Vuksan/BH_US_11_VuksanPericin_PECOFF_WP.pdf
	+ Slides: https://media.blackhat.com/bh-us-11/Vuksan/BH_US_11_VuksanPericin_PECOFF_Slides.pdf
