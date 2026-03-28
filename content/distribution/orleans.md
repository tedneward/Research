title=Orleans
tags=distribution, library, actor, clr, shared space
summary=Actors-based implementation for distributed systems implementation.
~~~~~~

[Website](https://www.microsoft.com/en-us/research/project/orleans-virtual-actors/) | [Core research paper](https://www.microsoft.com/en-us/research/publication/orleans-distributed-virtual-actors-for-programmability-and-scalability/) | [Github](https://github.com/dotnet/orleans)

Heavily influenced by [Orbit](../orbit), a Java actors flavor.

[HanBaoBao](https://github.com/ReubenBond/hanbaobao-web): Orleans sample application with Kubernetes hosting

### Concepts
Core Orleans concepts.

* Grains: the building blocks. Grains = identity + behavior + state

    "Grains are entities comprising user-defined identity, behavior, and state. Grain identities are user-defined keys which make Grains always available for invocation. Grains can be invoked by other grains or by external clients such as Web frontends, via strongly-typed communication interfaces (contracts). Each grain is an instance of a class which implements one or more of these interfaces. ... Grains can have volatile and/or persistent state that can be stored in any storage system. As such, grains implicitly partition application state, enabling automatic scalability and simplifying recovery from failures. Grain state is kept in memory while the grain is active, leading to lower latency and less load on data stores. ... Instantiation of grains is automatically performed on demand by the Orleans runtime. Grains which are not used for a while are automatically removed from memory to free up resources. This is possible because of their stable identity, which allows invoking grains whether they are already loaded into memory or not. This also allows for transparent recovery from failure because the caller does not need to know on which server a grain is instantiated on at any point in time. Grains have a managed lifecycle, with the Orleans runtime responsible for activating/deactivating, and placing/locating grains as needed. This allows the developer to write code as if all grains were always in-memory. Taken together, the **stable identity, statefulness, and managed lifecycle** of Grains are core factors that make systems built on Orleans scalable, performant, & reliable without forcing developers to write complex distributed systems code." "They are the atomic units of isolation, distribution, and persistence. Grains are objects that represent application entities."

* Silo: the space in which Grains live.

* Cluster: a collection of silos.

### Getting Started


## Investigation

#### Add unit testing to HelloWorld above

#### Stateful grain(s)
[Russell's tutorial](https://medium.com/@kritner/microsoft-orleans-reusing-grains-and-grain-state-136977facd42) states that there's two ways to do stateful grains:

* Extend `Grain<T>` instead of `Grain`

    Grain state needs to be persisted, which means we need to configure the SiloHost with a persistence configuration option. MemoryGrainStorage is the classic in-memory storage option; use `.AddMemoryGrainStorage("storage-name")` in silo configuration.

    Then create a grain interface that exposes the state (optional?), which provides an internal/protected member State to store the state, and use WriteStateAsync() to do the actual storage.

* "Do it yo'self" (which isn't clear to me what that entails)

Look into [MathGrains](https://dotnet.github.io/orleans/docs/tutorials_and_samples/MathGrains.html) (when it has actual text) and/or build my own calculator

Chat application: investigate multiplayer communication. (Does Orleans support server->client communication flow, or is it all client-initiated?) -- looks like this [Twitter-clone-like sample](https://github.com/dotnet/orleans/tree/master/Samples/3.3/Chirper) may have some answers to that. 

There's also the concept of "grain observers" (IGrainObserver), which [the presence sample](https://github.com/dotnet/orleans/tree/master/Samples/3.0/Presence) uses.

#### Dynamic lookup of grains? Display a list of active grains?

#### Dynamic invocation of grains? Runtime discovery of grains?

#### Versioning? Contract versioning?

#### Grains implementing multiple interfaces? (supported or not?)

#### Messaging underpining
If this is an actors implementation, I would think we would be able to get to the messages being sent/received in a more detailed fasion, which could then allow for some of the dynamic invocation of grains that I'm curious about.

#### Grain call filters (interceptors)

#### Request context (request/response metadata)

#### How do I hook into grain lifecycle to know about activation/deactivation?
[Here](https://dotnet.github.io/orleans/docs/grains/grain_lifecycle.html) it documents that application logic can participate with a grain's lifecycle in one of two ways.

* **Override `Participate` method from Grain base class.** The passed IGrainLifecycle object provides the ability to register a `Task ...(CancellationToken ct)` method to be invoked when grains of that type enter a partiular state.

* **"components can access the lifecycle via the grain activation context (see IGrainActivationContext.ObservableLifecycle)."** Not quite sure what this means yet, but it looks like it has to do with how grains are constructed via dependency injection. Later in that section it says:

    > "Components created during a grain’s construction can take part in the lifecycle as well, without any special grain logic being added. Since the grain’s activation context (IGrainActivationContext), including the grain’s lifecycle (IGrainActivationContext.ObservableLifecycle), is created before the grain is created, any component injected into the grain by the container can participate in the grain’s lifecycle."

    I think this is related to the IGrainRuntime-based constructor I found in the [Grain.cs](https://github.com/dotnet/orleans/blob/master/src/Orleans.Core.Abstractions/Core/Grain.cs) implementation (which I thought was a two-argument constructor?).

#### Are grains leased, and can I configure leasing options?

#### Singletons?
In the [Unit Testing](https://dotnet.github.io/orleans/docs/tutorials_and_samples/testing.html) section, we see reference to this snippet of code:
```
hostBuilder.ConfigureServices(services => {
    services.AddSingleton<T, Impl>(...);
});
```
Does this mean we have the ability to do singleton implementations of grains? **No**, I think this is related to how services/objects are injected into grains, false alarm.


