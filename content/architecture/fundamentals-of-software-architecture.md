title=Fundamentals of Software Architecture (2nd Ed)
tags=architecture, reading, book
summary=Notes from the book
~~~~~~

<!-- Let's use some MermaidJS for some diagrams here, shall we? -->
<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
mermaid.initialize({ startOnLoad: true });
</script>

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

Many of the outdated frameworks for determining architectural characteristics had a fatal flaw: assuming one set of architectural characteristics for the entire system. The scope of architectural characteristics is a useful measure for architects, especially in determining the most appropriate architecture style to use as a starting point for implementation. Failing to find a good measure of scope, we developed one. We call it architecture quantum.

***Architectural Quanta and Granularity***: Component-level coupling isn’t the only thing that binds software together. Many business concepts bind parts of the system together semantically, creating *functional cohesion*. To design, analyze, and evolve software successfully, architects and developers must consider all the coupling points that could break. An *architecture quantum* is “the smallest part of the system that runs independently.” (Microservice: a service can run independently within the architecture, including its own data and other dependencies.) This:

* *establishes the scope for a set of architectural characteristics*: Architects use the architecture quantum as a boundary delineating a set of architectural characteristics, particularly operational ones. Because it is independently deployable and has high functional cohesion (discussed next), the architecture quantum provides a useful measure of architecture modularity.
* *independent deployment from other parts of the architecture*: For example, if an application uses a database, that database is part of the quantum, because the system won’t function without it. This requirement means that virtually all legacy systems that are deployed using a single database, by definition, form a quantum of one. However, in the microservices architecture style, each service includes its own database (part of the bounded context driving philosophy, described in detail in Chapter 18). This creates multiple quanta within that architecture, because each service has its own architectural characteristics scope.
* *high functional cohesion*: Cohesion in component design refers to how unified the contained code is in its purpose. High functional cohesion implies that an architecture quantum does something purposeful. This distinction matters little in traditional monolithic applications with a single database, where the cohesion is essentially the entire system. However, in distributed architectures like event-driven or microservices, architects are more likely to design each service to match a single workflow (a bounded context), so that service would exhibit high functional cohesion.
* *low-external-implementation static coupling*: The level of implementation coupling between architecture quanta should be low. This characteristic is also derived from the DDD philosophy of low coupling between bounded contexts. Quanta form the operational building blocks of architecture that sit one level of abstraction higher than components. They often overlap with service boundaries. This goal reflects architects’ general preference for loose coupling between different parts of the architecture. ***(Higher coupling is allowed for narrower scopes; the broader the scope, the looser the coupling should be.)***
* *synchronous communication with other quanta*: Synchronous communication is unforgiving in distributed architectures. 

Types of coupling:

* ***Semantic coupling*** describes the natural coupling of the problem for which an architect is building a solution. For example, an order-processing application’s inherent coupling includes things like inventory, catalogs, shopping carts, customers, and sales. The nature of the problem that motivates building a software solution defines this coupling. Architects have few techniques that prevent changes to the domain from rippling out through the system: a change to the domain (and therefore the semantics) means we’re changing the requirements for the system. While architects can adapt to that, no magical architecture pattern prevents changing the core problem from affecting architecture.
* ***Implementation coupling*** describes how an architect and team decide to implement particular dependencies. In an order-processing application, the team must consider a variety of constraints in setting domain boundaries. For example, should all the data reside in a single database, or should some of it be split apart for better scalability or availability? Should we build a monolith or a distributed architecture? The answers to these questions have little effect on the system’s semantic coupling, but greatly affect architectural decisions.
* ***Static coupling*** refers to the “wiring” of an architecture—​how services depend upon one another. Two services are part of the same architecture quantum if they both depend on the same coupling point. For example, let’s say that two microservices, Catalog and Shipping, need to share address information, so they both create a dependency to a shared component. Because both services are coupled to that dependency, they are part of the same architecture quantum. Here’s an easy way to think about coupling in software architecture: two things are coupled if changing one might break the other. Static coupling defines the scope dependencies in an architecture. For example, if several services use the same relational database, they are part of the same quantum.
* ***Dynamic coupling*** describes the forces involved when architecture quanta must communicate with each other. For example, when two services are running, they must communicate to form workflows and perform tasks within the system. Architects must consider the trade-offs when communicating between services in a distributed architecture.

