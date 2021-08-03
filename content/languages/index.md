title=Languages
category=language
type=categorypage
summary=A collection of links about programming languages.
tags=language
~~~~~~

Programming languages are (generally) human-friendly means of getting a computer to do something interesting on a human's behalf. Some languages may be friendlier than others; where opinions will genuinely differ as to which are friendlier, there are some that deliberately seek to be as obtuse and unreadable as possible, and those are usually called "esoteric" programming languages and fit into their own category of madness.

["Programming Paradigms for Dummies: What Every Programmer Should Know"](https://www.info.ucl.ac.be/~pvr/VanRoyChapter.pdf); includes a [chart of the major programming paradigms](http://www.info.ucl.ac.be/people/PVR/paradigmsDIAGRAMeng108.pdf):

* Descriptive declarative programming **[XML](../../formats/xml), S-expression**
* First-order functional programming
* Imperative programming **Pascal, [C](../c)**
* Imperative search programming **SNOBOL, [Icon](../icon), [Prolog](../prolog)**
* Functional programming **[Scheme](../lisp/scheme), ML**
* Deterministic logic programming
* Relational & logic programming **[Prolog](../prolog), SQL embeddings**
* Constraint (logic) programming **CLP, ILOG Solver**
* Concurrent constraint programming **LIFE, AKL**
* Lazy concurrent constraint programming **[Oz](../oz), [Alice](../alice), [Curry](../curry)**
* Continuation programming **[Scheme](../lisp/scheme), [ML](../ml)**
* Lazy functional programming **[Haskell](../haskell)**
* Monotonic dataflow programming
* Declarative concurrent programming **Pipes, MapReduce**
* Lazy dataflow programming
* Lazy dataflow concurrent programming **[Oz](../oz), [Alice](../alice), [Curry](../curry)**
* ADT functional programming **[Haskell](../haskell), [ML](../ml), [E](../e)**
* ADT imperative programming **CLU, [OCaml](../ocaml), [Oz](../oz)**
* Nonmonotonic dataflow programming
* Concurrent logic programming **[Oz](../oz), [Alice](../alice), [Curry](../curry), Excel, AKL, FGHC, FCP**
* Functional reactive programming (FRP)
* Weak synchronous programming **FrTime, SL**
* Strong synchronous programming **Esterel, Lustre, Signal**
* Multi-agent dataflow programming **[Oz](../oz), [Alice](../alice), AKL**
* Event-loop programming **[E in one val](../e)**
* Multi-agent programming
* Message-passing concurrent programming **[Erlang](../erlang), AKL**
* Active object programming
* Object capabilities programming **CSP, Occam, [E](../e), [Oz](../oz), [Alice](../alice), publish/subscribe, tuple space (Linda)**
* Sequential object-oriented programming
* Stateful functional programming **[Java](../jvm/java), [OCaml](../ocaml)**
* Concurrent object-oriented programming
* Shared-state concurrent programming **[Smalltalk](../smalltalk), [Oz](../oz), [Java](../jvm/java), [Alice](../alice)**
* Software transactional memory **SQL embeddings**

Declarative, imperative, functional, constraint, logic, relational, concurrent, dataflow, synchronous, mesage-passing, event-loop, object-oriented, stateful, shared-state

## Fun
["History of Programming Languages"](http://thequickword.wordpress.com/2014/02/16/james-irys-history-of-programming-languages-illustrated-with-pictures-and-large-fonts/) by James Iry. Illustrated--pictures and large fonts. | ["Say something you dislike about a language you love"](https://lobste.rs/s/2cw6ov/say_something_you_dislike_about_language) | ["Say something nice about a language you dislike"](https://lobste.rs/s/hib1ui/say_something_nice_about_programming)


## See also [Language Places](../../place/languages) and [PLZoo](../../place/plzoo)


## Language categories
Wikipedia defines a really large ontological breakdown of languages; I prefer a slightly smaller one:

* Assembly/Machine: Characterized by little-to-no abstraction over the target platform.

* Procedural: Characterized by imperative execution statements

* [Object-oriented](/tags/object): Characterized by the union of state and behavior into a first-class concept, either at compile-time, run-time, or both

* [Functional](/tags/functional): Characterized by mathematics-inspired functions as first-class concepts. Preference for expressions over statements, lazy execution, immutable values, and so on. | [Wikipedia](https://en.wikipedia.org/wiki/Functional_programming) | Some [reading](/reading/functional) | Functional programming brought us [monads](/reading/monads) and all the fun that goes with that. Frequently cites/builds off of the [lambda calculus](http://en.wikipedia.org/wiki/Lambda_calculus).

#### [Metaprogramming](/tags/metaobject) (aka MetaObject Protocol)
Characterized by the idea that we can elevate "above" the object concept, in a variety of different ways: source generation, semantic macros, parametric polymorphism, and so on. Many MOPs allow for the runtime manipulation of object instances or types without requiring recompilation.

#### Declarative

#### [Static](/tags/static)-vs-[dynamic](/tags/dynamic) typing

#### [Compiled](/tags/compiled)-vs-[interpreted](/tags/interpreted) execution

#### [Probabalistic Programming](http://probabilistic-programming.org/wiki/Home?imm_mid=0e7ab9&cmp=em-prog-na-na-newsltr_20160910)
"Make it easier to to probabilistic inference in custom models." | [Probabalistic Models of Cognition](https://probmods.org/) | ["TOWARDS COMMON-SENSE REASONING VIA CONDITIONAL SIMULATION: LEGACIES OF TURING IN ARTIFICIAL INTELLIGENCE"](https://arxiv.org/pdf/1212.4799v2.pdf)

Some [slides](https://tminka.github.io/papers/mlss2009/WinnMinka-ProbabilisticProgramming-slides.pdf) on the concept; they mention a Microsoft Research language, Csoft, that does not appear in Google, and reference [InferNET](/libraries/infernet.html) as being close to what Csoft was supposed to offer.

## Comparisons
[Syntax across languages](http://rigaux.org/language-study/syntax-across-languages.html): One large page of comprehensive syntax across languages | [Quick comparison of ten non-mainstream languages](http://www.h3rald.com/articles/10-programming-languages/) | [List of multiparadigm languages](http://en.wikipedia.org/wiki/List_of_multi-paradigm_programming_languages) | [Hostiness: List of languages targeting an existing host platform](http://blog.fogus.me/2012/10/09/hostiness/) | [Advanced programming languages](http://matt.might.net/articles/best-programming-languages/) -- thoughts on [Haskell](../haskell), Scala, [Scheme](../lisp/scheme), SML, [OCaml](../ocaml) | ["Six programming paradigms that will change how you think about coding"](https://www.ybrikman.com/writing/2014/04/09/six-programming-paradigms-that-will/) | ['A Language a Day'](https://andrewshitov.com/2019/11/25/a-language-a-day-advent-calendar-2019/) | ["Dimensional Analysis in Programming Languages: A survey of existing designs/implementations for automatic conversion and verification of units of measurement in computer programs"](https://gmpreussner.com/research/dimensional-analysis-in-programming-languages)

["Bits of History, Words of Advice"](http://gbracha.blogspot.com/2020/05/bits-of-history-words-of-advice.html): The creator of [Newspeak](../smalltalk/newspeak) and one of the core developers working on [Java](../jvm/java) and the [JVM](/platforms/jvm) offers some advice about Smalltalk's lack of success in the mainstream.

# Implementation Reading
* Escape analysis: Escape analysis is an optimization for identifying objects which do not escape the dynamic extent of a function; such objects can be stack-allocated, or 'flattened' so that usages of them are replaced with a series of local variables (the latter optimization is known as "scalar replacement").

	An overview of the escape analysis algorithm used in Factor's Optimizing compiler:

	http://factor-language.blogspot.com/2008/08/algorithm-for-escape-analysis.html
	http://en.wikipedia.org/wiki/Escape_analysis
* Register allocation
    * Linear scan: The linear scan algorithm sacrifices code quality for compilation speed; it only needs to make one or two passes over the intermediate representation to assign registers, and therefore runs in O(n) time; therefore it is much faster than graph coloring, which runs in O(n2) time.
        * Linear Scan Register Allocation, Massimiliano Poletto and Vivek Sarkar, http://www.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf
        * Linear Scan Register Allocation for the Java HotSpot Client Compiler, by Christian Wimmer, http://www.ssw.uni-linz.ac.at/Research/Papers/Wimmer04Master/
        * Quality and Speed in Linear-scan Register Allocation, by Omri Traub, Glenn Holloway, Michael D. Smith, http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.8435
	* Graph coloring
    	* Graph coloring is traditionally implemented by building an interference graph, attempting to color it, and if coloring fails, spilling some values and building the interference graph again. Building the graph is pretty expensive; if your program is in SSA form, it turns out you can perform spilling, build the graph and color it all in one shot. Register allocation for programs in SSA form using chordal graph coloring, Sebastian Hack, http://digbib.ubka.uni-karlsruhe.de/volltexte/documents/6532
* Crash Course on Notation in Programming Language Theory
	- Jeremy G. Siek
	- LambdaConf 2018
	- Part 1: https://www.youtube.com/watch?v=vU3caZPtT2I
	- Part 2: https://www.youtube.com/watch?v=MhuK_aepu1Y
	- Slides: https://www.dropbox.com/s/joaq7m9v75blrw5/pl-notation-lambdaconf-2018.pdf?dl=1
	- 2012 blog post: http://siek.blogspot.com/2012/07/crash-course-on-notation-in-programming.html
* [Type Safety in Three Easy Lemmas](https://siek.blogspot.com/2013/05/type-safety-in-three-easy-lemmas.html)
* [On the Relationship Between Static Analysis and Type Theory](https://semantic-domain.blogspot.com/2019/08/on-relationship-between-static-analysis.html)
* [Soundness and completeness: with precision](https://bertrandmeyer.com/2019/04/21/soundness-completeness-precision/)
* [What is soundness (in static analysis)?](http://www.pl-enthusiast.net/2017/10/23/what-is-soundness-in-static-analysis/)
* Brown CS: CSCI 1730: Programming Languages
	- http://cs.brown.edu/courses/csci1730/2012/
	- http://cs.brown.edu/courses/cs173/2012/Videos/
* OPLSS (Oregon Programming Languages Summer School)
	- https://cs.uoregon.edu/research/summerschool/
	- 2019-2017, 2003: https://www.youtube.com/channel/UCDe6N9R7U-RYWA57wzJQ2SQ/playlists
	- 2016-2015: https://www.youtube.com/channel/UCsON_8vogp4nCQFTnfu43kA/playlists
	- free video lectures available, including the introductory ones based on Practical Foundations for Programming Languages: http://www.cs.cmu.edu/~rwh/pfpl/
* Programming Language Implementation Summer School (PLISS)
	- https://pliss2019.github.io/talks.html
	- https://www.youtube.com/channel/UCofC5zis7rPvXxWQRDnrTqA/playlists 
* [SSA book](http://ssabook.gforge.inria.fr/latest/)
* Intermediate Representations in Imperative Compilers: A Survey
	- ACM Computing Surveys, Vol. 45, No. 3, Article 26, 2013
	- James Stanier, Des Watson
	- http://dx.doi.org/10.1145/2480741.2480743
	- http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.885.5223&rep=rep1&type=pdf
* Modern Intermediate Representations (IR)
	- Introduction to LLVM - David Chisnall (Cambridge University)
	- [HPC Summer School 2017](https://llvm.org/devmtg/2017-06/)
	- https://llvm.org/devmtg/2017-06/1-Davis-Chisnall-LLVM-2017.pdf
* Testing Intermediate Representations for Binary Analysis
	- https://softsec.kaist.ac.kr/~soomink/paper/ase17main-mainp491-p.pdf
	- https://github.com/SoftSec-KAIST/MeanDiff
	- https://softsec-kaist.github.io/MeanDiff/
* [CS 7194 - Great works in Programming Languages](https://www.cs.cornell.edu/courses/cs7194/2019sp/)
* Type Systems - Neel Krishnaswami
	- https://www.cl.cam.ac.uk/teaching/1819/Types/materials.html
	- https://www.cl.cam.ac.uk/teaching/1819/Types/handout.pdf
* http://jschuster.org/blog/2016/11/29/getting-started-in-programming-languages/
* [Programming Languages: Application and Interpretation](http://cs.brown.edu/~sk/Publications/Books/ProgLangs/) by Shriram Krishnamurthi
* [SIGPLAN Awards](http://www.sigplan.org/Awards/)
* [Great Works in Programming Languages](https://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) Collected by Benjamin C. Pierce
* [10PL: 10 papers that all PhD students in programming languages ought to know, for some value of 10](https://github.com/nuprl/10PL) from Northeastern University Programming Research Lab 
* [Best of PLDI 2004](https://dblp.uni-trier.de/db/conf/pldi/pldi2004best.html)
* [Classic Papers in Programming Languages and Logic](https://www.cs.cmu.edu/~crary/819-f09/) by Karl Crary
* What Type Soundness Theorem Do You Really Want to Prove?
	- https://blog.sigplan.org/2019/10/17/what-type-soundness-theorem-do-you-really-want-to-prove/
	- Milner Award Lecture: The Type Soundness Theorem That You Really Want to Prove (and now you can)
		- POPL 2018; Derek Dreyer
		- https://www.youtube.com/watch?v=8Xyk_dGcAwk
* Type Theory Behind Glasgow Haskell Compiler Internals
	- LambdaConf 2018; Vitaly Bragilevsky
	- https://www.youtube.com/playlist?list=PLvPsfYrGz3wspkm6LVEjndvQqK6SkcXaT
	- https://github.com/bravit/tt-ghc-exercises/
	- https://github.com/lambdaconf/lambdaconf-2018/tree/master/LC18-slides
* Principles of Programming Languages
	- Lectures - Matthias Felleisen
	- https://felleisen.org/matthias/4400-s20/lectures.html
*  [learn-programming-languages](https://github.com/jeanqasaur/learn-programming-languages)
	- Resources for the working programmer to learn more about the fundamentals and theory of programming languages.
	- Jean Yang

[Lingua.NET](https://archive.codeplex.com/?p=lingua): Discontinued/archived CodePlex parser generator. Archived content copied locally [here](../dotnet/lingua.zip).