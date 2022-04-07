title=Mach-O
tags=format, macos, elf, dwarf, macho
summary=macOS executable file format.
~~~~~~

* Mach-O Runtime Architecture - http://math-atlas.sourceforge.net/devel/assembly/MachORuntime.pdf
* Mach-O Programming Topics - https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/MachOTopics/0-Introduction/introduction.html
* [OS X ABI Mach-O File Format Reference](https://github.com/aidansteele/osx-abi-macho-file-format-reference) ([PDF](https://pewpewthespells.com/re/Mach-O_File_Format.pdf))
* osx-re-101 - https://github.com/michalmalik/osx-re-101
* Reverse Engineering/Mac OS X - https://en.wikibooks.org/wiki/Reverse_Engineering/Mac_OS_X

## Readings

* Basics of the Mach-O file format - https://samhuri.net/posts/2010/01/basics-of-the-mach-o-file-format/
* Dynamic Linking: ELF vs. Mach-O - http://timetobleed.com/dynamic-linking-elf-vs-mach-o/
* Dynamic Linking of Imported Functions in Mach-O - https://www.apriorit.com/dev-blog/225-dynamic-linking-mach-o / https://www.codeproject.com/Articles/187181/Dynamic-Linking-of-Imported-Functions-in-Mach-O
* Dynamic symbol table duel: ELF vs Mach-O, round 2 - http://timetobleed.com/dynamic-symbol-table-duel-elf-vs-mach-o-round-2/
* DYLD Detayled - The internals of DYLD, the dynamic linker, and the `__LINKEDIT` section - http://newosxbook.com/articles/DYLD.html
* Extracting libraries from dyld_shared_cache - https://worthdoingbadly.com/dscextract/
* Friday Q&A 2012-04-27: PLCrashReporter and Unwinding the Stack With DWARF - https://www.mikeash.com/pyblog/friday-qa-2012-04-27-plcrashreporter-and-unwinding-the-stack-with-dwarf.html
* Friday Q&A 2012-05-04: PLCrashReporter and Unwinding the Stack With DWARF, Part 2 - https://www.mikeash.com/pyblog/friday-qa-2012-05-04-plcrashreporter-and-unwinding-the-stack-with-dwarf-part-2.html
* Friday Q&A 2012-11-09: dyld: Dynamic Linking On OS X - https://www.mikeash.com/pyblog/friday-qa-2012-11-09-dyld-dynamic-linking-on-os-x.html
* Friday Q&A 2012-11-30: Let's Build A Mach-O Executable - https://www.mikeash.com/pyblog/friday-qa-2012-11-30-lets-build-a-mach-o-executable.html
* Having Fun with Obfuscated Mach-O Files - https://www.pnfsoftware.com/blog/having-fun-with-obfuscated-mach-o-files/
* Hello Mach-O: Dissection of minimal Intel 32-bits, 204 bytes, Mach-O "Hello World" executable file - http://seriot.ch/hello_macho.php
* Mach-O Binaries - http://www.m4b.io/reverse/engineering/mach/binaries/2015/03/29/mach-binaries.html
* Mach-O Executables - https://www.objc.io/issues/6-build-tools/mach-o-executables/
* MacOS Dylib Injection through Mach-O Binary Manipulation
	- https://malwareunicorn.org/workshops/macos_dylib_injection.html
* Parsing Mach-O files - https://lowlevelbits.org/parsing-mach-o-files/
* Playing with Mach-O binaries and dyld
	+ https://blog.lse.epita.fr/articles/82-playing-with-mach-os-and-dyld.html
	+ https://lse.epita.fr/data/lt/2017-03-14/lt-2017-03-14-Stanislas_Lejay-Playing_with_machos_and_dyld.pdf
* Redirection of Imported Functions in Mach-O - https://www.codeproject.com/Articles/187192/Redirection-of-Imported-Functions-in-Mach-O
* Running Executables on macOS From Memory - https://blog.cylance.com/running-executables-on-macos-from-memory
* Runtime binary loading via the dynamic loader on Apple Mac OS X - http://www.subreption.com/blog/2009/02/runtime-binary-loading-via-the-dynamic-loader-on-apple-mac-os-x.html
* The Mach-O Transition: Darling in the Past 5 Years - http://blog.darlinghq.org/2017/02/the-mach-o-transition-darling-in-past-5.html



## Tools/Software

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



## Talks

* 2018 - Mach-O Tricks
	+ BaiJiuCon at Mobile Security Conference (MOSEC) 2018
	+ http://iokit.racing/machotricks.pdf
* 2013 - DEF CON 21 - Mach-O Malware Analysis: Combatting Mac OSX/iOS Malware with Data Visualization
	+ https://infocon.org/cons/DEF%20CON/DEF%20CON%2021/DEF%20CON%2021%20presentations/Remy%20Baumgarten/
	+ Slides: https://infocon.org/cons/DEF%20CON/DEF%20CON%2021/DEF%20CON%2021%20presentations/Remy%20Baumgarten/DEFCON-21-Baumgarten-Mach-O-Viz.pdf
	+ Paper: https://infocon.org/cons/DEF%20CON/DEF%20CON%2021/DEF%20CON%2021%20presentations/Remy%20Baumgarten/DEFCON-21-Baumgarten-Mach-O-Viz-WP.pdf
	+ Video: https://infocon.org/cons/DEF%20CON/DEF%20CON%2021/DEF%20CON%2021%20video%20and%20slides%20x265/DEF%20CON%2021%20Hacking%20Conference%20Presentation%20By%20Remy%20Baumgarten%20-%20Combatting%20Mac%20OSX%20iOS%20Malware%20with%20Data%20Visualization%20-%20Video%20and%20Slides.mp4
	+ http://macsecurity.net/view/42/
	+ http://www.securitytube.net/video/9133
* 2009 - Black Hat DC - Let your Mach-O fly - Vincenzo Iozzo
	+ Slides: http://www.blackhat.com/presentations/bh-dc-09/Iozzo/BlackHat-DC-09-Iozzo-Macho-on-the-fly.pdf
	+ Paper: http://www.blackhat.com/presentations/bh-dc-09/Iozzo/BlackHat-DC-09-Iozzo-let-your-mach0-fly-whitepaper.pdf