Flowchart:

1. Choose architecture characteristics (1 set => Monolithic architecture, or more than 1 set => Distributed architecture)
2. Choose quanta
3. Determine persistence
4. Determine communication styles between quanta

*(Here they jump into the "Going Green" kata as an example of more-than-1 architecture characteristics)*

## Ch 8: Component-Based Thinking

Module: collection of related code. *Logical components*: the building blocks of a system. Identifying/managing logical components is a part of *architectural thinking*, so much that we call this *component-based thinking*: seeing the structure of a system as a set of logical components, all interacting to perform certain business functions. It's at this level that an architect "sees" the system.

Logical components in software architecture are usually manifested through a namespace or a directory structure containing the source code that implements that particular functionality. Typically, the leaf nodes of the directory structure or namespace containing source code represent the logical components in the architecture, and higher-level directories or namespace nodes represent the system’s domains and subdomains. 

#### Logical vs Physical Architecture
*(A little self-explanatory)* A logical architecture diagram doesn’t typically show a user interface, databases, services, or other physical artifacts. Rather, it shows the logical components and how they interact, which should match the directory structures and namespaces that organize the code. A physical architecture, on the other hand, includes such physical artifacts as services, user interfaces, databases, and so on. Physical architecture should closely represent one (or more) of the architectural styles documented.

Generally, a system’s logical architecture is independent of its physical architecture. In other words, when creating a logical architecture, the focus is more on what the system does, how that functionality is demarcated, and how the functional parts of the system interact, rather than on its physical structure.

Creating a logical architecture involves continuously identifying and restructuring logical components. Component identification works best as an iterative process. It involves producing candidate components, then refining them through a feedback loop:

<pre class="mermaid">
flowchart LR
    id1(identify initial core components)
    id2(assign user stories to components)
    id3(analyze roles and responsibility statements)
    id4(analyze architecture characteristics)
    id5(refactor as needed)
    id1 --> id2
    id2 --> id3
    id3 --> id4
    id4 --> id5
    id5 --> id2
</pre>

1. **Identify core components.** One mistake many software architects make is spending too much effort trying to get the initial logical components perfect the first time. A better approach is to make a “best guess” as to what the initial core components might look like, based on the core functionalities of the system, and refine them through the workflow above. In other words, it’s better to iterate over the logical components as you learn more about the system than to try to get it all perfect the first time, when you know least about the system and its specific requirements.

    * **The Workflow Approach.** As the name suggests, this approach leverages the major happy-path (non-error) workflows a user might take through the system (or its main request-processing workflow). If the architect has some sense of the general flow, they can develop components based on those steps.

    * **The Actor/Action Approach.** This approach is particularly useful when a system has multiple actors. With this approach, the architect identifies the major actions a user can perform in the system (such as placing an order). The system itself is always an actor, too, performing automated functions such as billing and replenishing stock.

    * **The Entity Trap.** It’s all too tempting for an architect to start identifying components by focusing on the entities involved with the system, then deriving components from those entities. The names of the logical components are ambiguous and don’t describe the role of the component. Components become dumping grounds for domain-related functionalities. When components become too coarse-grained, they do too much and lose their purpose.

2. **Assign user stories.** This is an iterative process, since most user stories or requirements are not completely known up front; they evolve as the system evolves. This step is meant to start filling those empty buckets *(a metaphor for the potentially-identified core components)*, giving the components specific roles and responsibilities.

3. **Analyzing roles and responsibilities.** This is how the architect ensures that the requirements or user stories assigned to those components belong there and that the components are not doing too much. What the architect is concerned about in this step is cohesion: how, and how much, a component’s operations interrelate. Over time, components can get too big, even though their operations allinterrelate.

4. **Analyzing architectural characteristics.** Some architectural characteristics, such as scalability, reliability, availability, fault tolerance, elasticity, and agility (the ability to respond quickly to change), may influence the size of a logical component.

5. **Refactor as needed.** Feedback is king. Architects must continually iterate on their component designs in collaboration with developers. Architects should expect to restructure components frequently throughout the lifecycle of a system or product–not only in greenfield systems, but in any that undergo frequent maintenance.

