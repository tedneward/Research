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

## Section 2: Languages, paradigms, and concepts

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

## Section 3: Designing a language and its programs

"A programming language is not designed in a vacuum, but for solving certain kinds of problems. Each problem has a paradigm that is best for it. No one paradigm is best for all problems." ... "We will look at two interesting cases: languages that support two paradigms (Section 3.1) and layered languages (Section 3.2)."

##### 3.1: Languages that support two paradigms

"Many languages support two paradigms, typically one for programming in the small and another for programming in the large. The first paradigm is chosen for the kind of problem most frequently targeted by the language. The second paradigm is chosen to support abstraction and modularity and is used when writing large programs."

* **[Prolog](../prolog):** The first paradigm is a logic programming engine based on unification and depth-first search. The second paradigm is imperative: the assert and retract operations which allow a program to add and remove program clauses. Prolog dates from 1972, which makes it an old language. Recent developments in modeling languages based on advanced search algorithms advance both the logic programming and imperative programming sides. Modern Prolog implementations have added some of these advances, e.g., support for constraint programming and a module
system.
* **Modeling languages** (e.g., [Comet](../comet), Numerica): The first paradigm is a solver: constraint programming (see Section 7), local search (see the chapter by Philippe Codognet), satisfiability (SAT solvers), and so forth. The second paradigm is object-oriented programming.
* **Solving libraries** (e.g., [Gecode](/libraries/gecode)): The first paradigm is a solver library based on advanced search algorithms, such as Gecode. The second paradigm is added by the host language, e.g., C++ and Java support object-oriented programming.
* **Language embedding** (e.g., [SQL](../sql)): SQL already supports two paradigms: a relational programming engine for logical queries of a database and a transactional interface for concurrent updates of the database. The host language complements this by supporting object-oriented programming, for organization of large programs. This example goes beyond two paradigms to show a design with three complementary paradigms.

##### 3.2: A definitive programming language
"At some point in time, ***language research will give solutions that are good enough that researchers will move on to work at higher levels of abstraction***. This has already arrived for many subareas of language design, such as assembly languages and parsing algorithms. In the 1970s, compiler courses were built around a study of parsing algorithms. Today, parsing is well understood for most practical purposes and compiler design has moved on. Today’s compiler courses are built around higher level topics such as dataflow analysis, type systems, and language concepts. We postulate that this kind of evolution is happening with language design as well."

This section goes on to examine Erlang, E, Distributed Oz, and Didactic Oz as examples of language design success. Personally, I'm not sure that the two Oz examples are really two separate examples, but given that the author is one of the principals behind Oz, I suppose it's to be expected. The author asserts, "The surprise is that all four projects ended up using languages with very similar structures ... The common language has a layered structure with four layers: a strict functional core, followed by declarative concurrency, then asynchronous message passing, and finally global named state. This layered structure naturally supports four paradigms. ... From the common structure of these designs, one can infer several plausible consequences for language design. ***First, that the notion of declarative programming is at the very core of programming languages.*** This is already well-known; our study reinforces this conclusion. ***Second, that declarative programming will stay at the core for the foreseeable future, because distributed, secure, and fault-tolerant programming are essential topics that need support from the programming language.*** ***Third, that deterministic concurrency is an important form of concurrent programming that should not be ignored.*** We remark that deterministic concurrency is an excellent way to exploit the parallelism of multi-core processors because it is as easy as functional programming and it cannot have race conditions (see also Section 6). A final conclusion is that ***message-passing concurrency is the correct default for general-purpose concurrent programming instead of shared-state concurrency.***" That's a whole crap-ton of "skating fast over thin ice" and tautological reasoning, in my opinion. The first seems tautological, the second and third seem reasonable, and the fourth again seems pretty fast-and-loose, asertion-without-justification.

##### 3.3: Architecture of self-sufficient systems
"The ultimate software system is one that does not require any human assistance, i.e., it can provide for every software modification that it needs, including maintenance, error detection and correction, and adaptation to changing requirements. Such a system can be called *self sufficient*. Self-sufficient systems can be very robust; for example peer-to-peer networks can manage themselves to survive in extremely hostile environments by doing reversible phase transitions [44, 54]. Let us leave aside for now the artificial intelligence required to build such a system, and investigate just the language mechanisms it needs. The system may ask for human assistance in some cases, but in principle it should contain all the mechanisms it needs to accomplish its tasks.

