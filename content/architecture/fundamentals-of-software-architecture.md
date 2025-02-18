title=Fundamentals of Software Architecture (2nd Ed)
tags=architecture, reading, book
summary=Notes from the book
~~~~~~

*(Mark Richards, Neal Ford; OReilly; ISBN 978-1-098-17545-0)* Notes from the Early Release as of 15 Feb 2025

## Ch 1: Introduction

**Defining Software Architecture**: "Figure 1-1 illustrates how we like to think about software architecture. This definition has four dimensions. The software architecture of a system consists of an *architecture style* as the starting point, combined with the *architecture characteristics* it must support, the *logical components* to implement its behavior, and finally the *architecture decisions* justifying it all."

- Architectural characterisitics ("ilities"): Availability, Scalability, Fault Tolerance, Reliability, Security, Elasticity, Testability, Agility, Recoverability, Performance, Deployability, Learnability, ...
- Logical components: form the domains, entities, workflows, ... "one of the key structures for architects"
- Architecture style: layered/tiered, etc
- Architecture decisions: "Architecture decisions form the constraints of the system and direct the development teams on what is and what isn’t allowed."

**Laws of Software Architecture**

1. ***Everything in software architecture is a trade-off.***

    1. If you think you’ve discovered something that isn’t a trade-off, more likely you just haven’t identified the trade-off... yet.
    2. You can’t just do trade-off analysis once and be done with it.

2. ***Why is more important than how.***

3. ***Most architecture decisions aren’t binary but rather exist on a spectrum between extremes.***

**Expectations of an Architect**

