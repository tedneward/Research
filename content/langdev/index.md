title=Language Development
category=language development
type=categorypage
summary=A collection of links and articles on building programming languages.
tags=language, language development
~~~~~~

[Chunks and Beacons](https://agiletechnicalexcellence.com/2024/07/22/chunks-and-beacons.html)

[Reddit r/ProgrammingLanguages](https://www.reddit.com/r/ProgrammingLanguages/)

[Protos are Wrong](https://reasonablypolymorphic.com/blog/protos-are-wrong/): Protobuffers were obviously built by amateurs because they offer bad solutions to widely-known and already-solved problems. ... What’s so frustrating about all of this is a little understanding of how modern type-systems work would be enough to drastically simplify the protobuffer spec and simultaneously remove all of the arbitrary restrictions. The solution is as follows: Make all fields in a message required. This makes messages product types; Promote `oneof` fields to instead be standalone data types. These are coproduct types; Give the ability to parameterize product and coproduct types by other types. That’s it! These three features are all you need in order to define any possible piece of data. With these simpler pieces, we can re-implement the rest of the protobuffer spec in terms of them.

## Reading

### Books

- [Compiler Construction](https://c9x.me/compile/bib/wirthcc.pdf)
- [Compiler Design](https://www.goodreads.com/book/show/5205564-compiler-design-mar-15-2006-chattopadhyay-santanu)
- [Compiling with Continuations](https://www.goodreads.com/book/show/2079575.Compiling_with_Continuations)
- [Concepts of Programming Languages](https://www.goodreads.com/book/show/603257.Concepts_of_Programming_Languages)
- [Concepts of Programming Languages](https://www.ime.usp.br/~alvaroma/ucsp/proglang/book.pdf)
- [Discrete Mathematics for Computing](https://www.amazon.com/gp/product/0230216110/ref=sw_img_1?smid=ATVPDKIKX0DER&psc=1)
- Engineering a Compiler - [Amazon](https://www.amazon.com/Engineering-Compiler-Keith-D-Cooper/dp/0128154128/ref=sr_1_1)
- Homotopy Type Theory - [Goodreads](https://www.goodreads.com/book/show/18106978-homotopy-type-theory)
- [How to Design Programs](https://htdp.org/2020-8-1/Book/index.html) - [Goodreads](https://www.goodreads.com/book/show/1119079.How_to_Design_Programs)
- [Human-Centered Programming Languages](https://bookish.press/hcpl)
- [Introduction to Compilers and Language Design](https://www3.nd.edu/~dthain/compilerbook/compilerbook.pdf)
- Modern Compiler Design - [Amazon](https://www.amazon.com/Modern-Compiler-Design-Dick-Grune/dp/1461446988/ref=sr_1_1)
- Modern Compiler Implementation:
    - in C - [Amazon](https://www.amazon.com/Modern-Compiler-Implementation-Andrew-Appel/dp/0521607655)
- Parsing Techniques: A Practical Guide - [Goodreads](https://www.goodreads.com/en/book/show/1756599) | [Amazon](https://www.amazon.com/Parsing-Techniques-Practical-Monographs-Computer-ebook/dp/B0017AMLL8/ref=sr_1_1)
- Practical Foundations for Programming Languages - [Amazon](https://www.amazon.com/Practical-Foundations-Programming-Languages-Professor/dp/1107029570)
- [Programming Languages: Application and Interpretation](http://papl.cs.brown.edu/2015) - Shriram Krishnamurthi and Joe Gibbs Politz
- [SOFTLANG team](http://www.softlang.org/book), Uni Koblenz-Landau - [Github](https://github.com/softlang)
- The Elements Of Computing Systems - [Amazon](https://www.amazon.com/Elements-Computing-Systems-second-Principles/dp/0262539802/ref=sr_1_1)
- Thinking with Types: Type-Level Programming in Haskell - [Leanpub](https://leanpub.com/thinking-with-types)
- Type Theory and Formal Proof: An Introduction - [Goodreads](https://www.goodreads.com/book/show/21442441-type-theory-and-formal-proof)
- Type Theory and Functional Programming - [Goodreads](https://www.goodreads.com/book/show/11364683-type-theory-and-functional-programming)

### Language Learnings

- [Clojure](https://github.com/imteekay/programming-language-research/tree/master/language-learning/clojure)
- [Elixir](https://github.com/imteekay/programming-language-research/tree/master/language-learning/elixir)
- [Haskell](https://github.com/imteekay/programming-language-research/tree/master/language-learning/haskell)
- [Ruby](https://github.com/imteekay/programming-language-research/tree/master/language-learning/ruby)

### Essays/Papers

- 10 Myths About Scalable Parallel Programming Languages (Redux): 
    - [Part 1: Productivity and Performance](https://chapel-lang.org/blog/posts/10myths-part1/)
    - [Part 2: Past Failures and Future Attempts](https://chapel-lang.org/blog/posts/10myths-part2/)
    - [Part 3: New Languages vs Language Extensions](https://chapel-lang.org/blog/posts/10myths-part3/)
    - [Part 4: Syntax Matters](https://chapel-lang.org/blog/posts/10myths-part4/)
    - [Part 5: Productivity and Magic Compilers](https://chapel-lang.org/blog/posts/10myths-part5/)
- [10 papers that all PhD students in programming languages ought to know](https://github.com/nuprl/10PL)
- [A case for feminism in PL design](https://dl.acm.org/doi/pdf/10.1145/3689492.3689809)
- [A Frontend Programmer's Guide to Languages](https://thatjdanisso.cool/programming-languages)
- [A Generic Framework for Automated QA of Software Models](https://thesai.org/Downloads/Volume5No1/Paper_5-A_Generic_Framework_for_Automated_Quality_Assurance_of_Software_Models.pdf): references the OMG's Generic AST Model (GASTM) which I think is related to Abstract Syntax Tree Metamodeling (ASTM), [here](https://www.omg.org/spec/ASTM/1.0/About-ASTM) ([PDF](https://www.omg.org/spec/ASTM/1.0/PDF)) This kinda looks like the generic AST I was futzing about with.
- [A Language Creators' Conversation: Guido van Rossum, James Gosling, Larry Wall & Anders Hejlsberg](https://www.youtube.com/watch?v=csL8DLXGNlU&ab_channel=PyCascades)
- [A syntactic approach to type soundness](https://web.eecs.umich.edu/~weimerw/2008-615/reading/wright92syntactic.pdf)
- [A Tale of Two Asyncs: Open Source Language Design in Rust and Node.js](https://www.youtube.com/watch?v=aGJTXdXQN2o)
- [A Theory of Type Polymorphism in Programming](https://homepages.inf.ed.ac.uk/wadler/papers/papers-we-love/milner-type-polymorphism.pdf)
- [A wish list for a new programming language](http://www.drmaciver.com/2015/07/a-wish-list/)
- [Abstracting Gradual Typing](https://www.cs.ubc.ca/~rxg/agt.pdf)
- [An Axiomatic Basis for Computer Programming](http://sunnyday.mit.edu/16.355/Hoare-CACM-69.pdf)
- [Another Go at Language Design](https://www.youtube.com/watch?v=7VcArS4Wpqk)
- [Bjarne Stroustrup : C++: evolving a useful language](https://www.youtube.com/watch?v=6jwOoIywnZE&ab_channel=BrownCS)
- [Building a Debugger: Code Analysis](https://nan.fyi/debugger)
- [Call-by-name, call-by-value, and the λ-calculus](https://www.sciencedirect.com/science/article/pii/0304397575900171?ref=pdf_download&fr=RR-2&rr=795ba8dc2acd4edd)
- [Classic Papers in Programming Languages and Logic](https://www.cs.cmu.edu/~crary/819-f09)
- [Complete and Easy Bidirectional Typechecking for Higher-Rank Polymorphism](https://www.cl.cam.ac.uk/~nk480/bidir.pdf);
- [Concepts of Programming Languages](https://www.youtube.com/playlist?list=PLgybIyDbLkEQUTX00Mazlcb7KhX1UzpXs)
- [Delimited Continuations, Demystified by Alexis King](https://www.youtube.com/watch?v=TE48LsgVlIU&ab_channel=CodeSync)
- [Dual-Language General-Purpose Self-Hosted Visual Language and new Textual Programming Language for Applications](https://arxiv.org/abs/2509.20426) ([PDF](../2509.20426v1.pdf)): "Most visual programming languages (VPLs) are domain-specific, with few general-purpose VPLs like Programming Without Coding Technology (PWCT). These general-purpose VPLs are developed using textual programming languages and improving them requires textual programming. In this thesis, we designed and developed PWCT2, a dual-language (Arabic/English), general-purpose, self-hosting visual programming language. Before doing so, we specifically designed a textual programming language called Ring for its development. Ring is a dynamically typed language with a lightweight implementation, offering syntax customization features. It permits the creation of domain-specific languages through new features that extend object-oriented programming, allowing for specialized languages resembling Cascading Style Sheets (CSS) or Supernova language. The Ring Compiler and Virtual Machine are designed using the PWCT visual programming language where the visual implementation is composed of 18,945 components that generate 24,743 lines of C code, which increases the abstraction level and hides unnecessary details. Using PWCT to develop Ring allowed us to realize several issues in PWCT, which led to the development of the PWCT2 visual programming language using the Ring textual programming language. PWCT2 provides approximately 36 times faster code generation and requires 20 times less storage for visual source files. It also allows for the conversion of Ring code into visual code, enabling the creation of a self-hosting VPL that can be developed using itself. PWCT2 consists of approximately 92,000 lines of Ring code and comes with 394 visual components." [Source](https://github.com/PWCT/PWCT2)
- [Dynamic Language Embedding](https://scg.unibe.ch/archive/phd/renggli-phd.pdf)
- [Efficient Gradual Typing](https://arxiv.org/pdf/1802.06375.pdf)
- [Fundamental concepts in programming languages](https://www.math.pku.edu.cn/teachers/qiuzy/plan/lits/FundamentalConceptOfPL.pdf)
- ["A Generic Abstract Syntax Model for Embedded Languages"](https://www.cs.tufts.edu/~nr/cs257/archive/emil-axelsson/paper.pdf): "Representing a syntax tree using a data type often involves having many similar-looking constructors. Functions operating on such types often end up having many similar-looking cases. Different languages often make use of similar-looking constructions. We propose a generic model of abstract syntax trees capable of representing a wide range of typed languages. Syntactic constructs can be composed in a modular fashion enabling reuse of abstract syntax and syntactic processing within and across languages. Building on previous methods of encoding extensible data types in Haskell, our model is a pragmatic solution to Wadler’s “expression problem". Its practicality has been confirmed by its use in the implementation of the embedded language Feldspar."
- [Generic Abstract Syntax Tree (geast)](https://angeljavalopez.medium.com/geast-a-generic-abstract-syntax-tree-c7feb681b6b5)
- ["GAST"](../GAST_A_generic_AST_representation_for_language-ind.pdf) (PDF)
- [Going beyond JavaScript](https://www.youtube.com/watch?v=VwisE497Nsg&ab_channel=Intelligence.ai%3AConcepts-FirstPodcast)
- [Gradual Type Theory](https://arxiv.org/pdf/1811.02440.pdf)
- [Gradual Typing for Functional Languages](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=b7ca4b0e6d3119aa341af73964dbe38d341061dd)
- [Gradual Typing: A New Perspective](https://www.irif.fr/~gc/papers/popl19.pdf)
- [Grammars for programming languages](https://medium.com/@mikhail.barash.mikbar/grammars-for-programming-languages-fae3a72a22c6)
- [Growing a Language](https://www.youtube.com/watch?v=_ahvzDzKdB0), by Guy Steele
- [Haai: Reactive programming without lifting](https://soft.vub.ac.be/~boeyen/haai/)
- [How Big Should a Programming Language Be?](https://tratt.net/laurie/blog/2023/how_big_should_a_programming_language_be.html): "... a long-held opinion I have about programming language design: we have a tendency to keep adding features to a language until it becomes so big that its sheer size makes it difficult to use reliably." *Yes!*
- [How OCaml type checker works -- or what polymorphism and garbage collection have in common](https://okmij.org/ftp/ML/generalization.html)
- [How Rust does OSS](https://www.youtube.com/watch?v=m0rakUuPXFM)
- [How Statically-Typed Functional Programmers Write Code](./research/papers/how-statically-typed-functional-programmers-write-code)
- [How To Create Your Own Programming Language](https://dev.to/jasonsbarr/how-to-create-your-own-programming-language-2642)
- [JavaScript Static Analysis for Evolving Language Specifications](https://www.youtube.com/watch?v=3Jlu_jnHB8g&ab_channel=PLRGKAIST)
- [Language-oriented software engineering](https://parametri.city/blog/2018-12-23-language-oriented-software-engineering/index.html)
- [Let’s Build a Programming Language](https://medium.com/hackernoon/lets-build-a-programming-language-2612349105c6)
- [Linguistics and Compilers](https://www.youtube.com/watch?v=Ix6M9Nj_Dug&ab_channel=FunctionalSC)
- [Migrating Gradual Types](https://dl.acm.org/doi/pdf/10.1145/3158103)
- [Minimalism in Programming Language Design](https://pointersgonewild.com/2022/05/23/minimalism-in-programming-language-design)
- [On Model Subtyping](https://hal.inria.fr/hal-00695034/document)
- [On Understanding Types, Data Abstraction, and Polymorphism](http://lucacardelli.name/Papers/OnUnderstanding.A4.pdf)
- [On understanding types, data abstraction and effects](https://www.youtube.com/watch?v=3Cdw5x72k_g&ab_channel=MicrosoftResearch)
- [Panel: The Future of Programming Languages](https://learn.microsoft.com/en-us/events/pdc-pdc08/tl57)
- [Papers on programming languages: ideas from 70's for today](https://medium.com/@mikhail.barash.mikbar/papers-on-programming-languages-ideas-from-70s-for-today-2931891d4dbd)
- [Papers to read](https://github.com/haskellcamargo/papers-to-read)
- [Pluggable Type Systems](https://bracha.org/pluggableTypesPosition.pdf)
- [Practical Foundations for Programming Languages](./practical-foundations.pdf) (PDF)
- [Principles of Programming Languages](https://www.youtube.com/playlist?list=PLTo1TmBz2ekof8VsYaoTxP-9VgJ9P-dTO) by Robert M. Siegfried
- [Principles of Programming Languages](https://www.youtube.com/playlist?list=PLK06XT3hFPzilgF1mi_hHqcXO1-o_8OEe)
- [Principles of Programming Languages (course)](https://bguppl.github.io/interpreters/practice_sessions/ps4.html) ([Source](https://github.com/bguppl/interpreters))
- [Principles of Programming Languages](https://www.cs.toronto.edu/~david/course-notes/csc324.pdf)
- [Program Analysis](https://gist.github.com/MattPD/00573ee14bf85ccac6bed3c0678ddbef)
- [Programming and Programming Languages](https://papl.cs.brown.edu/2018/index.html)
- [Programming Language and Compilers Reading List](https://www.jntrnr.com/programming-language-and-compilers-reading-list)
- [Programming Language Foundations in Agda](https://plfa.github.io/beta)
- [Programming Language Semantics](http://www.cs.nott.ac.uk/~pszgmh/123.pdf)
- [Programming language semantics: It’s easy as 1,2,3](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC2C046CF94382B3B408036B84475DC7/S0956796823000072a.pdf/programming-language-semantics-its-easy-as-123.pdf)
- [Programming language theory and practice in ReScript](https://bobzhang.github.io/rescript-pl-course)
- [PROGRAMMING A PROBLEM-ORIENTED LANGUAGE](http://www.forth.org/POL.pdf)
- [Programming type-safe transformations using higher-order abstract syntax](https://www.cs.mcgill.ca/~bpientka/papers/cc.pdf)
- [Programming in Homotopy Type Theory](http://dlicata.web.wesleyan.edu/pubs/lh122tttalks/lh12wg2.8.pdf)
- [Reactive Functions without Functions](https://programming-journal.org/2024/8/11/) ([PDF](https://arxiv.org/pdf/2403.02296))
- [Refined Criteria for Gradual Typing](https://drops.dagstuhl.de/opus/volltexte/2015/5031/pdf/21.pdf)
- [Relational operators in Apache Calcite](https://www.querifylabs.com/blog/relational-operators-in-apache-calcite)
- [Rob Pike - What We Got Right, What We Got Wrong](https://www.youtube.com/watch?v=yE5Tpp2BSGw)
- [Simple Programming Languages](https://ryanbrewer.dev/posts/simple-programming-languages.html)
- [So many programming languages so little time](https://www.youtube.com/watch?v=FEjH5VxmDoY&ab_channel=MicrosoftDeveloper)
- [Static Typing Where Possible, Dynamic Typing When Needed: The End of the Cold War Between Programming Languages](https://www.ics.uci.edu/~lopes/teaching/inf212W12/readings/rdl04meijer.pdf)
- [Stephanie Weirich speaks about Programming Language Design](https://www.youtube.com/watch?v=gLTDyrAY4Hk)
- [The Behavior of Gradual Types: A User Study](https://cs.brown.edu/~sk/Publications/Papers/Published/tgpk-beh-grad-types-user-study/paper.pdf)
- [The Calculated Typer](https://bahr.io/pubs/entries/calctyper.html): We present a calculational approach to the design of type checkers, showing how they can be derived from behavioural specifications using equational reasoning. In addition, we show how the calculations can be simplified by taking an algebraic approach based on fold fusion, and further improved by taking a constraint-based approach to solving and composing fusion preconditions. We illustrate our methodology with three examples of increasing complexity, starting with a simple expression language, then adding support for exceptions, and finally considering a version of the lambda calculus.
- [The Design Principles of the Elixir Type System](https://arxiv.org/pdf/2306.06391.pdf)
- [The Economics of Programming Languages](https://www.youtube.com/watch?v=XZ3w_jec1v8&ab_channel=StrangeLoopConference)
- [The Mess We're In - Joe Armstrong](https://www.youtube.com/watch?v=lKXe3HUG2l4)
- [The Next Programming Language - Douglas Crockford](https://www.youtube.com/watch?v=R2idkNdKqpQ&ab_channel=code%3A%3Adiveconference)
- [The Next 700 Programming Languages](https://www.cs.cmu.edu/~crary/819-f09/Landin66.pdf)
- [The Programming Language Enthusiast](http://www.pl-enthusiast.net)
- [The Slow March of Progress](https://earthly.dev/blog/programming-language-improvements/)
- [The Study of Programming Languages](https://cs.lmu.edu/~ray/notes/plstudy)
- [The Taxonomy of Reactive Programming](https://vsavkin.com/the-taxonomy-of-reactive-programming-d40e2e23dee4): Events and State; Deriving and Executing; Reified and Transparent; Composition; Implicit and Explicit Time; Self and External Observation; 
- [Towards a theory of type structure](https://www.cis.upenn.edu/~stevez/cis670/pdfs/Reynolds74.pdf)
- [Towards Practical Gradual Typing](https://www2.ccs.neu.edu/racket/pubs/ecoop2015-takikawa-et-al.pdf)
- [Type Inference Algorithms](http://www.win.tue.nl/~hzantema/semssm.pdf)
- [Type Inference for Records in a Natural Extension of ML](https://www.cs.cmu.edu/~aldrich/courses/819/row.pdf)
- [Type Systems for Object-Oriented Programming Languages](http://i.stanford.edu/pub/cstr/reports/cs/tr/98/1602/CS-TR-98-1602.pdf)
- [Type Systems](http://lucacardelli.name/papers/typesystems.pdf)
- [What every compiler writer should know about programmers](https://www.complang.tuwien.ac.at/kps2015/proceedings/KPS_2015_submission_29.pdf)
- [What's Next for Our Programming Languages](https://www.youtube.com/watch?v=q3XcQh0cNZM&ab_channel=InfoQ)
- [Why Dependent Types Matter](http://www.cs.nott.ac.uk/~psztxa/publ/ydtm.pdf)
- [Why Programming Languages Matter](https://www.youtube.com/watch?v=JqYCt9rTG8g&ab_channel=StrangeLoopConference)
- [Why Study Programming Languages](https://rachit.pl/post/why-study-programming-languages)
- [The Development of the C Language](https://www.bell-labs.com/usr/dmr/www/chist.pdf)

- [Flattening ASTs (and Other Compiler Data Structures)](https://www.cs.cornell.edu/~asampson/blog/flattening.html)
- [Intrinsically-Typed Definitional Interpreters for Linear, Session-Typed Languages](https://eelcovisser.org/publications/2020/RouvoetPKV20.pdf)
- [Languages I want to write](https://blog.wesleyac.com/posts/language-todos)
- [Less is more: language features](http://blog.ploeh.dk/2015/04/13/less-is-more-language-features/)
- [Let Arguments Go First](https://xnning.github.io/papers/let-arguments-go-first.pdf);
- [Notation as a Tool of Thought](https://dl.acm.org/doi/pdf/10.1145/358896.358899)
- [Open, extensible object models](https://piumarta.com/software/cola/objmodel2.pdf): "The artificial distinction between implementation language and end-user language can be eliminated by implementing the language using only end-user objects and messages, making the implementation accessible for arbitrary modification by programmers. We show that three object types and five methods are sufficient to bootstrap an extensible object model and messaging semantics that are described entirely in terms of those same objects and messages."
- [S-Expressions in Javascript](https://www.freecodecamp.org/news/s-expressions-in-javascript/)
- [Three Things I Wish I Knew When I Started Designing Languages](https://www.youtube.com/watch?v=oa0qq75i9oc)
- [The Naked Truth About Writing a Programming Language](https://www.digitalmars.com/articles/b90.html)

## Implementations

### Compiler

- [A miniature model of the Typescript compiler](https://github.com/imteekay/mini-typescript)
- [A Retargetable C Compiler](./a-retargetable-c-compiler-design-and-implementation.pdf); makes use of literate programming (/languages/noweb)
- [Alias analysis](https://en.wikipedia.org/wiki/Alias_analysis)
- [An Incremental Approach to Compiler Construction](http://scheme2006.cs.uchicago.edu/11-ghuloum.pdf)
- [An Introduction to Interpreters and JIT Compilation](https://stefan-marr.de/2023/09/pliss-summer-school)
- [AST (Abstract Syntax Tree)](https://medium.com/@dinis.cruz/ast-abstract-syntax-tree-538aa146c53b)
- [Anders Hejlsberg on Modern Compiler Construction](https://www.youtube.com/watch?v=wSdV1M7n4gQ)
- [Building a Parser from scratch](https://www.dmitrysoshnikov.education/p/parser-from-scratch)
- [Building a parser in C#, from first principles](https://www.youtube.com/watch?v=klHyc9HQnNQ&ab_channel=NDCConferences)
- [Compiler Design course](https://www.youtube.com/playlist?list=PLDAE55AEE0731D729&feature=plcp)
- [Compilers and Interpreters](https://medium.com/hackernoon/compilers-and-interpreters-3e354a2e41cf)
- [Compilers Resources](https://glyphack.com/blog/compiler-resources)
- [Compilers: Nuts and bolts of Programming Languages](https://pgrandinetti.github.io/compilers)
- [Compiling Scheme to C with closure conversion](https://matt.might.net/articles/compiling-scheme-to-c)
- [Compiling to Java](https://matt.might.net/articles/compiling-to-java)
- [Compiling to lambda-calculus](https://matt.might.net/articles/compiling-up-to-lambda-calculus)
- [Expression Parsing Made Easy](http://journal.stuffwithstuff.com/2011/03/19/pratt-parsers-expression-parsing-made-easy) - Bob Nystrom
- [Flattening ASTs (and Other Compiler Data Structures)](https://www.cs.cornell.edu/~asampson/blog/flattening.html)
- [Fredrik Lundh - Simple Town-Down Parsing In Python](https://11l-lang.org/archive/simple-top-down-parsing)
- [Garbage Collection Algorithms](https://www.dmitrysoshnikov.education/p/essentials-of-garbage-collectors)
- [How the TypeScript compiler works](https://www.iamtk.co/series/the-typescript-compiler)
- [How To Build A Programming Language From Scratch](https://www.youtube.com/watch?v=8VB5TY1sIRo&list=PL_2VhOvlMk4UHGqYCLWc6GO8FaPl8fQTh&ab_channel=tylerlaceby)
- [How to Compile Your Language](https://isuckatcs.github.io/how-to-compile-your-language/)
- [How to implement a programming language in JavaScript](http://lisperator.net/pltut)
- [How would compilers change in the next 10 years?](https://www.youtube.com/watch?v=p15qRHZ_Leg&ab_channel=CompilerConstruction)
- [Implementing a bignum calculator](https://www.youtube.com/watch?v=PXoG0WX0r_E)
- [Interpreter, Compiler, JIT](https://nickdesaulniers.github.io/blog/2015/05/25/interpreter-compiler-jit) - Nick Desaulniers
- [IU Compiler Course](https://iucompilercourse.github.io/IU-P423-P523-E313-E513-Fall-2020)
- [JavaScript ∩ WebAssembly](https://www.youtube.com/watch?v=PP5r_b3Ws8s&ab_channel=ReactEurope)
- [JavaScript implementation in SpiderMonkey](https://www.youtube.com/playlist?list=PLo3w8EB99pqJVPhmYbYdInBvAGarDavh-)
- [KAIST CS420: Compiler Design](https://www.youtube.com/playlist?list=PL5aMzERQ_OZ8RWqn-XiZLXm1IJuaQbXp0)
- [Language grammar](https://stackoverflow.com/a/4726662/11314146)
- [Lessons from Writing a Compiler](https://borretti.me/article/lessons-writing-compiler)
- [Let's build a compiler](https://generalproblem.net)
- [Let’s Build a Compiler!](http://compilers.iecc.com/crenshaw/tutorfinal.pdf) - Jack W. Crenshaw
- [Lexical Analysis](https://medium.com/hackernoon/lexical-analysis-861b8bfe4cb0)
- [Lexical Scanning in Go](https://www.youtube.com/watch?v=HxaD_trXwRE)
- [Lexing in JS style](https://areknawo.com/the-lexer-in-js)
- [Mozilla Hacks Compiler Compiler](https://www.youtube.com/playlist?list=PLo3w8EB99pqKF1FQllRsxyQh3sA7V2Hc-)
- [Quick look at the TypeScript Compiler API](https://www.youtube.com/watch?v=AnjfW633e8o%E2%80%8E.%E2%80%8Edev)
- [Parsing Algorithms](https://www.dmitrysoshnikov.education/p/essentials-of-parsing)
- [Pursuit of Performance on Building a JavaScript Compiler](https://rustmagazine.org/issue-3/javascript-compiler)
- [Resources for Amateur Compiler Writers](https://c9x.me/compile/bib)
- [Rethinking compiler technology in a heterogeneous world](https://www.youtube.com/watch?v=6Ncnx0bT4lk&ab_channel=HiPEACTV)
- [Scheme from Scratch - Introduction](http://peter.michaux.ca/articles/scheme-from-scratch-introduction)
- [The business of selling compilers](https://www.youtube.com/watch?v=JRyv2oyWIbA&ab_channel=HiPEACTV)
- [Top Down Operator Precedence](http://javascript.crockford.com/tdop/tdop.html) - Douglas Crockford
- [Typescript Compiler explained by the Author Anders Hejlsberg](https://www.youtube.com/watch?v=f6TCB61fDwY)
- [TypeScript Compiler Notes](https://github.com/microsoft/TypeScript-Compiler-Notes)
- [Understanding compiler optimization](https://www.youtube.com/watch?v=haQ2cijhvhE)
- [Understanding GC in JSC From Scratch](https://webkit.org/blog/12967/understanding-gc-in-jsc-from-scratch)
- [Which Interpreters are Faster, AST or Bytecode?](https://stefan-marr.de/2023/10/ast-vs-bytecode-interpreters)
- [Write you a Haskell](http://dev.stephendiehl.com/fun)

### Experiments

- [Bob: A Tiny Object-Oriented Language](https://jacobfilipp.com/DrDobbs/articles/DDJ/1994/9415/9415e/9415e.htm)
- [Lepton](https://github.com/gingerBill/Lepton): Simple Programming Language
- Let's make a Teeny Tiny compiler

    - [Part 1](https://austinhenley.com/blog/teenytinycompiler1.html)
    - [Part 2](https://austinhenley.com/blog/teenytinycompiler2.html)
    - [Part 3](https://austinhenley.com/blog/teenytinycompiler3.html)

- [miniUni](https://github.com/gidra5/miniUni): A concurrent scripting language
- [uza](https://github.com/msanlop/uza): a simple statically-typed programming language

### PL Paradigms

- [Compiling with Continuations or without? Whatever](https://www.youtube.com/watch?v=cPBr59ECiRU&ab_channel=ACMSIGPLAN)
- [Continuation-passing style in JavaScript](https://matt.might.net/articles/by-example-continuation-passing-style)
- [Continuation-passing style](https://en.wikipedia.org/wiki/Continuation-passing_style)

### Interpreter

- [A Python Interpreter Written in Python](http://aosabook.org/en/500L/a-python-interpreter-written-in-python.html)
- [An interpreter for the Monkey programming language](https://github.com/imteekay/crafting-an-interpreter)
- [Building an Interpreter](https://www.iamtk.co/series/building-an-interpreter)
- [Building an Interpreter from scratch](https://www.dmitrysoshnikov.education/p/essentials-of-interpretation)
- [Cheaply writing a fast interpreter](https://www.youtube.com/watch?v=V8dnIw3amLA&ab_channel=PerformanceSummit)
- [Compiling Lisp to bytecode](https://healeycodes.com/compiling-lisp-to-bytecode-and-running-it)
- [Crafting Interpreters](http://craftinginterpreters.com/contents.html)
- [Crafting an Interpreter](https://github.com/imteekay/crafting-an-interpreter)
- [(How to Write a (Lisp) Interpreter (in Python))](http://norvig.com/lispy.html)
- [How languages work #1: String interpolation](https://martin.janiczek.cz/2023/07/27/how-languages-work-1-string-interpolation.html)
- [Implementing a Simple Compiler on 25 Lines of JavaScript](https://blog.mgechev.com/2017/09/16/developing-simple-interpreter-transpiler-compiler-tutorial)
- Let’s Build A Simple Interpreter:
    - [Part 1](https://ruslanspivak.com/lsbasi-part1)
    - [Part 2](https://ruslanspivak.com/lsbasi-part2)
    - [Part 3](https://ruslanspivak.com/lsbasi-part3)
    - [Part 4](https://ruslanspivak.com/lsbasi-part4)
    - [Part 5](https://ruslanspivak.com/lsbasi-part5)
    - [Part 6](https://ruslanspivak.com/lsbasi-part6)
    - [Part 7](https://ruslanspivak.com/lsbasi-part7)
    - [Part 8](https://ruslanspivak.com/lsbasi-part8)
    - [Part 9](https://ruslanspivak.com/lsbasi-part9)
    - [Part 10](https://ruslanspivak.com/lsbasi-part10)
    - [Part 11](https://ruslanspivak.com/lsbasi-part11)
    - [Part 12](https://ruslanspivak.com/lsbasi-part12)
    - [Part 13](https://ruslanspivak.com/lsbasi-part13)
    - [Part 14](https://ruslanspivak.com/lsbasi-part14)
    - [Part 15](https://ruslanspivak.com/lsbasi-part15)
    - [Part 16](https://ruslanspivak.com/lsbasi-part16)
    - [Part 17](https://ruslanspivak.com/lsbasi-part17)
    - [Part 18](https://ruslanspivak.com/lsbasi-part18)
- [LittleBasic](https://github.com/mateiw/littlebasic)
- [Little lisp interpreter](https://maryrosecook.com/blog/post/little-lisp-interpreter)
- [Little Lisp interpreter](https://www.recurse.com/blog/21-little-lisp-interpreter)
- [Make a Lisp](https://github.com/kanaka/mal)
- [Pratt Parsers: Expression Parsing Made Easy](http://journal.stuffwithstuff.com/2011/03/19/pratt-parsers-expression-parsing-made-easy)
- [What do people mean when they say “transpiler”?](https://decomposition.al/blog/2017/07/30/what-do-people-mean-when-they-say-transpiler)

### PL Research

- [Increasing the Impact of PL Research](http://www.pl-enthusiast.net/2020/07/29/increasing-the-impact-of-pl-research)
- [What is PL research and how is it useful?](http://www.pl-enthusiast.net/2015/05/27/what-is-pl-research-and-how-is-it-useful)

### Backend

- [How LLVM & Clang work](https://www.youtube.com/watch?v=IR_L1xf4PrU&ab_channel=tanmaybakshi)
- [Building a Virtual Machine](https://www.dmitrysoshnikov.education/p/virtual-machine)

### Program Synthesis

- [Generating Programs from Types](https://www.youtube.com/watch?v=ZPyVcnCabIU&ab_channel=SkillsMatter)

### Parallel/Concurrent Programming

- [A Science of Concurrent Programs](https://lamport.azurewebsites.net/tla/science.pdf)
- [The Art of Multiprocessor Programming](https://cs.ipm.ac.ir/asoc2016/Resources/Theartofmulticore.pdf)
- [The Parallel Event Loop Model and Runtime](https://design.inf.usi.ch/sites/default/files/biblio/daniele-bonetta-phd-parallel-javascript.pdf)


**NOTE:** Some links from https://github.com/imteekay/programming-language-research
