title=Flow-based Programming (fbp)
tags=distribution, protocol, architecture, language, jvm, clr, native
summary=A programming paradigm, discovered/invented by J. Paul Rodker Morrison in the late '60s, that uses a "data processing factory" metaphor for designing and building applications.
~~~~~~

[Website](https://jpaulm.github.io/fbp/index.html) | [Book: "Flow-Based Programming"](https://jpaulm.github.io/fbp/book.html) | [fbp Protocol](https://flowbased.github.io/fbp-protocol/)

*(The book spends most of its time in the early chapters praising the author's point of view and condemning anything that doesn't follow; rather than actually discussing what flow-based programming is, it spends most of its early time describing what it isn't. Not a highly-recommended read.)*

FBP defines applications as networks of "black box" processes, which communicate via data chunks (called Information Packets) travelling across predefined connections (think "conveyor belts"), where the connections are specified externally to the processes. These black box processes can be reconnected endlessly to form different applications without having to be changed internally. FBP is thus naturally component-oriented.

FBP is a special case of dataflow programming characterized by asynchronous, concurrent processes "under the covers", Information Packets with defined lifetimes, named ports, "bounded buffer" connections, and definition of connections external to the components - it has been found to support improved development time and maintainability, reusability, rapid prototyping, simulation, improved performance, and good communication among developers, maintenance staff, users, systems people, and management - not to mention that FBP naturally takes advantage of multiple cores... without the programmer having to struggle with the intricacies of multitasking!

FBP exhibits "data coupling", described in the Wikipedia article on the IT concept called "coupling" as the loosest type of coupling between components. Loose coupling provides significantly improved maintainability in systems.

FBP promotes a high-level, functional style of specifications that simplifies reasoning about system behavior.

FBP involves a significant "paradigm shift" from conventional programming, as it uses an "assembly line" image of data processing, which really has to be used to experience its advantages. Not surprisingly given the hold that the so-called "von Neumann" paradigm has over programming technology, over the last 40+ years a number of companies have come out with FBP-like or "FBP-inspired" systems (to borrow a term coined by Joe Witt of Cloudera), which exhibit some of the attributes of FBP, but do not involve this paradigm shift, including some of the biggest and most successful companies in the industry, such as IBM, Microsoft, Facebook, Google, and the New York Times (see FBP External References). Unfortunately, without the FBP paradigm shift, these systems cannot fully achieve the advantages listed above, although most of them combine a visual notation with some degree of componentry and "configurable modularity", to use the term popularized by the late Nate Edwards. We have therefore been forced to use the term "classical FBP" to refer to the FBP architecture described in this web site. It is hard for someone reading documentation to tell whether a given product describing itself as "an FBP system" is "classical" or not, but, roughly, multiple input ports, "back pressure", and asynchronism, constitute a sort of litmus test to check whether systems should be classed as "classical" FBP systems. While the FBP paradigm shift may seem unfamiliar, given the prevalence of the older programming approaches, in fact it embodies a simple mental model (not "simple" as in easy but "simple" as in elegant, to quote Joe Witt), and has proven over several decades to result in applications that are more understandable and maintainable than those built using the conventional (von Neumann) paradigm.

## FBP Tenets (open-ended)

* If work is boring, let a robot do it!
* Corollary: using a design tool should be fun!
* No one language should try to do everything!
* The world is asynchronous - don't try to force the systems we build into a synchronous framework!
* Information Packets are things
* The von Neumann paradigm is only appropriate within a single process! Duh!
* Any language or system that "talks data" should be able to talk to any other one that "talks data".
* A process needs to be able to have more than one input port, and needs to be able to choose which one to receive from!
* If a process's upstream connection fills up, the process feeding it will be suspended (unless the connection is marked "DropOldest") ("back pressure")

## Implementations

* Javascript: [NoFlo](https://noflojs.org/) [Source](https://github.com/noflo/noflo)
* [Flowhub](https://flowhub.io/)
* [javafbp](https://github.com/jpaulm/javafbp)
* [csharpfbp](https://github.com/jpaulm/csharpfbp)
* [C++ fbp](https://github.com/jpaulm/cppfbp)
