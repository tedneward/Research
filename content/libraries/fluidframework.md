title=Fluid Framework
tags=library, presentation, distribution, storage
summary=A collection of client libraries for distributing and synchronizing shared state, allowing multiple clients to simultaneously create and operate on shared data structures using coding patterns similar to those used to work with local data.
~~~~~~

### How Fluid works
Fluid was designed to deliver collaborative experiences with blazing performance. To achieve this goal, the team kept the server logic as simple and light-weight as possible. This approach helped ensure virtually instant syncing across clients with very low server costs.

To keep the server simple, each Fluid client is responsible for its own state. While previous systems keep a source of truth on the server, the Fluid service is responsible for taking in data operations, sequencing the operations, and returning the sequenced operations to the clients. Each client is able to use that sequence to independently and accurately produce the current state regardless of the order it receives operations.

Here is a typical flow:

* Client code changes data locally
* Fluid runtime sends that change to the Fluid service
* Fluid service sequences that operation and broadcasts it to all clients
* Fluid runtime incorporates that operation into local data and raises a “valueChanged” event
* Client code handles that event (updates view, runs business logic

[Website](https://fluidframework.com/) | [Source](https://github.com/microsoft/FluidFramework)