* Make architecture decisions: "An architect is expected to define the architecture decisions and design principles used to guide technology decisions within the team, within the department, or across the enterprise."
* Continually analyze the architecture: "An architect is expected to continually analyze the architecture and the current technology environment and recommend solutions for improvement."
* Keep current with latest trends: "An architect is expected to keep current with the latest technology and industry trends."
* Ensure compliance with decisions: "An architect is expected to ensure compliance with architecture decisions and design principles." *(I don't agree with this; I don't think putting the architect in charge of governance enforcement does anything but make teams want to avoid communicating with the architect. Enforcement should come elsewhere--but it's not clear where/how, which is why I think people default to having architects do it.)*
* Understand diverse technologies, frameworks, platforms, and environments: "An architect is expected to have exposure to multiple and diverse technologies, frameworks, platforms, and environments."
* Know the business domain: "An architect is expected to have a certain level of business-domain expertise."
* Posess interpersonal skills: "An architect is expected to possess exceptional interpersonal skills, including teamwork, facilitation, and leadership." *(In the list, they call this "lead a team", which is different from the more full description)*
* Understand and navigate organizational politics: "An architect is expected to understand the political climate of the enterprise and be able to navigate its politics."

# Part 1: Foundations

## Ch 2: Architectural Thinking

**Architecture vs Design**
A spectrum, ranging from strategic (architecture) to tactical (design):

Element | Architecture | Design
------- | ------------ | ------
tradeoffs | significant | insignificant
effort | high | low
perspective | strategic | tactical

Perspective (strategic v tactical): "How much thought and planning is involved in the decision? How many people are involved in the decision? Is the decision a long-term vision or a short-term action?"
Level of effort: architecture is the stuff that's hard to change (Fowler, "Who needs an architect?")
Tradeoffs: "The more significant the trade-offs are, the more architectural the decision tends to be. For example, choosing to use the microservices architecture style provides better scalability, agility, elasticity, and fault tolerance. However, this architecture is highly complex, is very expensive, has poor data consistency, and doesn’t perform well due to service coupling. These are some pretty significant trade-offs. We can conclude that this decision is more on the architectural side of the spectrum than design."

**Technical Breadth**
Versus technical depth. Four kinds of knowledge (you know, you know you don't know, you don't know you don't know), breadth is more important than depth for an architect. Devote 20 minutes a day to learning something. Developing a personal radar.

> Antipattern: Frozen Caveman
> A behavioral antipattern commonly observed in the wild, the Frozen Caveman antipattern, describes architects who revert to their pet irrational concern for every architecture. For example, one of Neal’s colleagues worked on a system that featured a centralized architecture. Each time they delivered the design to the client architects, the persistent question was “But what if we lose Italy?” Several years before, a freak communication problem had prevented the client’s headquarters from communicating with its stores in Italy, causing great inconvenience. While the chances of this recurring were extremely small, the architects had become obsessed with this particular architectural characteristic.
>
> Generally, this antipattern manifests in architects who have been burned in the past by a poor decision or unexpected occurrence, making them particularly cautious about anything related. While risk assessment is important, it should be realistic as well. Understanding the difference between genuine and perceived technical risk is part of the ongoing learning process. Thinking like an architect requires overcoming these Frozen Caveman ideas and experiences, seeing other solutions, and asking more relevant questions.

**Analyzing Tradeoffs**
Everything is a tradeoff. (Example: online item auction system, analyzing "queues or topics" messaging approach)

**Understanding Business Drivers** (to be explored more in Chs 4, 5, 6, and 7) *(not sure why it's here then)*

**Balancing Architect and Hands-On Coding** Avoiding the Bottleneck Trap antipattern (avoid being the critical path).

> Antipattern: Bottleneck Trap
> The Bottleneck Trap antipattern occurs when an architect takes ownership of code within the critical path of a system (usually the underlying framework code or some of the more complicated parts) and becomes a bottleneck to the team. This happens because the architect is not a full-time developer and therefore must balance development work (like writing and testing source code) with the architect role (drawing diagrams, attending meetings, and well, attending more meetings).
>
> One way to avoid the Bottleneck Trap is for the architect to delegate the critical parts of the system to others on the development team and then focus on coding a minor piece of business functionality (such as a service or UI screen) one to three iterations down the road. This has three positive effects. First, the architect gains hands-on experience by writing production code, while avoiding becoming a bottleneck on the team. Second, the critical path and framework code are distributed to the development team (where they belong), giving the team ownership and a better understanding of the harder parts of the system. Third, and perhaps most important, the architect is writing the same business-related source code as the development team. This helps them better identify with the development team’s pain points around processes, procedures, and the development environment (and hopefully work to improve those things).

Remain hands on by:

* Frequent proofs of concept *(but do them properly!)*
* Tackle technical debt
* Fix bugs
* Automate
* Do code reviews *(less fond of this one, as it emphasizes the architect-as-enforcer)*

## Ch 3: Modularity

> 95% of the words [written about software architecture] are spent extolling the benefits of “modularity” and little, if anything, is said about how to achieve it.
>
> Glenford J. Myers (*Composite/Structured Design* (Van Nostrand Reinhold, 1978))

Modularity is an organizing principle: "Understanding modularity and its many incarnations in the development platform of choice is critical for architects. Many of the tools we have to analyze architecture (such as metrics, fitness functions, and visualizations) rely on modularity and related concepts."

"Preserving good modularity exemplifies our definition of an implicit architecture characteristic: virtually no project requirements explicitly ask the architect to ensure good modular distinction and communication, but sustainable code bases do require the order and consistency that this brings."

**Modularity vs Granularity**
"Modularity is about *breaking systems apart into smaller pieces*, such as moving from a monolithic architecture style (like the traditional n-tiered layered architecture) to a highly distributed architecture style like microservices. Granularity, on the other hand, is about **the size of those pieces**--how big a particular part of the system (or service) should be. ... Granularity causes services or components to be coupled to one another, creating complex, hard-to-maintain architecture antipatterns like Spaghetti Architecture, Distributed Monoliths, and the famous Big Ball of Distributed Mud. The trick to avoiding these architectural antipatterns is to pay attention to granularity and the overall level of coupling between services and components."

"... in this book, we use modularity to describe ***a logical grouping of related code***, which could be a group of classes in an object-oriented language or a group of functions in a structured or functional language." Logical does not always imply or enforce physical.

**Measuring modularity**

Cohesion, coupling, connascence

**Cohesion**: The extent to which a module’s parts should be contained within the same module. In other words, it measures how related the parts are to one another. An ideal cohesive module is one where all parts are packaged together; breaking them into smaller pieces would require coupling the parts together via calls between modules to achieve useful results.

- Functional cohesion: Every part of the module is related to the other, and the module contains everything essential it needs to function.
- Sequential cohesion: Two modules interact: one outputs data that becomes the input for the other.
- Communicational cohesion: Two modules form a communication chain in which each operates on information and/or contributes to some output. For example, one adds a record to the database and the other generates an email based on that information.
- Procedural cohesion: Two modules must execute code in a particular order.
- Temporal cohesion: Modules are related based on timing dependencies. For example, many systems have a list of seemingly unrelated things that must be initialized at system startup; these different tasks are temporally cohesive.
- Logical cohesion: The data within modules is related logically but not functionally. For example, consider a module that converts information from text, serialized objects, or streams into some other format. Its operations are related, but the functions are quite different.
- Coincidental cohsion: The elements in a module are unrelated other than being in the same source file. This represents the most negative form of cohesion.

[Chidamber and Kemerer Object-Oriented Metrics Suite](https://en.wikipedia.org/wiki/Programming_complexity#Chidamber_and_Kemerer_Metrics); LCOM, Lack of Cohesion in Methods: "Basically, ... exposes incidental coupling within classes. A better definition of LCOM would be 'the sum of sets of methods not shared via sharing fields.'"

**Coupling**: two flavors, afferent (incoming) and efferent (outgoing)

- Afferent: measures the number of incoming connections to a code artifact (component, class, function, and so on).
- Efferent: measures the outgoing connections to other code artifacts.

Metrics: 

- Abstractness: the ratio of abstract artifacts (abstract classes, interfaces, and so on) to concrete artifacts (implementations); measures a code base’s degree of abstractness versus implementation
- Instability: the volatility of a code base; breaks more easily when changed, because of high coupling
- Distance from Main Sequence: imagines an ideal relationship between abstractness and instability; classes that fall near this idealized line exhibit a healthy mixture of these two competing concerns. Too close to the origin is the "Zone of Pain" (code with too much implementation and not enough abstraction becomes brittle and hard to maintain); too far away from the origin is the "Zone of Uselessness" (code that is too abstract becomes difficult to use)

**Connascence**: Two components are connascent if a change in one would require the other to be modified in order to maintain the overall correctness of the system

"Meilir Page-Jones’s book What Every Programmer Should Know about Object-Oriented Design (Dorset House, 1996) created a more precise language to describe different types of coupling in object-oriented languages. Connascence isn’t a coupling metric like afferent and efferent coupling—​rather, it represents a language that helps architects describe different types of coupling more precisely (and understand some common consequences of types of coupling)."

- Static connascence: source-code-level coupling

    - Name: Multiple components must agree on the name of an entity. Method names and method parameters are the most common way that code bases are coupled and the most desirable, especially in light of modern refactoring tools that make system-wide name changes trivial to implement. For example, developers no longer change the name of a method in an active code base but rather refactor the method name using modern tools, affecting the change throughout the code base.

    - Type: Multiple components must agree on the type of an entity. This type of connascence refers to the common tendency in many statically typed languages to limit variables and parameters to specific types. However, this capability isn’t purely for statically typed languages—​some dynamically typed languages also offer selective typing, notably Clojure and Clojure Spec.

    - Meaning: Multiple components must agree on the meaning of particular values. It is also called Connascence of Convention. The most common obvious case for this type of connascence in code bases is hard-coded numbers rather than constants. For example, it is common in some languages to consider defining somewhere that int TRUE = 1; int FALSE = 0. Imagine the problems that would arise if someone flipped those values.

    - Position: Multiple components must agree on the order of values. This is an issue with parameter values for method and function calls, even in languages that feature static typing. For example, if a developer creates a method void updateSeat(String name, String seatLocation) and calls it with the values updateSeat("14D", "Ford, N"), the semantics aren’t correct, even if the types are.

    - Algorithm: Multiple components must agree on a particular algorithm. A common case for Connascence of Algorithm occurs when a developer defines a security hashing algorithm that must run and produce identical results on both the server and client to authenticate the user. Obviously, this represents a high degree of coupling—​if any details of either algorithm change, the handshake will no longer work.

- Dynamic connascence: execution/runtime coupling

    - Execution: The order of execution of multiple components is important.
    - Timing: The timing of the execution of multiple components is important. The common case for this type of connascence is a race condition caused by two threads executing at the same time, affecting the outcome of the joint operation.
    - Values: Several values depend on one another and must change together. Consider a case where a developer has defined a rectangle by defining four points to represent its corners. To maintain the integrity of the data structure, the developer cannot randomly change one of the points without considering the impact on the other points to preserve the shape of the rectangle. A more common and problematic case involves transactions, especially in distributed systems. In a system designed with separate databases, when someone needs to update a single value across all of the databases, the values must either all change together or not change at all.
    - Identity: Multiple components must reference the same entity. A common example of Connascence of Identity involves two independent components that must share and update a common data structure, such as a distributed queue.

Properties of connascence: Connascence is an analysis framework for architects and developers, and some of its properties help ensure that we use it wisely.

- Strength: Architects determine the strength of a system’s connascence by the ease with which a developer can refactor its coupling. Some types of connascence are demonstrably more desirable than others, as shown in Figure 3-5. Refactoring toward better types of connascence can improve the coupling characteristics of a code base. Architects should prefer static connascence to dynamic because developers can determine it by simple source-code analysis, and because modern tools make it trivial to improve static connascence. For example, Connascence of Meaning could be improved by refactoring to Connascence of Name, creating a named constant rather than a magic value. (Refactor in this direction: identity -> value -> timing -> execution -> position -> algorithm -> meaning -> type -> name)

- Locality: The locality of a system’s connascence measures how proximal (close) its modules are to each other in the code base. Proximal code (code in the same module) typically has more and higher forms of connascence than more separated code (in separate modules or code bases). In other words, forms of connascence that would indicate poor coupling when the components are far apart are fine when the components are closer together.

- Degree: The degree of connascence relates to the size of the impact of changing a class in a particular module—​does that change impact a few classes or many? Lesser degrees of connascence require fewer changes to other classes and modules and hence damage code bases less. In other words, having high dynamic connascence isn’t terrible if an architect only has a few modules. However, code bases tend to grow, making a small problem correspondingly bigger in terms of change.

Page-Jones offers three guidelines for using connascence to improve system modularity:

- Minimize overall connascence by breaking the system into encapsulated elements
- Minimize any remaining connascence that crosses encapsulation boundaries
- Maximize connascence within encapsulation boundaries

Jim Weirich offers two great rules"

- Rule of Degree: Convert strong forms of connascence into weaker forms of connascence.
- Rule of Locality: As the distance between software elements increases, use weaker forms of connascence.

## Ch 4: Architectural Characteristics Defined

## Ch 5: Identifying Architectural Characteristics

## Ch 6: Measuring and Governing Architecture Characteristics

## Ch 7: The Scope of Architectural Characteristics

## Ch 8: Component-Based Thinking

# Part 2: Architecture Styles

## Ch 9: Foundations

## Ch 10: Layered Architectural Style

## Ch 11: Modular Monolith Architectural Style

## Ch 12: Pipeline Architectural Style

## Ch 13: Microkernel Architectural Style

## Ch 14: Service-Based Architectural Style

## Ch 15: Event-Driven Architectural Style

## Ch 16: Space-Based Architectural Style

## Ch 17: Orcehstration-Driven Service-Oriented Architecture

## Ch 18: Microservices Architecture

## Ch 19: Choosing the Appropriate Architectural Style

## Ch 20: Architectural Patterns

# Part 3: Techniques and Soft Skills

## Ch 21: Architectural Decisions

## Ch 22: Analyzing Architectural Risk

## Ch 23: Diagramming Architecture

## Ch 24: Making Teams Effective

## Ch 25: Negotiation and Leadership Skills

## Ch 26: Architectural Intersections

## Ch 27: The Laws of Software Architecture, Revisited

**First Law: Everything in software architecture is a trade-off**

- Shared library versus shared service
- Synchronous versus Asynchronous Messaging

**First Corollary to the First Law: Missing trade-offs**

- Code reuse

**Second Corollary to the First Law: You can't do it just once**

**Second Law: Why is more important than how**

> Antipattern: Out of Context
> This antipattern occurs when the architect understands the trade-offs but not how to weight all of them based on the current context.

**Third Law: Most architecture decisions aren’t binary but rather exist on a spectrum between extremes**

