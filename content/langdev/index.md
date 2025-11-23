title=Language Development
category=language development
type=categorypage
summary=A collection of links and articles on building programming languages.
tags=language, language development
~~~~~~

[Chunks and Beacons](https://agiletechnicalexcellence.com/2024/07/22/chunks-and-beacons.html)

[Reddit r/ProgrammingLanguages](https://www.reddit.com/r/ProgrammingLanguages/)

[Protos are Wrong](https://reasonablypolymorphic.com/blog/protos-are-wrong/): Protobuffers were obviously built by amateurs because they offer bad solutions to widely-known and already-solved problems. ... What’s so frustrating about all of this is a little understanding of how modern type-systems work would be enough to drastically simplify the protobuffer spec and simultaneously remove all of the arbitrary restrictions. The solution is as follows: Make all fields in a message required. This makes messages product types; Promote `oneof` fields to instead be standalone data types. These are coproduct types; Give the ability to parameterize product and coproduct types by other types. That’s it! These three features are all you need in order to define any possible piece of data. With these simpler pieces, we can re-implement the rest of the protobuffer spec in terms of them.

## Categories

[Code Generation](/langdev/code-generation) | [Concurrency implementation](/langdev/concurrency-implementation) | [Continuations](/langdev/continuations) | [Correctness](/langdev/correctness) | [DSLs](/langdev/domain-specific-langs) | [Effects](/langdev/effects) | [Implementation](/langdev/implementation) | [Lists](/langdev/lists) | [Logic](/langdev/logic) | [Parsing](/langdev/parsing) | [Syntax](/langdev/syntax) | [Testing](/langdev/testing) | [Types and Type Systems](/langdev/types-and-type-systems) | [Validation](/langdev/validation) and [Verification](/langdev/verification)

Resources: [Courses](/langdev/courses) 

## Reading

### Articles/Blogs/Essays/Papers

- 10 Myths About Scalable Parallel Programming Languages (Redux): 

    - [Part 1: Productivity and Performance](https://chapel-lang.org/blog/posts/10myths-part1/)
    - [Part 2: Past Failures and Future Attempts](https://chapel-lang.org/blog/posts/10myths-part2/)
    - [Part 3: New Languages vs Language Extensions](https://chapel-lang.org/blog/posts/10myths-part3/)
    - [Part 4: Syntax Matters](https://chapel-lang.org/blog/posts/10myths-part4/)
    - [Part 5: Productivity and Magic Compilers](https://chapel-lang.org/blog/posts/10myths-part5/)

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
- [An Incremental Approach to Compiler Construction](http://scheme2006.cs.uchicago.edu/11-ghuloum.pdf):  Scheme and Functional Programming 2006; Abdulaziz Ghuloum -- [Github](https://github.com/namin/inc) Step-by-step development of a Scheme-to-x86 compiler
- [Building a Debugger: Code Analysis](https://nan.fyi/debugger)
- [Call-by-name, call-by-value, and the λ-calculus](https://www.sciencedirect.com/science/article/pii/0304397575900171?ref=pdf_download&fr=RR-2&rr=795ba8dc2acd4edd)
- [Complete and Easy Bidirectional Typechecking for Higher-Rank Polymorphism](https://www.cl.cam.ac.uk/~nk480/bidir.pdf);
- [Delimited Continuations, Demystified by Alexis King](https://www.youtube.com/watch?v=TE48LsgVlIU&ab_channel=CodeSync)
- [Dual-Language General-Purpose Self-Hosted Visual Language and new Textual Programming Language for Applications](https://arxiv.org/abs/2509.20426) ([PDF](../2509.20426v1.pdf)): "Most visual programming languages (VPLs) are domain-specific, with few general-purpose VPLs like Programming Without Coding Technology (PWCT). These general-purpose VPLs are developed using textual programming languages and improving them requires textual programming. In this thesis, we designed and developed PWCT2, a dual-language (Arabic/English), general-purpose, self-hosting visual programming language. Before doing so, we specifically designed a textual programming language called Ring for its development. Ring is a dynamically typed language with a lightweight implementation, offering syntax customization features. It permits the creation of domain-specific languages through new features that extend object-oriented programming, allowing for specialized languages resembling Cascading Style Sheets (CSS) or Supernova language. The Ring Compiler and Virtual Machine are designed using the PWCT visual programming language where the visual implementation is composed of 18,945 components that generate 24,743 lines of C code, which increases the abstraction level and hides unnecessary details. Using PWCT to develop Ring allowed us to realize several issues in PWCT, which led to the development of the PWCT2 visual programming language using the Ring textual programming language. PWCT2 provides approximately 36 times faster code generation and requires 20 times less storage for visual source files. It also allows for the conversion of Ring code into visual code, enabling the creation of a self-hosting VPL that can be developed using itself. PWCT2 consists of approximately 92,000 lines of Ring code and comes with 394 visual components." [Source](https://github.com/PWCT/PWCT2)
- [Dynamic Language Embedding](https://scg.unibe.ch/archive/phd/renggli-phd.pdf)
- [Efficient Gradual Typing](https://arxiv.org/pdf/1802.06375.pdf)
- [Flattening ASTs (and Other Compiler Data Structures)](https://www.cs.cornell.edu/~asampson/blog/flattening.html)
- [From Lisp S-Expressions to Java](/langdev/From_Lisp_S-expressions_to_Java_source_code.pdf)
- ["A Generic Abstract Syntax Model for Embedded Languages"](https://www.cs.tufts.edu/~nr/cs257/archive/emil-axelsson/paper.pdf): "Representing a syntax tree using a data type often involves having many similar-looking constructors. Functions operating on such types often end up having many similar-looking cases. Different languages often make use of similar-looking constructions. We propose a generic model of abstract syntax trees capable of representing a wide range of typed languages. Syntactic constructs can be composed in a modular fashion enabling reuse of abstract syntax and syntactic processing within and across languages. Building on previous methods of encoding extensible data types in Haskell, our model is a pragmatic solution to Wadler’s “expression problem". Its practicality has been confirmed by its use in the implementation of the embedded language Feldspar."
- [Generic Abstract Syntax Tree (geast)](https://angeljavalopez.medium.com/geast-a-generic-abstract-syntax-tree-c7feb681b6b5)
- ["GAST"](/langdev/GAST_A_generic_AST_representation_for_language-ind.pdf) (PDF)
- [Going beyond JavaScript](https://www.youtube.com/watch?v=VwisE497Nsg&ab_channel=Intelligence.ai%3AConcepts-FirstPodcast)
- [Growing a Language](https://www.youtube.com/watch?v=_ahvzDzKdB0), by Guy Steele
- [Haai: Reactive programming without lifting](https://soft.vub.ac.be/~boeyen/haai/)
- [How Big Should a Programming Language Be?](https://tratt.net/laurie/blog/2023/how_big_should_a_programming_language_be.html): "... a long-held opinion I have about programming language design: we have a tendency to keep adding features to a language until it becomes so big that its sheer size makes it difficult to use reliably." *Yes!*
- [How OCaml type checker works -- or what polymorphism and garbage collection have in common](https://okmij.org/ftp/ML/generalization.html)
- [How Rust does OSS](https://www.youtube.com/watch?v=m0rakUuPXFM)
- [How To Create Your Own Programming Language](https://dev.to/jasonsbarr/how-to-create-your-own-programming-language-2642)
- How to Implement Local Type Inference - https://www.reddit.com/r/ProgrammingLanguages/comments/1gkjkz4/how_to_implement_local_type_inference/
- [Intrinsically-Typed Definitional Interpreters for Linear, Session-Typed Languages](https://eelcovisser.org/publications/2020/RouvoetPKV20.pdf)
- [JavaScript Static Analysis for Evolving Language Specifications](https://www.youtube.com/watch?v=3Jlu_jnHB8g&ab_channel=PLRGKAIST)
- [Language-oriented software engineering](https://parametri.city/blog/2018-12-23-language-oriented-software-engineering/index.html)
- [Linguistics and Compilers](https://www.youtube.com/watch?v=Ix6M9Nj_Dug&ab_channel=FunctionalSC)
- [Migrating Gradual Types](https://dl.acm.org/doi/pdf/10.1145/3158103)
- [Minimalism in Programming Language Design](https://pointersgonewild.com/2022/05/23/minimalism-in-programming-language-design)
- [On Model Subtyping](https://hal.inria.fr/hal-00695034/document)
- [On Understanding Types, Data Abstraction, and Polymorphism](http://lucacardelli.name/Papers/OnUnderstanding.A4.pdf)
- [On understanding types, data abstraction and effects](https://www.youtube.com/watch?v=3Cdw5x72k_g&ab_channel=MicrosoftResearch)
- [Panel: The Future of Programming Languages](https://learn.microsoft.com/en-us/events/pdc-pdc08/tl57)
- [Papers on programming languages: ideas from 70's for today](https://medium.com/@mikhail.barash.mikbar/papers-on-programming-languages-ideas-from-70s-for-today-2931891d4dbd)
- [Pluggable Type Systems](https://bracha.org/pluggableTypesPosition.pdf)
- [Practical Foundations for Programming Languages](./practical-foundations.pdf) (PDF)
- [Principles of Programming Languages](https://www.youtube.com/playlist?list=PLTo1TmBz2ekof8VsYaoTxP-9VgJ9P-dTO) by Robert M. Siegfried
- [Principles of Programming Languages](https://www.youtube.com/playlist?list=PLK06XT3hFPzilgF1mi_hHqcXO1-o_8OEe)
- [Principles of Programming Languages (course)](https://bguppl.github.io/interpreters/practice_sessions/ps4.html) ([Source](https://github.com/bguppl/interpreters))
- [Principles of Programming Languages](https://www.cs.toronto.edu/~david/course-notes/csc324.pdf)
- [Program Analysis](https://gist.github.com/MattPD/00573ee14bf85ccac6bed3c0678ddbef)
- [Programming and Programming Languages](https://papl.cs.brown.edu/2018/index.html)
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
- [Simple Programming Languages](https://ryanbrewer.dev/posts/simple-programming-languages.html)
- [So many programming languages so little time](https://www.youtube.com/watch?v=FEjH5VxmDoY&ab_channel=MicrosoftDeveloper)
- [Static Typing Where Possible, Dynamic Typing When Needed: The End of the Cold War Between Programming Languages](https://www.ics.uci.edu/~lopes/teaching/inf212W12/readings/rdl04meijer.pdf)
- [Stephanie Weirich speaks about Programming Language Design](https://www.youtube.com/watch?v=gLTDyrAY4Hk)
- [The Behavior of Gradual Types: A User Study](https://cs.brown.edu/~sk/Publications/Papers/Published/tgpk-beh-grad-types-user-study/paper.pdf)
- [The Calculated Typer](https://bahr.io/pubs/entries/calctyper.html): We present a calculational approach to the design of type checkers, showing how they can be derived from behavioural specifications using equational reasoning. In addition, we show how the calculations can be simplified by taking an algebraic approach based on fold fusion, and further improved by taking a constraint-based approach to solving and composing fusion preconditions. We illustrate our methodology with three examples of increasing complexity, starting with a simple expression language, then adding support for exceptions, and finally considering a version of the lambda calculus.
- [The Design Principles of the Elixir Type System](https://arxiv.org/pdf/2306.06391.pdf)
- [The Economics of Programming Languages](https://www.youtube.com/watch?v=XZ3w_jec1v8&ab_channel=StrangeLoopConference)
- [The Mess We're In](https://www.youtube.com/watch?v=lKXe3HUG2l4) - Joe Armstrong
- [The Naked Truth About Writing a Programming Language](https://www.digitalmars.com/articles/b90.html)
- [The Next Programming Language](https://www.youtube.com/watch?v=R2idkNdKqpQ&ab_channel=code%3A%3Adiveconference) - Douglas Crockford
- [The Next 700 Programming Languages](https://www.cs.cmu.edu/~crary/819-f09/Landin66.pdf)
- [The Slow March of Progress](https://earthly.dev/blog/programming-language-improvements/)
- [The Study of Programming Languages](https://cs.lmu.edu/~ray/notes/plstudy)
- [The Taxonomy of Reactive Programming](https://vsavkin.com/the-taxonomy-of-reactive-programming-d40e2e23dee4): Events and State; Deriving and Executing; Reified and Transparent; Composition; Implicit and Explicit Time; Self and External Observation; 
- [Three Things I Wish I Knew When I Started Designing Languages](https://www.youtube.com/watch?v=oa0qq75i9oc)
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

- [Languages I want to write](https://blog.wesleyac.com/posts/language-todos)
- [Less is more: language features](http://blog.ploeh.dk/2015/04/13/less-is-more-language-features/)
- [Let Arguments Go First](https://xnning.github.io/papers/let-arguments-go-first.pdf);
- [Notation as a Tool of Thought](https://dl.acm.org/doi/pdf/10.1145/358896.358899)
- [Open, extensible object models](https://piumarta.com/software/cola/objmodel2.pdf): "The artificial distinction between implementation language and end-user language can be eliminated by implementing the language using only end-user objects and messages, making the implementation accessible for arbitrary modification by programmers. We show that three object types and five methods are sufficient to bootstrap an extensible object model and messaging semantics that are described entirely in terms of those same objects and messages."
- [S-Expressions in Javascript](https://www.freecodecamp.org/news/s-expressions-in-javascript/)

### Books

- [A Retargetable C Compiler](/langdev/a-retargetable-c-compiler); makes use of literate programming (/languages/noweb)
- [A Compiler Writing Journey](https://github.com/DoctorWkt/acwj)
- [Basics of Compiler Design (Anniversary Edition)](http://www.diku.dk/~torbenm/Basics/) - Torben Mogensen
- [Compiler Construction](https://c9x.me/compile/bib/wirthcc.pdf) (PDF)
- [Compiler Design](https://www.goodreads.com/book/show/5205564-compiler-design-mar-15-2006-chattopadhyay-santanu)
- Compiler Design: Theory, Tools, and Examples - Seth D. Bergmann

    * [C/C++ Edition](http://elvis.rowan.edu/~bergmann/books/Compiler_Design/c_cpp/Text/C_CppEd.pdf) (PDF)
    * [Java Edition](http://elvis.rowan.edu/~bergmann/books/Compiler_Design/java/CompilerDesignBook.pdf) (PDF)

- [Compiler Design in C (1990)](http://www.holub.com/software/compiler.design.in.c.html) - Allen Holub, Prentice Hall
- [Compiling with Continuations](https://www.goodreads.com/book/show/2079575.Compiling_with_Continuations)
- [Compiling Scala for the Java Virtual Machine](http://lampwww.epfl.ch/~schinz/thesis-final-A4.pdf) - Michel Schinz (PDF)
- [Compiling Techniques (1969)](http://www.chilton-computing.org.uk/acl/literature/books/compilingtechniques/overview.htm) - F.R.A. Hopgood, Macdonald
- [Computer Language Notes: Compilers and Interpreters](https://github.com/melling/ComputerLanguages/blob/master/compilers.md)
- [Concepts of Programming Languages](/langdev/concepts-of-programming-languages)
- Control structures in programming languages: from goto to algebraic effects - https://xavierleroy.org/control-structures/
- [Discrete Mathematics for Computing](https://www.amazon.com/gp/product/0230216110/ref=sw_img_1)
- [Engineering a Compiler](/langdev/engineering-a-compiler)
- [Essentials of Compilation: An Incremental Approach](/langdev/essentials-of-compilation) - by Siek, Newton: A book about compiling Racket to x86-64 assembly
- [Essentials of Programming Languages](/langdev/essentials-of-programming-languages)
- Homotopy Type Theory - [Goodreads](https://www.goodreads.com/book/show/18106978-homotopy-type-theory)
- [How to Compile Your Language](https://isuckatcs.github.io/how-to-compile-your-language/)
- [How to Design Programs](https://htdp.org/) [Website](https://htdp.org/2020-8-1/Book/index.html)
- [Human-Centered Programming Languages](https://bookish.press/hcpl)
- [Introduction to Compilers and Language Design](https://www3.nd.edu/~dthain/compilerbook/compilerbook.pdf) ([PDF](/langdev/Intro_to_Compilers_and_Language_Design.pdf))
- Modern Compiler Design - [Amazon](https://www.amazon.com/Modern-Compiler-Design-Dick-Grune/dp/1461446988/ref=sr_1_1)
- Modern Compiler Implementation:
    - in C - [Amazon](https://www.amazon.com/Modern-Compiler-Implementation-Andrew-Appel/dp/0521607655)
    - in ML - [Amazon](https://www.amazon.com/Modern-Compiler-Implement-Andrew-Appel/dp/0521607647)
- Parsing Techniques: A Practical Guide - [Goodreads](https://www.goodreads.com/en/book/show/1756599) | [Amazon](https://www.amazon.com/Parsing-Techniques-Practical-Monographs-Computer-ebook/dp/B0017AMLL8/ref=sr_1_1)
- [Practical Foundations for Programming Languages](/langdev/practical-foundations-for-programming-languages)
- [Programming Language Pragmatics](https://www.cs.rochester.edu/~scott/pragmatics/) - Michael L Scott. Covers theoretical background behind languages beyond syntax.
- [Programming Languages: Application and Interpretation](/langdev/plai.html)
- [Programming languages and techniques (PDF)](http://www.seas.upenn.edu/~cis120/current/notes/120notes.pdf)
- [SOFTLANG team](http://www.softlang.org/book), Uni Koblenz-Landau - [Github](https://github.com/softlang)
- The Elements Of Computing Systems - [Amazon](https://www.amazon.com/Elements-Computing-Systems-second-Principles/dp/0262539802/ref=sr_1_1)

### Object-Oriented

* ["The concept of class invariant in object-oriented programming"](https://arxiv.org/pdf/2109.06557.pdf): "Class invariants — consistency constraints preserved by every operation on objects of a given type — are fundamental to building, understanding and verifying object-oriented programs. For verification, however, they raise difficulties, which have not yet received a generally accepted solution. The present work introduces a proof rule meant to address these issues and allow verification tools to benefit from invariants."

### Gradual Typing

- [Gradual Type Theory](https://arxiv.org/pdf/1811.02440.pdf)
- [Gradual Typing for Functional Languages](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=b7ca4b0e6d3119aa341af73964dbe38d341061dd)
- [Gradual Typing: A New Perspective](https://www.irif.fr/~gc/papers/popl19.pdf)

### Language Learnings

- [Another Go at Language Design](https://www.youtube.com/watch?v=7VcArS4Wpqk)
- [Bjarne Stroustrup : C++: evolving a useful language](https://www.youtube.com/watch?v=6jwOoIywnZE&ab_channel=BrownCS)
- [Clojure](https://github.com/imteekay/programming-language-research/tree/master/language-learning/clojure)
- [Elixir](https://github.com/imteekay/programming-language-research/tree/master/language-learning/elixir)
- [Haskell](https://github.com/imteekay/programming-language-research/tree/master/language-learning/haskell)
- [Ruby](https://github.com/imteekay/programming-language-research/tree/master/language-learning/ruby)
- [The Development of the C Language](https://www.bell-labs.com/usr/dmr/www/chist.pdf)
- [Rob Pike - What We Got Right, What We Got Wrong](https://www.youtube.com/watch?v=yE5Tpp2BSGw)
- [Typescript Compiler explained by the Author Anders Hejlsberg](https://www.youtube.com/watch?v=f6TCB61fDwY)
- [TypeScript Compiler Notes](https://github.com/microsoft/TypeScript-Compiler-Notes)
- [How the TypeScript compiler works](https://www.iamtk.co/series/the-typescript-compiler)

### PL Paradigms

- [Compiling with Continuations or without? Whatever](https://www.youtube.com/watch?v=cPBr59ECiRU&ab_channel=ACMSIGPLAN)
- [Continuation-passing style in JavaScript](https://matt.might.net/articles/by-example-continuation-passing-style)
- [Continuation-passing style](https://en.wikipedia.org/wiki/Continuation-passing_style)

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

---

[Implementing Functional Languages: A Tutorial](http://research.microsoft.com/en-us/um/people/simonpj/Papers/pj-lester-book/) - Simon Peyton Jones, David Lester

[Introduction to Compilers and Language Design](https://www3.nd.edu/~dthain/compilerbook/compilerbook.pdf) | [Introduction to Compilers and Language Design](http://compilerbook.org/) - Douglas Thain (PDF)

[Let's Build a Compiler](http://www.stack.nl/~marcov/compiler.pdf) (PDF)

[Practical and Theoretical Aspects of Compiler Construction](http://web.stanford.edu/class/archive/cs/cs143/cs143.1128/) (class lectures and slides)

[Resources for Amateur Compiler Writers](http://c9x.me/compile/bib/)

[Semantics Engineering with PLT Redex](http://redex.racket-lang.org/): The PhD-level programming languages course at Northeastern uses the Redex book, and I found it to be a good introduction. The tool itself ([Redex](http://docs.racket-lang.org/redex/index.html)) is a great way to experiment with semantics, including reduction relations (roughly, the part of the semantics that says how the program runs) and type systems. You could use this book as a substitute for TAPL (at least for learning the basics of formal semantics), or you could use Redex to experiment with the languages described in TAPL.

[mpri-2.4-public](https://gitlab.inria.fr/fpottier/mpri-2.4-public): Resources for course MPRI 2-4 on functional programming and type systems.

["Bits of History, Words of Advice"](http://gbracha.blogspot.com/2020/05/bits-of-history-words-of-advice.html): The creator of [Newspeak](/languages/smalltalk/newspeak) and one of the core developers working on [Java](/languages/jvm/java) and the [JVM](/platforms/jvm) offers some advice about Smalltalk's lack of success in the mainstream.

* **Runtime Semantics**:
	* ["Open, Extensible Object Models"](https://www.piumarta.com/software/cola/objmodel2.pdf): "We show that three object types and five methods are sufficient to bootstrap an extensible object model and messaging semantics that are described entirely in terms of those same objects and messages." ([Source](https://www.piumarta.com/oopsla07/))
