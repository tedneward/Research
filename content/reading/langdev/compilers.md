title=Compilers Reading
tags=language, reading, llvm, native, langdev
summary=Collection of articles on implementing languages.
~~~~~~

## Implementation tools
[Lingua.NET](https://archive.codeplex.com/?p=lingua): Discontinued/archived CodePlex parser generator. Archived content copied locally [here](/languages/dotnet/lingua.zip).

[GCC Front-end HOWTO](https://tldp.org/HOWTO/GCC-Frontend-HOWTO.html): How to build a GCC front-end (so GCC can take care of the rest)

## Background, Books
[68 resources on creating programming languages](https://tomassetti.me/resources-create-programming-languages/)

[Awesome Compilers](https://github.com/aalhour/awesome-compilers)

[A Compiler Writing Journey](https://github.com/DoctorWkt/acwj)

[An Incremental Approach to Compiler Construction](http://scheme2006.cs.uchicago.edu/11-ghuloum.pdf):  Scheme and Functional Programming 2006; Abdulaziz Ghuloum -- [Github](https://github.com/namin/inc) Step-by-step development of a Scheme-to-x86 compiler

[An Introduction to GCC](https://web.archive.org/web/20170326232435/http://www.network-theory.co.uk/docs/gccintro/index.html) - Brian Gough

[Basics of Compiler Design (Anniversary Edition)](http://www.diku.dk/~torbenm/Basics/) - Torben Mogensen

[Compiler Design in C (1990)](http://www.holub.com/software/compiler.design.in.c.html) - Allen Holub, Prentice Hall

Compiler Design: Theory, Tools, and Examples - Seth D. Bergmann

* [C/C++ Edition](http://elvis.rowan.edu/~bergmann/books/Compiler_Design/c_cpp/Text/C_CppEd.pdf) - Seth D. Bergmann (PDF)
* [Java Edition](http://elvis.rowan.edu/~bergmann/books/Compiler_Design/java/CompilerDesignBook.pdf) - Seth D. Bergmann (PDF)

[Computer Language Notes: Compilers and Interpreters](https://github.com/melling/ComputerLanguages/blob/master/compilers.md)

[Compiling Scala for the Java Virtual Machine](http://lampwww.epfl.ch/~schinz/thesis-final-A4.pdf) - Michel Schinz (PDF)

[Compiling Techniques (1969)](http://www.chilton-computing.org.uk/acl/literature/books/compilingtechniques/overview.htm) - F.R.A. Hopgood, Macdonald

[Essentials of Compilation: An Incremental Approach](https://github.com/IUCompilerCourse/Essentials-of-Compilation) by Siek, Newton: A book about compiling Racket to x86-64 assembly

[Essentials of Programming Languages](http://www.eopl3.com/): EOPL, as it’s better known, introduces readers to the internal workings of programming languages by describing small programming languages and creating an interpreter for each one. The book is very hands-on, with lots of exercises for the reader to modify the interpreters with new features. It touches on the ideas of reasoning about languages and formal semantics, but mostly sticks to the interpreter-as-semantics approach.

[How to Design Programs](https://htdp.org/)

[Implementing Functional Languages: A Tutorial](http://research.microsoft.com/en-us/um/people/simonpj/Papers/pj-lester-book/) - Simon Peyton Jones, David Lester

[Introduction to Compilers and Language Design](https://www3.nd.edu/~dthain/compilerbook/compilerbook.pdf) | [Introduction to Compilers and Language Design](http://compilerbook.org/) - Douglas Thain (PDF)

[Let's Build a Compiler](http://www.stack.nl/~marcov/compiler.pdf) (PDF)

[Practical and Theoretical Aspects of Compiler Construction](http://web.stanford.edu/class/archive/cs/cs143/cs143.1128/) (class lectures and slides)

[Programming Language Pragmatics](https://www.cs.rochester.edu/~scott/pragmatics/) by Michael L Scott. Covers theoretical background behind languages beyond syntax.

[Programming Languages: Application and Interpretation](http://cs.brown.edu/courses/cs173/2012/book/)

[Programming languages and techniques (PDF)](http://www.seas.upenn.edu/~cis120/current/notes/120notes.pdf)

[Resources for Amateur Compiler Writers](http://c9x.me/compile/bib/)

[Semantics Engineering with PLT Redex](http://redex.racket-lang.org/): The PhD-level programming languages course at Northeastern uses the Redex book, and I found it to be a good introduction. The tool itself ([Redex](http://docs.racket-lang.org/redex/index.html)) is a great way to experiment with semantics, including reduction relations (roughly, the part of the semantics that says how the program runs) and type systems. You could use this book as a substitute for TAPL (at least for learning the basics of formal semantics), or you could use Redex to experiment with the languages described in TAPL.

[mpri-2.4-public](https://gitlab.inria.fr/fpottier/mpri-2.4-public): Resources for course MPRI 2-4 on functional programming and type systems.

### Lists of recommended reading
[GCC Wiki - List of compiler books](https://gcc.gnu.org/wiki/ListOfCompilerBooks)

[Jordan Rose (Swift team) recommendations](http://belkadan.com/blog/2015/11/Recommendations/)

http://jschuster.org/blog/2016/11/29/getting-started-in-programming-languages/

[Jonathan Turner’s Reading List](http://www.jonathanturner.org/2016/10/programming-language-and-compilers-reading-list.html): Turner is an engineer on Mozilla’s Rust team and recently posted his reading list for getting up-to-speed on programming languages. The list starts with some resources on how to build interpreters and compilers, but also points to more academic material later.

[10PL](https://github.com/nuprl/10pl): This is a list compiled by Northeastern’s PL faculty of (roughly) ten academic papers that they think every student in PL should know. Not all of them are PL papers themselves, and they don’t form a full foundation on their own, but they form a kind of “great books” list for PL.

Benjamin Pierce, the author of TAPL, also has a [similar list](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) (although with a slightly more type-heavy and theoretical bent).

[Classic Papers in Programming Languages and Logic](https://www.cs.cmu.edu/~crary/819-f09/) by Karl Crary

## Tutorials/Intros/Walkthroughs

[FreeCompilerCamp.org](http://freecompilercamp.org/): Online Training for Extending Compilers [Github](https://github.com/freeCompilerCamp):
- Clang/LLVM Tutorials
	- http://freecompilercamp.org/clang-llvm-landing
	- Alok Mishra, Anjia Wang, Chunhua Liao, Yonghong Yan, Barbara Chapman
	- https://sc19.supercomputing.org/proceedings/tech_poster/tech_poster_pages/rpost138.html
- FreeCompilerCamp.org: Training for OpenMP Compiler Development from Cloud
	- https://sc19.supercomputing.org/proceedings/workshops/workshop_pages/ws_bphpcte103.html

## College/University Courses

[Functional programming and type systems](https://wikimpri.dptinfo.ens-cachan.fr/doku.php?id=cours:c-2-4-2); [supplemental repo](https://gitlab.inria.fr/fpottier/mpri-2.4-public)

[Stanford OpenEdX: Compilers - Alex Aiken](http://online.stanford.edu/course/compilers-0)

[Brown CS: CSCI 1730: Programming Languages](http://cs.brown.edu/courses/csci1730/2012/) [Videos](http://cs.brown.edu/courses/cs173/2012/Videos/)

[OPLSS (Oregon Programming Languages Summer School)](https://cs.uoregon.edu/research/summerschool/)
	- 2019-2017, 2003: https://www.youtube.com/channel/UCDe6N9R7U-RYWA57wzJQ2SQ/playlists
	- 2016-2015: https://www.youtube.com/channel/UCsON_8vogp4nCQFTnfu43kA/playlists
	- free video lectures available, including the introductory ones based on Practical Foundations for Programming Languages: http://www.cs.cmu.edu/~rwh/pfpl/

[Principles of Programming Languages](https://felleisen.org/matthias/4400-s20/lectures.html)

[Programming Language Implementation Summer School (PLISS)](https://pliss2019.github.io/talks.html) [YouTube](https://www.youtube.com/channel/UCofC5zis7rPvXxWQRDnrTqA/playlists)

University of Utah: Advanced Compilers - John Regehr
	- Weeks 1 and 2: http://blog.regehr.org/archives/1419
	- Weeks 3-5: http://blog.regehr.org/archives/1428

[UW professor Dan Grossman's teaching materials](https://homes.cs.washington.edu/~djg/teachingMaterials/)

[UW CSE CSEP 501](https://courses.cs.washington.edu/courses/csep501/): Compilers - Hal Perkins
	- Winter 2018
		- Homepage: https://courses.cs.washington.edu/courses/csep501/18sp/
		- Lecture Videos: https://courses.cs.washington.edu/courses/csep501/18sp/video/
	- Winter 2016
		- Homepage: https://courses.cs.washington.edu/courses/csep501/16wi/
		- Playlist: https://www.youtube.com/playlist?list=PLTPQEx-31JXhfAWGnGzwbfhB2zUB7Jd4C
		- Topics: https://courses.cs.washington.edu/courses/csep501/16wi/calendar/lecturelist.html

[SFU CMPT 886](http://www.cs.sfu.ca/~wsumner/teaching/886/15/schedule.html): Program Analysis and Reliability - Nick Sumner, Spring 2015 [YouTube playlist](https://www.youtube.com/playlist?list=PLNC6lmsIySCOPjY8IwKBtD2cqe-MMgIGM)

UCSD CSE 131: Compiler Construction
	- Fall 2019; Joseph Gibbs Politz
		- https://ucsd-cse131-f19.github.io/
		- https://podcast.ucsd.edu/watch/fa19/cse131_a00
	- Winter 2018; Ranjit Jhala
		- https://ucsd-progsys.github.io/131-web/
		- https://podcast.ucsd.edu/watch/wi18/cse131_a00

UCSD CSE 231: Advanced Compiler Design
	- Winter 2019; Sorin Lerner
		- https://podcast.ucsd.edu/watch/wi19/cse231_a00
		- https://ucsd-pl.github.io/cse231/wi19/

[NPTEL: Compiler Design](https://nptel.ac.in/courses/106108052/) ([YouTube playlist](https://www.youtube.com/playlist?list=PL3690D679B876DE6A)): 2011; Y.N. Srikant

---

## Posts
[Interview with Jesper Louis Andsersen](https://medium.com/@unbalancedparen/interview-with-jesper-louis-andersen-about-erlang-haskell-ocaml-go-idris-the-jvm-software-and-b0de06440fbd#.g4q9w4eqq) about a ton of languages.

["Less is more: language features"](http://blog.ploeh.dk/2015/04/13/less-is-more-language-features/)

["Languages I want to write"](https://blog.wesleyac.com/posts/language-todos)

["A wish list for a new programming language"](http://www.drmaciver.com/2015/07/a-wish-list/)

---

## Detection

Pre-defined Compiler Macros - https://sourceforge.net/p/predef/wiki/
	- Architectures - https://sourceforge.net/p/predef/wiki/Architectures/
	- Compilers - https://sourceforge.net/p/predef/wiki/Compilers/
	- Endianness - https://sourceforge.net/p/predef/wiki/Endianness/
	- Language Standards - https://sourceforge.net/p/predef/wiki/Standards/
	- Operating Systems - https://sourceforge.net/p/predef/wiki/OperatingSystems/
	- Standard Libraries - https://sourceforge.net/p/predef/wiki/Libraries/

SPY: Friendly Neighborhood C++17 Constexpr Predef Wrapper
	- OS, compiler, libc, stdlib detection
	- https://github.com/jfalcou/spy

---

## Conferences

Compilers Call For Papers for Conferences, Workshops and Journals at WikiCFP - http://www.wikicfp.com/cfp/call?conference=compilers

Computer Architecture and Compilers Conference Map - http://archconfmap.com/

* ASPLOS: International Conference on Architectural Support for Programming Languages and Operating Systems - https://asplos-conference.org/ - http://dblp.uni-trier.de/db/conf/asplos/
* CASES: Compilers, Architecture, and Synthesis for Embedded Systems - http://www.esweek.org/cases - http://dblp.uni-trier.de/db/conf/cases/
* CC: The International Conference on Compiler Construction - http://conf.researchr.org/series/CC - http://dblp.uni-trier.de/db/conf/cc/
* CGO: International Symposium on Code Generation and Optimization - http://cgo.org/ - http://dblp.uni-trier.de/db/conf/cgo/
* History of Programming Languages (HOPL)
* HPCA: International Symposium on High-Performance Computer Architecture - https://www.hpca-conf.org/ - http://dblp.uni-trier.de/db/conf/hpca/
* ICFP: International Conference on Functional Programming - http://icfpconference.org/ - http://dblp.uni-trier.de/db/conf/icfp/
* International Conference on Software Engineering (ICSE)
* ISMM: International Symposium on Memory Management - http://www.sigplan.org/Conferences/ISMM/ - http://dblp.uni-trier.de/db/conf/iwmm/
* LCTES: Languages, Compilers, and Tools for Embedded Systems - https://conf.researchr.org/series/LCTES - http://dblp.uni-trier.de/db/conf/* lctrts/
* OOPSLA: Object-Oriented Programming Systems, Languages and Applications - http://www.sigplan.org/Conferences/OOPSLA/ - http://www.oopsla.org/ - http://dblp.uni-trier.de/db/conf/oopsla/
* PACT: International Conference on Parallel Architecture and Compilation - http://pactconf.org/ - http://dblp.uni-trier.de/db/conf/IEEEpact/
* PLDI: Programming Language Design and Implementation - http://www.sigplan.org/Conferences/PLDI/ - http://dblp.uni-trier.de/db/conf/pldi/
	- [Best of PLDI 2004](https://dblp.uni-trier.de/db/conf/pldi/pldi2004best.html)
* POPL: Principles of Programming Languages - http://www.sigplan.org/Conferences/POPL/ - http://dblp.uni-trier.de/db/conf/popl/
* PPoPP: ACM SIGPLAN Symposium on Principles and Practice of Parallel Programming - http://www.sigplan.org/Conferences/PPOPP/ - http://dblp.uni-trier.de/db/conf/ppopp/
* SAS: International Static Analysis Symposium - http://www.staticanalysis.org/ - http://dblp.uni-trier.de/db/conf/sas/
* SCOPES: International Workshop on Software and Compilers for Embedded Systems - http://www.scopesconf.org/ - http://dblp.uni-trier.de/db/conf/scopes/
* [SIGPLAN Awards](http://www.sigplan.org/Awards/)
* SPLASH
* Summit on Advances in Programming Languages (SNAPL)


## Documentation

- GCC online documentation - https://gcc.gnu.org/onlinedocs/
	- Cynbe's GCC Debugging Hints - http://muq.org/~cynbe/gcc/
		- Debugging Resources - http://muq.org/~cynbe/gcc/offsite-resources.html
		- Comments on the Internals Manual - http://muq.org/~cynbe/gcc/gccint.html
	- GCC Wiki - https://gcc.gnu.org/wiki
- Visual C++ documentation
	- https://docs.microsoft.com/en-us/cpp/
	- https://github.com/Microsoft/cpp-docs
	- https://msdn.microsoft.com/en-us/library/60k1461a.aspx

## [Sanitizers](https://github.com/google/sanitizers)


## Talks

### 2019

- An overview of Clang
	- 2019 LLVM Developers’ Meeting; Sven van Haastregt, Anastasia Stulova
	- https://www.youtube.com/watch?v=5kkMpJpIGYU
	- http://llvm.org/devmtg/2019-10/talk-abstracts.html#tut8
- GCC under the hood
	- Linaro Connect San Diego 2019; Siddhesh Poyarekar
	- https://www.youtube.com/watch?v=brxAm99w8D8
	- https://siddhesh.in/gcc-under-the-hood.pdf
	- https://siddhesh.in/posts/gcc-under-the-hood.html
	- https://linaroconnectsandiego.sched.com/event/SubD/san19-221-gcc-under-the-hood
- Introduction to LLVM
	- 2019 LLVM Developers’ Meeting; Eric Christopher & Johannes Doerfert
	- https://www.youtube.com/watch?v=J5xExRGaIIY

### 2018

- Introduction to LLVM: Building simple program analysis tools and instrumentation
	- FOSDEM 2018; Mike Shah
	- https://fosdem.org/2018/schedule/event/introduction/
	- https://www.youtube.com/watch?v=VKIv_Bkp4pk
	- slides & code: http://www.mshah.io/fosdem18.html

### 2017

- Getting started with LLVM: the TL;DR version
	- LinaroOrg Connect San Francisco 2017; Diana Picus
	- https://connect.linaro.org/resource/sfo17/sfo17-110/
- LLVM Internals #2
	- Linaro Connect Budapest 2017; Renato Golin, Peter Smith, Diana Picus, Omair Javaid, Adhemerval Zanella
	- http://connect.linaro.org/resource/bud17/bud17-302/

### 2016

- Introduction to LLVM – Projects, Components, Integration, Internals
	- Linaro Connect Las Vegas 2016; Renato Golin
	- http://connect.linaro.org/resource/las16/las16-501/
- Anders Hejlsberg on Modern Compiler Construction
	- Channel 9; May 12, 2016
	- https://channel9.msdn.com/Blogs/Seth-Juarez/Anders-Hejlsberg-on-Modern-Compiler-Construction
- STOKE: Search-Based Compiler Optimization
	- UCI CS Distinguished Lecture; April 29, 2016; Alex Aiken
	- https://www.youtube.com/watch?v=rZFeTTFp7x4

### 2015

- Understanding Compiler Optimization
	- Meeting C++ 2015; Chandler Carruth
	- https://www.youtube.com/watch?v=FnGCDLhaxKU
- Stochastic Optimization for x86 Binaries
	- Google Tech Talks; January 12, 2015; Eric Schkufza
	- https://www.youtube.com/watch?v=aD9mZDJzb58

### 2014

- Superoptimizing LLVM
	- UW CSE Colloquium; December 2, 2014; John Regehr
	- https://www.youtube.com/watch?v=Ux0YnVEaI6A
- Compiler Technologies
	- Northwest C++ Users' Group; October 15, 2014; Jim Hogg
	- http://nwcpp.org/october-2014.html

### 2013

- Compiler Confidential
	- GoingNative 2013; Eric Brumer
	- https://channel9.msdn.com/Events/GoingNative/2013/Compiler-Confidential