#### Component Coupling
The more coupled a system’s components are, the harder it is to maintain and test the system.

***Static Coupling.*** occurs when components communicate synchronously with each other. Architects need to be concerned about two types of coupling: afferent and efferent.

* *Afferent coupling* (also known as incoming or fan-in coupling) is the degree to which other components depend on a target component.
* *Efferent coupling* (also known as outgoing or fan-out coupling) is the degree to which a target component depends on other components.

***Temporal Coupling.*** describes nonstatic dependencies, usually those based on timing or transactions (single units of work). Difficult to detect.

> **The Law of Demeter:** A component or service should have limited knowledge of other components or services. The idea behind the Law of Demeter is to limit each component’s knowledge about the rest of the system. NOTE: Applying the Law of Demeter does not necessarily reduce the systemwide level of coupling; rather, it usually redistributes that coupling to different parts of the system.

*(Here they go through the Going Going Gone kata)*

# Part 2: Architecture Styles

## Ch 9: Foundations

An architecture's style describes several different characteristics:

* Component topology
* Physical architecture
* Deployment
* Communication style
* Data topology

Fundamental patterns

* ***Big Ball of Mud*** (Foote/Yoder): "A Big Ball of Mud is a haphazardly structured, sprawling, sloppy, duct-tape-and-baling-wire, spaghetti-code jungle. These systems show unmistakable signs of unregulated growth, and repeated, expedient repair. Information is shared promiscuously among distant elements of the system, often to the point where nearly all the important information becomes global or duplicated. The overall structure of the system may never have been well defined. If it was, it may have eroded beyond recognition. Programmers with a shred of architectural sensibility shun these quagmires. Only those who are unconcerned about architecture, and, perhaps, are comfortable with the inertia of the day-to-day chore of patching the holes in these failing dikes, are content to work on such systems." Generally one to avoid, usually the result of neglect and/or failure to achieve vision/insight.
* ***Unitary Architecture***: "In the beginning, there was only the computer, and software ran on it. The two started as a single entity, then split as they evolved and the need grew for more sophisticated capabilities."
* ***Client/Server***: Comes in several flavors

    * Desktop and database server. Old-school early-PC style.
    * Browser and web server.
    * Single-page Javascript Applications.
    * Three-tier. *(Honestly I think three-tier emerged long before the CORBA/DCOM wars, but maybe this is splitting hairs.)*

#### Architecture Partitioning
Layered monolith vs modular monolith.

An interesting side effect of layered architecture’s predominance relates to how companies often organized the seating in their physical offices according to different project roles. Because of Conway’s Law, when using a layered architecture, it makes some sense to have all the backend developers sit together in one department, the DBAs in another, the presentation team in another, and so on.

Organizing architecture based on its technical capabilities, like the layered monolith style does, represents technical top-level partitioning (Presentation, Business Rules, Service, Persistence):

* Clearly separates customization code.
* Aligns more closely to the layered architecture pattern.
* Higher degree of global coupling. Changes to the Common or Local component will likely affect all the other components.
* Developers may have to duplicate domain concepts in both the Common and Local layers.
* Typically, higher coupling at the data level. In a system like this, the application architects and the data architects would likely collaborate to create a single database, including customization and domains. That in turn would create difficulties in untangling the data relationships later, if the architects eventually want to migrate this architecture to a distributed system.

Domain top-level partitioning: grouping based on domain concepts (CatalogCheckout, Reporting, ShipToCustomer, ...) rather than technical purpose :

* Modeled more closely on how the business functions rather than on an implementation detail
* Easier to build cross-functional teams around domains
* Aligns more closely to the modular monolith and microservices architecture styles
* Message flow matches the problem domain
* Easy to migrate data and components to a distributed architecture
* Customization code appears in multiple places

Monolithic architecture styles:

* Layered
* Pipeline
* Microkernel

Distributed:

* Service-based
* Event-driven
* Space-based
* Service-oriented
* Microservices

*(Oh, I don't like this breakdown much, though I don't have one better to offer yet. Pipelines can definitely be distributed, and service-based, service-oriented, and microservices feels like very fine-lined segregation.)*

Fallcies of Distributed Computing

## Ch 10: Layered Architectural Style

