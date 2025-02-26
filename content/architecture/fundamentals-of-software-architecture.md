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

Structural design consists of two activities:

- architectural characteristics analysis
- logical component design (Ch 8)

Problem domain: list of requirements for the system; architectural characteristics are independent of the domain

"To be considered an architectural characteristic, a requirement must meet three criteria. It must specify a nondomain design consideration, influence some structural aspect of the design, and be critical or important to the application’s success."

*An architecture characteristic specifies a nondomain design consideration*: Structural design in software architecture consists of two activities by an architect: understanding the problem domain and uncovering what kinds of capabilities the system needs to support to be successful. The domain design considerations cover the behavior of the system, and architectural characteristics define the capabilities. Taken together, these two activities define structural design. While design requirements specify what the application should do, architectural characteristics specify how to implement the requirements and why certain choices were made: in short, the operational and design criteria for the project to succeed. For example, specific levels of performance are often an important architectural characteristic, but often don’t appear in requirements documents. Even more pertinent: no requirements document actually states that a design must “prevent technical debt,” but it is a common design consideration. We cover this distinction between explicit and implicit characteristics in depth in “Extracting Architectural Characteristics from Domain Concerns”.

*An architecture characteristic influences some structural aspect of the design*: The primary reason architects try to describe architectural characteristics on projects is to tease out important design considerations. Can the architect implement it via design, or does this architectural characteristic require special structural consideration to succeed? For example, security is a concern in virtually every project, and all systems must take certain baseline precautions during design and coding. However, security rises to the level of an architectural characteristic when the architect determines that the architecture needs special structure to support it. Consider two common architectural characteristics: security and scalability. Architects can accommodate security in a monolithic system by using good coding hygiene, including well-known techniques such as encryption, hashing, and salting. Conversely, in a distributed architecture such as microservices, the architect would build a more hardened service with stricter access protocol--a structural approach. Thus, architects can accommodate security via either design or structure. On the other hand, consider scalability: no amount of clever design will allow a monolithic architecture to scale beyond a certain point. *(I'm not sure I entirely believe that.)* Beyond that, the system must change to a distributed architectural style. Architects pay close attention to operational architectural characteristics (discussed in “Operational Architectural Characteristics”) because they are the characteristics that most often require special structural support.

*An architecture characteristic must be critical or important to application success*: Applications can support a huge number of architectural characteristics... but they shouldn’t. Each architectural characteristic a system supports adds complexity to its design. That’s why architects should strive to choose the fewest possible architectural characteristics rather than the most.

Architectural characteristics divided into implicit vs explicit, depending on whether they often appear in requirements.

#### Partial List of Architectural Characteristics

**Operational**
Term | Definition
---- | -------------------
Availability | How much of the time the system will need to be available; if that’s 24/7, steps need to be in place to allow the system to be up and running quickly in case of any failure.
Continuity | The system’s disaster-recovery capability.
Performance | How well the system performs; ways to measure this include stress testing, peak analysis, analysis of the frequency of functions used and response times.
Recoverability | Business continuity requirements: in case of a disaster, how quickly the system must get back online. This includes backup strategies and requirements for duplicate hardware.
Reliability/safety | Whether the system needs to be fail-safe, or if it is mission critical in a way that affects lives. If it fails, will it cost the company large sums of money? This is often a spectrum rather than a binary.
Robustness | The system’s ability to handle error and boundary conditions while running: for example, if the internet connection or power fails.
Scalability | The system’s ability to perform and operate as the number of users or requests increases.

**Structural**
Term | Definition
---- | -----------
Configurability | How easily end users can change aspects of the software’s configuration through interfaces.
Extensibility | How well the architecture accommodates changes that extend its existing functionality.
Installability | How easy it is to install the system on all necessary platforms.
Leverageability/reuse | The extent to which the system’s common components can be leveraged across multiple products.
Localization | Support for multiple languages on entry/query screens in data fields.
Maintainability | How easy it is to apply changes and enhance the system.
Portability | The system’s ability to run on more than one platform (such as Oracle and SAP DB)?
Upgradeability | How easy and quick it is to upgrade to a newer version on servers and clients.

**Cloud**
Term | Definition
---- | ---------------
On-demand scalability | The cloud provider’s ability to scale up resources dynamically based on demand.
On-demand elasticity | The cloud provider’s flexibility as resource demands spike; similar to scalability.
Zone-based availability | The cloud provider’s ability to separate resources by computing zones to make for more resilient systems.
Region-based privacy and security | The cloud provider’s legal ability to store data from various countries and regions. Many countries have laws governing where their citizens’ data may reside (and often restricting it from storage outside their region).

**Cross-cutting**
Term | Definition
---- | ---------------
Accessibility | How easily all users can access the system, including those with disabilities like colorblindness or hearing loss.
Archivability | The system’s constraints around archiving or deleting data after a specified period of time.
Authentication | Security requirements to ensure users are who they say they are.
Authorization | Security requirements to ensure users can access only certain functions within the application (by use case, subsystem, webpage, business rule, field level, etc.).
Legal | The legislative constraints in which the system operates, such as data protection laws like GDPR or financial-records laws like Sarbanes-Oxley in the US, or any regulations regarding the way the application is to be built or deployed. This includes what reservation rights the company requires.
Privacy | The system’s ability to encrypt and hide transactions from internal company employees, even DBAs and network architects.
Security | Rules and constraints about encryption (in the database or for network communication between internal systems; authentication for remote user access, and other security measures.
Supportability | The level of technical support the application needs; how much logging and other facilities are required to debug errors in the system?
Usability/achievability | The level of training required for users to achieve their goals with the application/solution.

**[ISO partial list](https://iso25000.com/index.php/en/iso-25000-standards/iso-25010)**

Performance efficiency: Measure of the performance relative to the amount of resources used under known conditions. This includes time behavior (measure of response, processing times, and/or throughput rates), resource utilization (amounts and types of resources used), and capacity (degree to which the maximum established limits are exceeded).

Compatibility: Degree to which a product, system, or component can exchange information with other products, systems, or components and/or perform its required functions while sharing the same hardware or software environment. It includes coexistence (can perform its required functions efficiently while sharing a common environment and resources with other products) and interoperability (degree to which two or more systems can exchange and utilize information).

Usability: Users can use the system effectively, efficiently, and satisfactorily for its intended purpose. It includes appropriateness recognizability (users can recognize whether the software is appropriate for their needs), learnability (how easily users can learn how to use the software), user error protection (protection against users making errors), and accessibility (make the software available to people with the widest range of characteristics and capabilities).

Reliability: Degree to which a system functions under specified conditions for a specified period of time. This characteristic includes subcategories such as maturity (does the software meet the reliability needs under normal operation), availability (software is operational and accessible), fault tolerance (does the software operate as intended despite hardware or software faults), and recoverability (can the software recover from failure by recovering any affected data and reestablish the desired state of the system.

Security: Degree to which the software protects information and data so that people or other products or systems have the degree of data access appropriate to their types and levels of authorization. This family of characteristics includes confidentiality (data is accessible only to those authorized to have access), integrity (the software prevents unauthorized access to or modification of software or data), nonrepudiation, (can actions or events be proven to have taken place), accountability (can user actions of a user be traced), and authenticity (proving the identity of a user).

Maintainability: Represents the degree of effectiveness and efficiency to which developers can modify the software to improve it, correct it, or adapt it to changes in environment and/or requirements. This characteristic includes modularity (degree to which the software is composed of discrete components), reusability (degree to which developers can use an asset in more than one system or in building other assets), analyzability (how easily developers can gather concrete metrics about the software), modifiability (degree to which developers can modify the software without introducing defects or degrading existing product quality), and testability (how easily developers and others can test the software).

Portability: Degree to which developers can transfer a system, product, or component from one hardware, software, or other operational or usage environment to another. This characteristic includes the subcharacteristics of adaptability (can developers effectively and efficiently adapt the software for different or evolving hardware, software, or other operational or usage environments), installability (can the software be installed and/or uninstalled in a specified environment), and replaceability (how easily developers can replace the functionality with other software).

Functional suitability: This characteristic represents the degree to which a product or system provides functions that meet stated and implied needs when used under specified conditions. This characteristic is composed of the following subcharacteristics:

Functional completeness: Degree to which the set of functions covers all the specified tasks and user objectives.

Functional correctness: Degree to which a product or system provides the correct results with the needed degree of precision.

Functional appropriateness: Degree to which the functions facilitate the accomplishment of specified tasks and objectives.

Architectures can't support all of the architecture characteristics (cost; some work against one another; ambiguity) so only support those that are critical or important

> "Never shoot for the best architecture; shoot for the least worst architecture."

## Ch 5: Identifying Architectural Characteristics

At least three places to uncover architectural characteristics: domain concerns, project requirements, your implicit domain knowledge

Domain concern | Architectural characteristics
-------------- | -----------------------------
Mergers and acquisitions | Interoperability, scalability, adaptability, extensibility
Time to market | Agility, testability, deployability
User satisfaction | Performance, availability, fault tolerance, testability, deployability, agility, security
Competitive advantage | Agility, testability, deployability, scalability, availability, fault tolerance
Time and budget | Simplicity, feasibility

A *composite architectural characteristic* is one that has no single objective definition but rather is composed of other measurable things

*(They walk through a kata here)*

**_Architecture Characteristics Worksheet**_
```
System/Project: _________________
Architect/Team: _________________

Top 3  Driving Characteristics    Implicit Characteristics
 [ ]   _______________________    ________________________
 [ ]   _______________________    ________________________
 [ ]   _______________________    ________________________
 [ ]   _______________________    ________________________
 [ ]   _______________________    ________________________
 [ ]   _______________________    Others Considered
 [ ]   _______________________    ________________________
                                  ________________________
```

Seven slots on the left, deliberately, to force prioritization

## Ch 6: Measuring and Governing Architecture Characteristics

**Measuring Architecture Characteristics**

Struggles

* They aren't physics
* Wildly varying definitions
* Too composite

Forms

* Operational measures (response times, etc)
* Structural measures (cyclomatic complexity, etc)
* Process measures (testability, deployability, etc)

#### Governance and Fitness Functions

Governance covers any aspect of the software development process that architects want to influence. Use tools whenever possible; these are *fitness functions*: "any mechanism that provides an objective integrity assessment of some architecture characteristic or combination of architecture characteristics."

Analyze modularity via cyclic dependencies

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

