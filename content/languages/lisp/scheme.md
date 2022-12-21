title=Scheme
tags=jvm, clr, native, language, functional, lisp, dynamic, object, metaobject
summary=Homoiconic dynamic functional(ish) language derived from Lisp.
~~~~~~

[R6RS](http://www.r6rs.org/) | [R7RS](https://small.r7rs.org/attachment/r7rs.pdf)

Older specifications: [R5RS](http://www-swiss.ai.mit.edu/~jaffer/r5rs_toc.html) | [R4RS](http://www.cs.indiana.edu/scheme-repository/R4RS/r4rs_toc.html)

### Implementations

* [Bones](http://www.call-with-current-continuation.org/bones/bones.html): Another Scheme compiler, targets x86_64
* [Gambit Scheme](https://gambitscheme.org/) ([Source](https://github.com/gambit/gambit)): an efficient implementation of the Scheme programming language.
* [Larceny](http://www.larcenists.org/)
* [MIT/GNU Scheme](https://www.gnu.org/software/mit-scheme/)
* [GNU Guile Scheme](../guile)
    - FFI bindings: [SCHeMe UnterstüTZung](https://sinusoid.es/schmutz) — easy Guile Scheme C++ bindings ([Source](https://github.com/arximboldi/schmutz))
* [C: Chibi Scheme](https://github.com/ashinn/chibi-scheme): Implements R7RS small.
* [C: Chicken Scheme](https://call-cc.org/): Implements R5RS (with some changes). R7RS support is a work in progress.
* [C: s7](https://ccrma.stanford.edu/software/snd/snd/s7.html)
* [CLR: IronScheme](https://github.com/IronScheme/IronScheme)
* [JVM: Bigloo](http://www-sop.inria.fr/mimosa/fp/Bigloo/bigloo.html#Bigloo-homepage)
* [JVM: Kawa](https://en.wikipedia.org/wiki/Kawa_(Scheme_implementation))
* [JVM: SISC](https://en.wikipedia.org/wiki/SISC)
* [JVM: JScheme](http://jscheme.sourceforge.net/jscheme/main.html) and [here](http://norvig.com/jscheme.html)
* [Scheme in One Day (siod)](https://github.com/gjcarrette/siod)
* [Inlab Scheme](https://scheme.inlab.net/)
* [Femtolisp](https://github.com/JeffBezanson/femtolisp): a lightweight, robust, scheme-like lisp implementation

### Reading
* [The Scheme Programming Language (4th Ed)](https://www.scheme.com/tspl4/), by Dybvig ([3rd Ed](https://www.scheme.com/tspl3/), [2nd Ed](https://www.scheme.com/tspl2/))
* [Structured Interpretation of Computer Programming (SICP)](https://mitpress.mit.edu/sicp/); [JS edition](https://sourceacademy.org/sicpjs/index) ([PDF](https://sicp.sourceacademy.org/sicpjs.pdf)) ([Source](https://github.com/source-academy/sicp))
* [A Pamphlet Against R. Computational Intelligence in Guile Scheme](https://panicz.github.io/pamphlet/)
* [An Introduction to Scheme and its Implementation](http://www.cs.rpi.edu/academics/courses/fall00/ai/scheme/reference/schintro-v14/schintro_toc.html)
* [Concrete Abstractions: An Introduction to Computer Science Using Scheme](https://gustavus.edu/+max/concrete-abstractions.html) - M. Hailperin, B. Kaiser, K. Knight
* [ORBIT](https://cpsc.yale.edu/sites/default/files/files/tr445.pdf): An Optimizing Compiler for Scheme
* [Scheme 9 from Empty Space - First edition (2007)](https://unglue.it/work/506723/) - Nils M. Holm (PDF)
* [Scheme From Scratch](http://peter.michaux.ca/articles/scheme-from-scratch-introduction)
* [Scheme Tutorial](http://www.cs.hut.fi/Studies/T-93.210/schemetutorial/)
* [Simply Scheme: Introducing Computer Science](http://www.cs.berkeley.edu/~bh/ss-toc2.html) - B. Harvey, M. Wright
* [Teach Yourself Scheme in Fixnum Days](https://ds26gte.github.io/tyscheme/index-Z-H-1.html)
* ["VLISP: A Verfied Implementation of Scheme"](http://mirror.informatimago.com/scheme/repository.readscheme.org/ftp/papers/vlisp-lasc/vlisp.pdf)
* [Write Yourself a Scheme in 48 Hours](https://en.wikibooks.org/wiki/Write_Yourself_a_Scheme_in_48_Hours) - Wikibooks

### Resources
[Scheme Reports web site](http://scheme-reports.org/): Where standardization discussions happen.

[The Internet Scheme Repository](http://www.cs.indiana.edu/scheme-repository/home.html): A good source of links, code, and documentation for scheme.

[Schemers.org](http://www.schemers.org/): A list of Scheme resources including documentation, software, communities, jobs, and events.

[MIT's Scheme home page](http://groups.csail.mit.edu/mac/projects/scheme/): Not quite as extensive as the Scheme Repository or Schemers.org.

[Scheme Requests for Implementation](http://srfi.schemers.org/): Contains proposals for a number of Scheme extensions. Many of these tend to exist in one form or the other in a lot of the different Schemes, but can have wildly different interfaces. The SRFI process is essentially aimed at making these non-standard features more standard, without actually being standard (see also: obfuscated). Guile 1.8 implements a large number of SRFIs.

[Greg Badros' Scheme Lecture Notes](http://www.cs.washington.edu/education/courses/341/99su/lectures/scheme/): A set of slides that touch on a variety of subjects related to scheme programing, including samples of similar code written in C and scheme, lambda calculus, and lists.