"What is a reasonable architecture for designing self-sufficient systems? From the conclusions of the previous section and our experience in building distributed systems, we can propose an architecture. In terms of programming paradigms, what we need first is components as first-class entities (specified by closures) that can be manipulated through higher-order programming. Above this level, the components behave as isolated concurrent agents that communicate through message passing. Finally, we need named state and transactions for system reconfiguration and system maintenance. Named state allows us to manage the content of components and change their interconnections. This gives us a language that has a layered structure similar to the previous section.

"With this language we can program our system. To allow the program to adapt itself to its environment, we take inspiration from biological systems and organize its components as feedback loops. The system then consists of a set of interacting feedback loops. A single feedback loop consists of three concurrent components that interact with a subsystem (see Figure 6): a monitoring agent, a correcting agent, and an actuating agent. Realistic systems consist of many feedback loops. Since each subsystem must be as self-sufficient as possible, there must be feedback loops at all levels. These feedback loops can interact in two fundamental ways:

* **Stigmergy**: Two loops share one subsystem.
* **Management**: One loop controls another loop directly

The paper has multiple diagrams here, one of the human respiratory system and one of the TCP protocol transmission cycle, both as examples of feedback loops.

"A program then consists of a set of feedback loops interacting through stigmergy and management. The inner loop *(of TCP)* implements reliable transfer of a byte stream using a sliding window protocol. The outer loop does congestion control: if too many packets are lost, it reduces the transfer rate of the inner loop by reducing the window size. In our view, the large-scale structure of software will more and more be done in this self-sufficient style. If it is not done in this way, the software will simply be too fragile and collapse with any random error or problem.

## 4: Programming concepts

### 4.1 Record

"A record is a data structure: a group of references to data items with indexed access to
each item. For example:

```
R=chanson(nom:"Le Roi des Aulnes"
    artiste:"Dietrich Fischer-Dieskau"
    compositeur:"Franz Schubert"
    langue:allemand)
```

"The record is referenced by the identifier R. Members can be references through the dot operation, e.g., R.nom returns a reference to the string "Le Roi des Aulnes". The record is the foundation of symbolic programming. A symbolic programming language is able to calculate with records: create new records, decompose them, and examine them. Many important data structures such as arrays, lists, strings, trees, and hash tables can be derived from records. When combined with closures (see next section), records can be used for component-based programming."

### 4.3 Lexically-scoped closures

"The lexically scoped closure is an enormously powerful concept that is at the heart of programming. Functional programming, which is programming with closures, is a central paradigm. From an implementation viewpoint, a closure combines a procedure with its external references (the references it uses at its definition). From the programmer’s viewpoint, a closure is a “packet of work”: a program can transform any instructions into a closure at one point in the program, pass it to another point, and decide to execute it at that point. The result of its execution is the same as if the instructions were executed at the point the closure was created.

"Figure 9 *(from the paper)* shows schematically what happens when a closure is defined and when it is called. The procedure P is implemented by a closure. At the definition (context D), P stores the references from the definition context. For example, it keeps the reference x to some named state. We say that the environment (set of references) of P is closed over its definition context. At the call (context C), P uses the references from context D.

"*(The below pseudocode)* shows one possible use for a closure: creating a control structure. 

```
...                             ...
...                             ...
<stmt>    ; Instruction.  ===>  P = proc ($) <stmt> end ; Define procedure referenced by P (context D)
...                             ...
...                             (P) ; Call the procedure P (context C)
```

"At the left, we execute the instruction <stmt>. At the right, instead of executing <stmt>, we place it inside a procedure (closure) referenced by P (the example uses Oz syntax). Any time later on in the program, we can decide to call P. We have separated the definition of <stmt> from its execution. With this ability we can define control structures such as an if statement or while loop.

