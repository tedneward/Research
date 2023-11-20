title=Lisp
tags=jvm, clr, native, language, functional, dynamic, object, metaobject
summary=The original dynamic functional(ish) homoiconic (consistent symbology) language.
~~~~~~

[Scheme](../scheme)s are often spoken synonymously as Lisps.

### Common Lisp Implementations:

* [CLISP](https://clisp.sourceforge.io/): a high-level, general-purpose, object-oriented, dynamic, functional programming language.
* C: [GCL](https://www.gnu.org/software/gcl/): the official Common Lisp for the GNU project.
* C: [Embeddable Common Lisp](https://common-lisp.net/project/ecl/) ([Source](https://gitlab.com/embeddable-common-lisp/ecl)): Full Common Lisp implementation, available as a shared library `libecl.so` embeddable in any C, C++ or other application.
* C: [Guile](../guile): "Guile mostly implements R6RS."
* C: [s7](https://ccrma.stanford.edu/software/snd/snd/s7.html): Implements a subset of R5RS/R7RS. Descended from TinyScheme.
* C: [TinyScheme](http://tinyscheme.sourceforge.net/): Implements a subset of R5RS.
* C++: [Clasp](https://github.com/drmeister/clasp): Full Common Lisp implementation well integrated with C++, using LLVM for the code generation, to integrate closely with C++ applications or libraries.
* JVM: [Armed Bear Common Lisp](http://abcl.org/) or [here](https://common-lisp.net/project/armedbear/)
* JVM: [Kawa](https://www.gnu.org/software/kawa/): R7RS. Supports the javax.script API.
* Native: [Steel Bank Common Lisp](http://www.sbcl.org/) ([Source](http://www.sbcl.org/platform-table.html))
* [Clozure CL](https://www.clozure.com/ccl): "Clozure CL is available for download from [ccl.clozure.com](http://ccl.clozure.com/)" (Self-hosted compiler, so requires a copy of both the source and bootstrap compilers, which are all available on [Github](https://github.com/Clozure/ccl): "For the latest released version of CCL, please see https://github.com/Clozure/ccl/releases/latest and download the archive for your platform. These archives contain not only the necessary binaries, but also a full clone of the source code. So, to install a complete CCL, all you have to do is download one archive and extract it.")
* Rust: [Ketos](https://github.com/murarth/ketos): A functional Lisp.
* [Allegro Common Lisp](https://franz.com/products/allegro-common-lisp/): Commercial implementation with a free (evaluational, not-timeboxed) download.
* [LispWorks](http://www.lispworks.com/documentation/index.html): [Personal Edition](http://www.lispworks.com/downloads/index.html)

### "A Lisp":

* JVM: [Clojure](../clojure): a Lisp on the JVM
* Native: [newLISP](http://www.newlisp.org/): "newLISP is a scripting language designed not to be compiled but to be fully dynamic and introspective. Many of the differences to other LISPs result from this distinction."
* [Ferret](https://ferret-lang.org/): appears to compile [Clojure](/languages/clojure.html) into native code
* [zygomys](https://github.com/glycerine/zygomys): An embedded Lisp for Go. Inspired by Clojure, but more oriented towards imperative programming. Has an infix syntax layer that looks like a subset of Go.
* [L++](https://bitbucket.org/ktg/l/src/master/): a programming language that transcompiles to C++. It uses Lisp-like syntax.
* [ligo](https://github.com/aki237/ligo): scheme like language interpreter in golang
* ["How to Write a Program: Lisp interpreter in 90 lines of C++"](http://howtowriteaprogram.blogspot.com/2010/11/lisp-interpreter-in-90-lines-of-c.html)
* ["I Built a Lisp Compiler"](https://mpov.timmorgan.org/i-built-a-lisp-compiler/)
* ["Make a Lisp"](https://github.com/kanaka/mal): Step-by-step process to make your own lisp in your language of choice.
* [Writing a lisp compiler from scratch, in JavaScript](https://notes.eatonphil.com/compiler-basics-lisp-to-assembly.html), [Part 2](https://notes.eatonphil.com/compiler-basics-functions.html), [Part 3](https://notes.eatonphil.com/compiler-basics-llvm.html), [Part 4](https://notes.eatonphil.com/compiler-basics-llvm-conditionals.html), [Part 5](https://notes.eatonphil.com/compiler-basics-llvm-system-calls.html), [Part 6](https://notes.eatonphil.com/compiler-basics-an-x86-upgrade.html), [Source](https://github.com/eatonphil/ulisp)
* [Llisp](https://stopa.io/post/292): A Lisp in Lisp
* Awk: https://github.com/darius/awklisp
* Swift: https://github.com/uraimo/SwiftyLISP A minimal Lisp implemented in Swift

Standalone Lisp environment: [Lisp in a Box!](https://common-lisp.net/project/lispbox/): "Lispbox is an IDE for Common Lisp development. Actually, Lispbox is just a pre-configured packaging of the Emacs editing environment, SLIME (The Superior Lisp Interaction Mode for Emacs), the Quicklisp library manager, and the Clozure Common Lisp compiler."


### Lisp-inspired:

* [ArkScript](../arkscript): A small functional Lisp-like programming language. Separate bytecode compiler and VM.
* [Arc](../arc): Paul Graham vaporware
* [Carp](../carp): a statically typed lisp, without a GC, for real-time applications.
* [CLiPs](../clips): an expert system rule engine using a Lisp as the language for facts and rules
* [Io](../../io): A prototype-based OO language.
* [Janet](../../janet)
* [JESS](https://jess.sandia.gov/): Java Expert System Shell, a CLIPS-inspired expert system rule engine on the JVM
* [Lux](../lux): A functional, statically-typed Lisp that will run on several platforms, such as the Java Virtual Machine and JavaScript interpreters.

### Reading

* [John McCarthy's Home Page](http://www-formal.stanford.edu/jmc/)
* [Land of Lisp](http://landoflisp.com/)
* [The Lisp Curse](http://winestockwebdesign.com/Essays/Lisp_Curse.html): An attempt to reconcile the power of the Lisp language with the inability of the Lisp community to repduce their pre-AI Winter achievements; the explanation is that the power of Lisp is actually its curse, that those who can hack anything in Lisp often do, but only to the point where it is useful to themselves, and never take that final step to produce something generally useful.
* [Practical Common Lisp (book)](https://gigamonkeys.com/book/)
* ["C++ and Lisp"](https://www.lurklurk.org/cpp_clos.html): "This article investigates these *[C++ and Lisp]* different approaches in a variety of areas, with two intents. Firstly, I find that it is always illuminating to see concepts from an alternative viewpoint, to be reminded that things can be done differently when a different set of constraints apply. Neither is right or wrong, just appropriate in different circumstances."
* ["Embedding Lisp in C++"](https://lambdafaktorie.com/embedding-lisp-in-c-a-recipe/)
* [Language repos for "Artificial Intelligence: A Modern Approach"](https://github.com/aimacode), by Norvig (Java, Lisp, Python, JavaScript, pseudocode)
* [Chris Kohlepp's Blog](https://chriskohlhepp.wordpress.com/): Interesting sections. ["Advanced C++ and Lisp"](https://chriskohlhepp.wordpress.com/advanced-c-lisp/), ["Embeddable Common Lisp on iPhone"](https://chriskohlhepp.wordpress.com/embeddable-common-lisp-on-iphone/), ["Reasoning Systems"](https://chriskohlhepp.wordpress.com/reasoning-systems/), and so on.
* ["How to Write a Lisp Interpreter in JavaScript"](https://chidiwilliams.com/post/how-to-write-a-lisp-interpreter-in-javascript/)

### Libraries(ish)

* [Foil](http://foil.sourceforge.net/): a Foreign Object Interface for Lisp (JVM and CLR integration)

### FFI

- Clasp — Bringing Common Lisp and C++ Together
	- https://github.com/drmeister/clasp

### Deployment

[Running Lisp in production](https://www.grammarly.com/blog/engineering/running-lisp-in-production/)