Also known as *n-tier*.

Components within the layered architecture style are organized into logical horizontal layers, with each layer performing a specific role within the application (such as presentation logic or business logic). Although there are no specific restrictions in terms of the number and types of layers that must exist, most layered architectures consist of four standard layers: Presentation, Business, Persistence, and Database. Some architectures combine the Business and Persistence layers, particularly when the persistence logic (such as SQL or HSQL) is embedded within the Business layer components. Smaller applications may have only three layers, whereas larger and more complex business applications may contain five or more.

Each layer has a specific role and responsibility, and forms an abstraction around the work that needs to be done to satisfy a particular business request. For example, the Presentation layer is responsible for handling all UI and browser communication logic, whereas the Business layer is responsible for executing specific business rules associated with the request. The Presentation layer doesn’t need to know or worry about how to get customer data; it only needs to display that information on a screen in a particular format. Similarly, the Business layer doesn’t need to be concerned about how to format customer data for display on a screen or even where that data is coming from; it only needs to get the data from the Persistence layer, perform business logic against it (such as calculating values or aggregating data), and pass that information up to the Presentation layer.

This separation of concerns within the layered architecture style makes it easy to build effective role and responsibility models. Components within a specific layer are limited in scope, dealing only with the logic that pertains to that layer. For example, components in the Presentation layer only handle presentation logic, whereas components residing in the Business layer only handle business logic. This allows developers to leverage their particular technical expertise to focus on the technical aspects of the domain (such as presentation logic or persistence logic). The trade-off of this benefit, however, is a lack of overall holistic agility (the entire system’s ability to respond quickly to change).

The layered architecture is a technically partitioned architecture (as opposed to domain-partitioned). This means, as you learned in Chapter 9, that components, by their technical role in the architecture (such as presentation or business) rather than by domain (such as customer). As a result, any particular business domain is spread throughout all of the layers of the architecture. For example, the domain of “customer” is contained in the Presentation layer, Business layer, Rules layer, Services layer, and Database layer, making it difficult to apply changes to that domain. As a result, a DDD approach does not fit particularly well with the layered architecture style.

Each layer can be either closed or open. If a layer is closed, then as a request moves from the top layer down to the bottom layer, the request cannot skip any layers. It must go through the layer immediately beneath to get to the next layer. It would be much faster and easier for any layer to access a lower layer directly for simple retrieval requests, bypassing any unnecessary layers (what used to be known in the early 2000s as the Fast-Lane Reader pattern). For this to happen, the intermediate layers would have to be open, allowing requests to bypass other layers. Which is better—open layers or closed layers? The answer to this question lies in a key concept known as *layers of isolation*: changes made in one layer of the architecture generally don’t impact or affect components in other layers, providing the contracts between those layers remain unchanged. Each layer is independent of the other layers, with little or no knowledge of their inner workings. However, to support layers of isolation, layers involved with the major flow of a request have to be closed. If the Presentation layer can access the Persistence layer directly, then changes made to the Persistence layer would impact both the Business layer and the Presentation layer, producing a very tightly coupled application with layer interdependencies between components. This makes a layered architecture very brittle, as well as difficult and expensive to change. Leveraging the concept of open and closed layers helps define the relationship between architecture layers and request flows. It also provides developers with the necessary information and guidance to understand layer-access restrictions within the architecture. Failure to document or properly communicate which layers in the architecture are open and closed (and why) usually results in tightly coupled, brittle architectures that are very difficult to test, maintain, and deploy.

**Architecture Sinkhole:** This antipattern occurs when requests are simply passed through from layer to layer, with no business logic performed. For example, suppose the Presentation layer responds to a user’s simple request to retrieve basic customer data (such as name and address). The Presentation layer passes the request to the Business layer, which does nothing but pass the request on to the Rules layer, which in turn does nothing but pass it on to the Persistence layer, which then makes a simple SQL call to the Database layer to retrieve the customer data. The data is then passed all the way back up the stack with no additional processing or logic to aggregate, calculate, apply rules to, or transform any of it. This results in unnecessary object instantiation and processing, draining both memory consumption and performance. The key to determining whether this antipattern is at play is to analyze the percentage of requests that fall into this category. The 80-20 rule is usually a good practice to follow. For example, it is acceptable if only 20 percent of the requests are sinkholes; however, if it’s 80 percent, that’s a good indicator that the layered architecture is not the correct architecture style for the problem domain. Another approach to solving the Architecture Sinkhole antipattern is to make all the layers in the architecture open--realizing, of course, that the trade-off is increased difficulty in managing change.