"The examples can easily be generalized to procedures with arguments. The closed environment exists as before. The arguments are passed during each call. The closure therefore has two sets of references: a closed environment (from the definition) and the arguments (from each call). Almost all programming languages (except for a few venerable ancestors such as Pascal and C) use this kind of closure:

* functions are closures;
* procedures are closures;
* objects are closures;
* classes are closures;
* software components are closures.

"Many abilities normally associated with specific paradigms are based on closures:

* Instantiation and genericity, normally associated with object-oriented programming, can be done easily by writing functions that return other functions. In object-oriented programming the first function is called a “class” and the second is called an “object”.
* Separation of concerns, normally associated with aspect-oriented programming, can be done easily by writing functions that take other functions as arguments. For example, Erlang has a function that implements a generic fault-tolerant client/server. It is called with a function argument that defines the server’s behavior. ... [AOP] is usually done by syntactic transformations (called “weaving”) that add aspect code to the original source. The AspectJ language is a good example of this approach. Weaving is difficult to use because it is fragile: it is easy to introduce errors in the program (changing the source code changes the semantics of the program). Using closures instead makes it easier to preserve correctness because the source code is not changed.
* Component-based programming is a style of programming in which programs are organized as components, where each component may depend on other components. A component is a building block that specifies part of a program. An instance of a component is called a module, which is a record containing closures. A new module is created by a function that takes its dependent modules as inputs. The component is the function.

"The Erlang language implements all these abilities directly with closures. ... In most other languages, though, the use of closures is hidden inside the language’s implementation and is not available directly to the programmer. If done carefully this can be an advantage, since the implementation can guarantee that the closures are used correctly."

* **Independence (concurrency)**: "Another key concept is independence: constructing a program as independent parts. This is not as simple as it may seem. For example, consider a program that consists of instructions executing one after the other. The instructions are not independent since they are ordered in time. To implement independence we need a new programming concept called concurrency. When two parts do not interact at all, we say they are concurrent. (When the order of execution of two parts is given, we say they are sequential.) Concurrent parts can be extended to have some well-defined interaction, which is called communication.

"Concurrency should not be confused with parallelism. Concurrency is a language concept and parallelism is a hardware concept. Two parts are parallel if they execute simultaneously on multiple processors. Concurrency and parallelism are orthogonal: it is possible to run concurrent programs on a single processor (using preemptive scheduling and time slices) and to run sequential programs on multiple processors (by parallelizing the calculations).

"The real world is concurrent: it consists of activities that evolve independently. The computing world is concurrent as well. It has three levels of concurrency:

* Distributed system: a set of computers connected through a network. A concurrent activity is called a computer. This is the basic structure of the Internet.
* Operating system: the software that manages a computer. A concurrent activity is called a process. Processes have independent memories. The operating system handles the task of mapping the process execution and memory to the computer. For example, each running application typically executes in one process.
* Activities inside one process. A concurrent activity is called a thread. Threads execute independently but share the same memory space. For example, the different windows in a Web browser typically execute in separate threads.

"The fundamental difference between processes and threads is how resource allocation is done. Process-level concurrency is sometimes called competitive concurrency: each process tries to acquire all the system’s resources for itself. The operating system’s chief role is to arbitrate the resource requests done by all the processes and to allocate resources in a fair way. Thread-level concurrency is sometimes called cooperative concurrency: threads in a process share resources and collaborate to achieve the result of the process. Threads run in the same application and so are guided by the same program. 

"There are two popular paradigms for concurrency. The first is shared-state concurrency: threads access shared data items using special control structures called monitors to manage concurrent access. This paradigm is by far the most popular. It used by almost all mainstream languages, such as Java and C#. Another way to do shared-state concurrency is by means of transactions: threads atomically update shared data items. This approach is used by databases and by software transactional memory. The second paradigm is message-passing concurrency: concurrent agents each running in a single thread that send each other messages.

"Despite their popularity, monitors are the most difficult concurrency primitive to program with. Transactions and message passing are easier, but still difficult. All three approaches suffer from their expressiveness: they can express nondeterministic programs (whose execution is not completely determined by their specifications), which is why it is hard to reason about their correctness. Concurrent programming would be much simpler if the nondeterminism were controlled in some way, so that it is not visible to the programmer. Sections 6 and 7 present four important paradigms that implement this idea to make concurrent programming much simpler.

