title=Orleans
tags=distribution, library, actors, clr
summary=Actors-based implementation for distributed systems implementation.
~~~~~~

[Website](https://www.microsoft.com/en-us/research/project/orleans-virtual-actors/) | [Core research paper](https://www.microsoft.com/en-us/research/publication/orleans-distributed-virtual-actors-for-programmability-and-scalability/) | [Github](https://github.com/dotnet/orleans)

Heavily influenced by [Orbit](orbit), a Java actors flavor.

### Concepts
Core Orleans concepts.

* Grains: the building blocks. Grains = identity + behavior + state

  "Grains are entities comprising user-defined identity, behavior, and state. Grain identities are user-defined keys which make Grains always available for invocation. Grains can be invoked by other grains or by external clients such as Web frontends, via strongly-typed communication interfaces (contracts). Each grain is an instance of a class which implements one or more of these interfaces. ... Grains can have volatile and/or persistent state that can be stored in any storage system. As such, grains implicitly partition application state, enabling automatic scalability and simplifying recovery from failures. Grain state is kept in memory while the grain is active, leading to lower latency and less load on data stores. ... Instantiation of grains is automatically performed on demand by the Orleans runtime. Grains which are not used for a while are automatically removed from memory to free up resources. This is possible because of their stable identity, which allows invoking grains whether they are already loaded into memory or not. This also allows for transparent recovery from failure because the caller does not need to know on which server a grain is instantiated on at any point in time. Grains have a managed lifecycle, with the Orleans runtime responsible for activating/deactivating, and placing/locating grains as needed. This allows the developer to write code as if all grains were always in-memory. Taken together, the **stable identity, statefulness, and managed lifecycle** of Grains are core factors that make systems built on Orleans scalable, performant, & reliable without forcing developers to write complex distributed systems code." "They are the atomic units of isolation, distribution, and persistence. Grains are objects that represent application entities."

* Silos: the space in which Grains live.

* Clusters: a collection of silos.

### Getting Started

* Have .NET Core SDK installed

* Bootstrap the projects:

  ```
  dotnet new console -n Client
  dotnet new console -n SiloHost
  dotnet new classlib -n GrainIntfs
  dotnet new classlib -n GrainImpls
  ```

  In essence, this is like every other strongly-typed distributed object system; GrainIntfs contains the strongly-typed interfaces that the Client will use (through a proxy) to talk to the GrainImpls (implementations) living inside the SiloHost.

* [Set up NuGet References](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#add-orleans-nuget-packages)

  * SiloHost: Needs to depend on `Microsoft.Orleans.Server`, `Microsoft.Extensions.Logging.Console`
  * GrainInterfaces: `Microsoft.Orleans.Core.Abstractions`, `Microsoft.Orleans.CodeGenerator.MSBuild`
  * GrainImpls: `Microsoft.Orleans.CodeGenerator.MSBuild`, `Microsoft.Orleans.Core.Abstractions`, `Microsoft.Extensions.Logging.Abstractions`
  * Client: `Microsoft.Extensions.Logging.Console`, `Microsoft.Orleans.Client`

* Set up cross-project references:

  * GrainImpls references GrainInterfaces
  * SiloHost references GrainInterfaces and GrainImpls
  * Client references GrainInterfaces

* [Define Grain interface(s)](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#define-a-grain-interface)

* [Define Grain implementation(s)](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#define-a-grain-class)

* [Create the Silo](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#create-the-silo--programcs)

* [Create the Client](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#create-the-client--programcs)

* Run the application

  * Run the SiloHost

  * Run the Client

