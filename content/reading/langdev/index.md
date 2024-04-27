title=Language Development
tags=reading, langdev
summary=A collection of links and articles on building programming languages.
~~~~~~

## Reading

* [Build Your Own Programming Language](https://github.com/PacktPublishing/Build-Your-Own-Programming-Language) (source)
* [Crafting Interpreters](http://craftinginterpreters.com/) by Bob Nystrom ([Github](https://github.com/munificent/craftinginterpreters))

    * ["My Experience Crafting an Interpreter with Rust"](https://ceronman.com/2021/07/22/my-experience-crafting-an-interpreter-with-rust/)
    
* [Let's Build a Simple Interpreter](https://ruslanspivak.com/lsbasi-part1/): Up to 19 parts up through 2020.
* [A Retargetable C Compiler](./a-retargetable-c-compiler-design-and-implementation.pdf); makes use of literate programming (/languages/noweb)
* [LLVM Tutorial: Kaleidoscope](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/index.html)
* [TinyML: A tiny functional language interpreter](https://d3s.mff.cuni.cz/files/teaching/nprg077/02-tinyml.pdf) (Tomas Petricek)
* [CS6120: Advanced Compilers: The Self-Guided Online Course](https://www.cs.cornell.edu/courses/cs6120/2020fa/self-guided/): The work consists of reading papers and open-source hacking tasks, which use LLVM and an educational IR invented just for this class.
* [Dynamic Language Embedding](https://scg.unibe.ch/archive/phd/renggli-phd.pdf)
* [X-expressions in XMLisp: S-expressions and Extensible Markup Language Unite](https://home.cs.colorado.edu/~ralex/papers/PDF/X-expressions.pdf): "XMLisp unites S-expressions with XML into X-expressions that unify the notions of data sharing with computation. Using a combination of the Meta Object Protocol (MOP), readers and printers, X-expressions uniquely integrate XML at a language, not API level, into Lisp in a way that could not be done with other programming languages."
* [Principles of Programming Languages course](https://bguppl.github.io/interpreters/): [Source](https://github.com/bguppl/interpreters)
* [Generic Abstract Syntax Tree (geast)](https://angeljavalopez.medium.com/geast-a-generic-abstract-syntax-tree-c7feb681b6b5)
* ["GAST"](./GAST_A_generic_AST_representation_for_language-ind.pdf) (PDF)
* [Practical Foundations for Programming Languages](./practical-foundations.pdf) (PDF)
* ["A Generic Abstract Syntax Model for Embedded Languages"](https://www.cs.tufts.edu/~nr/cs257/archive/emil-axelsson/paper.pdf): "Representing a syntax tree using a data type often involves having many similar-looking constructors. Functions operating on such types often end up having many similar-looking cases. Different languages often make use of similar-looking constructions. We propose a generic model of abstract syntax trees capable of representing a wide range of typed languages. Syntactic constructs can be composed in a modular fashion enabling reuse of abstract syntax and syntactic processing within and across languages. Building on previous methods of encoding extensible data types in Haskell, our model is a pragmatic solution to Wadler’s “expression problem". Its practicality has been confirmed by its use in the implementation of the embedded language Feldspar."
* [Sudolang: A powerful programming language for LLMs](https://medium.com/javascript-scene/sudolang-a-powerful-pseudocode-programming-language-for-llms-d64d42aa719b)

## DSLs

[BuildIt](https://buildit.so/): A framework for rapidly developing high-performance Domain Specific Languages (DSLs) with little to no compiler knowledge. [Source](https://github.com/BuildIt-lang/buildit/)

[gel: Generic Extensible Language](https://www.cs.utexas.edu/~wcook/Drafts/2008/gel.pdf) (PDF)

> One of the things I like about this paper is that it points out that Lisp and XML are essentially the same creature: Lisp: `(if (< x 3) (print x))` == XML: `<if><test op="lt"><var name="x"/><const>3</const></test><then><call fun="print"><arg>x</arg></call></then></if>` I kinda love that.

[coAST](https://github.com/coala/coAST): coAST is a universal abstract syntax tree that allows to easily analyze each programming language. Especially adding new languages should be easy and generic. (Last update Dec 2018)

[MLIR: Creating a Toy Language and AST](https://mlir.llvm.org/docs/Tutorials/Toy/Ch-1/)

[Creating a DSL Step by Step, Part 1](https://www.youtube.com/watch?v=3sfMSHyjMHk)

[Create a programming language that the whole company can understand](https://www.youtube.com/watch?app=desktop&v=G2TxT0muOis)

[Creating a Ruby DSL: A Guide to Advanced Metaprogramming](https://www.toptal.com/ruby/ruby-dsl-metaprogramming-guide)

[Towards Dynamically Extensible Syntax](https://homepages.cwi.nl/~storm/publications/jh.pdf): introduces CherryLisp -- a Lisp dialect with dynamically user-definable syntax that suffers from neither of [drawbacks listed in the abstract].

## Articles/Papers

["Three Things I Wish I Knew When I Started Designing Languages"](https://www.youtube.com/watch?v=oa0qq75i9oc)

["The Naked Truth About Writing a Programming Language"](https://www.digitalmars.com/articles/b90.html)

["How Big Should a Programming Language Be?"](https://tratt.net/laurie/blog/2023/how_big_should_a_programming_language_be.html): "... a long-held opinion I have about programming language design: we have a tendency to keep adding features to a language until it becomes so big that its sheer size makes it difficult to use reliably." *Yes!*

[Open, extensible object models](https://piumarta.com/software/cola/objmodel2.pdf): "The artificial distinction between implementation language and end-user language can be eliminated by implementing the language using only end-user objects and messages, making the implementation accessible for arbitrary modification by programmers. We show that three object types and five methods are sufficient to bootstrap an extensible object model and messaging semantics that are described entirely in terms of those same objects and messages."

[Intrinsically-Typed Definitional Interpreters for Linear, Session-Typed Languages](https://eelcovisser.org/publications/2020/RouvoetPKV20.pdf)

[Interview with Jesper Louis Andsersen](https://medium.com/@unbalancedparen/interview-with-jesper-louis-andersen-about-erlang-haskell-ocaml-go-idris-the-jvm-software-and-b0de06440fbd#.g4q9w4eqq) about a ton of languages.

["Less is more: language features"](http://blog.ploeh.dk/2015/04/13/less-is-more-language-features/)

["Languages I want to write"](https://blog.wesleyac.com/posts/language-todos)

["A wish list for a new programming language"](http://www.drmaciver.com/2015/07/a-wish-list/)

[A Generic Framework for Automated QA of Software Models](https://thesai.org/Downloads/Volume5No1/Paper_5-A_Generic_Framework_for_Automated_Quality_Assurance_of_Software_Models.pdf): references the OMG's Generic AST Model (GASTM) which I think is related to Abstract Syntax Tree Metamodeling (ASTM), [here](https://www.omg.org/spec/ASTM/1.0/About-ASTM) ([PDF](https://www.omg.org/spec/ASTM/1.0/PDF)) This kinda looks like the generic AST I was futzing about with.

[The Super Tiny Compiler](https://github.com/jamiebuilds/the-super-tiny-compiler) (JS)

[Program Analysis](https://gist.github.com/MattPD/00573ee14bf85ccac6bed3c0678ddbef)

[Nanopass](https://legacy.cs.indiana.edu/~dyb/pubs/nano-jfp.pdf): A framework for compiler education | [Source](https://github.com/nanopass/) in Racket or Scheme

[Language Incubator](https://github.com/EarlGray/language-incubator): Repo of language experiments/explorations; "An incubator/sandbox for learning compilers, interpreters, code generation, virtual machines, assemblers, JITs, etc."

[Principles of Programming Languages (course)](https://bguppl.github.io/interpreters/practice_sessions/ps4.html) ([Source](https://github.com/bguppl/interpreters))

[Flattening ASTs (and Other Compiler Data Structures)](https://www.cs.cornell.edu/~asampson/blog/flattening.html)

---

## Native/raw
[AsmInterpreter](https://github.com/yekyam/AsmInterpreter): A simple assembly interpreter to help people with understanding the language without the hassle of setup.

[Build your own Lisp](http://www.buildyourownlisp.com/contents) teaches C by building a Lisp.

[luax](https://github.com/morrow1nd/luax): Lua-like programming language for studying compiler and interpreter courses.

[Square](https://github.com/square-lang/Square): A tiny programming language under 200kb.

[mal](https://github.com/kanaka/mal) (Make A Lisp): Steps (and collection of implementations) to make your own Lisp.

[Writer your own C compiler from scratch with Python](https://medium.com/@pasi_pyrro/how-to-write-your-own-c-compiler-from-scratch-with-python-90ab84ffe071)

---

## LLVM
[Writing your own toy language](https://gnuu.org/2009/09/18/writing-your-own-toy-compiler/) using flex, bison, LLVM; [code](https://github.com/lsegal/my_toy_compiler)

[Implementing a JIT Compiled Language with Haskell and LLVM](https://www.stephendiehl.com/llvm/)

[A Tutorial on How to Write a Compiler Using LLVM](https://tomassetti.me/a-tutorial-on-how-to-write-a-compiler-using-llvm/)

---

## CLR
[How to Design Worlds (PDF)](https://world.cs.brown.edu/1/htdw-v1.pdf)

[learn-programming-languages](https://github.com/jeanqasaur/learn-programming-languages): Resources for the working programmer to learn more about the fundamentals and theory of programming languages. (Jean Yang)

[Concatenative Thinking (wiki)](https://concatenative.org/wiki/view/Front%20Page): We are interested in both theoretical results and practical programming advice, especially as it pertains to any Concatenative language. We want to bring together disparate language communities and build a common knowledge repository that people can consult to learn more about this family of languages.

Video - [Creating a domain specific language for .NET Application](https://www.youtube.com/watch?app=desktop&v=64x29FGaoK4)

Presentation - [Write your own domain specific language with F#](https://www.youtube.com/watch?app=desktop&v=NoGyFQ99NgY)

Kaleidoscope: [Implementing a language with LLVM in CSharp](https://ice1000.org/llvm-cs/en/CSharpLangImpl01/): "By the end of the tutorial, we’ll have written a bit less than 1000 lines of non-comment, non-blank, lines of code. With this small amount of code, we’ll have built up a very reasonable compiler for a non-trivial language including a hand-written lexer, parser, AST, as well as code generation support with a JIT compiler. While other systems may have interesting “hello world" tutorials, I think the breadth of this tutorial is a great testament to the strengths of LLVM and why you should consider it if you’re interested in language or compiler design."

---

## JVM

[write_your_own_dynamic_language_runtime](https://github.com/forax/write_your_dynamic_language_runtime): How to write interpreters or dynamic compilers for dynamically typed languages on top of the JVM. This repository provides the basis to implement your own

* Abstract Syntax Tree Interpreter
* Stack based Interpreter
* Java Virtual Machine based Interpreter

of a dynamically typed language named smalljs which is almost a subset of JavaScript.

[joeq: A Virtual Machine and Compiler Infrastructure](https://joeq.sourceforge.net/) ([PDF](https://suif.stanford.edu/~jwhaley/papers/ivme03.pdf)) ([Source](https://sourceforge.net/projects/joeq/)): entirely implemented in JavaTM, leading to greater reliability, portability, maintainability, and efficiency. It is also language-independent, so code from any supported language can be seamlessly compiled, linked, and executed --- all dynamically!

[Scripting and Dynamic Interaction in Java](http://alumni.media.mit.edu/~mt/skij/dynjava/dynjava.html)

[Video: Nashorn: implementing a dynamic language runtime on JVM](https://www.youtube.com/watch?v=KKaHkkpdHxg) (Attila Szegedi)

---

## Python

- https://github.com/menezesd/epic-lang: interpreter for Python-like programming language with braces

- https://github.com/jonpry/Pill: Pill is an open source interpreter for the Cadence Skill language. Its purpose is to run PCell generator codes used in VLSI. Pill is written in Python and compiles the source into Python bytecode where it is then executed alongside regular python functions at similar speed to "native" python codes. *(This is an intriguing idea, and one that deserves some further exploration--if I can go from source to Py bytecode, we skip much of the parsing and get a startup speed benefit.)*

- [(How to Write a (Lisp) Interpreter (in Python))](http://norvig.com/lispy.html): Norvig builds a simple Scheme in simple Python

- [ast](https://docs.python.org/3/library/ast.html): The Python official documentation of the `ast` module that ships as part of Python. "The ast module helps Python applications to process trees of the Python abstract syntax grammar. The abstract syntax itself might change with each Python release; this module helps to find out programmatically what the current grammar looks like. An abstract syntax tree can be generated by passing ast.PyCF_ONLY_AST as a flag to the compile() built-in function, or using the parse() helper provided in this module. The result will be a tree of objects whose classes all inherit from ast.AST. An abstract syntax tree can be compiled into a Python code object using the built-in compile() function."

- [CPython Internals](https://devguide.python.org/internals/exploring/)

- [Green Tree Snakes: The Missing Python AST docs](https://greentreesnakes.readthedocs.io/en/latest/index.html). Points out a few projects using the Python AST:

    - [pytest](https://docs.pytest.org/) (uses the AST to produce useful assertion error messages)
    - [astsearch](https://astsearch.readthedocs.io/) (search the semantics, not the syntax)
    - [astpath](https://github.com/hchasestevens/astpath) (XPath over an AST)
    - [bellybutton](https://github.com/hchasestevens/bellybutton) readily customised linter

- [Code Transformer](https://github.com/danielzuegner/code-transformer): "The CodeTransformer is a Transformer based architecture that jointly learns from source code (Context) and parsed abstract syntax trees (AST; Structure). It does so by linking source code tokens to AST nodes and using pairwise distances (e.g., Shortest Paths, PPR) between the nodes to represent the AST. This combined representation is processed in the model by adding the contributions of each distance type to the raw self-attention score between two input tokens (See the paper for more details)."

- https://github.com/maxmalysh/tiny-py-interpreter: Python interpreter written in Python; uses ANTLR4

- https://github.com/jszheng/py3antlr4book: Covert ANTLR4 book source code to Python3 version.

---

## Rust

[Create Your Own Programming Language with Rust](https://createlang.rs/intro.html): Incomplete but interesting first steps

---

## Learning/AI-related

- https://openreview.net/pdf?id=Xh5eMZVONGF : LANGUAGE-AGNOSTIC REPRESENTATION LEARNING
OF SOURCE CODE FROM STRUCTURE AND CONTEXT

---

## Toy/experimental

- [jtc](https://github.com/progschj/jtc): A toy programming language interpreter that has no dependencies and sits in a single C++ file. C++11 capable compilers should compile it without extra options other than enabling C++11.

- [Maverick](https://github.com/willianscsilva/interpreter)

- [Eval](https://github.com/tevelee/Eval): a lightweight interpreter framework written in Swift, evaluating expressions at runtime.

- [Pointless](https://ptls.dev/) ([Source](https://github.com/pointless-lang/pointless)): a scripting language for learning and fun.

- Imp:

    - [IMP](https://github.com/jayconrod/imp-interpreter): A minimal interpreter for the toy language, IMP, used as an example for building interpreters.

    - https://github.com/nandor/utcn-imp: Imp Language and Interpreter

- [Kaleidoscope](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/LangImpl01.html): the classic from the LLVM website

- [Dwarf](https://github.com/nicolasdilley/dwarf-interpreter): A very small scripting language written in Elixir.

- [Bhai](https://github.com/DulLabs/bhai-lang): A toy programming language written in Typescript

- https://github.com/hisystems/Interpreter: Simple language interpreter written in pure C#.

- https://github.com/airtrack/luna: A toy interpreter of lua-like language

- https://github.com/sam-astro/Z-Sharp: Custom programming interpreter for ZSharp (Z#), a language I made up.

- https://github.com/proglangclass/interpreter: Language built during the Programming Language Masterclass.

- https://github.com/JohnEarnest/ok: An open-source interpreter for the K5 programming language.

- https://github.com/drmenguin/minilang-interpreter: Interpreter and Read-Eval-Print-Loop for a simple programming language called "MiniLang", written in C++

- https://github.com/bbu/simple-interpreter: A hackable and extensible lexer, parser and interpreter for a minimalistic, imperative, C-like language.

- https://github.com/oriontransfer/PL0-Language-Tools: An implementation of PL/0 including a tree-based interpreter and virtual machine. http://programming.dojo.net.nz/study/pl0-language-tools/index

- https://github.com/jamesdhutton/Interpreter: Interpreter for a simple language

- https://github.com/hijkzzz/mini-interpreter: A simple scripting language (supports anonymous functions and clases)

- https://github.com/mattgreen/hython: Haskell-powered Python 3 interpreter

- https://github.com/yangtau/hedgehog: a toy programming language

- https://github.com/totalspectrum/tinyscript

- https://github.com/progschj/jtc: A toy programming language interpreter in a single C++ file

### Monkey
This is the language described by the book ["Writing an Interpreter in Go"](https://interpreterbook.com/). Also has a paired book, ["Writing a Compiler in Go"](https://compilerbook.com/) which appears to include the creation of a virtual machine for executing the compiled code.

* [C++](https://github.com/zhuzilin/monkey)
* [C++](https://github.com/yhirose/monkey-cpp)
* [C++](https://github.com/Imymirror/mirror-monkey)
* [Haskell](https://github.com/hatashiro/monkey-hs)
* [Rust](https://github.com/Rydgel/monkey-rust)
* [Rust](https://github.com/wadackel/rs-monkey-lang)
* [Source](https://github.com/haifenghuang/monkey) (archived)
* [Gadget](https://github.com/vkandola/go-go-gadget): The 'Gadget' interpreter language, implemented in Go, using the Writing An Interpreter In Go book. This language is based off the Monkey interpreter language described in the book, and will be implemented as I progress through the book.
* Rust: https://github.com/JoshMcguigan/monkey
* Rust: https://github.com/shuhei/cymbal
* Rust: https://github.com/hatashiro/monkey-rs

### Lox
From ["Crafting Interpreters"](http://www.craftinginterpreters.com/):

* C++: [CppLox](https://github.com/the-lambda-way/CppLox)
* Rust: [rlox](https://github.com/cwbriones/rlox)
* Swift: [slox](https://github.com/alexito4/slox)

### Esolangs

- https://github.com/nickdesaulniers/bf_interpreter_jit_compiler: Teach myself about interpreters, JITs, and compilers using the Brainfuck language as the toy language -- https://nickdesaulniers.github.io/blog/2015/05/25/interpreter-compiler-jit/

---

From https://github.com/imteekay/programming-language-research:

## Courses

- [301 - Organization of Programming Languages](https://www.youtube.com/watch?v=j2pYeKjq_60&list=PLB1enDd0fV0i5SWGe-A1YjmD8MmlGavIj&ab_channel=JayMcCarthy)
- [Benjamin Pierce - Software foundations](https://www.youtube.com/playlist?list=PLGCr8P_YncjUT7gXUVJWSoefQ40gTOz89)
- [CIS352 - Principles of Programming Languages](https://www.youtube.com/watch?v=2jrwXpUZW7k&list=PLXaqTeMx01E_eK1ZEpKvKL5KwSaj7cJW9&ab_channel=KristopherMicinski)
- [CMSC 430: Design and Implementation of Programming Languages](https://www.youtube.com/watch?v=KTWq1XAfuMQ&list=PLsg0tbEwZlcz0Xzv1rACy7xcQZiBcQ_iE&ab_channel=cmsc430)
- [CS 3520/6520 - Programming Languages](https://www.youtube.com/@matthewflatt489/playlists)
- [CS3110 - Functional Data Structures](https://www.youtube.com/watch?v=MUcka_SvhLw&list=PLre5AT9JnKShBOPeuiD9b-I4XROIJhkIU&ab_channel=MichaelRyanClarkson)
- [CS3MI3 - Principles of Programming Languages](https://www.youtube.com/playlist?list=PLF7ZhwvkczzM3tTaJTVYIcsGsX8uyIeXA)
- [CS520 - Theories Of Programming Languages](https://www.youtube.com/playlist?list=PLvV9DPeJV9xx0NegrG4gNu8WXSXibDICu)
- [CSE340 - Principles of Programming Languages](https://www.youtube.com/playlist?list=PLK06XT3hFPzilgF1mi_hHqcXO1-o_8OEe)
- [LINFO1131 - Advanced programming language concepts](https://www.youtube.com/playlist?list=PLw454N-VXALROTZ_phkQ-D4QDU5w3x4R8)
- [Accelerated 1](https://course.ccs.neu.edu/cs2500accelf17/index.html)
- [All the courses Matthias Felleisen teach](https://felleisen.org/matthias/teaching.html)
- [Building a Parser from scratch](https://dmitrysoshnikov.teachable.com/p/parser-from-scratch)
- [CMSC330 - Organization of Programming Languages](https://www.cs.umd.edu/class/spring2022/cmsc330/#schedule)
- [CMU - CS6120 - Advanced Compilers](https://www.cs.cornell.edu/courses/cs6120/2022sp/lesson)
- [Compilers — Stanford](https://online.stanford.edu/courses/soe-ycscs1-compilers)
- [Compilers Design Recipe](https://soft.vub.ac.be/compilers/book_sec_recipe.html)
- [Compilers: Theory and Practice — Udacity](https://www.udacity.com/course/compilers-theory-and-practice--ud168)
- [Concepts in Programming Languages](https://www.cl.cam.ac.uk/teaching/1617/ConceptsPL/materials.html)
- [COP 4020 - Programming Languages I](https://www.cs.ucf.edu/~leavens/COP4020/resources.shtml)
- [COS 326 - Functional Programming](https://mediacentral.princeton.edu/channel/COS+326+Functional+Programming/174748251)
- [CS 242: Programming Languages, Fall 2019](https://stanford-cs242.github.io/f19)
- [CS019 - Accelerated Introduction to Computer Science](https://cs.brown.edu/courses/cs019/2018/index.html)
- [CS164 Programming Languages and Compilers](https://www.bilibili.com/video/BV1NW411b79N?p=1)
- [CS242 - Programming Languages - Stanford](https://web.stanford.edu/class/cs242/coursework.html)
- [CS2500 - Fundamentals of Computer Science](https://www.ccs.neu.edu/home/nderbinsky/fundies1/m1.html)
- [CIS 341 - Compilers](https://www.seas.upenn.edu/~cis3410/20sp/)
- [CSCI1730 - Programming Languages - Application and Interpretation](https://cs.brown.edu/courses/cs173/2012/Videos)
- [CSE 131 - Compiler Construction](https://podcast.ucsd.edu/watch/SP17/cse131_sp17/23)
- [CSE230 - Principles/Programming Languages](https://podcast.ucsd.edu/watch/fa18/cse230_b00/24)
- [Essentials of Programming Languages](http://proglang.informatik.uni-freiburg.de/teaching/proglang/2020ws)
- [Fundamentals 1](https://course.ccs.neu.edu/cs2500f16/index.html)
- [Fundamentals 2](https://course.ccs.neu.edu/cs2510)
- [Hack Your Own Language](https://felleisen.org/matthias/4620-s18/index.html)
- [History of Programming Languages](https://felleisen.org/matthias/7480-s17/index.html)
- [Indiana University Compiler Course](https://iu.mediaspace.kaltura.com/media/Compiler+Course/1_hwlujpzd)
- [Introduction to Compiler Construction](https://www.students.cs.ubc.ca/~cs-411/2020w2/index.html)
- [Jay McCarthy - 406 Compiler Construction](https://youtu.be/4tUj8BuC0qM)
- [Matthias Felleisen - Intensive Principles of Programming Languages](https://felleisen.org/matthias/7400-s14/Problem_Sets.html)
- [Matthias Felleisen - Principles of Programming Languages](https://felleisen.org/matthias/4400-s20/lectures.html)
- [Principles of Compiler Design](https://www.bilibili.com/video/BV1qt41167uU?p=1)
- [Programming Language Foundations in Agda](https://cs.uwaterloo.ca/~plragde/747/notes/index.html)
- [Programming Languages and Logic](https://www.cs.cornell.edu/courses/cs4110/2021fa)
- [Programming Languages Course given by DCC-UFMG](https://hanielb.github.io/2021.2-lp)
- [Programming Languages Ⅰ](https://www.coursera.org/learn/programming-languages-1)
- [Programming Languages Ⅱ](https://www.coursera.org/learn/programming-languages2)
- [Ray Total Courses](https://cs.lmu.edu/~ray)
- [Theory of Programming Languages](http://staff.ustc.edu.cn/~yuzhang/tpl/2020s/index.html#reading)

## Books

- [Compiler Construction](https://c9x.me/compile/bib/wirthcc.pdf)
- [Compiler Design](https://www.goodreads.com/book/show/5205564-compiler-design-mar-15-2006-chattopadhyay-santanu)
- [Compiling with Continuations](https://www.goodreads.com/book/show/2079575.Compiling_with_Continuations)
- [Concepts of Programming Languages](https://www.goodreads.com/book/show/603257.Concepts_of_Programming_Languages)
- [Discrete Mathematics for Computing](https://www.amazon.com/gp/product/0230216110/ref=sw_img_1?smid=ATVPDKIKX0DER&psc=1)
- [Engineering a Compiler](https://www.amazon.com/Engineering-Compiler-Keith-D-Cooper/dp/0128154128/ref=sr_1_1?keywords=Engineering+a+Compiler&qid=1675768541&s=books&sr=1-1)
- [Homotopy Type Theory](https://www.goodreads.com/book/show/18106978-homotopy-type-theory)
- [How to Design Programs: An Introduction to Programming and Computing](https://www.goodreads.com/book/show/1119079.How_to_Design_Programs)
- [HTDP](https://htdp.org/2020-8-1/Book/index.html)
- [Human-Centered Programming Languages](https://bookish.press/hcpl)
- [Introduction to Compilers and Language Design](https://www3.nd.edu/~dthain/compilerbook/compilerbook.pdf)
- [Modern Compiler Design](https://www.amazon.com/Modern-Compiler-Design-Dick-Grune/dp/1461446988/ref=sr_1_1?crid=7JFBNCBOHIW9&keywords=Modern+Compiler+Design&qid=1675768609&s=books&sprefix=modern+compiler+design%2Cstripbooks-intl-ship%2C228&sr=1-1)
- [Modern Compiler Implementation in C](https://www.amazon.com/Modern-Compiler-Implementation-Andrew-Appel/dp/0521607655)
- [Parsing Techniques: A Practical Guide](https://www.goodreads.com/en/book/show/1756599)
- [Parsing Techniques. A Practical Guide](https://www.amazon.com/Parsing-Techniques-Practical-Monographs-Computer-ebook/dp/B0017AMLL8/ref=sr_1_1?crid=1W94M9OYZ6MH8&keywords=Parsing+Techniques.+A+Practical+Guide&qid=1675768574&s=books&sprefix=parsing+techniques.+a+practical+guide%2Cstripbooks-intl-ship%2C211&sr=1-1)
- [Practical Foundations for Programming Languages](https://www.amazon.com/Practical-Foundations-Programming-Languages-Professor/dp/1107029570)
- [Programming Languages: Application and Interpretation](https://www.goodreads.com/book/show/10580126-programming-languages)
- [SICP — Structure and Interpretation of Computer](./research/books/sicp)
- [The Elements Of Computing Systems](https://www.amazon.com/Elements-Computing-Systems-second-Principles/dp/0262539802/ref=sr_1_1?crid=2CZ8FBOMQ0X7C&keywords=The+Elements+Of+Computing+Systems&qid=1675768639&s=books&sprefix=the+elements+of+computing+systems%2Cstripbooks-intl-ship%2C463&sr=1-1)
- [Thinking with Types: Type-Level Programming in Haskell](https://leanpub.com/thinking-with-types)
- [Type Theory and Formal Proof: An Introduction](https://www.goodreads.com/book/show/21442441-type-theory-and-formal-proof)
- [Type Theory and Functional Programming](https://www.goodreads.com/book/show/11364683-type-theory-and-functional-programming)

## Learning Paths

- [Advanced Programming Languages](http://di002.edv.uniovi.es/~labra/APL.html)
- [Compiler Engineer Path](http://dmitrysoshnikov.com/courses/compiler-engineer-path)
- [Learn Type Theory](https://github.com/jozefg/learn-tt)
- [PLR & Compiler Learning Path](learning-path.md)
- [Programming Language Theory Path](https://steshaw.org/plt)
- [So You Want to Be a (Compiler) Wizard](https://belkadan.com/blog/2016/05/So-You-Want-To-Be-A-Compiler-Wizard)

## Experiments

- [A miniature model of the Typescript compiler](https://github.com/imteekay/mini-typescript)
- [An interpreter for the Lox programming language](./research/experiments/lox.ts)
- [An interpreter for the Monkey programming language](https://github.com/imteekay/crafting-an-interpreter)
- [How the TypeScript compiler works](https://www.iamtk.co/series/the-typescript-compiler)

### Papers

- [10 papers that all PhD students in programming languages ought to know](https://github.com/nuprl/10PL)
- [A syntactic approach to type soundness](https://web.eecs.umich.edu/~weimerw/2008-615/reading/wright92syntactic.pdf)
- [A Theory of Type Polymorphism in Programming](https://homepages.inf.ed.ac.uk/wadler/papers/papers-we-love/milner-type-polymorphism.pdf)
- [Abstracting Gradual Typing](https://www.cs.ubc.ca/~rxg/agt.pdf)
- [An Axiomatic Basis for Computer Programming](http://sunnyday.mit.edu/16.355/Hoare-CACM-69.pdf)
- [Call-by-name, call-by-value, and the λ-calculus](https://www.sciencedirect.com/science/article/pii/0304397575900171?ref=pdf_download&fr=RR-2&rr=795ba8dc2acd4edd)
- [Classic Papers in Programming Languages and Logic](https://www.cs.cmu.edu/~crary/819-f09)
- [Efficient Gradual Typing](https://arxiv.org/pdf/1802.06375.pdf)
- [Fundamental concepts in programming languages](https://www.math.pku.edu.cn/teachers/qiuzy/plan/lits/FundamentalConceptOfPL.pdf)
- [Gradual Type Theory](https://arxiv.org/pdf/1811.02440.pdf)
- [Gradual Typing for Functional Languages](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=b7ca4b0e6d3119aa341af73964dbe38d341061dd)
- [Gradual Typing: A New Perspective](https://www.irif.fr/~gc/papers/popl19.pdf)
- [How Statically-Typed Functional Programmers Write Code](./research/papers/how-statically-typed-functional-programmers-write-code)
- [Migrating Gradual Types](https://dl.acm.org/doi/pdf/10.1145/3158103)
- [On Model Subtyping](https://hal.inria.fr/hal-00695034/document)
- [On Understanding Types, Data Abstraction, and Polymorphism](http://lucacardelli.name/Papers/OnUnderstanding.A4.pdf)
- [Papers on programming languages: ideas from 70's for today](https://medium.com/@mikhail.barash.mikbar/papers-on-programming-languages-ideas-from-70s-for-today-2931891d4dbd)
- [Papers to read](https://github.com/haskellcamargo/papers-to-read)
- [Pluggable Type Systems](https://bracha.org/pluggableTypesPosition.pdf)
- [Programming in Homotopy Type Theory](http://dlicata.web.wesleyan.edu/pubs/lh122tttalks/lh12wg2.8.pdf)
- [Refined Criteria for Gradual Typing](https://drops.dagstuhl.de/opus/volltexte/2015/5031/pdf/21.pdf)
- [Static Typing Where Possible, Dynamic Typing When Needed: The End of the Cold War Between Programming Languages](https://www.ics.uci.edu/~lopes/teaching/inf212W12/readings/rdl04meijer.pdf)
- [The Behavior of Gradual Types: A User Study](https://cs.brown.edu/~sk/Publications/Papers/Published/tgpk-beh-grad-types-user-study/paper.pdf)
- [The Design Principles of the Elixir Type System](https://arxiv.org/pdf/2306.06391.pdf)
- [The Next 700 Programming Languages](https://www.cs.cmu.edu/~crary/819-f09/Landin66.pdf)
- [Towards a theory of type structure](https://www.cis.upenn.edu/~stevez/cis670/pdfs/Reynolds74.pdf)
- [Towards Practical Gradual Typing](https://www2.ccs.neu.edu/racket/pubs/ecoop2015-takikawa-et-al.pdf)
- [Type Inference Algorithms](http://www.win.tue.nl/~hzantema/semssm.pdf)
- [Type Inference for Records in a Natural Extension of ML](https://www.cs.cmu.edu/~aldrich/courses/819/row.pdf)
- [Type Systems for Object-Oriented Programming Languages](http://i.stanford.edu/pub/cstr/reports/cs/tr/98/1602/CS-TR-98-1602.pdf)
- [Type Systems](http://lucacardelli.name/papers/typesystems.pdf)
- [What every compiler writer should know about programmers](https://www.complang.tuwien.ac.at/kps2015/proceedings/KPS_2015_submission_29.pdf)
- [Why Dependent Types Matter](http://www.cs.nott.ac.uk/~psztxa/publ/ydtm.pdf)

## Programming Language Design / PLT

- [A Language Creators' Conversation: Guido van Rossum, James Gosling, Larry Wall & Anders Hejlsberg](https://www.youtube.com/watch?v=csL8DLXGNlU&ab_channel=PyCascades)
- [A Tale of Two Asyncs: Open Source Language Design in Rust and Node.js](https://www.youtube.com/watch?v=aGJTXdXQN2o)
- [Another Go at Language Design](https://www.youtube.com/watch?v=7VcArS4Wpqk)
- [Bjarne Stroustrup : C++: evolving a useful language](https://www.youtube.com/watch?v=6jwOoIywnZE&ab_channel=BrownCS)
- [Concepts of Programming Languages](https://www.youtube.com/playlist?list=PLgybIyDbLkEQUTX00Mazlcb7KhX1UzpXs)
- [CS520 Theories of Programming Languages — KAIST](https://www.youtube.com/playlist?list=PLvV9DPeJV9xx0NegrG4gNu8WXSXibDICu)
- [Delimited Continuations, Demystified by Alexis King](https://www.youtube.com/watch?v=TE48LsgVlIU&ab_channel=CodeSync)
- [Going beyond JavaScript](https://www.youtube.com/watch?v=VwisE497Nsg&ab_channel=Intelligence.ai%3AConcepts-FirstPodcast)
- [Growing a Language, by Guy Steele](https://www.youtube.com/watch?v=_ahvzDzKdB0)
- [How Rust does OSS](https://www.youtube.com/watch?v=m0rakUuPXFM)
- [JavaScript Static Analysis for Evolving Language Specifications](https://www.youtube.com/watch?v=3Jlu_jnHB8g&ab_channel=PLRGKAIST)
- [Linguistics and Compilers](https://www.youtube.com/watch?v=Ix6M9Nj_Dug&ab_channel=FunctionalSC)
- [On understanding types, data abstraction and effects](https://www.youtube.com/watch?v=3Cdw5x72k_g&ab_channel=MicrosoftResearch)
- [Principles of Programming Languages by Robert M. Siegfried](https://www.youtube.com/playlist?list=PLTo1TmBz2ekof8VsYaoTxP-9VgJ9P-dTO)
- [Principles of Programming Languages](https://www.youtube.com/playlist?list=PLK06XT3hFPzilgF1mi_hHqcXO1-o_8OEe)
- [Rob Pike - What We Got Right, What We Got Wrong](https://www.youtube.com/watch?v=yE5Tpp2BSGw)
- [So many programming languages so little time](https://www.youtube.com/watch?v=FEjH5VxmDoY&ab_channel=MicrosoftDeveloper)
- [Stephanie Weirich speaks about Programming Language Design](https://www.youtube.com/watch?v=gLTDyrAY4Hk)
- [The Economics of Programming Languages](https://www.youtube.com/watch?v=XZ3w_jec1v8&ab_channel=StrangeLoopConference)
- [The Mess We're In](https://www.youtube.com/watch?v=lKXe3HUG2l4)
- [The Next Programming Language - Douglas Crockford](https://www.youtube.com/watch?v=R2idkNdKqpQ&ab_channel=code%3A%3Adiveconference)
- [What's Next for Our Programming Languages](https://www.youtube.com/watch?v=q3XcQh0cNZM&ab_channel=InfoQ)
- [Why Programming Languages Matter](https://www.youtube.com/watch?v=JqYCt9rTG8g&ab_channel=StrangeLoopConference)
- [Programming language semantics: It’s easy as 1,2,3](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC2C046CF94382B3B408036B84475DC7/S0956796823000072a.pdf/programming-language-semantics-its-easy-as-123.pdf)
- [Programming Language Semantics](http://www.cs.nott.ac.uk/~pszgmh/123.pdf)
- [A Frontend Programmer's Guide to Languages](https://thatjdanisso.cool/programming-languages)
- [Building a Debugger: Code Analysis](https://nan.fyi/debugger)
- [Concepts of Programming Languages](https://www.ime.usp.br/~alvaroma/ucsp/proglang/book.pdf)
- [Grammars for programming languages](https://medium.com/@mikhail.barash.mikbar/grammars-for-programming-languages-fae3a72a22c6)
- [How To Create Your Own Programming Language](https://dev.to/jasonsbarr/how-to-create-your-own-programming-language-2642)
- [Language-oriented software engineering](https://parametri.city/blog/2018-12-23-language-oriented-software-engineering/index.html)
- [Let’s Build a Programming Language](https://medium.com/hackernoon/lets-build-a-programming-language-2612349105c6)
- [Minimalism in Programming Language Design](https://pointersgonewild.com/2022/05/23/minimalism-in-programming-language-design)
- [Panel: The Future of Programming Languages](https://learn.microsoft.com/en-us/events/pdc-pdc08/tl57)
- [Principles of Programming Languages](https://www.cs.toronto.edu/~david/course-notes/csc324.pdf)
- [Programming and Programming Languages](https://papl.cs.brown.edu/2018/index.html)
- [Programming Language and Compilers Reading List](https://www.jntrnr.com/programming-language-and-compilers-reading-list)
- [Programming Language Foundations in Agda](https://plfa.github.io/beta)
- [Programming language theory and practice in ReScript](https://bobzhang.github.io/rescript-pl-course)
- [Shriram Krishnamurthi and Joe Gibbs Politz - Programming Languages: Application and Interpretation](http://papl.cs.brown.edu/2015)
- [The Programming Language Enthusiast](http://www.pl-enthusiast.net)
- [The Study of Programming Languages](https://cs.lmu.edu/~ray/notes/plstudy)
- [Why Study Programming Languages](https://rachit.pl/post/why-study-programming-languages)

## Compiler

- [Anders Hejlsberg on Modern Compiler Construction](https://www.youtube.com/watch?v=wSdV1M7n4gQ)
- [Building a parser in C#, from first principles](https://www.youtube.com/watch?v=klHyc9HQnNQ&ab_channel=NDCConferences)
- [Compiler Design course](https://www.youtube.com/playlist?list=PLDAE55AEE0731D729&feature=plcp)
- [How To Build A Programming Language From Scratch](https://www.youtube.com/watch?v=8VB5TY1sIRo&list=PL_2VhOvlMk4UHGqYCLWc6GO8FaPl8fQTh&ab_channel=tylerlaceby)
- [How would compilers change in the next 10 years?](https://www.youtube.com/watch?v=p15qRHZ_Leg&ab_channel=CompilerConstruction)
- [Implementing a bignum calculator](https://www.youtube.com/watch?v=PXoG0WX0r_E)
- [JavaScript ∩ WebAssembly](https://www.youtube.com/watch?v=PP5r_b3Ws8s&ab_channel=ReactEurope)
- [JavaScript implementation in SpiderMonkey](https://www.youtube.com/playlist?list=PLo3w8EB99pqJVPhmYbYdInBvAGarDavh-)
- [KAIST CS420: Compiler Design](https://www.youtube.com/playlist?list=PL5aMzERQ_OZ8RWqn-XiZLXm1IJuaQbXp0)
- [Lexical Scanning in Go](https://www.youtube.com/watch?v=HxaD_trXwRE)
- [Mozilla Hacks Compiler Compiler](https://www.youtube.com/playlist?list=PLo3w8EB99pqKF1FQllRsxyQh3sA7V2Hc-)
- [Quick look at the TypeScript Compiler API](https://www.youtube.com/watch?v=AnjfW633e8o%E2%80%8E.%E2%80%8Edev)
- [Rethinking compiler technology in a heterogeneous world](https://www.youtube.com/watch?v=6Ncnx0bT4lk&ab_channel=HiPEACTV)
- [The business of selling compilers](https://www.youtube.com/watch?v=JRyv2oyWIbA&ab_channel=HiPEACTV)
- [Typescript Compiler explained by the Author Anders Hejlsberg](https://www.youtube.com/watch?v=f6TCB61fDwY)
- [Understanding compiler optimization](https://www.youtube.com/watch?v=haQ2cijhvhE)
- [A miniature model of the Typescript compiler](https://github.com/sandersn/mini-typescript)
- [Alias analysis](https://en.wikipedia.org/wiki/Alias_analysis)
- [An Incremental Approach to Compiler Construction](http://scheme2006.cs.uchicago.edu/11-ghuloum.pdf)
- [An Introduction to Interpreters and JIT Compilation](https://stefan-marr.de/2023/09/pliss-summer-school)
- [An Introduction to Interpreters and JIT Compilation](https://stefan-marr.de/2023/09/pliss-summer-school)
- [AST (Abstract Syntax Tree)](https://medium.com/@dinis.cruz/ast-abstract-syntax-tree-538aa146c53b)
- [Bob Nystrom - Expression Parsing Made Easy](http://journal.stuffwithstuff.com/2011/03/19/pratt-parsers-expression-parsing-made-easy)
- [Building a Parser from scratch](https://www.dmitrysoshnikov.education/p/parser-from-scratch)
- [Compilers and Interpreters](https://medium.com/hackernoon/compilers-and-interpreters-3e354a2e41cf)
- [Compilers Resources](https://glyphack.com/blog/compiler-resources)
- [Compilers: Nuts and bolts of Programming Languages](https://pgrandinetti.github.io/compilers)
- [Compiling Scheme to C with closure conversion](https://matt.might.net/articles/compiling-scheme-to-c)
- [Compiling to Java](https://matt.might.net/articles/compiling-to-java)
- [Compiling to lambda-calculus](https://matt.might.net/articles/compiling-up-to-lambda-calculus)
- [Douglas Crockford - Top Down Operator Precedence](http://javascript.crockford.com/tdop/tdop.html)
- [Dr. Dobbs - Bob: A Tiny Object-Oriented Language](http://www.drdobbs.com/open-source/bob-a-tiny-object-oriented-language/184409401)
- [Flattening ASTs (and Other Compiler Data Structures)](https://www.cs.cornell.edu/~asampson/blog/flattening.html)
- [Fredrik Lundh - Simple Town-Down Parsing In Python](https://11l-lang.org/archive/simple-top-down-parsing)
- [Garbage Collection Algorithms](https://www.dmitrysoshnikov.education/p/essentials-of-garbage-collectors)
- [How to implement a programming language in JavaScript](http://lisperator.net/pltut)
- [IU Compiler Course](https://iucompilercourse.github.io/IU-P423-P523-E313-E513-Fall-2020)
- [Jack W. Crenshaw - Let’s Build a Compiler!](http://compilers.iecc.com/crenshaw/tutorfinal.pdf)
- [Language grammar](https://stackoverflow.com/a/4726662/11314146)
- [Lessons from Writing a Compiler](https://borretti.me/article/lessons-writing-compiler)
- [Let's build a compiler](https://generalproblem.net)
- [Let's make a Teeny Tiny compiler, part 1](https://austinhenley.com/blog/teenytinycompiler1.html)
- [Let's make a Teeny Tiny compiler, part 2](https://austinhenley.com/blog/teenytinycompiler2.html)
- [Let's make a Teeny Tiny compiler, part 3](https://austinhenley.com/blog/teenytinycompiler3.html)
- [Lexical Analysis](https://medium.com/hackernoon/lexical-analysis-861b8bfe4cb0)
- [Lexing in JS style](https://areknawo.com/the-lexer-in-js)
- [Make a Lisp](https://github.com/kanaka/mal)
- [Nick Desaulniers - Interpreter, Compiler, JIT](https://nickdesaulniers.github.io/blog/2015/05/25/interpreter-compiler-jit)
- [Parsing Algorithms](https://www.dmitrysoshnikov.education/p/essentials-of-parsing)
- [Pursuit of Performance on Building a JavaScript Compiler](https://rustmagazine.org/issue-3/javascript-compiler)
- [Resources for Amateur Compiler Writers](https://c9x.me/compile/bib)
- [Scheme from Scratch - Introduction](http://peter.michaux.ca/articles/scheme-from-scratch-introduction)
- [TypeScript Compiler Notes](https://github.com/microsoft/TypeScript-Compiler-Notes)
- [Understanding GC in JSC From Scratch](https://webkit.org/blog/12967/understanding-gc-in-jsc-from-scratch)
- [Which Interpreters are Faster, AST or Bytecode?](https://stefan-marr.de/2023/10/ast-vs-bytecode-interpreters)
- [Write you a Haskell](http://dev.stephendiehl.com/fun)

## PL Paradigms

- [Compiling with Continuations or without? Whatever](https://www.youtube.com/watch?v=cPBr59ECiRU&ab_channel=ACMSIGPLAN)
- [Continuation-passing style in JavaScript](https://matt.might.net/articles/by-example-continuation-passing-style)
- [Continuation-passing style](https://en.wikipedia.org/wiki/Continuation-passing_style)

## Interpreter

- [Cheaply writing a fast interpreter](https://www.youtube.com/watch?v=V8dnIw3amLA&ab_channel=PerformanceSummit)
- [Building an Interpreter from scratch](https://www.dmitrysoshnikov.education/p/essentials-of-interpretation)
- [Crafting an Interpreter](https://github.com/imteekay/crafting-an-interpreter)
- [(How to Write a (Lisp) Interpreter (in Python))](http://norvig.com/lispy.html)
- [A Python Interpreter Written in Python](http://aosabook.org/en/500L/a-python-interpreter-written-in-python.html)
- [Building an Interpreter](https://www.iamtk.co/series/building-an-interpreter)
- [Crafting Interpreters](http://craftinginterpreters.com/contents.html)
- [How languages work #1: String interpolation](https://martin.janiczek.cz/2023/07/27/how-languages-work-1-string-interpolation.html)
- [Implementing a Simple Compiler on 25 Lines of JavaScript](https://blog.mgechev.com/2017/09/16/developing-simple-interpreter-transpiler-compiler-tutorial)
- [Let’s Build A Simple Interpreter](https://ruslanspivak.com/lsbasi-part1)
- [Little lisp interpreter](https://maryrosecook.com/blog/post/little-lisp-interpreter)
- [Little Lisp interpreter](https://www.recurse.com/blog/21-little-lisp-interpreter)
- [Pratt Parsers: Expression Parsing Made Easy](http://journal.stuffwithstuff.com/2011/03/19/pratt-parsers-expression-parsing-made-easy)
- [What do people mean when they say “transpiler”?](https://decomposition.al/blog/2017/07/30/what-do-people-mean-when-they-say-transpiler)

## PL Research

- [Increasing the Impact of PL Research](http://www.pl-enthusiast.net/2020/07/29/increasing-the-impact-of-pl-research)
- [What is PL research and how is it useful?](http://www.pl-enthusiast.net/2015/05/27/what-is-pl-research-and-how-is-it-useful)

## Type System

- ["Hindley-Milner Type Inference — Part 1](https://www.youtube.com/watch?v=cQf_6NsLp80&ab_channel=AdamDoup%C3%A9)
- ["Hindley-Milner Type Inference — Part 2](https://www.youtube.com/watch?v=xJXcZp2vgLs&list=PLK06XT3hFPzilgF1mi_hHqcXO1-o_8OEe&index=37&ab_channel=AdamDoup%C3%A9)
- ["Propositions as Types" by Philip Wadler](https://www.youtube.com/watch?v=IOiZatlZtGU)
- [A Taste of Type Theory](https://www.youtube.com/watch?v=--2jJwdQ5js)
- [A Type System From Scratch](https://www.youtube.com/watch?v=IbjoA5xVUq0)
- [Bringing Types to Elixir by Giuseppe Castagna and Guillaume Duboc](https://www.youtube.com/watch?v=gJJH7a2J9O8&ab_channel=CodeSync)
- [Discrete Math — Dr. Trefor Bazett](https://www.youtube.com/playlist?list=PLHXZ9OQGMqxersk8fUxiUMSIx0DBqsKZS)
- [Gradual Type Theory](https://www.youtube.com/watch?v=EGKeWg2ES0A&ab_channel=POPL2019)
- [Gradual Typing: A New Perspective](https://www.youtube.com/watch?v=JuwHDskX7Qg&ab_channel=POPL2019)
- [How to Evaluate the Performance of Gradual Type Systems](https://www.youtube.com/watch?v=7d6iJdSRFtQ&ab_channel=CambridgeUniversityPress)
- [Let's build a typesystem in Haskell!](https://www.youtube.com/watch?v=aZFWY6DxX54)
- [The Hindley-Milner Type System](https://www.youtube.com/watch?v=OyrByPkiX7s&ab_channel=NicolasLaurent)
- [Thinking with Types](https://www.youtube.com/playlist?list=PLE-CSy3N6yEeYY5tx1u5IP3d_2xZOmpKO)
- [Type Systems - The Good, Bad and Ugly](https://www.youtube.com/watch?v=SWTWkYbcWU0&t=2s&ab_channel=StrangeLoopConference)
- [Type-safe embedded domain-specific languages 1/4](https://www.youtube.com/watch?v=4sTeT7poU3g)
- [Type-safe embedded domain-specific languages 2/4](https://www.youtube.com/watch?v=OM_riJgZF8A)
- [Type-safe embedded domain-specific languages 3/4](https://www.youtube.com/watch?v=gFJTKJgL2zI)
- [Type-safe embedded domain-specific languages 4/4](https://www.youtube.com/watch?v=isAu8YuI6SA)
- [Types and Programming Languages Book club](https://www.youtube.com/playlist?list=PLlw1FcLpWd42E0AMWz9fY-oXa_m3DA3SW)
- [Types are like the Weather, Type Systems are like Weathermen](https://www.youtube.com/watch?v=XTl7Jn_kmio&ab_channel=ClojureTV)
- [Typing the Untyped: Soundness in Gradual Type Systems](https://www.youtube.com/watch?v=uJHD2xyv7xo)
- [What is Decidable about Gradual Types?](https://www.youtube.com/watch?v=rPZ7HhyGPh4&ab_channel=ACMSIGPLAN)
- [Why Static Typing Came Back](https://www.youtube.com/watch?v=Tml94je2edk&ab_channel=GOTOConferences)
- [Building a Typechecker from scratch](https://www.udemy.com/course/typechecker)
- [How to evaluate the performance of gradual type systems](https://users.cs.utah.edu/~blg/publications/pe4gt/gtnffvf-jfp-2019.pdf)
- [Optimizing and Evaluating Transient Gradual Typing](https://dl.acm.org/doi/pdf/10.1145/3359619.3359742)
- [Putting gradual types to work](https://arxiv.org/pdf/2101.12299.pdf)
- [Safe & Efficient Gradual Typing for TypeScript](https://www.cs.umd.edu/~aseem/safets.pdf)
- [What Is Decidable about Gradual Types?](https://dl.acm.org/doi/pdf/10.1145/3371097)
- [A brief introduction to type theory and the univalence axiom](https://math.uchicago.edu/~may/REU2015/REUPapers/Macor.pdf)
- [A reckless introduction to Hindley-Milner type inference](https://www.lesswrong.com/posts/vTS8K4NBSi9iyCrPo/a-reckless-introduction-to-hindley-milner-type-inference)
- [An accessible introduction to type theory and implementing a type-checker](https://mukulrathi.com/create-your-own-programming-language/intro-to-type-checking)
- [Bootstrapping a Type System](http://journal.stuffwithstuff.com/2010/10/29/bootstrapping-a-type-system)
- [Gradual Typing from Theory to Practice](https://blog.sigplan.org/2019/07/12/gradual-typing-theory-practice)
- [Hindley-Milner Type Checking AST](https://adamdoupe.com/teaching/classes/cse340-principles-of-programming-languages-f15/slides/Hindley-MilnerTypeChecking-Mohsen-Zohrevandi.pdf)
- [How should I read type system notation?](https://langdev.stackexchange.com/questions/2692/how-should-i-read-type-system-notation/2693#2693)
- [Introduction to Type Theory](https://www.cs.uoregon.edu/research/summerschool/summer22/topics.php)
- [MyPy TypeChecker](https://github.com/python/mypy/wiki/Type-Checker)
- [Programming and Programming Languages: Type Inference](https://papl.cs.brown.edu/2018/Type_Inference.html)
- [Propositions as types: explained](https://lawrencecpaulson.github.io/2023/08/23/Propositions_as_Types.html)
- [Python internals: Symbol tables, part 1](https://eli.thegreenplace.net/2010/09/18/python-internals-symbol-tables-part-1)
- [Python internals: Symbol tables, part 2](https://eli.thegreenplace.net/2010/09/20/python-internals-symbol-tables-part-2)
- [Strong arrows: a new approach to gradual typing](https://elixir-lang.org/blog/2023/09/20/strong-arrows-gradual-typing)
- [Type Checking If Expressions](http://journal.stuffwithstuff.com/2023/01/03/type-checking-if-expressions)
- [Type inference under the hood](https://www.aleksandra.codes/type-inference)
- [Type Systems by Luca Cardelli, Microsoft Research](http://lucacardelli.name/papers/typesystems.pdf)
- [Type Theory Workshop](https://functionalcs.github.io/curriculum/typetheory.html)
- [Understanding types as sets](https://portal.gitnation.org/contents/understanding-types-as-sets)
- [What is Gradual Typing](https://wphomes.soic.indiana.edu/jsiek/what-is-gradual-typing)

## Parsers

- [Building Extensible Parsers with Camlp4](https://asankhaya.github.io/pdf/BuildingExtensibleParserswithCamlp4.pdf)
- [Demystifying Pratt Parsers](https://martin.janiczek.cz/2023/07/03/demystifying-pratt-parsers.html)
- [Rewriting the Ruby parser](https://railsatscale.com/2023-06-12-rewriting-the-ruby-parser)

## Backend

- [How LLVM & Clang work](https://www.youtube.com/watch?v=IR_L1xf4PrU&ab_channel=tanmaybakshi)
- [Building a Virtual Machine](https://www.dmitrysoshnikov.education/p/virtual-machine)

## Program Synthesis

- [Generating Programs from Types](https://www.youtube.com/watch?v=ZPyVcnCabIU&ab_channel=SkillsMatter)

## Parallel/Concurrent Programming

- [A Science of Concurrent Programs](https://lamport.azurewebsites.net/tla/science.pdf)
- [The Art of Multiprocessor Programming](https://cs.ipm.ac.ir/asoc2016/Resources/Theartofmulticore.pdf)
- [The Parallel Event Loop Model and Runtime](https://design.inf.usi.ch/sites/default/files/biblio/daniele-bonetta-phd-parallel-javascript.pdf)

## Language Learnings

- [JavaScript](https://github.com/imteekay/programming-language-research/tree/master/language-learning/javascript)
- [Python](https://github.com/imteekay/programming-language-research/tree/master/language-learning/python)
- [Ruby](https://github.com/imteekay/programming-language-research/tree/master/language-learning/ruby)
- [Haskell](https://github.com/imteekay/programming-language-research/tree/master/language-learning/haskell)
- [Elixir](https://github.com/imteekay/programming-language-research/tree/master/language-learning/elixir)
- [Clojure](https://github.com/imteekay/programming-language-research/tree/master/language-learning/clojure)
- [Rust](https://github.com/imteekay/programming-language-research/tree/master/language-learning/rust)

### TypeScript

- [A horrifically deep dive into TypeScript module resolution](https://www.youtube.com/watch?v=MEl2R7mEAP8&ab_channel=MichiganTypeScript)
- [A Trip into the Compiler](https://www.youtube.com/watch?v=oNtz0fx_z_A&ab_channel=SitePen)
- [Advanced Types in TypeScript](https://www.youtube.com/playlist?list=PLw5h0DiJ-9PBIgIyd2ZA1CVnJf0BLFJg2)
- [AreTheTypesWrong with Andrew Branch](https://www.youtube.com/watch?v=8pOi1ccd280&ab_channel=MichiganTypeScript)
- [Hidden Gems of TypeScript compiler](https://www.youtube.com/watch?v=WkJagE7b5U0&t=12s&ab_channel=NG-BE)
- [How safe is "safe enough" for TypeScript](https://www.youtube.com/watch?v=ZwoPLuSB94I&ab_channel=MichiganTypeScript)
- [How the TypeScript Compiler Compiles](https://www.youtube.com/watch?v=X8k_4tZ16qU&ab_channel=ortatherox)
- [The Road to Private Methods](https://www.youtube.com/watch?v=wpgBdN9ZwkQ&ab_channel=SitePen)
- [Type Level Programming in TypeScript](https://www.youtube.com/watch?v=vGVvJuazs84)
- [Typescript Performance: Going Beyond The Surface](https://www.youtube.com/watch?v=lJ63-j0OHG0&ab_channel=BeJS)
- [TypeScript Performance](https://www.youtube.com/watch?v=ZL3z1oBZntk&ab_channel=MattPocock)
- [Typescript Type System](https://www.youtube.com/watch?v=svQnyVny-Hw&ab_channel=HansSchenker)
- [@typescript/analyze-trace](https://github.com/microsoft/typescript-analyze-trace)
- [A preview of Ezno's checker](https://kaleidawave.github.io/posts/a-preview-of-the-checker)
- [An Introduction To Type Programming In TypeScript](https://www.zhenghao.io/posts/type-programming)
- [Debugging the TypeScript Codebase](https://blog.andrewbran.ch/debugging-the-type-script-codebase)
- [Designing with types: Making illegal states unrepresentable](https://fsharpforfunandprofit.com/posts/designing-with-types-making-illegal-states-unrepresentable)
- [Investigating TypeScript compiler APIs](https://blog.scottlogic.com/2015/01/20/typescript-compiler-api.html)
- [JavaScript scope, Closures, and the TypeScript compiler](https://iamtk.co/javascript-scope-closures-and-the-typescript-compiler)
- [Making sense of TypeScript using set theory](https://blog.thoughtspile.tech/2023/01/23/typescript-sets)
- [Modules in TypeScript](https://gist.github.com/andrewbranch/79f872a8b9f0507c9c5f2641cfb3efa6)
- [Optimizing TypeScript Memory Usage](https://swatinem.de/blog/optimizing-tsc)
- [Reconstructing TypeScript, part 0: intro and background](https://jaked.org/blog/2021-09-07-Reconstructing-TypeScript-part-0)
- [Reconstructing TypeScript, part 1: bidirectional type checking](https://jaked.org/blog/2021-09-15-Reconstructing-TypeScript-part-1)
- [Reconstructing TypeScript, part 2: functions and function calls](https://jaked.org/blog/2021-09-27-Reconstructing-TypeScript-part-2)
- [Reconstructing TypeScript, part 3: operators and singleton types](https://jaked.org/blog/2021-10-06-Reconstructing-TypeScript-part-3)
- [Reconstructing TypeScript, part 4: union types](https://jaked.org/blog/2021-10-14-Reconstructing-TypeScript-part-4)
- [Reconstructing TypeScript, part 5: intersection types](https://jaked.org/blog/2021-10-28-Reconstructing-TypeScript-part-5)
- [Reconstructing TypeScript, part 6: narrowing](https://jaked.org/blog/2021-11-11-Reconstructing-TypeScript-part-6)
- [Static TypeScript](https://www.microsoft.com/en-us/research/uploads/prod/2019/09/mplr19main-id10-p-41a6cf2-42682-final.pdf)
- [Type level programming in TypeScript](https://mjj.io/2021/03/29/type-level-programming-in-typescript)
- [Types as axioms, or: playing god with static types](https://lexi-lambda.github.io/blog/2020/08/13/types-as-axioms-or-playing-god-with-static-types)
- [TypeScript / How the compiler compiles](https://www.huy.rocks/everyday/04-01-2022-typescript-how-the-compiler-compiles)
- [TypeScript and the dawn of gradual types](https://github.com/readme/featured/typescript-gradual-types)
- [TypeScript AST Resources](https://twitter.com/grow_love/status/1585711764565811201)
- [TypeScript Bytecode Interpreter / Runtime Types](https://github.com/microsoft/TypeScript/issues/47658)
- [TypeScript Compiler API: Improve API Integrations Using Code Generation](https://blog.appsignal.com/2021/08/18/improve-api-integrations-using-code-generation.html)
- [TypeScript Compiler Internals](https://basarat.gitbook.io/typescript/overview)
- [TypeScript Compiler Manual](https://sandersn.github.io/manual/Typescript-compiler-implementation.html)
- [TypeScript Modules - Theory](https://www.typescriptlang.org/docs/handbook/modules/theory.html)
- [TypeScript Performance Tracing](https://github.com/microsoft/TypeScript/wiki/Performance-Tracing)
- [TypeScript Performance](https://github.com/microsoft/TypeScript/wiki/Performance)
- [TypeScript's type-independent output](https://neugierig.org/software/blog/2016/04/typescript-types.html)

### Ecmascript

- [Create Your Own JavaScript Runtime](https://www.youtube.com/watch?v=ynNDmp7hBdo&ab_channel=ErickWendel)
- [Ectype - bringing type safety (and more!) to vanilla JavaScript](https://www.youtube.com/watch?v=vyjHRlQrVSA&ab_channel=StrangeLoopConference)
- [Implementing one feature set in two JavaScript engines](https://www.youtube.com/watch?v=V1Q9iqxhfgU&ab_channel=WebEnginesHackfest)
- [JavaScript and C++ in Node.js core](https://www.youtube.com/watch?v=GrgMT5zMgF4&ab_channel=NearForm)
- [Node.js startup performance](https://www.youtube.com/watch?v=G36lrPrF09c&ab_channel=NearForm)
- [Static Hermes: the Next Generation of Hermes](https://www.youtube.com/watch?v=q-xKYA0EO-c&ab_channel=CallstackEngineers)
- [TC39 – From the proposal to ECMAScript - Step by Step](https://www.youtube.com/watch?v=ZheFIz4FhXo&ab_channel=FestDevConference)
- [`SingleEscapeCharacter`](https://262.ecma-international.org/13.0/#prod-SingleEscapeCharacter)
- [Automatic semicolon insertions in JavaScript](https://articles.wesionary.team/automatic-semicolon-insertions-in-javascript-best-practices-c49ed8222e12)
- [Deep JavaScript](https://exploringjs.com/deep-js/toc.html)
- [Empty Statement](https://tc39.es/ecma262/multipage/ecmascript-language-statements-and-declarations.html#sec-empty-statement)
- [From Research Prototypes to Continuous Integration: Guiding the Design and Implementation of JavaScript](https://blog.sigplan.org/2023/01/12/from-research-prototypes-to-continuous-integration-guiding-the-design-and-implementation-of-javascript)
- [JavaScript Closures](http://jibbering.com/faq/notes/closures)
- [JavaScript Garbage Collector](https://javascript.info/garbage-collection)
- [JavaScript Memory management](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_management)
- [JavaScript Static Analysis for Evolving Language Specifications](https://plrg.korea.ac.kr/assets/data/publication/thesis22-park.pdf)
- [Relation of Garbage Collector and Closure in JavaScript](https://www.geeksforgeeks.org/relation-of-garbage-collector-and-closure-in-javascript)
- [V8: full compiler](https://jayconrod.com/posts/51/a-tour-of-v8--full-compiler)
- [V8: Garbage Collection](https://jayconrod.com/posts/55/a-tour-of-v8-garbage-collection)

### Rust

- [Things I Learned (TIL) - Nicholas Matsakis](https://www.youtube.com/watch?v=LIYkT3p5gTs&ab_channel=PLISS)
- [Notes on a smaller Rust](https://without.boats/blog/notes-on-a-smaller-rust)
- [Removing Garbage Collection From the Rust Language](https://pcwalton.github.io/_posts/2013-06-02-removing-garbage-collection-from-the-rust-language.html)
- [Rust fact vs. fiction: 5 Insights from Google's Rust journey in 2022](https://opensource.googleblog.com/2023/06/rust-fact-vs-fiction-5-insights-from-googles-rust-journey-2022.html)
- [Rust: Project Goals](https://smallcultfollowing.com/babysteps/blog/2023/11/28/project-goals)
- [Rust's language ergonomics initiative](https://blog.rust-lang.org/2017/03/02/lang-ergonomics.html)
- [Why Static Languages Suffer From Complexity](https://hirrolot.github.io/posts/why-static-languages-suffer-from-complexity)

### Python

- [A JIT Compiler for CPython](https://www.youtube.com/watch?v=HxSHIpEQRjs&ab_channel=encukou)
- [Python's type system explained: Static vs dynamic typing | Guido van Rossum](https://www.youtube.com/watch?v=kSXZHRsWXfU)

### OCaml

- [How Jane Street is making OCaml the new Rust](https://www.efinancialcareers.com/news/2023/06/jane-street-programming-language)

## Browser

- [The internet computer](https://www.youtube.com/watch?v=v0160IirdL4&ab_channel=TheBrowserCompany)
- [Servo: Designing and Implementing a Parallel Browser](https://www.youtube.com/watch?v=67QP8t-89VM)
- [Servo: A Web View From Somewhere Else](https://www.youtube.com/watch?v=tNWQkNvg3_U&ab_channel=Igalia)
- [Intro to Rust-lang (Building the Dom and an HTML Parser)](https://www.youtube.com/watch?v=brhuVn91EdY&list=PLJbE2Yu2zumDF6BX6_RdPisRVHgzV02NW&index=22&ab_channel=TensorProgramming)
- [Intro to Rust-lang (Adding a Style Tree to our Browser)](https://www.youtube.com/watch?v=8e37RsyiGSE&list=PLJbE2Yu2zumDF6BX6_RdPisRVHgzV02NW&index=25&ab_channel=TensorProgramming)
- [Intro to Rust-lang (Adding a CSS engine and CSS parsing to our Browser)](https://www.youtube.com/watch?v=dnrEto7adg0&list=PLJbE2Yu2zumDF6BX6_RdPisRVHgzV02NW&index=24&ab_channel=TensorProgramming)
- [Intro to Rust (Building a Browser Engine: Commands and Rendering in OpenGL)](https://www.youtube.com/watch?v=rszgtm7i0n8&list=PLJbE2Yu2zumDF6BX6_RdPisRVHgzV02NW&index=27&ab_channel=TensorProgramming)
- [In The Loop - setTimeout, micro tasks, requestAnimationFrame, requestIdleCallback](https://www.youtube.com/watch?v=cCOL7MC4Pl0&ab_channel=JSConf)
- [Critical rendering path - Crash course on web performance](https://www.youtube.com/watch?v=PkOBnYxqj3k&ab_channel=IlyaGrigorik)
- [Chrome University 2018: Life of a Script](https://www.youtube.com/watch?v=voDhHPNMEzg&ab_channel=BlinkOn)
- [Browser From Scratch Live Streams](https://www.youtube.com/playlist?list=PLgOaDFg2Sml4CG1tYeYhQ6eKqyh0hmyg1)
- [Web Browser Engineering](https://browser.engineering)
- [Browser from scratch](https://zerox-dg.github.io/blog/tags/browser-from-scratch)
- [Browser from Scratch](https://zerox-dg.github.io/blog/tags/browser-from-scratch)
- [Browser Performance](https://www.kuniga.me/blog/2020/03/28/browser-performance.html)
- [Building a Rust Web Browser](https://joshondesign.com/tags/browser)
- [Concurrent JavaScript: It can work!](https://webkit.org/blog/7846/concurrent-javascript-it-can-work)
- [David Baron's blog: Blink engineer](https://dbaron.org/log)
- [How Browsers Work: Behind the scenes of modern web browsers](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork)
- [How browsers work](https://web.dev/howbrowserswork)
- [Key data structures and their roles in RenderingNG](https://developer.chrome.com/articles/renderingng-data-structures)
- [Let's build a browser engine!](https://limpet.net/mbrubeck/2014/08/08/toy-layout-engine-1.html)
- [Notes on how browsers work](https://www.kuniga.me/blog/2015/10/09/notes-on-how-browsers-work.html)
- [Notes on JavaScript Interpreters](https://www.kuniga.me/blog/2017/06/01/notes-on-javascript-interpreters.html)
- [Notes on Javascript Memory Profiling in Google Chrome](https://www.kuniga.me/blog/2015/06/07/notes-on-javascript-memory-profiling-in-google-chrome.html)
- [Overview of the RenderingNG architecture](https://developer.chrome.com/articles/renderingng-architecture)
- [reflows & repaints: css performance making your javascript slow?](http://www.stubbornella.org/content/2009/03/27/reflows-repaints-css-performance-making-your-javascript-slow)
- [Rendering: repaint, reflow/relayout, restyle](https://www.phpied.com/rendering-repaint-reflowrelayout-restyle)
- [RenderingNG deep-dive: LayoutNG](https://developer.chrome.com/articles/layoutng)
- [RenderingNG: an architecture that makes and keeps Chrome fast for the long term](https://blog.chromium.org/2021/10/renderingng.html)
- [Round-up of web browser internals resources](https://developer.chrome.com/blog/round-up-of-web-browser-internals-resources)
- [Understanding Reflow and Repaint in the browser](https://dev.to/gopal1996/understanding-reflow-and-repaint-in-the-browser-1jbg)
- [Web Browser Engineering](https://browser.engineering)
- [What forces layout / reflow](https://gist.github.com/paulirish/5d52fb081b3570c81e3a)

## Web UI

- [Algebraic effects, Fibers, Coroutines](https://www.youtube.com/watch?v=vzzOdWj4YyM&ab_channel=YouGottaLoveFrontend)
- [Algebraic Effects for React Developers](https://blog.reesew.io/algebraic-effects-for-react-developers)
- [Algebraic Effects for the Rest of Us](https://overreacted.io/algebraic-effects-for-the-rest-of-us)
- [PL web frameworks](https://twitter.com/sliminality/status/1516175554550018048)
- [React - Basic Theoretical Concepts](https://github.com/reactjs/react-basic)
- [React Concurrent mode](https://twitter.com/dan_abramov/status/1120971795425832961)
- [TypeScript + fp-ts: ReaderTaskEither and React](https://andywhite.xyz/posts/2021-01-28-rte-react)

## Careers

### Jobs

- [Chromium Engineer at Browser Company](/careers/chromium-engineer-browser-company.pdf)
- [Senior Software Engineer at Mozilla Corporation](/careers/mozilla-firefox-senior-software-engineer.pdf)
- [JavaScript Virtual Machine Compiler Engineer at Apple](/careers/javascript-virtual-machine-compiler-engineer.pdf)
- [Compiler Jobs](https://mgaudet.github.io/CompilerJobs)
- [Swift Type System Engineer](/careers/swift-type-system-engineer-apple.pdf)
- [Compiler Engineer](/careers/woven-by-toyota.pdf)
- [Groq Compiler Engineer](/careers/groq-compiler-engineer.pdf)
- [Modular AI Compiler Engineer](/careers/modular-ai-compiler-engineer.pdf)

### Schools

- [Programming Language and Compiler Research Groups](https://www.cs.cmu.edu/~mleone/language/projects.html)
- [Indiana University Bloomington](https://cs.indiana.edu)
- [KAIST Programming Language Research Group](https://plrg.kaist.ac.kr)
- [Tokyo Institute of Technology](https://prg.is.titech.ac.jp)
  - [TIT: How to Join the Group](https://prg.is.titech.ac.jp/people/how-to-join)
  - [Scholarships: Mext](https://www.titech.ac.jp/english/prospective-students/scholarships)
  - [Examples of Dissertations](https://prg.is.titech.ac.jp/dissertations)

## People in PL

- [Anders Hejlsberg](https://www.youtube.com/watch?v=2K_4T7M1DKk&ab_channel=AarthiandSriram)
- [Bob Nystrom](http://journal.stuffwithstuff.com)
- [Cynthia Richey](https://thia.codes)
- [Dmitry Soshnikov](https://twitter.com/DmitrySoshnikov)
- [Gavin Bierman](https://gavinbierman.github.io)
- [Gilad Bracha](https://bracha.org/Site/Home.html)
- [Graham Hutton](https://www.cs.nott.ac.uk/~pszgmh)
- [Jihyeok Park](https://plrg.korea.ac.kr/members/jihyeok.park)
- [Lexi Lambda](https://lexi-lambda.github.io)
- [Mads Torgersen](https://twitter.com/madstorgersen)
- [Matthias Felleisen](https://felleisen.org/matthias)
- [Niko Matsakis](https://smallcultfollowing.com/babysteps)
- [Patrick Walton](https://pcwalton.github.io)
- [Paulette Koronkevich](https://koronkevi.ch)
- [Programming Linnguistics](https://pling.jondgoodwin.com)
- [Researchers in Programming Languages and Compilers](https://www.cs.cmu.edu/~mleone/language-people.html)
- [Roberto Giacobazzi](http://profs.sci.univr.it/~giaco)
- [Simon Peyton Jones](https://simon.peytonjones.org)
- [StackExchange: Programming Language Design and Implementation](https://langdev.stackexchange.com)
- [Stefan Marr](https://stefan-marr.de)
- [Sukyoung Ryu](https://plrg.kaist.ac.kr/ryu)
- [Ronald Garcia](https://www.cs.ubc.ca/~rxg)
- [TK](https://iamtk.co)