### 4.3 Named state

"The final key concept we will introduce is named state. State introduces an abstract notion of time in programs. In functional programs, there is no notion of time. Functions are mathematical functions: when called with the same arguments, they always give the same results. Functions do not change. In the real world, things are different. There are few real-world entities that have the timeless behavior of functions. Organisms grow and learn. When the same stimulus is given to an organism at different times, the reaction will usually be different. How can we model this inside a program? We need to model an entity with a unique identity (its name) whose behavior changes during the execution of the program. To do this, we add an abstract notion of time to the program. This abstract time is simply a sequence of values in time that has a single name. We call this sequence a named state. Unnamed state is also possible (monads and DCGs, see Section 2.1), but it does not have the modularity properties of named state. 

"*(Consider)* two components, A and B, where component A has an internal named state (memory) and component B does not. Component B always has the same behavior: whenever it is called with the same arguments, it gives the same result. Component A can have different behaviors each time it is called, if it contains a different value in its named state. Having named state is both a blessing and a curse. It is a blessing because it allows the component to adapt to its environment. It can grow and learn. It is a curse because a component with named state can develop erratic behavior if the content of the named state is unknown or incorrect. A component without named state, once proved correct, always stays correct. Correctness is not so simple to maintain for a component with named state. A good rule is that named state should never be invisible: there should always be some way to access it from the outside.

"Named state is important for a system’s modularity. We say that a system (function, procedure, component, etc.) is modular if updates can be done to part of the system without changing the rest of the system. We give a scenario to show how we can design a modular system by using named state. Without named state, this is not possible.

"Assume that we have three developers, P, U1, and U2. P has developed a module M that contains two functions F and G. U1 and U2 are users of M: their own programs used module M. Here is one possible definition of M:

```
fun {ModuleMaker}
    fun {F ...}
        ... % Definition of F
    end
    fun {G ...}
        ... % Definition of G
    end
in
    themodule(f:F g:G)
end
M={ModuleMaker} % Creation of M
```

"The function ModuleMaker is a software component, i.e., it defines the behavior of part of a system. We create instances of this component by calling ModuleMaker. One such instance is the module M. Note that a module’s interface is simply a record, where each field is one of the module’s operations. The module M has two operations F and G. 

"Now assume that developer U2 has an application that consumes a huge amount of calculation time. U2 would like to investigate where all this time is being spent, so that he can rewrite his application to be less costly. U2 suspects that F is being called too many times and he would like to verify this. U2 would like a new version of M that counts the number of times F is called. So U2 contacts P and asks him to create a new version of M that does this, but without changing the interface (that defines the operations of M and how they are called) since otherwise U2 would have to change all of his program (not to mention U1!).

"Surprise! This is not possible without named state. If F does not have named state then it cannot change its behavior. In particular, it cannot keep a counter of how many times it is called. The only solution in a program without named state is to change F’s interface (its arguments):

```
fun {F ... Fin Fout}
    Fout=Fin+1
    ...
end        
```

"We add two arguments to F, namely Fin and Fout. When calling F, Fin gives the count of how many times F was called, and F calculates the new count in Fout by adding one to Fin. When calling F, we have to link all these new arguments together. For example, three successive calls to F would look like this:

```
A={F ... F1 F2}
B={F ... F2 F3}
C={F ... F3 F4}
```

"F1 is the initial count. The first call calculates F2, which is passed to the second call, and so forth. The final call returns the count F4. We see that this is a very bad solution, since U2 has to change his program wherever F is called. It gets worse: U1 also has to change his program, even though U1 never asked for any change. All users of M, even U1, have to change their programs, and they are very unhappy for this extra bureaucratic overhead.

"The solution to this problem is to use named state. We give an internal memory to the module M. In Oz, this internal memory is called a cell or a variable cell. This corresponds simply to what many languages call a variable. Here is the solution:

