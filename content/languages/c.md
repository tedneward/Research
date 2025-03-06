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

## Books

* [256-Color VGA Programming in C](http://www.brackeen.com/vga/) - David Brackeen
* [A Tutorial on Pointers and Arrays in C](https://web.archive.org/web/20180827131006/http://home.earthlink.net/~momotuk/pointers.pdf) - Ted Jensen (PDF)
* [An Introduction to C & GUI Programming](https://magpi.raspberrypi.com/books/c-gui-programming) - Simon Long (PDF)
* [Bare-metal programming for ARM](https://github.com/umanovskis/baremetal-arm) - Daniels Umanovskis [(PDF)](http://umanovskis.se/files/arm-baremetal-ebook.pdf)
* [Beej's Guide to C Programming](http://beej.us/guide/bgc/) - B. Hall (HTML, PDF)
* [Beej's Guide to Network Programming - Using Internet Sockets](http://beej.us/guide/bgnet/) - B. Hall
* [Beej's Guide to the GNU Debugger (GDB)](http://beej.us/guide/bggdb/) - B. Hall (HTML)
* [Build Your Own Lisp](http://www.buildyourownlisp.com) - Daniel Holden
* [C Elements of Style](http://www.oualline.com/books.free/style/) - Steve Oualline
* [C for Python Programmers](http://www.cburch.com/books/cpy/) - Carl Burch
* [C Internals](https://www.avabodh.com/cin/cin.html) - Rajeev Kumar (HTML)
* [C Notes for Professionals](https://goalkicker.com/CBook) - Compiled from StackOverflow Documentation (PDF)
* [C Programming](https://en.wikibooks.org/wiki/Programming%3AC) - Wikibooks
* [C Programming Boot Camp - Paul Gribble](https://gribblelab.org/teaching/CBootCamp/)
* [C Programming Tutorial](https://www.tutorialspoint.com/cprogramming/) - Tutorialspoint (HTML)
* [Coursebook](https://github.com/illinois-cs241/coursebook) - B. Venkatesh, L. Angrave, et al.
* [Deep C](http://www.slideshare.net/olvemaudal/deep-c)
* [Essential C](http://cslibrary.stanford.edu/101/EssentialC.pdf) - Nick Parlante (PDF)
* [Everything you need to know about pointers in C - Peter Hosey](http://boredzo.org/pointers/)
* [Functional C (1997)](https://research.utwente.nl/files/5128727/book.pdf) - Pieter H. Hartel, Henk Muller (PDF)
* [Hashing](https://www.smashwords.com/books/view/737188) - Prakash Hegade
* [Learn to Code With C - The MagPi Essentials](https://magpi.raspberrypi.com/books/essentials-c-v1) (PDF)
* [Learning GNU C](https://download-mirror.savannah.gnu.org/releases/c-prog-book/learning_gnu_c.pdf) - Ciaran O’Riordan (PDF)
* [Let us C](https://web.archive.org/web/20211006163041/http://pdvpmtasgaon.edu.in/uploads/dptcomputer/Let%20us%20c%20-%20yashwantkanetkar.pdf) - Yashavant Kanetkar (PDF) *(:card_file_box: archived)*
* [Modeling with Data](https://ben.klemens.org/pdfs/gsl_stats.pdf) - Ben Klemens (PDF)
* [Modern C](https://modernc.gforge.inria.fr) - Jens Gustedt (PDF)
* [Object-Oriented Programming With ANSI-C](http://www.planetpdf.com/codecuts/pdfs/ooc.pdf) (PDF)
* [Programming in C](http://ee.hawaii.edu/~tep/EE160/Book/PDF/) - Bharat Kinariwala & Tep Dobry
* [Programming in C](https://www.freetechbooks.com/programming-in-c-t1337.html) - Kishori Mundargi
* [Structures and C](https://www.smashwords.com/books/view/644937) - Prakash Hegade
* [The Basics of C Programming](https://www.phys.uconn.edu/~rozman/Courses/P2200_13F/downloads/TheBasicsofCProgramming-draft-20131030.pdf) - Marshall Brain (PDF)
* [The C book](http://publications.gbdirect.co.uk/c_book/) - Mike Banahan, Declan Brady and Mark Doran (PDF, HTML)
* [The C Programming Language Handbook](https://flaviocopes.com/page/c-handbook/) - Flavio Copes (PDF, EPUB, Kindle) *(email address requested)*
* [The Craft of Text Editing or A Cookbook for an Emacs](http://www.finseth.com/craft/) - Craig A. Finseth
* [The Current C Programming Language Standard – ISO/IEC 9899:2018 (C17/C18), Draft](https://web.archive.org/web/20181230041359/http://www.open-std.org/jtc1/sc22/wg14/www/abq/c17_updated_proposed_fdis.pdf) - Open Standards Org - www.open-std.org (PDF)
* [The GNU C Programming Tutorial](http://www.crasseux.com/books/ctut.pdf) - Mark Burgess, Ron Hale-Evans (PDF)
* [The GNU C Reference Manual](https://www.gnu.org/software/gnu-c-manual/gnu-c-manual.html) - Trevis Rothwell, James Youngman (HTML) [(PDF)](https://www.gnu.org/software/gnu-c-manual/gnu-c-manual.pdf)
* [The little book about OS development](http://littleosbook.github.io) - Erik Helin, Adam Renberg
* [The New C Standard - An Economic and Cultural commentary (2009)](http://www.knosof.co.uk/cbook/cbook.html) - Derek M. Jones (PDF)
* [TONC GBA Programming - Game Boy Advance Development](http://www.coranac.com/tonc/text/toc.htm)

---

## Relationship to other languages

* [C-rusted: The Advantages of Rust, in C, without the Disadvantages](https://arxiv.org/pdf/2302.05331.pdf)
* [CLangSharp](https://github.com/dotnet/ClangSharp): CLang bindings in [C#](/languages/dotnet/csharp)