title=Language Implementation Reading
tags=language, reading, llvm, native
summary=Collection of articles on implementing languages.
~~~~~~

["The Naked Truth About Writing a Programming Language"](https://www.digitalmars.com/articles/b90.html)


[Program Analysis](https://gist.github.com/MattPD/00573ee14bf85ccac6bed3c0678ddbef)

## Background, Books
[68 resources on creating programming languages](https://tomassetti.me/resources-create-programming-languages/)

[Awesome Compilers](https://github.com/aalhour/awesome-compilers)

[A Compiler Writing Journey](https://github.com/DoctorWkt/acwj)

[An Incremental Approach to Compiler Construction](http://scheme2006.cs.uchicago.edu/11-ghuloum.pdf):  Scheme and Functional Programming 2006; Abdulaziz Ghuloum -- [Github](https://github.com/namin/inc) Step-by-step development of a Scheme-to-x86 compiler

[An Introduction to GCC](https://web.archive.org/web/20170326232435/http://www.network-theory.co.uk/docs/gccintro/index.html) - Brian Gough

[Basics of Compiler Design (Anniversary Edition)](http://www.diku.dk/~torbenm/Basics/) - Torben Mogensen

[Compiler Design in C (1990)](http://www.holub.com/software/compiler.design.in.c.html) - Allen Holub, Prentice Hall

[Compiler Design: Theory, Tools, and Examples, C/C++ Edition](http://elvis.rowan.edu/~bergmann/books/Compiler_Design/c_cpp/Text/C_CppEd.pdf) - Seth D. Bergmann (PDF)

[Compiler Design: Theory, Tools, and Examples, Java Edition](http://elvis.rowan.edu/~bergmann/books/Compiler_Design/java/CompilerDesignBook.pdf) - Seth D. Bergmann (PDF)

[Computer Language Notes: Compilers and Interpreters](https://github.com/melling/ComputerLanguages/blob/master/compilers.md)

[Compiling Scala for the Java Virtual Machine](http://lampwww.epfl.ch/~schinz/thesis-final-A4.pdf) - Michel Schinz (PDF)

[Compiling Techniques (1969)](http://www.chilton-computing.org.uk/acl/literature/books/compilingtechniques/overview.htm) - F.R.A. Hopgood, Macdonald

[Crafting Interpreters](http://craftinginterpreters.com/) by Bob Nystrom [Github](https://github.com/munificent/craftinginterpreters)

[Essentials of Compilation: An Incremental Approach](https://github.com/IUCompilerCourse/Essentials-of-Compilation) by Siek, Newton: A book about compiling Racket to x86-64 assembly

[Essentials of Programming Languages](http://www.eopl3.com/): EOPL, as it’s better known, introduces readers to the internal workings of programming languages by describing small programming languages and creating an interpreter for each one. The book is very hands-on, with lots of exercises for the reader to modify the interpreters with new features. It touches on the ideas of reasoning about languages and formal semantics, but mostly sticks to the interpreter-as-semantics approach.

[How to Design Programs](https://htdp.org/)

[Implementing Functional Languages: A Tutorial](http://research.microsoft.com/en-us/um/people/simonpj/Papers/pj-lester-book/) - Simon Peyton Jones, David Lester

[Introduction to Compilers and Language Design](https://www3.nd.edu/~dthain/compilerbook/compilerbook.pdf) | [Introduction to Compilers and Language Design](http://compilerbook.org/) - Douglas Thain (PDF)

[learn-programming-languages](https://github.com/jeanqasaur/learn-programming-languages)
	- Resources for the working programmer to learn more about the fundamentals and theory of programming languages.
	- Jean Yang

[Practical and Theoretical Aspects of Compiler Construction](http://web.stanford.edu/class/archive/cs/cs143/cs143.1128/) (class lectures and slides)

[Programming Language Pragmatics](https://www.cs.rochester.edu/~scott/pragmatics/) by Michael L Scott. Covers theoretical background behind languages beyond syntax.

[Programming Languages: Application and Interpretation](http://cs.brown.edu/courses/cs173/2012/book/)

[Programming languages and techniques (PDF)](http://www.seas.upenn.edu/~cis120/current/notes/120notes.pdf)

[Resources for Amateur Compiler Writers](http://c9x.me/compile/bib/)

[Semantics Engineering with PLT Redex](http://redex.racket-lang.org/): The PhD-level programming languages course at Northeastern uses the Redex book, and I found it to be a good introduction. The tool itself ([Redex](http://docs.racket-lang.org/redex/index.html)) is a great way to experiment with semantics, including reduction relations (roughly, the part of the semantics that says how the program runs) and type systems. You could use this book as a substitute for TAPL (at least for learning the basics of formal semantics), or you could use Redex to experiment with the languages described in TAPL.

[Types and Programming Languages](https://www.cis.upenn.edu/~bcpierce/tapl/): TAPL (rhymes with “apple”), as it’s better known, has a solid introduction to formal semantics in the first few chapters and would be my pick for a starting point on formal semantics. The remainder of the book deals with type systems, which form only one part of programming languages, but it’s the canonical reference if you’re looking to learn about types.

[The ANTLR Mega Tutorial](https://tomassetti.me/antlr-mega-tutorial/)

### Lists of recommended reading
[GCC Wiki - List of compiler books](https://gcc.gnu.org/wiki/ListOfCompilerBooks) | [Jordan Rose (Swift team) recommendations](http://belkadan.com/blog/2015/11/Recommendations/) | http://jschuster.org/blog/2016/11/29/getting-started-in-programming-languages/ | [Jonathan Turner’s Reading List](http://www.jonathanturner.org/2016/10/programming-language-and-compilers-reading-list.html): Turner is an engineer on Mozilla’s Rust team and recently posted his reading list for getting up-to-speed on programming languages. The list starts with some resources on how to build interpreters and compilers, but also points to more academic material later. | [10PL](https://github.com/nuprl/10pl): This is a list compiled by Northeastern’s PL faculty of (roughly) ten academic papers that they think every student in PL should know. Not all of them are PL papers themselves, and they don’t form a full foundation on their own, but they form a kind of “great books” list for PL. | Benjamin Pierce, the author of TAPL, also has a [similar list](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) (although with a slightly more type-heavy and theoretical bent). | [Classic Papers in Programming Languages and Logic](https://www.cs.cmu.edu/~crary/819-f09/) by Karl Crary

## Tutorials/Intros/Walkthroughs
[FreeCompilerCamp.org](http://freecompilercamp.org/): Online Training for Extending Compilers [Github](https://github.com/freeCompilerCamp):
- Clang/LLVM Tutorials
	- http://freecompilercamp.org/clang-llvm-landing
	- Alok Mishra, Anjia Wang, Chunhua Liao, Yonghong Yan, Barbara Chapman
	- https://sc19.supercomputing.org/proceedings/tech_poster/tech_poster_pages/rpost138.html
- FreeCompilerCamp.org: Training for OpenMP Compiler Development from Cloud
	- https://sc19.supercomputing.org/proceedings/workshops/workshop_pages/ws_bphpcte103.html

- Let's Build an Interpreter (series) ([Github](https://github.com/hisystems/Interpreter/tree/master/Engine)): [1](https://ruslanspivak.com/lsbasi-part1/) | [2](https://ruslanspivak.com/lsbasi-part2/) | [3](https://ruslanspivak.com/lsbasi-part3/) | [4](https://ruslanspivak.com/lsbasi-part4/) | [5](https://ruslanspivak.com/lsbasi-part5/) | [6](https://ruslanspivak.com/lsbasi-part6/) | [7](https://ruslanspivak.com/lsbasi-part7/) | [8](https://ruslanspivak.com/lsbasi-part8/) | [9](https://ruslanspivak.com/lsbasi-part9/) | [10](https://ruslanspivak.com/lsbasi-part10/) | [11](https://ruslanspivak.com/lsbasi-part11/) | [12](https://ruslanspivak.com/lsbasi-part12/) | [13](https://ruslanspivak.com/lsbasi-part13/) | [14](https://ruslanspivak.com/lsbasi-part14/) | [15](https://ruslanspivak.com/lsbasi-part15/) | [16](https://ruslanspivak.com/lsbasi-part16/) | [17](https://ruslanspivak.com/lsbasi-part17/) | [18](https://ruslanspivak.com/lsbasi-part18/) | [19](https://ruslanspivak.com/lsbasi-part19/) | may be more...?

- Immo Landwerth has done a collection of videos on building a language called Minsk, for the CLR platform, in a live-streaming style: [Source](https://github.com/terrajobst/minsk) | [Episode 1](https://www.youtube.com/watch?v=wgHIkdUQbp0&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y) | [Episode 2](https://www.youtube.com/watch?v=3XM9vUGduhk&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=2) | [Episode 3](https://www.youtube.com/watch?v=61dLQNgd9o8&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=3) | [Episode 4](https://www.youtube.com/watch?v=xF-8rWeqV1A&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=4) | [Episode 5](https://www.youtube.com/watch?v=EEzuO9XWmUY&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=5) | [Episode 6](https://www.youtube.com/watch?v=EEzuO9XWmUY&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=6) | [Episode 7](https://www.youtube.com/watch?v=SJE_gUnJl2Y&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=7) | [Episode 8](https://www.youtube.com/watch?v=PfpayNvfu20&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=8) | [Episode 9](https://www.youtube.com/watch?v=QwZuY1dExAc&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=9) | [Episode 10](https://www.youtube.com/watch?v=QwZuY1dExAc&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=10) | [Episode 11](https://www.youtube.com/watch?v=QwZuY1dExAc&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=11) | [Episode 12](https://www.youtube.com/watch?v=psTZi6xpTlM&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=12) | [Episode 13](https://www.youtube.com/watch?v=NvVc8erZpeI&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=13) | [Episode 14](https://www.youtube.com/watch?v=NvVc8erZpeI&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=14) | [Episode 15](https://www.youtube.com/watch?v=NvVc8erZpeI&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=15) | [Episode 16](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=16) | [Episode 17](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=17) | [Episode 18](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=18) | [Episode 19](https://www.youtube.com/watch?v=Ecrv8sCYEbA&list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y&index=19) | more are likely on the way

[Build your own Lisp](http://www.buildyourownlisp.com/contents) teaches C by building a Lisp.

## College/University Courses

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

[UCB CS294-113](http://www.wolczko.com/CS294/): Virtual Machines and Managed Runtimes
	- [A Concise and Opinionated History of Virtual Machines](https://archive.org/download/vmss16/wolczko.pdf) or [YouTube](https://www.youtube.com/watch?v=QnQYhrpX39M)
		- [Virtual Machines Summer School 2016](https://soft-dev.org/events/vmss16/)

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

### Domain-specific languages (DSLs)
[DSLs - A powerful Scala feature](http://www.scala-lang.org/node/1403) | [Bootstrapping a simple compiler from nothing](http://homepage.ntlworld.com/edmund.grimley-evans/bcompiler.html)

["Design Guidelines for Domain Specific Languages"](https://arxiv.org/pdf/1409.2378): "In this paper we investigate guidelines that are useful for designing domain specific languages, largely based on our experience in developing languages as well as relying on existing guidelines on general purpose (GPLs) and modeling languages. We defined guidelines to support a DSL developer to achieve better quality of the language design and a better acceptance among its users."

Writing Your First Domain Specific Language: [Part 1](https://www.codeproject.com/Articles/26975/Writing-Your-First-Domain-Specific-Language-Part-1), [Part 2](https://www.codeproject.com/Articles/29058/Writing-your-first-Domain-Specific-Language-Part-2) (uses [Irony](/libraries/irony)))

---

## Posts
[Interview with Jesper Louis Andsersen](https://medium.com/@unbalancedparen/interview-with-jesper-louis-andersen-about-erlang-haskell-ocaml-go-idris-the-jvm-software-and-b0de06440fbd#.g4q9w4eqq) about a ton of languages. | ["Less is more: language features"](http://blog.ploeh.dk/2015/04/13/less-is-more-language-features/) | ["Languages I want to write"](https://blog.wesleyac.com/posts/language-todos) | ["A wish list for a new programming language"](http://www.drmaciver.com/2015/07/a-wish-list/)

---

## Implementation and Optimization

### Type Systems

* [On the Relationship Between Static Analysis and Type Theory](https://semantic-domain.blogspot.com/2019/08/on-relationship-between-static-analysis.html)

* [Soundness and completeness: with precision](https://bertrandmeyer.com/2019/04/21/soundness-completeness-precision/)

* [What is soundness (in static analysis)?](http://www.pl-enthusiast.net/2017/10/23/what-is-soundness-in-static-analysis/)

* [What Type Soundness Theorem Do You Really Want to Prove?](https://blog.sigplan.org/2019/10/17/what-type-soundness-theorem-do-you-really-want-to-prove/) ([YouTube](https://www.youtube.com/watch?v=8Xyk_dGcAwk))
	- Milner Award Lecture: The Type Soundness Theorem That You Really Want to Prove (and now you can), POPL 2018; Derek Dreyer

* Type Theory Behind Glasgow Haskell Compiler Internals
	- LambdaConf 2018; Vitaly Bragilevsky
	- https://www.youtube.com/playlist?list=PLvPsfYrGz3wspkm6LVEjndvQqK6SkcXaT
	- https://github.com/bravit/tt-ghc-exercises/
	- https://github.com/lambdaconf/lambdaconf-2018/tree/master/LC18-slides

### Escape analysis
Escape analysis is an optimization for identifying objects which do not escape the dynamic extent of a function; such objects can be stack-allocated, or 'flattened' so that usages of them are replaced with a series of local variables (the latter optimization is known as "scalar replacement").

	An overview of the escape analysis algorithm used in Factor's Optimizing compiler: http://factor-language.blogspot.com/2008/08/algorithm-for-escape-analysis.html http://en.wikipedia.org/wiki/Escape_analysis

### Register allocation

* Linear scan: The linear scan algorithm sacrifices code quality for compilation speed; it only needs to make one or two passes over the intermediate representation to assign registers, and therefore runs in O(n) time; therefore it is much faster than graph coloring, which runs in O(n2) time.

	* Linear Scan Register Allocation, Massimiliano Poletto and Vivek Sarkar, http://www.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf

	* Linear Scan Register Allocation for the Java HotSpot Client Compiler, by Christian Wimmer, http://www.ssw.uni-linz.ac.at/Research/Papers/Wimmer04Master/

	* Quality and Speed in Linear-scan Register Allocation, by Omri Traub, Glenn Holloway, Michael D. Smith, http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.8435


* Graph coloring

	* Graph coloring is traditionally implemented by building an interference graph, attempting to color it, and if coloring fails, spilling some values and building the interference graph again. Building the graph is pretty expensive; if your program is in SSA form, it turns out you can perform spilling, build the graph and color it all in one shot. Register allocation for programs in SSA form using chordal graph coloring, Sebastian Hack, http://digbib.ubka.uni-karlsruhe.de/volltexte/documents/6532

### Static Single Assignment (SSA)

* [Static Single Assignment (SSA) Book (PDF)](http://ssabook.gforge.inria.fr/latest/book-full.pdf) and [online](https://gforge.inria.fr/scm/viewvc.php/ssabook/book/)

### Instruction selection

* [Instruction Selection: Principles, Methods, & Applications](http://kth.diva-portal.org/smash/record.jsf?pid=diva2:951540): Gabriel Hjort Blindell (2016)

* [Universal Instruction Selection](https://github.com/gablin/ghb-thesis/blob/master/ghb-thesis.pdf): 2018 PhD Dissertation; Gabriel Hjort Blindell [Github](https://github.com/gablin/ghb-thesis) and also [here](http://www.diva-portal.org/smash/record.jsf?pid=diva2:1185339)

[Notes on Graph Algorithms Used in Optimizing Compilers](http://www.cs.umb.edu/~offner/files/flow_graph.pdf) - Carl Offner

- ALIVe: Automatic LLVM InstCombine Verifier
	- http://rise4fun.com/Alive
	- https://github.com/nunoplopes/alive
	- http://blog.regehr.org/archives/1170
	- https://www.cs.utah.edu/~regehr/papers/pldi15.pdf
	- http://llvm.org/devmtg/2014-10/Slides/Menendez-Alive.pdf
- Automatic Feedback Directed Optimizer (AutoFDO)
	- https://gcc.gnu.org/wiki/AutoFDO
	- https://github.com/google/autofdo
- Compiler Optimizations for Reverse Engineers by Rolf Rolles
	- http://www.msreverseengineering.com/blog/2014/6/23/compiler-optimizations-for-reverse-engineers
	- http://www.msreverseengineering.com/s/Binary-Literacy-Static-6-Optimizations.ppt
- Compiler Optimization Options
	- GCC: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
	- Clang: http://clang.llvm.org/docs/CommandGuide/clang.html#cmdoption-O0 - https://stackoverflow.com/questions/15548023/clang-optimization-levels
	- Visual C++: https://msdn.microsoft.com/en-us/library/19z1t1wy.aspx
- [Devirtualization in C++](https://hubicka.blogspot.com/search/label/devirtualization)
- [GoingNative 50: New Visual C++ Code Optimizer](https://channel9.msdn.com/Shows/C9-GoingNative/GoingNative-50-New-Visual-C-Code-Optimizer)
- [Link time optimization (LTO)](https://hubicka.blogspot.com/search/label/link-time%20optimization)
- [Optimizations in C++ Compilers: A practical journey](https://queue.acm.org/detail.cfm?id=3372264), by Matt Godbolt; ACM Queue vol. 17, no. 5 (2019)


### Superoptimization

- GNU Superoptimizer Version 2 - https://github.com/embecosm/gso2
- Souper - a superoptimizer for LLVM IR - https://github.com/google/souper
- Stochastic Superoptimization - http://blog.regehr.org/archives/923
- STOKE: A stochastic superoptimizer and program synthesizer - http://stoke.stanford.edu - https://github.com/StanfordPL/stoke
- Superoptimizing Compilers - http://superoptimization.org/wiki/Superoptimizing_Compilers
- Superoptimization - James Pallister - FOSDEM 2015 - https://archive.fosdem.org/2015/schedule/event/superoptimization/


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