```
fun {ModuleMaker}
    X={NewCell 0} % Create cell referenced by X
    fun {F ...}
        X:=@X+1 % New content of X is old plus 1
        ... % Original definition of F
    end
    fun {F ...}
        ... % Original definition of G
    end
    fun {Count} @X end % Return content of X
in
    themodule(f:F g:G c:Count)
end
M={ModuleMaker}
```

"The new module M contains a cell inside. Whenever F is called, the cell is incremented. The additional operation Count (accessed by M.c) returns the current count of the cell. The interfaces of F and G are unchanged. Now everybody is happy: U2 has his new module and nobody has to change their programs at all since F and G are called in the same way.

"The main advantage of named state is that the program becomes modular. The main disadvantage is that a program can become incorrect. It seems that we need to have and not have named state at the same time. How do we solve this dilemma?4 One solution is to concentrate the use of named state in one part of the program and to avoid named state in the rest. Figure 12 shows how this design works. The bulk of the program is a pure function without named state. The rest of the program is a state transformer: it calls the pure function to do the actual work. This concentrates the named state in a small part of the program."

## 5 Data abstraction

"A data abstraction is a way to organize the use of data structures according to precise rules which guarantee that the data structures are used correctly. A data abstraction has an inside, an outside, and an interface between the two. All data structures are kept on the inside. The inside is hidden from the outside. All operations on the data must pass through the interface. ... There are three advantages
to this organization:

1. First, there is a guarantee that the data abstraction will always work correctly. The interface defines the authorized operations on the data structures and no other operations are possible.
2. Second, the program is easier to understand. A user of the data abstraction does not need to understand how the abstraction is implemented. The program can be partitioned into many abstractions, implemented independently, which greatly reduces the program’s complexity. This can be further improved by adding the property of compositionality: allowing data abstractions to be defined inside of other data abstractions.
3. Third, it becomes possible to develop very large programs. We can divide the implementation among a team of people. Each abstraction has one person who is responsible for it: he implements it and maintains it. That person has to know just the interfaces used by his abstraction.

"In the rest of this section we first explain the four different ways to organize data abstractions. We then introduce two principles, polymorphism and inheritance, that greatly increase the power of data abstraction to organize programs. Object-oriented programming, as it is usually understood, is based on data abstraction with polymorphism and inheritance.

### 5.1 Objects and abstract data types

"There are four main ways to organize data abstractions, organized along two axes. The first axis is *state*: does the abstraction use named state or not. The second axis is *bundling*: does the abstraction fuse data and operations into a single entity (this is called an object or a procedural data abstraction (PDA)), or does the abstraction keep them separate (this is called an abstract data type (ADT)). Multiplying the two axes gives four possibilities: 

* Stateful and Abstract data type/unbundled ==> Stateful ADT
* Stateless and Abstract data type/unbundled ==> "Pure" ADT (for example, an integer)
* Stateful and Object/bundled ==> "Pure" object (very popular!)
* Stateless and Object/bundled ==> Declarative object

"The two other possibilities, the abstract data type with named state and the declarative object, can also be useful. But they are less used in current languages."

### 5.2 Polymorphism and the responsibility principle

"The most important principle of object-oriented programming, after data abstraction itself, is polymorphism. In everyday language, we say an entity is polymorphic if it can take on different forms. In computer programming, we say an entity is polymorphic if it can take arguments of different types. This ability is very important for organizing large programs so that the responsibilities of the program’s design are concentrated in well-defined places instead of being spread out over the whole program. To explain this, we use a real-world example. A sick patient goes to see a doctor. The patient does not need to be a doctor, but just to tell the doctor one message: “Cure me!”. The doctor understands this message and does the right thing depending on his speciality. The program “GetCured” run by the patient is polymorphic: it takes a doctor as argument and works with all different kinds of doctors. This is because all doctors understand the message “Cure me!”.

"For programming the idea of polymorphism is similar: if a program works with one data abstraction as argument, it can work with another, if the other has the same interface. All four kinds of data abstractions we saw before support polymorphism. But it is particularly simple for objects, which is one reason for the success of object-oriented programming."