Concern | Architectural characteristics | Rating
------- | ----------------------------- | ------
Overall cost | $
Partitioning type | Technical
Number of quanta | 1
Simplicity | *****
Modularity | *
Maintainability | *
Testability | **
Deployability | *
Evolvability | *
Responsiveness | ***
Scalability | *
Elasticity | *
Fault tolerance | *

Overall cost and simplicity are the primary strengths of the layered architecture style. Being monolithic, layered architectures aren’t as complex as distributed architecture styles; they’re simpler, easier to understand, and relatively low-cost to build and maintain. Use caution, though, because these ratings diminish quickly as the monolithic layered architecture gets bigger and consequently more complex.

Neither deployability and testability rate well for this architecture style. Deployability is low because deployments are high risk, infrequent, and involve a lot of ceremony and effort. For example, to make a simple three-line change to a class file, the entire deployment unit must be redeployed–introducing the potential for changes to the database, configuration, or other aspects of the code to sneak in alongside the original change. Furthermore, this simple three-line change is usually bundled with dozens of other changes, each of which further increases the risk and frequency of deployments. The low testability rating also reflects this scenario; with a simple three-line change, most developers are not going to spend hours executing the entire regression test suite for a simple three-line change (assuming they even have such a test suite). We give testability a two-star rating (rather than one star) because this style offers the ability to mock or stub components or even an entire layer, which eases the overall testing effort.

The engineering characteristics of the layered architecture style reflect the dynamic mentioned above: they all start well, but degrade as the size of the code base grows.

Elasticity and scalability rate very low (one star) for the layered architecture, primarily due to its monolithic deployments and lack of architectural modularity. Although it is possible to make certain functions within a monolith scale more than other functions, this effort usually requires very complex design techniques for which this architecture isn’t well suited, such as multithreading, internal messaging, and other parallel processing practices. However, because a layered system’s architecture quantum is always 1 (due to its monolithic UI and database and its backend processing), applications can only scale to a certain point.

Architects can achieve high responsiveness in a layered architecture with careful design, and increase it further through techniques such as caching and multithreading. We give this style three stars overall, because it does suffer from a lack of inherent parallel processing, as well as from closed layering and the Architecture Sinkhole antipattern.

## Ch 11: Modular Monolith Architectural Style

As the name suggests, the modular monolith architecture style is a monolithic architecture. As such, it’s deployed as a single unit of software: a web archive (WAR) file, a single assembly in .NET, an enterprise archive file (EAR) in the Java platform, and so on. Because modular monolith is considered a domain-partitioned architecture (one organized by business domains rather than technical capabilities), its isomorphic shape is defined as a single deployment unit with functionality grouped by domain area.

#### Common Risks
As with any monolithic system, the primary risk with the modular monolith architectural style is that it can get too big to properly maintain, test, and deploy. Monolithic architectures in and of themselves aren’t bad; it’s when they get too big that problems start to occur. What “too big” means varies from system to system, but here are some of the warning signs that the system might be too big:

* Changes take too long to make.
* When one area of the system is changed, other areas unexpectedly break.
* Team members get in each other’s way when applying changes.
* It takes too long for the system to start up.

Another risk is going overboard with code reuse. Code reuse and sharing are a necessary part of software development, but in this architecture style, too much code reuse blurs the module boundaries, leading the architecture into the risky territory of the unstructured monolith: a monolithic architecture with such highly interdependent code that it cannot be unraveled.

Too much intermodule communication is another risk in this architectural style. Ideally, modules should be independent and self-contained. As we’ve noted, it’s normal (and sometimes necessary) for some modules to communicate with others, particularly within a complex workflow. However, if there’s too much intercommunication between modules, it’s a good indication that the domains may have been ill-defined in the first place. In such cases, it’s worth putting additional thought into redefining the domains to accommodate complex workflows and interdependencies.

