title=Clean Architecture
tags=reading, books, architecture, design
summary=Bob Martin's screed on architecture. Captured for pedagogical analysis.
~~~~~~
*(by Robert Martin, aka "Uncle Bob", aka "the most misogynistic man in tech")*

# Part I: 
# 1: What is Design and Architecture?
"I’ll assert that there is no difference between [design and architecture]. None at all. ... The word “architecture” is often used in the context of something at a high level that is divorced from the lower-level details, whereas “design” more often seems to imply structures and decisions at a lower level. " Does his home have an architecture? It is the shape of the room, etc, but architecture diagrams provide an immense number of details. *(Fallacy: database logical schema vs physical schema, as a counter-example)* "The low-level details and the high-level structure are all part of the same whole. They form a continuous fabric that defines the shape of the system. You can’t have one without the other; indeed, no clear dividing line separates them." *(Disagree: design is the expression of code one level above the first-class citizen level of the language being used. Architecture is the set of decisions made ahead of time for developers, so that they are doing the "right" thing--by the project's standards and influenced by its problems--by default. They overlap, they influence each other, but architecture is clearly apart from design.)*

"**The goal of software architecture is to minimize the human resources required to build and maintain the required system.** The measure of design quality is simply the measure of the effort required to meet the needs of the customer. If that effort is low, and stays low throughout the lifetime of the system, the design is good. If that effort grows with each new release, the design is bad."

[Anonymized case study showing engineering growth growing yet productivity declining.]

[Tortoise v the Hare; counterexample is a 6-day experiment of one developer writing with TDD, and one day without.] "The only way to go fast, is to go well." *(The apples-to-oranges nature of the comparison here is just appalling. Nobody argues that quick-and-dirty yields great results every time--but the arrogance to assert that quick-and-dirty is never acceptable, particularly when executives are agreed on the consequences of doing so, is just beyond credulity.)*

# 2: A Tale of Two Values

"Every software system provides two different values to the stakeholders: behavior and structure. Software developers are responsible for ensuring that both those values remain high. Unfortunately, they often focus on one to the exclusion of the other. Even more unfortunately, they often focus on the lesser of the two values, leaving the software system eventually valueless."

**Behavior**: "Programmers are hired to make machines behave in a way that makes or saves money for the stakeholders. *(Not all software is just about saving money for stakeholders.)* We do this by helping the stakeholders develop a functional specification, or requirements document. *(Fascinating, because this sounds vaguely waterfall-ish, and Bob supposedly embraces agile.)* Then we write the code that causes the stakeholder's machines to satisfy those requirements." 

**Architecture**: "The second value of software has to do with the word "software" ... Software was invented to be "soft." It was intended to be a way to easily change the behavior of machines. Software was invented to be “soft.” It was intended to be a way to easily change the behavior of machines. ... When the stakeholders change their minds about a feature, that change should be simple and easy to make. The difficulty in making such a change should be proportional only to the scope of the change, and not to the shape of the change."

"If you ask the business managers, they’ll often say that it’s more important for the software system to work. Developers, in turn, often go along with this attitude. But it’s the wrong attitude. I can prove that it is wrong with the simple logical tool of examining the extremes.

* "If you give me a program that works perfectly but is impossible to change, then it won’t work when the requirements change, and I won’t be able to make it work. Therefore the program will become useless.
* "If you give me a program that does not work but is easy to change, then I can make it work, and keep it working as requirements change. Therefore the program will remain continually useful."

[Important/Urgent matrix]

"The first value of software—behavior—is urgent but not always particularly important. The second value of software—architecture—is important but never particularly urgent."

[Exhortation to "fight for the architecture"]

# Part II: Programming Paradigms

"Paradigms are ways of programming, relatively unrelated to languages. A paradigm tells you which programming structures to use, and when to use them. To date, there have been three such paradigms." *(Not true, there've been numerous paradigms, many of which overlap. See [VanRoy](/languages/paradigms-for-dummies). And VanRoy really ignores [AOP](/reading/aspect-oriented) entirely to boot.)*

# 3: Paradigm Overview

An overview chapter on structured programming, object-oriented programming, and functional programming. Summarized as follows:

* "Structured programming imposes discipline on direct transfer of control."
* "Object-oriented programming imposes discipline on indirect transfer of control."
* "Functional programming imposes discipline upon assignment."

*(All three of these are really incorrect analyses, because he wants to emphasize discipline on the developer. It's a very shallow and pretty unidimensional view of each.)*

# 4: Structured Programming

[History of Dijkstra] "The problem that Dijkstra recognized, early on, was that programming is hard, and that programmers don’t do it very well. A program of any complexity contains too many details for a human brain to manage without help. Overlooking just one small detail results in programs that may seem to work, but fail in surprising ways." *(Language designers refer to this in the large as "separation of concerns".)* "Dijkstra’s solution was to apply the mathematical discipline of proof. His vision was the construction of a Euclidian hierarchy of postulates, theorems, corollaries, and lemmas. Dijkstra thought that programmers could use that hierarchy the way mathematicians do. In other words, programmers would use proven structures, and tie them together with code that they would then prove correct themselves. ... The very control structures that made a module provable were the same minimum set of control structures from which all programs can be built. Thus structured programming was born."

["Goto Considered Harmful"]

"Structured programming allows modules to be recursively decomposed into provable units, which in turn means that modules can be functionally decomposed. That is, you can take a large-scale problem statement and decompose it into high-level functions." *(Or you could take small problems, collect them into a function, and build up that way--top-down or bottom-up.)* "But the proofs never came. The Euclidean hierarchy of theorems was never built. And programmers at large never saw the benefits of working through the laborious process of formally proving each and every little function correct. In the end, Dijkstra’s dream faded and died. Few of today’s programmers believe that formal proofs are an appropriate way to produce high-quality software." *(Academics are constantly chasing that dream, as are language designers--every language-generation or so has an effort towards provably-correct code, the most recent having found roots in the pure-functional-language world.)*

"Science is fundamentally different from mathematics, in that scientific theories and laws cannot be proven correct. ... They are falsifiable but not provable. ... Science does not work by proving statements true, but rather by proving statements false. Those statements that we cannot prove false, after much effort, we deem to be true enough for our purposes." *(Here comes the argument for TDD)* "... a program can be proven incorrect by a test, but it cannot be proven correct. All that tests can do, after sufficient testing effort, is allow us to deem a program to be correct enough for our purposes."

# 5: Object-Oriented Programming
What is O-O? "One answer to this question is “The combination of data and function.” Although often cited, this is a very unsatisfying answer because it implies that `o.f()` is somehow different from `f(o)`. This is absurd. Programmers were passing data structures into functions long before 1966, when Dahl and Nygaard moved the function call stack frame to the heap and invented OO." *(Bob blithely assumes that the paradigm must be tied to the language--in fact, yes, the union of state and behavior is the principal focus of objects, and you can express that paradigm in languages that don't have objects as first-class citizens. C did it with GUI applications for many years before C++ came along. Paradigms are concepts, and languages are expressions of concepts, making it much easier to write code in a particular paradigm if you use a language that embraces that same paradigm.)*

"Some folks fall back on three magic words to explain the nature of OO: encapsulation, inheritance, and polymorphism. The implication is that OO is the proper admixture of these three things, or at least that an OO language must support these three things." *(Warning: Strawman argument coming up.)*

Encapsulation: C had "perfect" encapsulation, then C++ broke it, and Java/C# refuse to allow for separation of declaration and definition. *(Not surprisingly, he is skating very fast over lots of details here in his rush to prove a meaningless point.)*

Inheritance: Again with the "we had this in C" discussion, relying on C compiler behavior to not rearrange order of fields in a struct to provide "effective" substitution capabilities of a `NamedPoint` for a `Point`. *(Never mind the fact that there was zero compiler enforcement or recognition of the relationship, and therefore these two could easily drift out of sync and lead to extremely subtle bugs that would only manifest at runtime.)*

*(Readers may get the feeling that Bob wants to go back to the days of C. This is common among the elderly.)*

Polymorphism: UNIX and its "everything is a file"/file descriptors design as an example of polymorphic behavior. *(He's falling back again on the "because we could do this before by hand, it's not that interesting to have" argument. Ironically, it's the exact opposite of Dijkstra's argument earlier: We could always do structured programming in assembly by using `goto` as necessary to implement it. It's a hugely inconsistent argument.)* "The bottom line is that polymorphism is an application of pointers to functions." *(Yup, I heard this argument from C programmers about C++ way back in the day.)* "OO languages may not have given us polymorphism, but they have made it much safer and much more convenient. ... Using an OO language makes polymorphism trivial. That fact provides an enormous power that old C programmers could only dream of. On this basis, we can conclude that OO imposes discipline on indirect transfer of control." *(That was some pretty fast skating there.)*

Power of polymorphism lies in being able to abstract without details. [Example of a copy program, where the source or target can be any file descriptor]

"module HL1 calls the F() function in module ML1. The fact that it calls this function through an interface is a source code contrivance. At runtime, the interface doesn’t exist. HL1 simply calls F() within ML1. ... Note, however, that the source code dependency (the inheritance relationship) between ML1 and the interface I points in the opposite direction compared to the flow of control. This is called dependency inversion, and its implications for the software architect are profound." *(That... really isn't what dependency inversion refers to, at least not among the people who coined the term.)* "With this approach, software architects working in systems written in OO languages have absolute control over the direction of all source code dependencies in the system. They are not constrained to align those dependencies with the flow of control. No matter which module does the calling and which module is called, the software architect can point the source code dependency in either direction. ... you can rearrange the source code dependencies of your system so that the database and the user interface (UI) depend on the business rules, rather than the other way around. ... This means that the UI and the database can be plugins to the business rules. It means that the source code of the business rules never mentions the UI or the database. As a consequence, the business rules, the UI, and the database can be compiled into three separate components or deployment units (e.g., jar files, DLLs, or Gem files) that have the same dependencies as the source code. The component containing the business rules will not depend on the components containing the UI and database. In turn, the business rules can be deployed independently of the UI and the database. Changes to the UI or the database need not have any effect on the business rules. Those components can be deployed separately and independently. In short, when the source code in a component changes, only that component needs to be redeployed. This is independent deployability. If the modules in your system can be deployed independently, then they can be developed independently by different teams. That’s independent developability."

*(This is all great in theory, but in practice, it never manifests this way. Tellingly, there's no example here, even a simple one.)*

# 6: Functional Programming

[Example: Squaring the first 25 integers in Java, Clojure/Lisp] "Variables in functional languages do not vary." *(sigh. That's why they usually don't get called variables, but values. Or name-value bindings. And only in pure-functional languages. And...)*

[Concurrency and immutability] "One of the most common compromises in regard to immutability is to segregate the application, or the services within the application, into mutable and immutable components. The immutable components perform their tasks in a purely functional way, without using any mutable variables. The immutable components communicate with one or more other components that are not purely functional, and allow for the state of variables to be mutated. Since mutating state exposes those components to all the problems of concurrency, it is common practice to use some kind of transactional memory to protect the mutable variables from concurrent updates and race conditions." *(Not sure where he's getting that STM is 'common practice'; it certainly isn't in any system I'm familiar with....)*

[Event sourcing] *(Greg Young strikes again)*

# Part III: Design Principles

* **SRP: The Single Responsibility Principle**: An active corollary to Conway’s law: The best structure for a software system is heavily influenced by the social structure of the organization that uses it so that each software module has one, and only one, reason to change.
* **OCP: The Open-Closed Principle**: Bertrand Meyer made this principle famous in the 1980s. The gist is that for software systems to be easy to change, they must be designed to allow the behavior of those systems to be changed by adding new code, rather than changing existing code.
* **LSP: The Liskov Substitution Principle**: Barbara Liskov’s famous definition of subtypes, from 1988. In short, this principle says that to build software systems from interchangeable parts, those parts must adhere to a contract that allows those parts to be substituted one for another.
* **ISP: The Interface Segregation Principle**: This principle advises software designers to avoid depending on things that they don’t use.
* **DIP: The Dependency Inversion Principle**: The code that implements high-level policy should not depend on the code that implements low-level details. Rather, details should depend on policies.

# Part IV: Component Principles

# 12: Components

"Components are the units of deployment. They are the smallest entities that can be deployed as part of a system." *(Not exactly, but it's not a terrible summation of Szyperski.)*

[PDP history around linking and loading and relocation] *(I have really no idea what his point here is with this.)*

# 13: Component Cohesion

* **REP: The Reuse/Release Equivalence Principle** (The granule of reuse is the granule of release)

* **CCP: The Common Closure Principle**

* **CRP: The Common Reuse Principle**


# 14: Component Coupling

# Part V: Architecture
# 15: What is Architecture?

# 16: Independence

# 17: Boundaries: Drawing Lines

# 18: Boundary Anatomy

# 19: Policy and Level

# 20: Business Rules

# 21: Screaming Architecture

# 22: The Clean Architecture

# 23: Presenters and Humble Objects

# 24: Partial Boundaries

# 25: Layers and Boundaries

# 26: The Main Component

# 27: Services: Great and Small

# 28: The Test Boundary

# 29: Clean Embedded Architecture

# Part VI: Details
# 30: The Database is a Detail

# 31: The Web is a Detail

# 32: Frameworks are Details

# 33: Case Study: Video Sales

# 34: The Missing Chapter

# Part VII: Appendix

# A: Architecture Archaeology
