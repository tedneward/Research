title=Programming Paradigms for Dummies: What Every Programmer Should Know
tags=language, reading
summary=Notes from the VanRoy paper.
~~~~~~

[Paper (PDF)](https://www.info.ucl.ac.be/~pvr/VanRoyChapter.pdf)

* **Languages, paradigms, and concepts** Section 2 explains what programming paradigms are and gives a taxonomy of the main paradigms. If your experience is limited to one or just a few programming languages or paradigms (e.g., object-oriented programming in Java), then you will find a much broader viewpoint here. We also explain how we organize the paradigms to show how they are related. We find that it is certainly not true that there is one “best” paradigm, and a fortiori this is not object-oriented programming! On the contrary, there are many useful paradigms. Each paradigm has its place: each has problems for which it gives the best solution (simplest, easiest to reason about, or most efficient). Since most programs have to solve more than one problem, it follows that they are best written in different paradigms. *("From each language, according to its abilities, to each project according to its needs." --Ted Neward)*
* **Designing a language and its programs** Section 3 explains how to design languages to support several paradigms. A good language for large programs must support several paradigms. One approach that works surprisingly well is the dual-paradigm language: a language that supports one paradigm for programming in the small and another for programming in the large. Another approach is the idea of designing a definitive language. We present an example design that has proved itself in four different areas. The design has a layered structure with one paradigm in each layer. Each paradigm is carefully chosen to solve the successive problems that appear. We explain why this design is good for building large-scale software.
* **Programming concepts** Section 4 explains the four most important concepts in programming: records, lexically scoped closures, independence (concurrency), and named state. Each of these concepts gives the programmer an essential expressiveness that cannot be obtained in any other way. These concepts are often used in programming paradigms.
* **Data abstraction** Section 5 explains how to define new forms of data with their operations in a program. We show the four kinds of data abstractions: objects and abstract data types are the two most popular, but there exist two others, declarative objects and stateful abstract data types. Data abstraction allows to organize programs into understandable pieces, which is important for clarity, maintenance, and scalability. It allows to increase a language’s expressiveness by defining new languages on top of the existing language. This makes data abstraction an important part of most paradigms.
* **Deterministic concurrent programming** Section 6 presents deterministic concurrent programming, a concurrent model that trades expressiveness for ease of programming. It is much easier to program in than the usual concurrent paradigms, namely shared-state concurrency and message-passing concurrency. It is also by far the easiest way to write parallel programs, i.e., programs that run on multiple processors such as multi-core processors. We present three important paradigms of deterministic concurrency that deserve to be better known. The price for using deterministic concurrency is that programs cannot express nondeterminism, i.e., where the execution is not completely determined by the specification. For example, a client/server application with two clients is nondeterministic since the server does not know from which client the next command will come. The inability to express nondeterminism inside a program is often irrelevant, since nondeterminism is either not needed, comes from outside the program, or can be limited to a small part of the program. In the client/server application, only the communication with the server is nondeterministic. The client and server implementations can themselves be completely deterministic.
* **Constraint programming** Section 7 presents the most declarative paradigm of our taxonomy, in the original sense of declarative: telling the computer what is needed instead of how to calculate it. This paradigm provides a high level of abstraction for solving problems with global conditions. This has been used in the past for combinatorial problems, but it can also be used for many more general applications such as computer-aided composition. Constraint programming has achieved a high degree of maturity since its origins in the 1970s. It uses sophisticated algorithms to find solutions that satisfy global conditions. This means that it genuinely delivers on its ambitious claims.

#### Section 2: Languages, paradigms, and concepts

There is a mapping of languages -> paradigms -> concepts: Each language realizes one or more paradigms, each paradigm consists of a set of concepts. "Each paradigm is defined by a set of programming concepts, organized into a simple core language called the paradigm’s *kernel language*." 27 paradigms described in the taxonomy; "of these 27 boxes, eight contain two paradigms with different names but similar concepts." Concepts contain basic primitive elements used to construct the paradigms. "Often two paradigms that seem quite different differ by just one concept." "A paradigm almost always has to be Turing complete to be practical."

![](http://imgur.com/fOG5sR2)

"[Figure 2](http://www.info.ucl.ac.be/people/PVR/paradigmsDIAGRAMeng108.pdf) shows two important properties of the paradigms: whether or not they have observable determinism and how strongly they support state."

**Observable nondeterminism**: nondeterminism is when the execution of a program is not completely determined by its specification, i.e., at some point during the execution the specification allows the program to choose what to do next. During the execution, this choice is made by a part of the run-time system called the *scheduler*. The nondeterminism is observable if a user can see different results from executions that start at the same internal configuration. This is highly undesirable. A typical effect is a race condition, where the result of a program depends on precise differences in timing between different parts of a program (a "race"). This can happen when the timing affects the choice made by the scheduler. But paradigms that have the power to express observable nondeterminism can be used to model real-world situations and to program independent activities.

We conclude that observable nondeterminism should be supported only if its expressive power is needed. This is especially true for concurrent programming. For example, the Java language can express observable nondeterminism since it has both named state and concurrency (see below). This makes concurrent programming in Java quite difficult [29]. Concurrent programming is much easier with the declarative concurrent paradigm, in which all programs are deterministic. Sections 6 and 7 present four important concurrent paradigms that do not have observable nondeterminism.

**Named state**: "State is the ability to remember information, or more precisely, to store a sequence of values in time. Its expressive power is strongly influenced by the paradigm that contains it. We distinguish three axes of expressiveness, depending on whether the state is unnamed or named, deterministic or nondeterministic, and sequential or concurrent. This gives eight combinations in all. Later in this chapter we give examples of many of these combinations. Not all of the combinations are useful. (The below) shows some useful ones arranged in a lattice:

```
Declarative paradigms (relational and functional): unnamed, deterministic, sequential
        |                                           |
        v                                           v
Imperative programming:                 Deterministic concurrency:
named, deterministic, sequential        unnamed, deterministic, concurrent
        |                                           |
        V                                           V
Guarded command programming:            Concurrent logic programming:
named, nondeterministic, sequential     unnamed, nondeterministics, concurrent
        \                                           /
         \                                         /
        Message-passing and shared-state concurrency:
        named, nondeterministic, concurrent
```

One intriguing box shown is Dijkstra’s guarded command language (GCL) [14]. It has named state and nondeterministic choice in a sequential language. It uses nondeterministic choice to avoid overspecifying algorithms (saying too much about how they should execute)."

"The paradigms in Figure 2 *(above)* are classified on a horizontal axis according to how strongly they support state. This horizontal axis corresponds to the vertical axis *("Less" at the top, "More" at the bottom)* in the lattice above. Let us follow the line from top to bottom. The least expressive combination is functional programming (threaded state, e.g., DCGs in Prolog and monads in functional programming: unnamed, deterministic, and sequential). Adding concurrency gives declarative concurrent programming (e.g., synchrocells: unnamed, deterministic, and concurrent). Adding nondeterministic choice gives concurrent logic programming (which uses stream mergers: unnamed, nondeterministic, and concurrent). Adding ports or cells, respectively, gives message passing or shared state (both are named, nondeterministic, and concurrent). Nondeterminism is important for real-world interaction (e.g., client/server). Named state is important for modularity (see Section 4.4)."

![](https://www.semanticscholar.org/paper/Programming-paradigms-for-dummies%3A-what-every-know-Roy/6a23352d49678bb429d24fb127d6c18eecc2d950/figure/5)

"Figure 4 (above) gives a view of computer programming in the context of general system design." "The two axes represent the main properties of systems: complexity (the number of basic interacting components) and randomness (how nondeterministic the system’s behavior is). There are two kinds of systems that are understood by science: aggregates (e.g., gas molecules in a box, understood by statistical mechanics) and machines (e.g., clocks and washing machines, a small number of components interacting in mostly deterministic fashion). ***The large white area in the middle is mostly not understood.*** *(Emphasis mine)* The science of computer programming is pushing inwards the two frontiers of system science: computer programs can act as highly complex machines and also as aggregates through simulation. Computer programming permits the construction of the most complex systems."

##### 2.3: Creative extension principle
"This principle ... gives us a guide for finding order in the vast set of possible paradigms. In a given paradigm, it can happen that programs become complicated for technical reasons that have no direct relationship to the specific problem that is being solved. This is a sign that there is a new concept waiting to be discovered. To show how the principle works, assume we have a simple sequential functional programming paradigm. Then here are three scenarios of how new concepts can be discovered and added to form new paradigms:

* "If we need to model several independent activities, then we will have to implement several execution stacks, a scheduler, and a mechanism for preempting execution from one activity to another. All this complexity is unnecessary if we add one concept to the language: *concurrency*.
* "If we need to model updatable memory, that is, entities that remember and update their past, then we will have to add two arguments to all function calls relative to that entity. The arguments represent the input and output values of the memory. This is unwieldy and it is also not modular because the memory travels throughout the whole program. All this clumsiness is unnecessary if we add one concept to the language: *named state*.
* "If we need to model error detection and correction, in which any function can detect an error at any time and transfer control to an error correction routine, then we need to add error codes to all function outputs and conditionals to test all function calls for returned error codes. All this complexity is unnecessary if we add one concept to the language: *exceptions*.

"***The common theme in these three scenarios (and many others!) is that we need to do pervasive (nonlocal) modifications of the program in order to handle a new concept. If the need for pervasive modifications manifests itself, we can take this as a sign that there is a new concept waiting to be discovered.*** *(Emphasis mine)* By adding this concept to the language we no longer need these pervasive modifications and we recover the simplicity of the program. The only complexity in the program is that needed to solve the problem. No additional complexity is needed to overcome technical inadequacies of the language." *(Accidental vs necessary complexity)*

#### Section 3: Designing a language and its programs

"A programming language is not designed in a vacuum, but for solving certain kinds of problems. Each problem has a paradigm that is best for it. No one paradigm is best for all problems." ... "We will look at two interesting cases: languages that support two paradigms (Section 3.1) and layered languages (Section 3.2)."

##### 3.1: Languages that support two paradigms

"Many languages support two paradigms, typically one for programming in the small and another for programming in the large. The first paradigm is chosen for the kind of problem most frequently targeted by the language. The second paradigm is chosen to support abstraction and modularity and is used when writing large programs."

* **[Prolog](../prolog):** The first paradigm is a logic programming engine based on unification and depth-first search. The second paradigm is imperative: the assert and retract operations which allow a program to add and remove program clauses. Prolog dates from 1972, which makes it an old language. Recent developments in modeling languages based on advanced search algorithms advance both the logic programming and imperative programming sides. Modern Prolog implementations have added some of these advances, e.g., support for constraint programming and a module
system.
* **Modeling languages** (e.g., Comet, Numerica [48]): The first paradigm is a solver: constraint programming (see Section 7), local search (see the chapter by Philippe Codognet [8]), satisfiability (SAT solvers), and so forth. The second paradigm is object-oriented programming.
* **Solving libraries** (e.g., Gecode): The first paradigm is a solver library based on advanced search algorithms, such as Gecode [43, 47]. The second paradigm is added by the host language, e.g., C++ and Java support object-oriented programming.
* **Language embedding** (e.g., SQL): SQL already supports two paradigms: a relational programming engine for logical queries of a database and a transactional interface for concurrent updates of the database. The host language complements this by supporting object-oriented programming, for organization of large programs. This example goes beyond two paradigms to show a design with three complementary paradigms.



---

Best footnote from the paper: "Similar reasoning *[referencing the statements "With n concepts, it is theoretically possible to construct 2n paradigms. Of course, many of these paradigms are useless in practice, such as the empty paradigm (no concepts)"]* explains why Baskin-Robbins has exactly 31 flavors of ice cream. We postulate that they have only 5 flavors, which gives 25 − 1 = 31 combinations with at least one flavor. The 32nd combination is the empty flavor. The taste of the empty flavor is an open research question."