Concern | Architectural characteristics | Rating
------- | ----------------------------- | ------
Overall cost | $
Partitioning type | Domain
Number of quanta | 1
Simplicity | *****
Modularity | **
Maintainability | **
Testability | **
Deployability | **
Evolvability | **
Responsiveness | ****
Scalability | *
Elasticity | *
Fault tolerance | *

Overall cost, simplicity, and modularity are the primary strengths of the modular monolith architecture style. Being monolithic in nature, these architectures don’t have the complexities associated with distributed architecture styles. They’re simpler and easier to understand, and relatively low-cost to build and maintain. Architectural modularity is achieved through the separation of concerns between the various modules, representing domains and subdomains.

Deployability and testability, while only two stars, rate slightly higher in modular monolith than the layered architecture due to its level of modularity. That said, this architecture style is still a monolith: as such, ceremony, risk, frequency of deployment, and completeness of testing negatively impact these scores.

Modular monolith architectures’ elasticity and scalability rate very low (one star), primarily due to monolithic deployments. Although it is possible to make certain functions within a monolith scale more than others, this effort usually requires very complex design techniques (such as multithreading, internal messaging, and other parallel-processing practices) for which this architecture isn’t well suited.

Modular monolith architectures’ monolithic deployments don’t support fault tolerance. If one small part of the architecture causes an out-of-memory condition, the entire application unit crashes. Furthermore, as in most monolithic applications, overall availability is affected by the high mean time to recovery (MTTR), with startup times usually measured in minutes.

## Ch 12: Pipeline Architectural Style
One of the fundamental styles in software architecture is the pipeline architecture (also known as the pipes and filters architecture). As soon as developers and architects decided to split functionality into discrete parts, this style of architecture followed. Developers in many functional programming languages will see parallels between language constructs and elements of this architecture. In fact, many tools that use the MapReduce programming model follow this basic topology.

The topology of the pipeline architecture consists of two main component types, pipes and filters. Filters contain the system functionality and perform a specific business function, and pipes transfer data to the next filter (or filters) in the chain. They coordinate in a specific fashion, with pipes forming one-way, usually point-to-point communication between filters.

