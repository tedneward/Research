title=Event-Driven/Event-Sourcing/Event Modeling Architecture
tags=architecture, event
summary=An approach to building systems via events.
~~~~~~

## Tools

- [Miro Event Modeling Toolkit](https://www.eventmodelers.de/): Build event-driven systems with visual Event Modeling directly in Miro. Design, collaborate, and generate code from your event models.

## Reading

### Articles/Blogs/Essays

- [Compilers Aren't Just for Programming Languages](https://www.architecture-weekly.com/p/compilation-isnt-just-for-programming)
- [Exploring CQRS and Event Sourcing](https://docs.microsoft.com/en-us/previous-versions/msp-n-p/jj554200(v=pandp.10)) - Dominic Betts, Julián Domínguez, Grigori Melnik, Mani Subramanian, Fernando Simonazzi ([EPUB, PDF](http://www.microsoft.com/en-us/download/details.aspx?id=34774) - [code samples](http://go.microsoft.com/fwlink/p/?linkid=258571))
- Six Event-Driven Archicture Patterns: [Part 1](https://medium.com/wix-engineering/6-event-driven-architecture-patterns-part-1-93758b253f47) [Part 2](https://medium.com/wix-engineering/6-event-driven-architecture-patterns-part-2-455cc73b22e1)
- ["The Case for Event-Driven Architecture with Mediator Topology"](https://www.infoq.com/articles/eda-mediator/)
- [The What, Why, and How of Event-Driven Programming](https://quix.io/blog/what-why-how-of-event-driven-programming)
- [What do commands do in Event Sourcing](https://ismaelcelis.com/posts/what-do-commands-do-in-event-sourcing/)
- [Handling events coming in an unknown order](https://event-driven.io/en/strict_ordering_in_event_handling/)

Rahul Krishnan's blog:

* [Overview](https://solutionsarchitecture.medium.com/event-driven-architecture-an-overview-00f5967385e6)
* [Deep Dive into Event Sourcing and CEP](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-deep-dive-into-event-sourcing-and-cep-bae090b4f19b)
* [Balancing Throughput, Latency, and Reliability](https://solutionsarchitecture.medium.com/event-driven-performance-optimization-balancing-throughput-latency-and-reliability-22e33e372243)
* [Schema Evolution, Deduplication, Ordering and Scalability](https://solutionsarchitecture.medium.com/mastering-event-driven-architectures-schema-evolution-deduplication-ordering-and-scalability-ed8d3596928e
* [Strategies for Error Management and Data Reliability](https://solutionsarchitecture.medium.com/event-driven-architecture-strategies-for-error-management-and-data-reliability-c76a5be2c0b6)
* [Observability: Tools and Techniques](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-observability-tools-and-techniques-2ba6e45ac82f)
* [Security Considerations](https://solutionsarchitecture.medium.com/mastering-event-driven-architectures-security-considerations-in-event-driven-architectures-7b2023a9b2e4)
* [Implementation in Modern Cloud Environments](https://solutionsarchitecture.medium.com/mastering-event-driven-architectures-implementation-in-modern-cloud-environments-e8c194e6dba7)
* [Common Anti-Patterns](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-common-anti-patterns-in-eda-63b3ac91c3a3)
* [Comparing and Contrasting Choreography, Orchestration, and Event Processing](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-part-10-comparing-and-contrasting-choreography-20b5ae6607df)
* [EDA vs Serverless](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-part-12-event-driven-architecture-vs-eda60dd7e361)
* [Theoretical Design--Event-Driven Architecture for a Financial Trading Platform](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-part-13-v-theoretical-design-event-driven-architecture-6902bd364fd2)
* [Introducing the Saga Pattern](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-part-14-introducing-the-saga-pattern-ef68a8712088)

"The Laws of Event Sourcing" - [Real World Event Sourcing](https://pragprog.com/titles/khpes/real-world-event-sourcing/)

- All Events are Immutable and Past Tense
- Applying a Failure Event Must Always Return the Previous State
- All Data Required for a Project Must Be on the Events
- Work Is a Side Effect
- All Projects must Stem from Events
- Never Manage More than One Flow per Process Manager
- Process Managers Must Not Read from Projections
- Event Schemas Are Immutable
- Different Projectors Cannot Share Projections
- Never Test Internal State

---

Complex Event Processing (CEP)

