title=Lisp
tags=jvm, clr, native, language, functional, dynamic, object, metaobject
summary=The original dynamic functional(ish) homoiconic (consistent symbology) language.
~~~~~~

[Scheme](../scheme)s are often spoken synonymously as Lisps.

### Common Lisp Implementations:

* C: [Embeddable Common Lisp](https://gitlab.com/embeddable-common-lisp/ecl): Full Common Lisp implementation, available as a shared library `libecl.so` embeddable in any C, C++ or other application.
* C: [Guile](https://www.gnu.org/software/guile/): 	"Guile mostly implements R6RS."
* C: [s7](https://ccrma.stanford.edu/software/snd/snd/s7.html): Implements a subset of R5RS/R7RS. Descended from TinyScheme.
* C: [TinyScheme](http://tinyscheme.sourceforge.net/): Implements a subset of R5RS.
* C++: [Clasp](https://github.com/drmeister/clasp): Full Common Lisp implementation well integrated with C++, using LLVM for the code generation, to integrate closely with C++ applications or libraries.
* JVM: [Armed Bear Common Lisp](http://abcl.org/)
* JVM: [Kawa](https://www.gnu.org/software/kawa/): R7RS. Supports the javax.script API.
* Native: [Steel Bank Common Lisp](http://www.sbcl.org/) ([Source](http://www.sbcl.org/platform-table.html))
* [Clozure CL](https://www.clozure.com/ccl): "Clozure CL is available for download from [ccl.clozure.com](http://ccl.clozure.com/)" (Self-hosted compiler, so requires a copy of both the source and bootstrap compilers, which are all available on [Github](https://github.com/Clozure/ccl): "For the latest released version of CCL, please see https://github.com/Clozure/ccl/releases/latest and download the archive for your platform. These archives contain not only the necessary binaries, but also a full clone of the source code. So, to install a complete CCL, all you have to do is download one archive and extract it.")
* [Allegro Common Lisp](https://franz.com/products/allegro-common-lisp/): Commercial implementation with a free (evaluational, not-timeboxed) download.
* Rust: [Ketos](https://github.com/murarth/ketos): A functional Lisp.

### "A Lisp":

* [Ferret](https://ferret-lang.org/): appears to compile [Clojure](/languages/clojure.html) into native code
* [Clojure](../clojure): a Lisp on the JVM
* [zygomys](https://github.com/glycerine/zygomys): An embedded Lisp for Go. Inspired by Clojure, but more oriented towards imperative programming. Has an infix syntax layer that looks like a subset of Go.

Standalone Lisp environment: [Lisp in a Box!](https://common-lisp.net/project/lispbox/): "Lispbox is an IDE for Common Lisp development. Actually, Lispbox is just a pre-configured packaging of the Emacs editing environment, SLIME (The Superior Lisp Interaction Mode for Emacs), the Quicklisp library manager, and the Clozure Common Lisp compiler."


### Lisp-inspired:

* [ArkScript](../arkscript): A small functional Lisp-like programming language. Separate bytecode compiler and VM.
* [Arc](../arc)
* [Carp](../carp)
* [CLiPs](../clips): an expert system rule engine using a Lisp as the language for facts and rules
* [Io](../../io): A prototype-based OO language.
* [Janet](../../janet)
* [JESS](https://jess.sandia.gov/): Java Expert System Shell, a CLIPS-inspired expert system rule engine on the JVM

### Reading

* [The Lisp Curse](http://winestockwebdesign.com/Essays/Lisp_Curse.html): An attempt to reconcile the power of the Lisp language with the inability of the Lisp community to repduce their pre-AI Winter achievements; the explanation is that the power of Lisp is actually its curse, that those who can hack anything in Lisp often do, but only to the point where it is useful to themselves, and never take that final step to produce something generally useful.