The isomorphic “shape” of the pipeline architecture is thus a single deployment unit, with functionality contained within filters connected by unidirectional pipes. *(I disagree fundamentally with the idea that this is a single deployment unit; one of the most powerful points of variability here is the ability to independently version and deploy a filter anywhere along the pipeline without adjusting or affecting any of the other elements in the chain. Key requirement to being able to do that, though, is the agreement on a unified shape to the pipeline--in other words, we all agree on what we're sending and consuming.)*

Filters are self-contained pieces of functionality that are independent from other filters. They are generally stateless, and should perform one task only. Composite tasks are typically handled by a sequence of filters rather than a single one. There are four types of filters in the pipeline architecture style:

* Producer: The starting point of a process, producer filters are outbound only. They are sometimes called the source. A user interface and an external request to the system are both examples of producer filters.
* Transformer: Transformer filters accept input, optionally perform a transformation on some or all of the data, then forward the data to the outbound pipe. Functional-programming advocates will recognize this feature as map. Transformer filters might, for example, enhance data, transform data, or perform some sort of calculation.
* Tester: Tester filters accept input, test it according to one or more criteria, and then optionally produces output based on the test. Functional programmers will recognize this as similar to reduce. A Tester filter might check that all data is valid and entered correctly, or to act as a switch to determine if processing should move forward (for example, “don’t forward the data to the next filter if the order amount is less than five dollars”).
* Consumer: The termination point for the pipeline flow, consumer filters sometimes persist the final result of the pipeline process to a database or display the final results on a UI screen.

*(Technically, I can also think of a filter being a "splitter", passing data into two distinct pipelines from here, but still flowing data unidirectionally down the pipeline. If it incorporates testing as part of the splitter, it becomes a "valve".)*

Pipes, in this architecture, form the communication channel between filters. Each pipe is typically unidirectional and point-to-point, accepting input from one source and directing output to another. Their payload can be any data format, but architects typically favor smaller amounts of data to enable high performance. If a filter (or group of filters) is deployed as a separate service in a distributed fashion, the pipes issue a unidirectional remote call using REST, messaging, streaming, or some other remote communication protocol. Whether their deployment topology is monolithic or distributed, pipes can be either synchronous or asynchronous. In monolithic deployments, architects use threads or embedded messaging for asynchronous communication to a filter.

#### Common Risks

* Overloading filters: The primary goal behind the pipeline architecture is to separate functionality into single-purpose filters, where each filter performs one specific action on the data and then hands it off to another filter for further processing. As such, one of its most common risks is overloading filters with too much responsibility. Good governance helps teams mitigate this risk by identifying the purpose behind each filter component.
* Violation of the unidirectional flow: Another common risk with this architecture style is introducing bidirectional communication between filters. Pipes are meant to be unidirectional only, providing a clear separation of concerns between filters to avoid collaboration between them. If bidirectional communication turns out to be necessary, this is a good indication that the pipeline architecture might not be the right style to use, or that the filters' functionality isn’t demarcated correctly.
* Handling error conditions: If an error occurs within a pipeline, it is often difficult to determine how to properly exit the pipeline and recover once the pipeline is started. For this reason, it’s important for architects to determine any possible fatal-error conditions within the pipeline before defining the architecture.
* Pipeline shape: Each pipe has a contract representing the data (and possibly the corresponding types) that it sends to the next filter. Changing a contract between filters requires strict governance and testing to ensure that other filters receiving the contract don’t break. *(This presumes that each filter has a separate contract for its inputs and its outputs; if these are normalized into an accepted shape across the entire pipeline, this becomes less of a concern, at the tradeoff of being more generalized and possibly wasteful and/or slightly out-of-phase to the filters' purpose.)*

Concern | Architectural characteristics | Rating
------- | ----------------------------- | ------
Overall cost | $
Partitioning type | Technical
Number of quanta | 1
Simplicity | *****
Modularity | **
Maintainability | **
Testability | ***
Deployability | **
Evolvability | ***
Responsiveness | ***
Scalability | *
Elasticity | *
Fault tolerance | *

Overall cost, simplicity, and modularity are the primary strengths of the pipeline architecture style. Being monolithic, pipeline architectures don’t have the complexities associated with distributed architecture styles--they’re simple and easy to understand, and are relatively low cost to build and maintain. Architectural modularity is achieved through separating concerns between the various filter types and transformers: any filter can be modified or replaced without affecting the other filters. *(Again, this is a little subject to the uniformity of pipeline shape--if the filters each expect different inputs and outputs, then filters must decide on a reader-makes-right vs writer-makes-right strategy to align the outputs of one filter to the inputs of another. Technically, though, that could be solved via the introduction of a new filter, but that can add to the overall complexity of the pipeline as a whole.)*

Deployability and testability, while only average, rate slightly higher than in the layered architecture due to the level of modularity filters can achieve. However, pipeline architectures are still typically monolithic, so their downsides include ceremony, risk, frequency of deployment, and completeness of testing. *(Again, not sure I buy the "typically monolithic" argument, but it depends I suppose on the degree implied in "typically".)*

Elasticity and scalability rate very low (one star) in the pipeline architecture, primarily due to monolithic deployments. Implementing this architecture style as a distributed architecture using asynchronous communication can significantly improve these characteristics, but the trade-off is a blow to overall cost and simplicity. *(Multiple pipelines could be run in parallel, each handling different load, so I think scalability is greater than they imply here.)*

Pipeline architectures don’t support fault tolerance because they are typically deployed as monolithic systems. If one small part of a pipeline architecture causes an out-of-memory condition to occur, the entire application unit is impacted and crashes. Furthermore, overall availability is affected by the high mean time to recovery (MTTR) common in most monolithic applications, with startup times measured in minutes. As with elasticity and scalability, implementing this architecture style as a distributed architecture using asynchronous communication can significantly improve fault tolerance, again paying the price with cost and complexity.

Most of the low-scoring operational characteristics can be raised by making this a distributed architecture with asynchronous communication, where each filter is a separate deployment unit and the pipes are remote calls. However, doing so will negatively affect other attributes such as simplicity and cost, illustrating one of the classic trade-offs of software architecture.

## Ch 13: Microkernel Architectural Style

## Ch 14: Service-Based Architectural Style

## Ch 15: Event-Driven Architectural Style

## Ch 16: Space-Based Architectural Style

## Ch 17: Orcehstration-Driven Service-Oriented Architecture

## Ch 18: Microservices Architecture

## Ch 19: Choosing the Appropriate Architectural Style

## Ch 20: Architectural Patterns

#### Reuse: Separating domain and operational coupling
One of the design goals of microservices architectures is a high degree of decoupling, often manifested in the advice “Duplication is preferable to coupling.”

Hexagonal (Ports & Adapters) vs Sidecar and Service Mesh

Sidecar

Advantages | Disadvantages
---------- | --------------
Offers a consistent way to create isolated coupling | Must implement a sidecar per platform
Allows consistent infrastructure coordination | Sidecar component may grow large/complex
Ownership per team, centralized, or some combination | Implementation “drift” between independent teams

#### Communication: Orchestration vs Choreography
Orchestration (mediation) is centralized invocation of dependencies; choreography is decentralized, each dependency passing on to the next

Orchestration:

* *Centralized workflow*:As complexity goes up, architects benefit from utilizing a unified component for state, behavior, and boundary conditions.
* *Error handling*: Error handling, a major part of many domain workflows, is assisted by having a state owner for the workflow.
* *Recoverability*: Because an orchestrator monitors the state of the workflow, if one or more domain services suffers from a short-term outage, the architect can add logic to retry.
* *State management*: Having an orchestrator makes the state of the workflow queryable, providing a place for other workflows and other transient states.
* *Responsiveness*: All communication must go through the orchestrator, which has the potential to create a throughput bottleneck that can harm responsiveness.
* *Fault tolerance*: While orchestration enhances recoverability for domain services, it creates a potential single point of failure for the workflow. This can be addressed with redundancy, but that also adds more complexity.
* *Scalability*: This communication style doesn’t scale as well as choreography because the orchestrator adds more coordination points, which cuts down on potential parallelism.
* *Service coupling*: Having a central orchestrator creates tighter coupling between it and the domain components, which is sometimes necessary but is frowned upon in microservices architectures.

Choreography:

* *Responsiveness*: This communication style has fewer single chokepoints, thus offering more opportunities for parallelism.
* *Scalability*: The lack of coordination points like orchestrators allows more independent scaling.
* *Fault tolerance*: The lack of a single orchestrator allows the architect to use multiple instances to enhance fault tolerance. They could, of course, create multiple orchestrators, but because all communication must go through them, multiple orchestrators are more sensitive to the workflow’s overall level of fault tolerance.
* *Service decoupling*: No orchestrator means less coupling.
* *Distributed workflow*: Having no workflow owner makes managing errors and other boundary conditions more difficult.
* *State management*: Having no centralized state holder hinders ongoing state management.
* *Error handling*: Error handling is more difficult without an orchestrator because the domain services must have more workflow knowledge.
* *Recoverability*: Recoverability becomes more difficult without an orchestrator to attempt retries and other remediation efforts.

CQRS: CQRS isolates writes into one datastore (usually a database; sometimes another infrastructure, such as a durable message queue), which synchronizes the data to another database (usually asynchronously), which services read requests. By separating reads and writes, architects can isolate different architectural characteristics depending on the data. This also allows them to use different data models for each database if necessary. CQRS is a good example of a data communication pattern that facilitates differing architectural characteristics for different types of data capabilities, security concerns, or other factors that benefit from physical separation.

*(No pros/cons list for CQRS? Fie, gentlmen, fie!)*

### Infrastructure

Event-driven architecture uses events to communicate between services, so event handlers need to subscribe to the proper services to build the workflow. Event handlers are implemented by brokers, which are part of the infrastructure of the architecture. In EDA, the topic or queue is typically owned by the sender. If a system uses only one broker for all communication, all of its services depend on a single part of the infrastructure; potential failure point. Alternative is to treat infrastructure in a similar manner to the granularity of domains; each group of related services shares a broker, reflecting the architecture's overall domain partitioning.

Single-broker:

* Centralized discovery
* fault tolerance
* Least possible infrastructure
* throughput limits

Domain-broker:

* Better isolation
* More difficult discovery of queues/topics
* Matches domain boundaries
* more infrastructure = more expensive
* More scalable
* More moving parts to maintain

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

