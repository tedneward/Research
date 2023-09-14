title=Languages reading
tags=reading, language
summary=A collection of links and articles on different programming languages.
~~~~~~

["7 Ur-languages"](https://madhadron.com/programming/seven_ur_languages.html):

* ALGOL

    **Characteristics.** Programs consist of sequences of assignments, conditionals, and loops, organized into functions. Many languages add module systems, ways of defining new data types, polymorphism, or alternate control flow constructs like exceptions or coroutines.

    **Examples.** Most common programming languages trace to this ur-language. ALGOL itself included ALGOL 58, ALGOL 60, ALGOL W, and ALGOL 68. Assembly languages for mainstream processors, Fortran, C, C++, Python, Java, C#, Ruby, Pascal, JavaScript and Ada all trace to this ur-language.

    **History.** This is the oldest ur-language, going back to Ada Lovelace formulating programs for Babbage’s analytical engine. The machine and assembly languages for all Eckert-Mauchly architecture computers, going back to EDVAC and the first Univacs were of this form, as were all early attempts at higher level languages, starting with Grace Hopper’s A-0 and going through Fortran and COBOL. In the 1960’s the academic computer science community developed structured programming to make programming in these languages more manageable, which led to ALGOL 60, which basically all members of the class derive from.

    Over time, members of this family accrete features taken from other ur-languages. In the 1980’s, notions from the Self ur-language were grafted onto many of these language in the form of classes as a way to define data types and do polymorphism. Since 2010, ideas from the ML ur-language have been appearing.

* Lisp

    **Characteristics.** Lisp consists of prefix expressions enclosed in parentheses. This syntax seems bizarre, but the language also has a built-in representation of lists as a data structure as parentheses around the space separated items (e.g., (1 2 3 4)). Thus the code is in the form of a list, and Lisp systems let you define macros that take a list, modify it, and pass that modified code to the compiler.

    Lisps tend to behave like some other ur-language when writing most code (usually ALGOL or ML), but are distinguished by the macro system that lets the programmer redefine the semantics of the language. Common Lisp, for example, has a loop syntax, but it is defined as a macro, not built into the language.

    **Examples.** There were many early Lisps, but the community achieved a consensus in Common Lisp. Meanwhile, Sussman and Steele explored how much could be done with functions and produced Scheme. Several other special purpose Lisps such as Lush (for numerical computing), AutoLISP (the scripting language for AutoCAD), and Emacs Lisp (the language used to implement editing behavior in the Emacs editor) have been used. In recent years Clojure has emerged as a third major branch of the Lisp family.

    **History.** Lisp is about a year younger than Fortran, which makes it the second oldest language still in use today. Its origins were in a purely mathematical question: how do you write down a mathematical structure you can define that can evaluate its own expressions? John McCarthy provided an answer in 1958, which then got implemented on a computer. That mathematical background made early Lisps awkward fits for the machines they were on. Questions about memory and CPU cycles were irrelevant to the mathematics, and things like garbage collection had to be invented to make it work.

    There was a period in the late 1970’s and early 1980’s when machines were specially built to run Lisp from the ground up. Much of today’s integrated development environments was invented on those machines. Lisp itself was the vehicle of choice for most artificial intelligence research in that period, and when artifical intelligence’s hype in the 1980’s failed to deliver, the field, and Lisp with it, crashed into what is called the “AI Winter.” Lisps remain stubbornly alive to this day, especially as computers gained power and other languages adopted many of the features that originally made them awkward to implement.

* ML (functional languages)

    **Characteristics.** ML languages are defined by functions being first class values and a type system in the Hindley-Milner family that is adequate to represent different kinds of functions and tagged unions. All iteration is done by recursion, as in

        sum : list of int -> int
        sum [] = 0
        sum (x:xs) = x + sum xs

    or by defining functions that encapsulate the iteration pattern and take another function to implement the behavior.

        map : ('a -> 'a) -> list of 'a -> list of 'a
        map _ [] = []
        map f (x:xs) = (f x) : (map f xs)

    Some languages in the family (Miranda and Haskell) are lazy by default, that is, they do not evaluate anything until it is actually needed. Others explore extensions of the type system in various directions. OCaml attempts to merge notions from the Self ur-language. Agda and Idris mix values and types (what is called dependent type systems) and 1ML mixes modules and types.

    **Examples.** ML spawned CaML (Cambridge ML), Standard ML, OCaml, and a whole related family such as Miranda, Haskell, and today the dependently typed languages like Agda and Idris.

    **History.** ML was the metalanguage (thus the name) for a theorem proving program developed in Cambridge, England. The language escaped from that context and was popular in Europe, particularly in England and France.

* Self (object-oriented languages)

    **Characteristics.** A program consists of a set of objects that can receive and send messages to each other. All behavior is implemented in this way. You create a new object by sending a message to an existing object. You do conditionals by having a variable which refers to either the true object or the false object. Both take a message with two parameters, a function to run on true, and a function to run on false. The true object runs the first function. The false object runs the second. The calling code does not know which it is sending to, only that it is sending a message. Loops are the same. Indeed, by creating and inserting appropriate objects into the right places you can entirely redefine the semantics of the language.

    These languages usually have their source stored in a live environment rather than text files. The programmer modifies the live system and saves its new state rather than compile files to produce a system.

    **Examples.** The two important examples are Smalltalk and Self. A whole range of languages implement message passing to objects in some subset of the language. This kind of partial import is usually referred to as “object oriented programming.” Most of these are modeled on Smalltalk. JavaScript is the exception, and derives from Self’s classless object system.

    The ideas were taken in two other important directions.

    First, Common Lisp’s object system generalized the idea of choosing what code is run based on what object receives a message. It disconnects behavior from the objects and instead the runtime chooses which behavior to run based on all the parameters involved, not just one.

    Second, Erlang switched the notion of a thread of execution jumping from object to object to run various code and instead had parallel threads of execution that explicitly listen for and send messages.

    **History.** Smalltalk was the original language, developed at Xerox Parc in the late 1970’s and 1980’s. There were a variety of commercial Smalltalk systems in the 1980’s, and IBM used Smalltalk to develop its programming tools for other languages (the collection of tools known as VisualAge). Today Smalltalk largely survives as the open source Pharo Smalltalk.

    A lot of work was done on how to make Smalltalk run fast and efficiently, culminating in the Strongtalk project. Strongtalk is historically important because its discoveries became the basis of the HotSpot just-in-time compiler for Java.

    Smalltalk inherited the notion of a value and its type from earlier languages, and implemented the idea of a class. All objects had a class that gave their type, and the class was used to construct objects of that type. Self disposed of the notion of class and worked solely with objects. As this is a purer form, I have chosen Self as the type specimen for this ur-language.

* Forth (stack languages)

    **Characteristics.** Stack languages are an inverse of Lisp, and share the grammar of Hewlett Packard reverse Polish notation calculators. They have a data stack. When you write a literal like the number 42, it is pushed to the stack. When you write the name of a function, it takes no explicit parameters. Instead it operates on the stack. Simple arithmetic looks quite backwards

        2 3 + 5 *
    
    and function definitions are equally terse. In most Forth variants, : defines a new word, in this case square. When square is called it is the same as calling dup, which duplicates the top element of the stack, followed by *, which multiplies the top two elements.

        : square dup * ;

        3 square

    Forth allows programmers to intercept the parser and replace it with their own code, so the grammar is entirely replaceable. It is common to see Forth programs that define small languages, such as a Fortran subset or a way to directly ASCII parse diagrams giving packet layouts or the transitions of state machines.

    **Examples.** Forth in all its many variants, PostScript, Factor, Joy (a purely functional language that uses a mathematical formulation of composition in place of the stack).

    **History.** Forth was originally written in 1970 to control radio telescopes, but then spread broadly in embedded systems. It is sufficiently easy to bootstrap a Forth system that there are dozens of variations created by different programmers for thir own purposes.

    PostScript emerged in the 1980’s as a flexible means to describe documents to printers. It is much more limited in many ways than Forth, but defines primitives related to graphical layouts in the language.

* APL (array languages)

    **Characteristics.** Everything in the language is an (n dimensional) array. Operators are one or two symbols long, and implement high level operations over these arrays. The result is so terse that the sequences of symbols become the label for an operation rather than giving it another name. For example, to calculate the average of an array in variable x, you would write

        (+⌿÷≢) x

    **Examples.** APL, J, K. The higher order operations over arrays have been partially exported into many environments, such as MATLAB, NumPy, and R.

    **History.** APL began as a mathematical notation created by Kenneth Iverson in the 1960’s. He then implemented it on a computer. It has enjoyed a niche following ever since among people doing heavy calculations. Its descendant, K, was very popular in financial settings.

* Prolog (logic languages)

    **Characteristics.** Programs consist of facts, either “ground” facts such as Bob is Ed and Jane’s father,

        father(bob, ed).
        father(bob, jane).

    or non-ground facts which define how to derive a fact from other facts by putting in variables (which are capitalized)

        grandfather(X, Y) :- father(X, Z), father(Z, Y).
    
    Prolog runtimes take these facts and a query on them and searches for a result for the query. And it turns out that if you choose the right structure for defining facts, this is Turing complete.

    The terms that form facts in Prolog are a native data type in their own right that can be created and then fed to the runtime, the same way that Lisp’s macros or Forth’s parser replacement work.

    Because Prolog programs are basically searches, they are tuned rather the way database queries are, adjusting the order in which things are searched and cutting off paths that will not yield anything as early as possible.

    **Examples.** Prolog, Mercury, Kanren. The vast majority of programming around this ur-language takes place in Prolog itself — the community is impressively unified.

    **History.** In the 1970’s, logicians in France realized that they could express programs in terms of first order logic, and began trying to implement this. In the 1980’s the Japanese fifth generation computer project bet heavily on Prolog, and when that project failed, Prolog went down in reputation with it.

    Meanwhile, decades of research continued into how to make Prolog runtimes smart enough to be efficient in most cases and how to add new capabilities, such as numerical constraints (yielding constraint logic programming).

    Prolog tends to show up in niches. Type checking for Java was for many years implemented in Prolog, as was Facebook’s original source code search tool.

---

[Aspect-Oriented](../aspect-oriented)

[Functional](../functional)

* [Monads](../monads)

Literate

* [nuweb](/languages/nuweb)

Logic

* [A Very Gentle Intro to Logic Programming](../avergentleintrotologicprog.html)

[Meta-object protocols (MOP)](../metaobjectprotocol.html)

[Multi-paradigm Design](../multi-paradigm-design.html)

Object-oriented

* [Object capabilities](../object-capability.html)
* [Object thinking](../object-thinking.html)
* [Foundations of Object Oriented Languages](https://www.cs.cmu.edu/~aldrich/FOOL/FOOL1/FOOL1-report.pdf) ([PDF](../FOOL1-report.pdf))

Miscellaneous

- [Syntax across languages](http://rigaux.org/language-study/syntax-across-languages.html): One large page of comprehensive syntax across languages
- [Hyperpolyglot](https://hyperpolyglot.org/): commonly used features in a side-by-side format
- [Concurrency is not Parallelism](https://vimeo.com/49718712)
- ["Dimensional Analysis in Programming Languages: A survey of existing designs/implementations for automatic conversion and verification of units of measurement in computer programs"](https://gmpreussner.com/research/dimensional-analysis-in-programming-languages)
- [CS 7194 - Great works in Programming Languages](https://www.cs.cornell.edu/courses/cs7194/2019sp/): A course on examining the "great works" (written) about programming languages
- [Great Works in Programming Languages](https://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) Collected by Benjamin C. Pierce
- [Flow based Programming](http://jpaulmorrison.com/fbp/) - J Paul Morrison
- [Introduction to Functional Programming](http://www.cl.cam.ac.uk/teaching/Lectures/funprog-jrh-1996/) - J. Harrison
- [Making Sense of Stream Processing](https://assets.confluent.io/m/2a60fabedb2dfbb1/original/20190307-EB-Making_Sense_of_Stream_Processing_Confluent.pdf) - Martin Kleppmann (PDF)
- [Mostly Adequate Guide to Functional Programming](https://mostly-adequate.gitbooks.io/mostly-adequate-guide/content/) - Mostly Adequate Core Team
- [The Pure Function Pipeline Data Flow v3.0 ---- the Grand Unified Programming Theory](https://github.com/linpengcheng/PurefunctionPipelineDataflow) - Lin Pengcheng
- [ProLaLa2022](https://github.com/dsyme/ProLaLa2022): "Archival material for "Programming Languages and the Law" 2022 Keynote" (DSyme); [@dsymetweets](https://twitter.com/dsymetweets/status/1482835211582906374): "Before I ever programmed in a functional language, while still a student, I worked as a C and Prolog programmer on a set of tools called STATUTE for modelling and automating adminstrative law. STATUTE eventually became Oracle Policy Modelling now Oracle Intelligent Advisor today / STATUTE made key design decisions about using limited natural language to achieve "practical isomorphism" between legislation/policy structure and the rules that form the implementation as a program. / This decision - made in a garage in Australia in 1989 by David Mead - cut programmers out of the loop, creating a form of end-user programming for those trained in law and policy. / This decision - made in a garage in Australia in 1989 by David Mead - cut programmers out of the loop, creating a form of end-user programming for those trained in law and policy. / If you feel like you're a PL guru and you've "seen it all" in how programming+logic can be delivered as a usable tool, I'd encourage you to watch Davin's demo from [the keynote](https://youtu.be/bLob9Ah1004). Conceptually it opens up a different kind of tooling for domains dominated by language and policy."
- [SXML](https://en.m.wikipedia.org/wiki/SXML)
- [X-expressions-in-XMLisp](https://www.semanticscholar.org/paper/X-expressions-in-XMLisp%3A-S-expressions-and-markup-Repenning-Ioannidou/7da9239a5a365593ba5437dca58b2ffc4620062e)
