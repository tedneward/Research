title=Lisp
tags=jvm, clr, native, language, functional, dynamic, object, metaobject
summary=The original dynamic functional(ish) homoiconic (consistent symbology) language.
~~~~~~

[Scheme](../scheme)s are often spoken synonymously as Lisps.

### Common Lisp Implementations:

* [Common Lisp](https://lisp-lang.org/): A dialect of the Lisp programming language, published in ANSI standard document ANSI INCITS 226-1994. Common Lisp is not an implementation, but rather a language specification. Several implementations of the Common Lisp standard are available, including free and open-source software and proprietary products. Common Lisp is a general-purpose, multi-paradigm programming language. It supports a combination of procedural, functional, and object-oriented programming paradigms.
* [Allegro Common Lisp](https://franz.com/products/allegro-common-lisp/): Commercial implementation with a free (evaluational, not-timeboxed) download.
* [CLISP](https://clisp.sourceforge.io/): a high-level, general-purpose, object-oriented, dynamic, functional programming language.
* [Clozure CL](https://www.clozure.com/ccl): "Clozure CL is available for download from [ccl.clozure.com](http://ccl.clozure.com/)" (Self-hosted compiler, so requires a copy of both the source and bootstrap compilers, which are all available on [Github](https://github.com/Clozure/ccl): "For the latest released version of CCL, please see https://github.com/Clozure/ccl/releases/latest and download the archive for your platform. These archives contain not only the necessary binaries, but also a full clone of the source code. So, to install a complete CCL, all you have to do is download one archive and extract it.")
* [Emacs Lisp](https://www.gnu.org/software/emacs/manua/html_node/eintr/index.html): a Lisp for an editor
* [LispWorks](http://www.lispworks.com/documentation/index.html): [Personal Edition](http://www.lispworks.com/downloads/index.html)
* C: [GCL](https://www.gnu.org/software/gcl/): the official Common Lisp for the GNU project.
* C: [Embeddable Common Lisp](https://common-lisp.net/project/ecl/) ([Source](https://gitlab.com/embeddable-common-lisp/ecl)): Full Common Lisp implementation, available as a shared library `libecl.so` embeddable in any C, C++ or other application.
* C: [Guile](../guile): "Guile mostly implements R6RS."
* C: [s7](https://ccrma.stanford.edu/software/snd/snd/s7.html): Implements a subset of R5RS/R7RS. Descended from TinyScheme.
* C: [TinyScheme](http://tinyscheme.sourceforge.net/): Implements a subset of R5RS.
* C++: [Clasp](https://github.com/drmeister/clasp): Full Common Lisp implementation well integrated with C++, using LLVM for the code generation, to integrate closely with C++ applications or libraries.
* JVM: [Armed Bear Common Lisp](http://abcl.org/) or [here](https://common-lisp.net/project/armedbear/)
* JVM: [Kawa](https://www.gnu.org/software/kawa/): R7RS. Supports the javax.script API.
* Lua: [femtolisp](https://github.com/JeffBezanson/femtolisp): Lua Lisp language
* Native: [Steel Bank Common Lisp](http://www.sbcl.org/) ([Source](http://www.sbcl.org/platform-table.html))
* WASM: [Femto Emacs](https://github.com/FemtoEmacs/wasCm) - translates Low Level Lisp into WebAssembly.
* WASM: [Wisp](https://github.com/mbrock/wisp) - Wisp is a Lisp system for WebAssembly and native execution.


### "A Lisp":

* JVM: [Clojure](/languages/lisp/clojure): a Lisp on the JVM
* Native: [newLISP](http://www.newlisp.org/): "newLISP is a scripting language designed not to be compiled but to be fully dynamic and introspective. Many of the differences to other LISPs result from this distinction."
* [Ferret](https://ferret-lang.org/): appears to compile [Clojure](/languages/clojure) into native code
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
* [Janet](../janet): Functional and imperative programming language and bytecode interpreter.
* [JESS](https://jess.sandia.gov/): Java Expert System Shell, a CLIPS-inspired expert system rule engine on the JVM
* [Emacs Lisp](https://www.gnu.org/software/emacs/manual/html_node/eintr/index.html) - dialect of the Lisp programming language used as a scripting language by Emacs with some later influence from Common Lisp. Created by GNU it supports imperative and functional programming methods.
* [Fennel](../fennel) - Lua Lisp Language.
* [Hime](../../jvm/hime) - A general programming language running on the JVM platform.
* [Liz](../liz) - Lisp-flavored general-purpose programming language (based on Zig).
* [llrl](../llrl) - Lisp-like programming language powered by Rust + LLVM.
* [Lux](../lux): A functional, statically-typed Lisp that will run on several platforms, such as the Java Virtual Machine and JavaScript interpreters.
* [PicoLisp](https://picolisp.com/wiki/) - Simple and lightweight and encourages clean, concise code.
* [Ren](https://github.com/ren-lang/compiler) - Cleaner, clearer JavaScript. Modern scripting language for the Web.
* [Urn](https://urn-lang.com/) - Lisp implementation for Lua. ([Code](https://github.com/SquidDev/urn)) ([Lobsters](https://lobste.rs/s/qzubyo/urn_lisp_implementation_for_lua))

### Reading

* [John McCarthy's Home Page](http://www-formal.stanford.edu/jmc/)
* [Land of Lisp](http://landoflisp.com/)
* [The Lisp Curse](http://winestockwebdesign.com/Essays/Lisp_Curse.html): An attempt to reconcile the power of the Lisp language with the inability of the Lisp community to repduce their pre-AI Winter achievements; the explanation is that the power of Lisp is actually its curse, that those who can hack anything in Lisp often do, but only to the point where it is useful to themselves, and never take that final step to produce something generally useful.
* [Practical Common Lisp (book)](https://gigamonkeys.com/book/)
* [Basic Lisp Techniques](http://franz.com/resources/educational_resources/cooper.book.pdf) - David J. Cooper, Jr. (PDF)
* [Casting Spels in Lisp](http://www.lisperati.com/casting.html)
* [Common Lisp: A Gentle Introduction to Symbolic Computation](http://www.cs.cmu.edu/~dst/LispBook/) - David S. Touretzky (PDF, PS)
* [Common Lisp: An Interactive Approach](http://www.cse.buffalo.edu/~shapiro/Commonlisp/) - Stuart C. Shapiro
* [Common Lisp Quick Reference](http://clqr.boundp.org)
* [Common Lisp the Language, 2nd Edition](http://www.cs.cmu.edu/Groups/AI/html/cltl/mirrors.html)
* [Google's Common Lisp Style Guide](https://google.github.io/styleguide/lispguide.xml)
* [Interpreting LISP](http://www.civilized.com/files/lispbook.pdf) - Gary D. Knott (PDF)
* [Learn Lisp The Hard Way](https://github.com/LispTO/llthw) - Colin J.E. Lupton
* [Let Over Lambda - 50 Years of Lisp](http://letoverlambda.com/index.cl/) - D. Hoyte
* [Lisp for the Web](https://leanpub.com/lispweb) - Adam Tornhill (PDF, EPUB, MOBI) *(Leanpub account or valid email requested)*
* [Lisp Hackers: Interviews with 100x More Productive Programmers](https://leanpub.com/lisphackers/read) - Vsevolod Dyomkin
* [Lisp Koans](https://github.com/google/lisp-koans)
* [Lisp Web Tales](https://leanpub.com/lispwebtales) - Pavel Penev *(Leanpub account or valid email requested)*
* [Loving Common Lisp, or the Savvy Programmer's Secret Weapon](https://leanpub.com/lovinglisp) - Mark Watson (PDF, EPUB, MOBI) *(Leanpub account or valid email requested)*
* [On Lisp](http://www.paulgraham.com/onlisp.html) - P. Graham
* [Paradigms of Artificial Intelligence Programming: Case Studies in Common Lisp](https://github.com/norvig/paip-lisp) - Peter Norvig (PDF, epub, markdown)
* [Practical Common Lisp](http://www.gigamonkeys.com/book/) - P. Seibel
* [The Common Lisp Cookbook](https://lispcookbook.github.io/cl-cookbook/)
* [The Evolution of Lisp](http://www.dreamsongs.com/Files/HOPL2-Uncut.pdf) - Guy L. Steele Jr., Richard P. Gabriel (PDF)
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

### [Awesome-lisp-languages](https://github.com/dundalek/awesome-lisp-languages)

## Classification

- **Type-A**: Simple syntax mapping  
*These languages usually just provide s-expressions (parentheses) syntax and are translated to the target language without extra features/semantics. Also sometimes being called transpilers.*

- **Type-B**: Syntax and additional semantics  
*In addition to translating the syntax some additional features/semantics that are not present in the target language are added. Usually if a language does not fit in other category, it can be considered being a Type-B.*

- **Type-C**: [Clojure](https://clojure.org/)-like  
*Distintive syntax that besides parentheses also uses brackets and curly braces. Distinctive features are persistent data structures, namespaces and vars, protocols.*

- **Type-L**: [Common Lisp](https://en.wikipedia.org/wiki/Common_Lisp)  
*Implementing ANSI Common Lisp standard or being inspired by it.*

- **Type-S**: [Scheme](https://en.wikipedia.org/wiki/Scheme_%28programming_language%29)  
*Implementing some of RxRS standards or being inspired by Scheme.*

## Languages

Listed primarily by the language which can be used for interoperability / [FFI](https://en.wikipedia.org/wiki/Foreign_function_interface).

*Language section does not necessarily mean the language of the implementation. For example `Ferret` compiles into `C++` but the compiler is written in `Clojure`. Or `Carp` interops with `C` but it is mostly written in `Haskell`. In case of `SBCL` it contains only small amounts of `C`, but it is implemented almost entirely in `Common Lisp`.*

### Multi Lang

- [Bigloo](https://www-sop.inria.fr/mimosa/fp/Bigloo/) [Type-S] compiles into native binaries, interop with C, JVM, .NET
- [Lux](https://github.com/LuxLang/lux) [Type-B] functional, statically-typed Lisp that will run on several platforms
- [Mal](https://github.com/kanaka/mal) is an educational lisp with implementations in dozens of languages. It is a great resource for learning about lisp implementation.
- [Ribbit](https://github.com/udem-dlteam/ribbit) [Type-S] small and portable Scheme implementation (R4RS, 4 KB footprint), AOT and incremental compilers, targets C, JavaScript, Python and Scheme
- [STELLA](https://www.isi.edu/isd/LOOM/Stella/index.html) - strongly typed, object-oriented, compiles down to Common Lisp, C++, or Java
- [Shen](https://shen-language.github.io/) [Type-B] implementations in many programming languages, builtin pattern-matching and logic programming, optional static typing and lazy evaluation
- [Wax](https://github.com/LingDong-/wax) [Type-A] tiny programming language, strongly statically typed, manual memory management, transpiles to C, C++, Java, TypeScript, Python, C#, Swift, Lua and WebAssembly
- [Zick Standard Lisp](https://github.com/zick/ZickStandardLisp) minimal lisp with 42 implementations

### Common Lisp
- [SBCL](http://www.sbcl.org) [Type-L] high performance native code compiler, native threading support, type inference engine
- [CLISP](https://clisp.sourceforge.io/) [Type-L] uses bytecode compiler, easily portable
- [Clozure CL](https://ccl.clozure.com/) [Type-L] fast compilation speed, native threads, precise generational compacting garbage collector, convenient foreign-function interface
- [Clasp](https://github.com/clasp-developers/clasp) [Type-L] compiled using LLVM, seamless integration with existing libraries
- [ECL](https://common-lisp.net/project/ecl/) [Type-L] embeddable and portable, can build standalone executables
- [Coalton](https://github.com/coalton-lang/coalton) [Type-L] efficient, statically typed functional programming language that supercharges Common Lisp
- See list of [additional implementations](https://www.cliki.net/Common+Lisp+implementation).

### Scheme
- [Chez Scheme](https://www.scheme.com/) [Type-S] compiles to native binaries, among the fastest available Scheme implementations, R6RS
- [Chicken Scheme](https://www.call-cc.org/) [Type-S] produces portable and efficient C, supports R5RS and R7RS (work in progress)
- [Guile](https://www.gnu.org/software/guile/) [Type-S] embedable, useful for extending programs with scripting
- [Racket](https://racket-lang.org/) [Type-S] large standard library, powerful macro system, includes DrRacket IDE
- [Cyclone](https://justinethier.github.io/cyclone/) [Type-S] Scheme-to-C compiler, R7RS, native threading support, generates fast native binaries
- [Microscheme](https://ryansuchocki.github.io/microscheme/) [Type-S] Scheme subset for microcontrollers (like Arduino boards)
- [Loko Scheme](https://gitlab.com/weinholt/loko) [Type-S] runs on bare hardware
- See list of [additional implementations](http://community.schemewiki.org/?scheme-faq-standards#implementations) and [benchmarks](https://ecraven.github.io/r7rs-benchmarks/).

### C/C++

- [C-Mera](https://github.com/kiselgra/c-mera) [Type-A] also includes extensions to generate code to run on CUDA, GLSL
- [Cakelisp](https://github.com/makuto/cakelisp) [Type-A] performance-oriented, good for game development, compiles down to C/C++, macros and compile-time code modification
- [Carp](https://github.com/carp-lang/Carp) [Type-B] statically typed, no GC (Rust-like borrow checking)
- [Dale](https://github.com/tomhrr/dale) [Type-B] Lisp-flavoured C with additional features, no GC, LLVM backend
- [Extempore](https://github.com/digego/extempore) [Type-S] designed for live coding and music performances, temporal scheduling based on audio card sample rate
- [FemtoLisp](https://github.com/JeffBezanson/femtolisp) [Type-S] scheme-like lisp, powers the compiler of the Julia language
- [Ferret](https://ferret-lang.org/) [Type-C] aimed towards embedded systems
- [Janet](https://janet-lang.org/) [Type-B] embedable, large standard library, GC
- [Jank](https://jank-lang.org/) [Type-C] LLVM-hosted, Clojure-compatible, type-analysis, JIT
- [jo_clojure](https://github.com/Zelex/jo_clojure) [Type-C] Fast Embeddable Clojure in C/C++, including persistent datastructures and STM
- [Lcc](https://github.com/saman-pasha/lcc) [Type-A] Lisp-like syntax for writing C
- [Liz](https://github.com/dundalek/liz) [Type-A] written as EDN, compiles to Zig, customizable memory allocators, native binaries for many architectures
- [Maru](https://www.piumarta.com/software/maru/) [Type-B] minimal self-hosting lisp, multimethods, user-defined types and structures, GC
- [PicoLisp](https://picolisp.com) [Type-B] compiled to bytecode and interpreted, C and Java interop, built-in  database and GUI
- [Owl Lisp](https://gitlab.com/owl-lisp/owl) [Type-S] dialect of the Scheme, code can be interpreted or compiled into C files
- [Toccata](https://github.com/Toccata-Lang/toccata) [Type-C] Clojure-inspired, gradually typed, no nil values, reference counting, compiles into native binaries

### C#

- [Clojure CLR](https://github.com/clojure/clojure-clr) [Type-C] great for game development with arcadia and unity
- [RainLisp](https://github.com/chr1st0scli/RainLisp) [Type-B] inspired by Scheme, interpreted, can be used as DSL integrating with .NET

### Erlang

- [Clojerl](https://github.com/clojerl/clojerl) [Type-C]
- [Lisp Flavored Erlang](http://lfe.io/) [Type-A]

### Fortran

- [fscheme](https://genepi.qimr.edu.au/Staff/davidD/Scheme/SIOM.html) [Type-S] small scheme interpreter written in Fortran 95
- [Schemetran](https://gitlab.com/codetk/schemetran) [Type-A] Expressing Fortran computations in Scheme, compiles to readable Fortran code

### Go

- [Joker](https://joker-lang.org/) [Type-C] interpreter, linter, great for scripting, Go interop is very limited
- [Slick](https://github.com/pcostanza/slick) [Type-L]  Lisp/Scheme-style s-expression surface syntax for the Go programming language
- [Zygo](https://github.com/glycerine/zygomys) [Type-B] embedable, call into native Go using reflection, optional infix syntax
- [ZYLISP](https://github.com/zylisp/zylisp) [Type-A] simple Lisp that compiles to Go (source or bytecode)

### Java

- [ABCL](https://common-lisp.net/project/armedbear/) [Type-L] CL interpreter and compiler, embedable using Java scripting API (JSR-223)
- [Armed Bear Clojure](https://github.com/lsevero/abclj) [Type-C+L] Common Lisp embedded in Clojure via ABCL
- [Clojure](https://clojure.org/) [Type-C]
- [Kawa](https://www.gnu.org/software/kawa/) [Type-S] scheme implementation (R7RS)
- [PicoLisp](https://picolisp.com) [Type-B] compiled to bytecode and interpreted, C and Java interop, built-in  database and GUI
- [Venice](https://github.com/jlangch/venice) [Type-C] Clojure-inspired, sandboxed, Java interop, 800+ builtin functions 

### JavaScript

- [BiwaScheme](https://www.biwascheme.org/) [Type-S] compact Scheme written in JavaScript, integrates well with web browsers and Node
- [ClojureScript](https://clojurescript.org/) [Type-C]
- [eslisp](https://github.com/anko/eslisp) [Type-A] S-expression syntax for ECMAScript/JavaScript, Lisp-like macros
- [JACL](https://tailrecursion.com/JACL/) [Type-L]  extended subset of Common Lisp, async reader and REPL development workflow
- [JSLisp](https://www.jslisp.org) ([source](https://github.com/6502/JSLisp)) [Type-L] Lisp-2, similar to Common Lisp, includes GUI library and IDE
- [LIPS](https://lips.js.org) [Type-S] similar to BiwaScheme, has better notation to call JS functions
- [Lumen](https://github.com/sctb/lumen) [Type-A] self-hosted Lisp for Lua and JavaScript, uses arrays as first-class datastructures
- [Parenscript](https://common-lisp.net/project/parenscript/) [Type-L] Common Lisp to JavaScript translator, native JS types, native calling convention
- [RacketScript](https://github.com/racketscript/racketscript) [Type-S] Racket to JavaScript compiler, interop with both Racket and JS ecosystem
- [Valtan](https://github.com/cxxxr/valtan) [Type-L] Common Lisp to JavaScript compiler
- [Whalesong](https://www.hashcollision.org/whalesong/) [Type-S] Racket to JavaScript compiler
- [Wisp](https://github.com/Gozala/wisp) [Type-C] Clojure-like, has protocols, no persistent data structures

### Julia
- [LispSyntax.jl](https://github.com/swadey/LispSyntax.jl) [Type-A] Clojure-like lisp syntax to Julia translator with convenience macros, uses Julia's compiler and JIT

### Lua

- [Fennel](https://fennel-lang.org/) [Type-A] full Lua compatibility, embedable, compiled code with no runtime dependency
- [Lumen](https://github.com/sctb/lumen) [Type-A] self-hosted Lisp for Lua and JavaScript, uses arrays as first-class datastructures
- [Urn](https://urn-lang.com/) [?] focus on minimalism, should work with LuaJIT, influenced by Common Lisp and Clojure

### Objective-C

- [DreamLisp](https://github.com/jsloop42/dreamlisp) [Type-B] Clojure-inspired, originally based on MAL, added modules, lazy collections
- [nu](https://github.com/programming-nu/nu) [?] interpreted

### OCaml

- [Reason-Lisp](https://github.com/jaredly/myntax) [Type-A] very incomplete

### PHP

- [Phel](https://phel-lang.org/) [Type-C] Phel is a functional programming language that compiles to PHP.

### Python

- [Hy](https://github.com/hylang/hy) [Type-A] compiles to Python AST, use Python ML libraries, runs on PyPy
- [Hissp](https://github.com/gilch/hissp) [Type-A] compiles to a functional subset of Python, macro metaprogramming with Python ecosystem
- [Pixie](https://github.com/pixie-lang/pixie) [Type-B] Clojure inspired, written in RPython, custom GC and JIT
- [Basilisp](https://github.com/basilisp-lang/basilisp) [Type-C] Clojure-compatible, targeting Python3.6+

### R

- [llr](https://github.com/dirkschumacher/llr) [Type-C] Clojure inspired, in R compiles and interops with R

### Rust

- [BLisp](https://ytakano.github.io/blisp/) [Type-B] statically typed scripting language, type inference, algebraic data types, generics
- [GameLisp](https://gamelisp.rs) [Type-B] scripting language for Rust game development, interpreted, pattern‑matching, coroutines, macros
- [Ketos](https://github.com/murarth/ketos) [Type-B] scripting and extension language for Rust programs, compiled to bytecode
- [Rustly](https://github.com/timothypratley/rustly) [Type-C] transpiler, only small subset of Clojure supported

### Shell

- [Gherkin](https://github.com/alandipert/gherkin) [Type-B] (dormant) implemented in Bash, shell interop
- [Fleck](https://github.com/chr15m/flk/) [Type-A] Clojure-like, based on [Mal](https://github.com/kanaka/mal/), packaged as single-file Bash script

### VHDL

- [Vhdl Lisp](https://github.com/domus123/vhdlisp) - alternative s-expression based notation to describe programmable integrated circuits (FPGAs)

### WASM

- [Arboreta WASM](https://github.com/Arboreta/arboreta-wasm) [?] Common Lisp tooling for WebAssembly
- [clj-wasm](https://github.com/roman01la/clj-wasm) [Type-A] Clojure-flavored WASM's text format
- [Liz](https://github.com/dundalek/liz) [Type-A] general purpose programming language, supports WASM compilation target
- [Schism](https://github.com/schism-lang/schism) [Type-S] self-hosting compiler from a subset of R6RS Scheme to WebAssembly
- [WebAssembly Scheme](https://github.com/PollRobots/scheme) [Type-S] partial implementation of R7RS scheme, written using WebAssembly Text format

## Misc

- [Bel](http://paulgraham.com/bel.html) - self-hosted lisp dialect, see also markdown formatted [mirror](https://github.com/alephyud/bel)
  - [Bel Clojure](https://github.com/stopachka/bel-clojure) - implementation in Clojure, includes continuations, Java numbers and strings, read [blog post](https://stopa.io/post/290)
  - [Language::Bel](https://github.com/masak/bel) - implementation of Bel in Perl 5, includes extensive test suite
  - [Chime](https://github.com/jeremyschlatter/chime/) - implementation of Bel written in Haskell
  - [Babybel](https://github.com/cookrn/babybel) - Ruby implementation of Bel
  - [Bel-sml](https://github.com/niyarin/bel-sml) - implementation written in Standard ML
- [uLisp](http://www.ulisp.com/) - Lisp for microcontrollers, fits into 2 Kbytes of RAM
- [CLJSL](https://github.com/IGJoshua/cljsl) - subset of Clojure compiled to GLSL for GPU programming
- A list of more [Clojure-like languages](https://github.com/chr15m/awesome-clojure-likes).
- Additional "write C in Lisp" [projects](https://www.reddit.com/r/lisp/comments/e10spm/a_list_of_various_lispflavored_programming/f8n6qxa/) (most of them not ready for a prime time).
- [Build your own lisp](http://www.buildyourownlisp.com/) - a book describing building a Lisp dialect
- See also list of languages  [implemented in Lisp](https://github.com/vindarel/list-of-languages-implemented-in-lisp).
- [Map of Common Lisp implementations](https://twitter.com/dk_jackdaniel/status/698157022483771392/photo/1)
- [Benchmarks of Scheme implementations](https://ecraven.github.io/r7rs-benchmarks/) 
