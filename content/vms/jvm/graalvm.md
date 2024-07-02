title=GraalVM
tags=vm, jvm, python, nodejs, wasm
summary=Polyglot VM from Oracle with support for a number of languages/platforms.
~~~~~~

[Website](https://www.graalvm.org/) | [Source](https://github.com/oracle/graal) | [Docs](http://www.graalvm.org/docs/)

> "GraalVM is a high-performance JDK distribution designed to accelerate the execution of applications written in Java and other JVM languages along with support for JavaScript, Ruby, Python, and a number of other popular languages. GraalVM’s polyglot capabilities make it possible to mix multiple programming languages in a single application while eliminating foreign language call costs."

---

## Notes
Notes on Graal and Truffle

### Introductory Material

- Add Graal JIT Compilation to Your JVM Language in 5 Steps, A Tutorial
  http://stefan-marr.de/2015/11/add-graal-jit-compilation-to-your-jvm-language-in-5-easy-steps-step-1/

- The SimpleLanguage, an example of using Truffle with great JavaDocs; official getting-started project:
  https://github.com/graalvm/simplelanguage
  
- Truffle Tutorial, Christan Wimmer, PLDI 2016, 3h recording
  https://youtu.be/FJY96_6Y3a4 [Slides](https://lafo.ssw.uni-linz.ac.at/pub/papers/2016_PLDI_Truffle.pdf)

- Truffle Tutorial, Nicolas Laurent
  https://norswap.com/truffle-tutorial/

- Series of blog posts on implementing a Lisp
  http://cesquivias.github.io/

- Truffle Tutorials, Presentations, Publications
  https://github.com/graalvm/graal/blob/master/docs/Publications.md

- Graal VM and Graal.JS on the Oracle Technology Network
  http://www.oracle.com/technetwork/oracle-labs/program-languages/overview/index-2301583.html

- Papers on Truffle
  http://ssw.jku.at/Research/Projects/JVM/Truffle.html

- Papers on Graal
  http://ssw.jku.at/Research/Projects/JVM/Graal.html


### Language Implementations

#### Maintained
- FastR, an R implementation: https://github.com/graalvm/fastr
- TruffleRuby: https://github.com/graalvm/truffleruby
- SOM Smalltalk: https://github.com/SOM-st/TruffleSOM
- SOMns, a Newspeak: https://github.com/smarr/SOMns
- SimpleLanguage: https://github.com/graalvm/simplelanguage
- Graal.JS, a JavaScript implementation: http://www.oracle.com/technetwork/oracle-labs/program-languages/overview/index-2301583.html,  https://github.com/graalvm/graaljs/
- GraalPython, a Python 3 implementation: https://github.com/graalvm/graalpython/
- Sulong, a LLVM IR implementation on top of the JVM https://github.com/graalvm/sulong
- RegexLanguage, a JavaScript-flavored regex language https://github.com/oracle/graal/blob/master/regex/src/com.oracle.truffle.regex/src/com/oracle/truffle/regex/RegexLanguage.java#L38

#### Status Unknown
- ZipPy, a Python 3: https://github.com/securesystemslab/zippy

#### Experiments
- TruffleSqueak, Squeak interpreter on top of Truffle https://github.com/timfel/trufflesqueak

- TruffleC, a C on top of the JVM: http://dl.acm.org/citation.cfm?id=2647528

- Mumbler: A Lisp
  https://github.com/cesquivias/mumbler & http://cesquivias.github.io/

- Lua
  https://github.com/lucasallan/LuaTruffle  &  http://www.luatruffle.org/
  
- Hex 
  https://bitbucket.org/hexafraction/truffles & https://hextruffle.wordpress.com/

- Golo (a minimal Truffle backend)
  https://github.com/smarr/golo-lang/tree/truffle

- TruffleMATE, a Smalltalk with a completely reified runtime system
  https://github.com/charig/TruffleMATE

- PureScript
  https://github.com/slamdata/truffled-purescript

- Mozart-Graal: An implementation of the Oz language
  https://github.com/eregon/mozart-graal

- DynSem: A Language Specification-Language, as a meta-interpreter in Truffle
  https://github.com/metaborg/dynsem

- Cover: A Safe Subset of C++
  https://github.com/gerard-/cover

- TrufflePascal
  https://github.com/Aspect26/TrufflePascal/

- Reactive Ruby: Truffle Ruby meets Reactive Programming
  https://github.com/guidosalva/ReactiveRubyTruffle
  
- PorcE: An Orc implementation on top of Truffle
  https://github.com/orc-lang/orc/tree/master/PorcE
 
- shen-truffle
  https://github.com/ragnard/shen-truffle

- NQP - Not Quite Perl (6)
  https://github.com/perl6/nqp/tree/truffle

- Go
  https://github.com/PDZaninov/GoLang-Compiler

### Key Papers

- The Truffle paper: “Self-Optimizing AST Interpreters”
  http://lafo.ssw.uni-linz.ac.at/papers/2012_DLS_SelfOptimizingASTInterpreters.pdf

- How to represent Objects Efficiently: “An Object Storage Model for the Truffle Language Implementation Framework”
  http://chrisseaton.com/rubytruffle/pppj14-om/pppj14-om.pdf

- The Truffle+Graal paper: "One VM to Rule Them All"
  http://lafo.ssw.uni-linz.ac.at/papers/2013_Onward_OneVMToRuleThemAll.pdf
 
- The Partical Evaluation paper: "Practical partial evaluation for high-performance dynamic language runtimes"  
  accessible via: https://chrisseaton.com/rubytruffle/pldi17-truffle/pldi17-truffle.pdf
  
### Other Related Papers

 - One Compiler: Deoptimization to Optimized Code (work on SubstrateVM, AOT compilation of Truffle code)
   http://doi.org/10.1145/3033019.3033025