*(It's interesting how Van Roy slices inheritance and polymorphism apart, which is easier to do for languages that use message-passing and dynamic resolution of message-invocation. Theoretically, a statically-compiled language could do the same--resolve at compile time whether the object in question supports the method being invoked and pass or not pass the call--but doing so has always been tied very closely to inheritance and virtual dispatch. Makes me wonder, maybe there's a language concept here where we have objects without inheritance that still support polymorphism--and that there's probably already some languages that do this, but I just haven't noticed it before. Something like*

        ```
        class Person
            method Eat(...)

        class Pet
            method Eat(...)

        class Furniture
            // no method Eat

        p := Person()
        p.Eat(...) // compiles
        c := Pet()
        c.Eat(...) // compiles
        t := Furniture()
        t.Eat(...) // ERROR
        ```

*... but the real power of polymorphism comes from substitutibility ("all Doctors understand the message 'Cure Me!'", and without inheritance, it's harder to see how this might work in a static language, at least without some form of type inference or generics?)*

### 5.3 Inheritance and the substitution principle

"The second important principle of object-oriented programming is inheritance. Many abstractions have a lot in common, in what they do but also in their implementations. It can be a good idea to define abstractions to emphasize their common relationship and without repeating the code they share. Repeated code is a source of errors: if one copy is fixed, all copies have to be fixed. It is all too easy to forget some copies or to fix them in the wrong way.

"Inheritance allows to define abstractions incrementally. Definition A can inherit from another definition B: definition A takes definition B as its base and shows how it is modified or extended. The incremental definition A is called a class. However, the abstraction that results is a full definition, not a partial one.

"Inheritance can be a useful tool, but it should be used with care. The possibility of extending a definition B with inheritance can be seen as another interface to B. This interface needs to be maintained throughout the lifetime of B. This is an extra source of bugs. Our recommendation is to use inheritance as little as possible. When defining a class, we recommend to define it as nonextensible if at all possible. In Java this is called a final class.

"Instead of inheritance, we recommend to use composition instead. Composition is a natural technique: it means simply that an attribute of an object refers to another object. The objects are composed together. In this way, it is not necessary to extend a class with inheritance. We use the objects as they are defined to be used.

"If you must use inheritance, then the right way to use it is to follow the substitution principle. Suppose that class A inherits from class B and we have two objects, OA and OB. The substitution principle states that any procedure that works with objects OB of class B must also work with objects OA of class A. In other words, inheritance should not break anything. Class A should be a conservative extension of class B.

"We end our discussion of inheritance with a cautionary tale. In the 1980s, a very large multinational company initiated an ambitious project based on object-oriented programming. Despite a budget of several billion dollars, the project failed miserably. One of the principal reasons for this failure was a wrong use of inheritance. Two main errors were committed:

* "Violating the substitution principle. A procedure that worked with objects of a class no longer worked with objects of a subclass. As a result, many almost-identical procedures needed to be written.

* "Using subclasses to mask bugs. Instead of correcting bugs, subclasses were created to mask bugs, i.e., to test for and handle those cases where the bugs occurred. As a result, the class hierarchy was very deep, complicated, slow, and filled with bugs.

## 6 Deterministic concurrent programming

"One of the major problems of concurrent programming is nondeterminism. An execution of a program is nondeterministic if at some point during the execution there is a choice of what to do next. Nondeterminism appears naturally when there is concurrency: since two concurrent activities are independent, the program’s specification cannot say which executes first. If there are several threads ready to run, then in each execution state the system has to choose which thread to execute next. This choice can be done in different ways; typically there is a part of the system called the scheduler that makes the choice.

"Nondeterminism is very hard to handle if it can be observed by the user of the program. Observable nondeterminism is sometimes called a race condition."

### 6.1 Avoiding nondeterminism in a concurrent language

"We can solve this problem by making a clear distinction between nondeterminism  *inside* the system, which cannot be avoided, and *observable* nondeterminism, which may be avoidable. We solve the problem in two steps:

* First, we limit observable nondeterminism to those parts of the program that really need it. The other parts should have no observable nondeterminism.
* Second, we define the language so that it is possible to write concurrent programs without observable nondeterminism.

Is it possible to have a concurrent language without observable determinism?

Concurrent paradigm | Races possible? | Inputs can be nondeterministic? | Example languages
------------------- | --------------- | ------------------------------- | ----------
Declarative concurrency | No | No | Oz, Alice
Constraint programming | No | No | Gecode, Numerica
Functional reactive programming | No | Yes | FrTime, Yampa
Discrete synchronous programming | No | Yes | Esterel, Lustre, Signal
Message-passing concurrency | Yes | Yes | Erlang, E

**Declarative concurrency** (also called **monotonic dataflow**). In this paradigm, deterministic inputs are received and used to calculate deterministic outputs. This paradigm lives completely in a deterministic world. If there are multiple input streams, they must be deterministic, i.e., the program must know exactly what input elements to read to calculate each output (for example, there could be a convention that exactly one element is read from each input stream). Two languages that implement this paradigm are Oz [50, 34] and Alice [38]. This paradigm can be made lazy without losing its good properties. The paradigm and its lazy extension are explained in more detail in Section 6.2. Constraint programming is related to declarative concurrency and is explained in Section 7.

There exists also a *nonmonotonic* dataflow paradigm, in which changes on any input are immediately propagated through the program. The changes can be conceptualized as *dataflow tokens* traveling through the program. This paradigm can accept nondeterministic input, but it has the disadvantage that it sometimes adds its own nondeterminism that does not exist in the input (called a “glitch” below). That is why we do not discuss this paradigm further in this chapter. Functional reactive programming is similar to nonmonotonic dataflow but without the glitches.

**Functional reactive programming** (also called **continuous synchronous programming**). In this paradigm, programs are functional but the function arguments can be changed and the change is propagated to the output. This paradigm can accept nondeterministic input and does not add any nondeterminism of its own. Semantically, the arguments are continuous functions of a totally ordered variable (which can correspond to useful magnitudes such as time or size). Implementations typically recompute values only when they change and are needed. Discretization is introduced only when results are calculated [16]. This means that arbitrary scaling is possible without losing accuracy due to approximation. If the changes are propagated correctly, then the functional program does not add any nondeterminism. For example, the simple functional expression `x+(x*y)` with `x=3` and `y=4` gives 15. If `x` is changed to 5, then the expression’s result changes from 15 to 25. Implementing this naively with a concurrent stream connecting a times agent to a plus agent is incorrect. This implementation can give a glitch, for example if the new value of x reaches the addition before the new result of the multiplication. This gives a temporary result of 17, which is incorrect. Glitches are a source of nondeterminism that the implementation must avoid, for example by compile-time preprocessing (doing a topological sort of operations) or thread scheduling constraints. Some languages that implement this paradigm are Yampa (embedded in Haskell) [27] and FrTime (embedded in Scheme) [12].

**Discrete synchronous programming**. In this paradigm, a program waits for input events, does internal calculations, and emits output events. This is called a reactive system. Reactive systems must be deterministic: the same sequence of inputs produces the same sequence of outputs. Like functional reactive programming, this paradigm can accept nondeterministic input and does not add any nondeterminism of its own. The main difference is that time is discrete instead of continuous: time advances in steps from one input event to the next. Output events are emitted at the same logical time instants as the input events.7 All calculations done to determine the next output event are considered to be part of the same time instant. This is exactly what happens in clocked digital logic: combinational circuits are “instantaneous” (they happen within one cycle) and sequential circuits “take time”: they use clocked memory (they happen over several cycles). The clock signal is a sequence of input events. Using discrete time enormously simplifies programming for reactive systems. For example, it means that subprograms can be trivially composed: output events from one subcomponent are instantaneously available as input events in other subcomponents. Some languages that implement this paradigm are Esterel [7], Lustre [21], and Signal [26]. Esterel is an imperative language, Lustre is a functional dataflow language, and Signal is a relational dataflow language. It is possible to combine the discrete synchronous and concurrent constraint paradigms to get the advantages of both. This gives the Timed CC model, which is explained in the chapter by Carlos Olarte et al [35].

All three paradigms have important practical applications and have been realized with languages that have good implementations.

### 6.2 Declarative concurrency

Declarative concurrency has the main advantage of functional programming, namely confluence, in a concurrent model. This means that all evaluation orders give the same result, or in other words, it has no race conditions. It adds two concepts to the functional paradigm: threads and dataflow variables. A thread defines a sequence of instructions, executed independently of other threads. Threads have one operation: `{NewThread P}`: create a new thread that executes the 0-argument procedure `P`. A dataflow variable is a single-assignment variable that is used for synchronization. Dataflow variables have three primitive operations:

* `X={NewVar}`: create a new dataflow variable referenced by X.
* `{Bind X V}`: bind X to V, where V is a value or another dataflow variable.
* `{Wait X}`: the current thread waits until X is bound to a value.

Using these primitive operations, we extend all the operations of the language to wait until their arguments are available and to bind their result. For example, we define the operation Add in terms of dataflow variables and a primitive addition operation PrimAdd:

```
proc {Add X Y Z}
    {Wait X} {Wait Y}
    local R in {PrimAdd X Y R} {Bind Z R} end
end
```

The call `Z={Add 2 3}` causes `Z` to be bound to 5 (the function output is the procedure’s third argument). We do the same for all operations including the conditional (if) statement (which waits until the condition is bound) and the procedure call (which waits until the procedure variable is bound). The result is a declarative dataflow language.

**Lazy declarative concurrency**: We can add lazy execution to declarative concurrency and still keep the good properties of confluence and determinism. In lazy execution, it is the consumer of a result that decides whether or not to perform a calculation, not the producer of the result. In a loop, the termination condition is in the consumer, not the producer. The producer can even be programmed as an infinite loop. Lazy execution does the least amount of calculation needed to get the result. We make declarative concurrency lazy by adding one concept, by-need synchronization, which is implemented by one operation: `{WaitNeeded X}`: the current thread waits until a thread does `{Wait X}`. This paradigm adds both lazy evaluation and concurrency to functional programming and is still declarative. It is the most general declarative paradigm based on functional programming known so far.9 With WaitNeeded we can define a lazy version of Add:

```
proc {LazyAdd X Y Z}
    thread {WaitNeeded Z} {Add X Y Z} end
end
```

This is practical if threads are efficient, such as in Mozart. The call `Z={LazyAdd 2 3}` delays the addition until the value of `Z` is needed. We say that it creates a lazy suspension. If another thread executes `Z2={Add Z 4}`, then the suspension will be executed, binding `Z` to 5. If the other thread executes `Z2={LazyAdd Z 4}` instead, then two lazy suspensions are created. If a third thread needs `Z2`, then both will be executed.

**Declarative concurrency and multi-core processors**: Decades of research show that parallel programming cannot be completely hidden from the programmer: it is not possible in general to automatically transform an arbitrary program into a parallel program. There is no magic bullet. The best that we can do is to make parallel programming as easy as possible. The programming language and its libraries should help and not hinder the programmer. Traditional languages such as Java or C++ are poorly equipped for this because shared-state concurrency is difficult. 

Declarative concurrency is a good paradigm for parallel programming. This is because it combines concurrency with the good properties of functional programming. Programs are mathematical functions: a correct function stays correct no matter how it is called (which is not true for objects). Programs have no race conditions: any part of a correct program can be executed concurrently without changing the results. Any correct program can be parallelized simply by executing its parts concurrently on different cores. If the set of instructions to execute is not totally ordered, then this can give a speedup. Paradigms that have named state (variable cells) make this harder because each variable cell imposes an order (its sequence of values). A common programming style is to have concurrent agents connected by streams. This kind of program can be parallelized simply by partitioning the agents over the cores, which gives a pipelined execution.

## 7 Constraint Programming


---

Best footnote from the paper: "Similar reasoning *[referencing the statements "With n concepts, it is theoretically possible to construct 2n paradigms. Of course, many of these paradigms are useless in practice, such as the empty paradigm (no concepts)"]* explains why Baskin-Robbins has exactly 31 flavors of ice cream. We postulate that they have only 5 flavors, which gives 2^5 − 1 = 31 combinations with at least one flavor. The 32nd combination is the empty flavor. The taste of the empty flavor is an open research question."
