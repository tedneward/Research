title=Event-sourcing storage model
tags=storage, model, events, event store
summary=Thoughts and links.
~~~~~~

A storage approach that stores a system’s state as an append-only sequence of events. Instead of updating the current state directly, each change to the system is recorded as an event. These events are then used to reconstruct the system’s state at any point in time.

Important Considerations for Event Sourcing

* Event Immutability: Events should be immutable. Once created, they cannot be changed.
* Event Sourcing vs. Event-Driven Architecture: While closely related, Event Sourcing is a pattern for storing and reconstructing state, while Event-Driven Architecture is a pattern for loosely coupling components.
* Eventual Consistency: Event Sourcing often leads to eventual consistency, meaning the system’s state may not be immediately updated after an event is recorded.
* Performance: Event Sourcing can be performance-intensive, especially for systems with high write loads or complex state transitions.
* Complexity: Implementing Event Sourcing can be more complex than traditional approaches due to the need for event handling, storage, and reconstruction.
* When to Use Event Sourcing

Event Sourcing is well-suited for:

* Systems that require a complete audit trail of changes.
* Systems with complex state transitions or business rules.
* Systems that need to be able to replay past events to recover from failures or explore different scenarios.
* Systems that benefit from eventual consistency.

Event Sourcing vs. Event-Driven Architecture: While Event-Driven Architecture and Event Sourcing are often used together, they are distinct concepts:

* Event-Driven Architecture: Focuses on decoupling components using events as a communication mechanism.
* Event Sourcing: Focuses on storing and reconstructing state using events.

[Introduction to Event Sourcing Workshop](https://github.com/oskardudycz/EventSourcing.NetCore/tree/main/Workshops/IntroductionToEventSourcing)

[Examples and Tutorials of Event Sourcing in .NET](https://github.com/oskardudycz/EventSourcing.NetCore)

[Understanding Eventsourcing](https://leanpub.com/eventmodeling-and-eventsourcing): The book by Martin Dilger

