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
* Imperative search programming **SNOBOL, Icon, [Prolog](../prolog)**
* Functional programming **[Scheme](../lisp/scheme), ML**
* Deterministic logic programming
* Relational & logic programming **[Prolog](../prolog), SQL embeddings**
* Constraint (logic) programming **CLP, ILOG Solver**
* Concurrent constraint programming **LIFE, AKL**
* Lazy concurrent constraint programming **[Oz](../oz), [Alice](../alice), [Curry](../curry)**
* Continuation programming **[Scheme](../lisp/scheme), ML**
* Lazy functional programming **[Haskell](../haskell)**
* Monotonic dataflow programming
* Declarative concurrent programming **Pipes, MapReduce**
* Lazy dataflow programming
* Lazy dataflow concurrent programming **[Oz](../oz), [Alice](../alice), [Curry](../curry)**
* ADT functional programming **[Haskell](../haskell), ML, [E](../e)**
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
* Stateful functional programming **Java, [OCaml](../ocaml)**
* Concurrent object-oriented programming
* Shared-state concurrent programming **[Smalltalk](../smalltalk), [Oz](../oz), Java, [Alice](../alice)**
* Software transactional memory **SQL embeddings**

Declarative, imperative, functional, constraint, logic, relational, concurrent, dataglow, synchronous, mesage-passing, event-loop, object-oriented, stateful, shared-state

## Fun
["History of Programming Languages"](http://thequickword.wordpress.com/2014/02/16/james-irys-history-of-programming-languages-illustrated-with-pictures-and-large-fonts/) by James Iry. Illustrated--pictures and large fonts. | ["Say something you dislike about a language you love"](https://lobste.rs/s/2cw6ov/say_something_you_dislike_about_language) | ["Say something nice about a language you dislike"](https://lobste.rs/s/hib1ui/say_something_nice_about_programming)


## General language sites/links
Some general language-wonk sorts of sites: 

* [Github Collections: Programming Languages](https://github.com/collections/programming-languages): As of 1 June 2020, I've collected the top two or three d[oz](../oz)en into this site (at least).

* [Codelani](https://codelani.com/) appears to be a comprehensive list of languages (over 4,000); the ["patterns"](https://codelani.com/lists/patterns.html) section is more a collection of "language atoms" that make up a lot of language syntax and semantics; I need to create my own ontology around this

* [Lambda the Ultimate | Programming Languages Weblog](http://lambda-the-ultimate.org/)

* [Programming Languages Short List (PLRE.org)](http://www.plre.org/languages.html)

* [Programming languages](http://microsoft.toddverbeek.com/lang.html) 

* [The Encyclopedia of Computer Languages](http://hopl.murdoch.edu.au/) 

* [Programming language - Wikipedia, the free encyclopedia](http://en.wikipedia.org/wiki/Programming_language) 

* [Visual Programming Languages - Snapshots](http://blog.interfacevision.com/design/design-visual-progarmming-languages-snapshots/) 

* [Embedded scripting languages list](https://github.com/dbohdan/embedded-scripting-languages)

* [PL Enthusiast](http://www.pl-enthusiast.net/) 

* [PL wonks](http://wonks.github.io/)

## Language categories
Wikipedia defines a really large ontological breakdown of languages; I prefer a slightly smaller one:

* Assembly/Machine: Characterized by little-to-no abstraction over the target platform.

* Procedural: Characterized by imperative execution statements

* [Object-oriented](/tags/object.html): Characterized by the union of state and behavior into a first-class concept, either at compile-time, run-time, or both

* [Functional](/tags/functional.html): Characterized by mathematics-inspired functions as first-class concepts. Preference for expressions over statements, lazy execution, immutable values, and so on. | [Wikipedia](https://en.wikipedia.org/wiki/Functional_programming) | Some [reading](/reading/functional.html) | Functional programming brought us [monads](reading/monads.html) and all the fun that goes with that. Frequently cites/builds off of the [lambda calculus](http://en.wikipedia.org/wiki/Lambda_calculus).

#### [Metaprogramming](/tags/metaobject.html) (aka MetaObject Protocol)

#### Declarative

#### [Static](/tags/static.html)-vs-[dynamic](/tags/dynamic.html) typing

#### [Compiled](/tags/compiled.html)-vs-[interpreted](/tags/interpreted.html) execution

#### [Probabalistic Programming](http://probabilistic-programming.org/wiki/Home?imm_mid=0e7ab9&cmp=em-prog-na-na-newsltr_20160910)
"Make it easier to to probabilistic inference in custom models." | [Probabalistic Models of Cognition](https://probmods.org/) | ["TOWARDS COMMON-SENSE REASONING
VIA CONDITIONAL SIMULATION: LEGACIES OF TURING IN ARTIFICIAL INTELLIGENCE"](https://arxiv.org/pdf/1212.4799v2.pdf)

Some [slides](https://tminka.github.io/papers/mlss2009/WinnMinka-ProbabilisticProgramming-slides.pdf) on the concept; they mention a Microsoft Research language, Csoft, that does not appear in Google, and reference [InferNET](/libraries/infernet.html) as being close to what Csoft was supposed to offer.

## Comparisons
[Syntax across languages](http://rigaux.org/language-study/syntax-across-languages.html): One large page of comprehensive syntax across languages | [Quick comparison of ten non-mainstream languages](http://www.h3rald.com/articles/10-programming-languages/) | [List of multiparadigm languages](http://en.wikipedia.org/wiki/List_of_multi-paradigm_programming_languages) | [Hostiness: List of languages targeting an existing host platform](http://blog.fogus.me/2012/10/09/hostiness/) | [Advanced programming languages](http://matt.might.net/articles/best-programming-languages/) -- thoughts on [Haskell](../haskell), Scala, [Scheme](../lisp/scheme), SML, [OCaml](../ocaml) | ["Six programming paradigms that will change how you think about coding"](https://www.ybrikman.com/writing/2014/04/09/six-programming-paradigms-that-will/) | ['A Language a Day'](https://andrewshitov.com/2019/11/25/a-language-a-day-advent-calendar-2019/) | ["Dimensional Analysis in Programming Languages: A survey of existing designs/implementations for automatic conversion and verification of units of measurement in computer programs"](https://gmpreussner.com/research/dimensional-analysis-in-programming-languages)

["Bits of History, Words of Advice"](gbracha.blogspot.com/2020/05/bits-of-history-words-of-advice.html): The creator of [Newspeak](newspeak.html) and one of the core developers working on [Java](java) and the [JVM](/platforms/jvm.html) offers some advice about Smalltalk's lack of success in the mainstream.

