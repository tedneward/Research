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

* Silo: the space in which Grains live.

* Cluster: a collection of silos.

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

* Set up dependencies (NuGet and cross-project). Each of these projects will 

    * [Set up NuGet References](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#add-orleans-nuget-packages)

        * SiloHost: Needs to depend on `Microsoft.Orleans.Server`, `Microsoft.Extensions.Logging.Console`:

            ```
            cd SiloHost
            dotnet add package Microsoft.Orleans.Server
            dotnet add package Microsoft.Extensions.Logging.Console
            ```

        * GrainInterfaces: `Microsoft.Orleans.Core.Abstractions`, `Microsoft.Orleans.CodeGenerator.MSBuild`

            ```
            cd GrainInterfaces
            dotnet add package Microsoft.Orleans.Core.Abstractions
            dotnet add package Microsoft.Orleans.CodeGenerator.MSBuild
            ```

        * GrainImpls: `Microsoft.Orleans.CodeGenerator.MSBuild`, `Microsoft.Orleans.Core.Abstractions`, `Microsoft.Extensions.Logging.Abstractions`:

            ```
            cd GrainImpls
            dotnet add package Microsoft.Extensions.Logging.Abstractions
            dotnet add package Microsoft.Orleans.Core.Abstractions
            dotnet add package Microsoft.Orleans.CodeGenerator.MSBuild
            ```

        * Client: `Microsoft.Extensions.Logging.Console`, `Microsoft.Orleans.Client`

            ```
            cd Client
            dotnet add package Microsoft.Extensions.Logging.Console
            dotnet add package Microsoft.Orleans.Client
            ```

    * Set up cross-project references:

        * GrainImpls references GrainInterfaces: `dotnet add reference ../GrainInterfaces`
      
        * SiloHost references GrainInterfaces and GrainImpls: `dotnet add reference ../GrainInterfaces` and `dotnet add reference ../GrainImpls`
      
        * Client references GrainInterfaces: `dotnet add reference ../GrainInterfaces`

* [Define Grain interface(s)](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#define-a-grain-interface)

  The Orleans HelloWorld tutorial defines a simple "Hello World" interface that takes a string and returns a string; specifically the return type is a `Task<string>` because Orleans wants to stress async invocation of remote methods. (Not sure if this is a strength or weakness or what yet; on the one hand, countless distributed object systems have gone with synchronous invocation and gotten themselves into trouble, but on the other hand, I am not a fan of "magic" built into the library...)

  ```
  using System.Threading.Tasks;

  namespace GrainInterfaces
  {
      public interface IHelloWorld : Orleans.IGrainWithIntegerKey
      {
          Task<string> SayHello(string greeting);
      }
  }
  ```

  Note the lack of `using` to obtain the `IGrainWithIntegerKey` type.

* [Define Grain implementation(s)](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#define-a-grain-class)

  In keeping with the distributed object approach, we define an implementation of the Grain in the implementation project that inherits from a `Orleans.Grain` base class, and implements the typed interface `IHelloWorld`.

  ```
  using HelloWorld.Interfaces;
  using System.Threading.Tasks;
  using Microsoft.Extensions.Logging;

  namespace HelloWorld.Grains
  {
      /// <summary>
      /// Orleans grain implementation class HelloGrain.
      /// </summary>
      public class HelloGrain : Orleans.Grain, IHelloWorld
      {
          private readonly ILogger logger;

          public HelloGrain(ILogger<HelloGrain> logger)
          {
              this.logger = logger;
          }  

          Task<string> IHelloWorld.SayHello(string greeting)
          {
              logger.LogInformation($"SayHello message received: greeting = '{greeting}'");
              return Task.FromResult($"You said: '{greeting}', I say: Hello!");
          }
      }
  }
  ```

  The `ILogger` appears to be injected in through a means I don't understand yet. (Can I inject any arbitrary constructor arguments?)

  Not sure where the "integer primary key" is coming into play here, or even if it should yet. This is a stateless grain, so maybe it doesn't need one?

* [Create the SiloHost](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#create-the-silo--programcs)

    The SiloHost is the process host for the Orleans Grain we've created, and will be what provides the Orleans runtime support so Clients (next) can find their way to the Grain; this gives the runtime the opportunity to do all of the things it likes to do on the behalf of the grain, like instantiation, activation, and so on. (The parallels here to EJB or RMI or CORBA or any of the other distributed-object systems is just spooky... or disappointing, depending on where you sit in opinion on those things.)

    ```
    using System;
    using System.Net;
    using System.Threading.Tasks;
    using HelloWorld.Grains;
    using Microsoft.Extensions.Logging;
    using Orleans;
    using Orleans.Configuration;
    using Orleans.Hosting;

    namespace OrleansSiloHost
    {
        public class Program
        {
            public static int Main(string[] args)
            {
                return RunMainAsync().Result;
            }

            private static async Task<int> RunMainAsync()
            {
                try
                {
                    var host = await StartSilo();
                    Console.WriteLine("Press Enter to terminate...");
                    Console.ReadLine();

                    await host.StopAsync();

                    return 0;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                    return 1;
                }
            }

            private static async Task<ISiloHost> StartSilo()
            {
                // define the cluster configuration
                var builder = new SiloHostBuilder()
                    .UseLocalhostClustering()
                    .Configure<ClusterOptions>(options =>
                    {
                        options.ClusterId = "dev";
                        options.ServiceId = "HelloWorldApp";
                    })
                    .Configure<EndpointOptions>(options => options.AdvertisedIPAddress = IPAddress.Loopback)
                    .ConfigureApplicationParts(parts => parts.AddApplicationPart(typeof(HelloGrain).Assembly).WithReferences())
                    .ConfigureLogging(logging => logging.AddConsole());

                var host = builder.Build();
                await host.StartAsync();
                return host;
            }
        }
    }
    ```

    `Main` just defers to an async version of `Main` to keep with the async theme everywhere.

    `RunMainAsync` async calls `StartSilo` to do the work of spinning up the runtime, then console-blocks until a Return is pressed, at which point it starts the shutdown of the runtime. Add some exception-handling, and we have a pretty vanilla host. **Investigate: Wonder if there's some generic hosting options coming down the pipe, or if the intent is to always keep Orleans host-neutral like this.**

    `StartSilo` does the work of the configuration. Points to explore:

    * `UseLocalhostClustering`: probably sets up clustering to be just localhost, wonder what this needs to look like to do clustering across different environments.
    * `Configure<ClusterOptions>`: looks like this sets up identifiers for how the cluster and silo is advertised or negotiates around names. **Investigate: How would multiple services identify?**
    * `Configure<EndpointOptions>`: how do interfaces and endpoints relate to one another?
    * `ConfigureApplicationparts`: looks like this is how the implementation actually gets registered with the silo/runtime
    * `ConfigureLogging`: pretty self-explanatory, wonder if I can set up multiple logging endpoints; guessing I just make multiple `logging.Add...()` calls or something.

    Documentation has a [list of options](https://dotnet.github.io/orleans/docs/host/configuration_guide/list_of_options_classes.html) for reference purposes. 

    During the build, an interesting step shows up: `Orleans.CodeGenerator - command-line = SourceToSource /Users/tedneward/Projects/Exploration.git/Orleans/GrainImpls/obj/Debug/net5.0/GrainImpls.orleans.g.args.txt`; want to bet it's generating server-side proxy arond the interfaces referenced?

* [Create the Client](https://dotnet.github.io/orleans/docs/tutorials_and_samples/tutorial_1.html#create-the-client--programcs)
  Ironically for most systems of this type, the Client code is the longest, which surprises me:
  ```
  using HelloWorld.Interfaces;
  using Orleans;
  using Orleans.Runtime;
  using System;
  using System.Threading.Tasks;
  using Microsoft.Extensions.Logging;
  using Orleans.Configuration;

  namespace OrleansClient
  {
      public class Program
      {
          const int initializeAttemptsBeforeFailing = 5;
          private static int attempt = 0;

          static int Main(string[] args)
          {
              return RunMainAsync().Result;
          }

          private static async Task<int> RunMainAsync()
          {
              try
              {
                  using (var client = await StartClientWithRetries())
                  {
                      await DoClientWork(client);
                      Console.ReadKey();
                  }

                  return 0;
              }
              catch (Exception e)
              {
                  Console.WriteLine(e);
                  Console.ReadKey();
                  return 1;
              }
          }

          private static async Task<IClusterClient> StartClientWithRetries()
          {
              attempt = 0;
              IClusterClient client;
              client = new ClientBuilder()
                  .UseLocalhostClustering()
                  .Configure<ClusterOptions>(options =>
                  {
                      options.ClusterId = "dev";
                      options.ServiceId = "HelloWorldApp";
                  })
                  .ConfigureLogging(logging => logging.AddConsole())
                  .Build();

              await client.Connect(RetryFilter);
              Console.WriteLine("Client successfully connect to silo host");
              return client;
          }

          private static async Task<bool> RetryFilter(Exception exception)
          {
              if (exception.GetType() != typeof(SiloUnavailableException))
              {
                  Console.WriteLine($"Cluster client failed to connect to cluster with unexpected error.  Exception: {exception}");
                  return false;
              }
              attempt++;
              Console.WriteLine($"Cluster client attempt {attempt} of {initializeAttemptsBeforeFailing} failed to connect to cluster.  Exception: {exception}");
              if (attempt > initializeAttemptsBeforeFailing)
              {
                  return false;
              }
              await Task.Delay(TimeSpan.FromSeconds(4));
              return true;
          }

          private static async Task DoClientWork(IClusterClient client)
          {
              // example of calling grains from the initialized client
              var friend = client.GetGrain<IHelloWorld>(0);
              var response = await friend.SayHello("Good morning, my friend!");
              Console.WriteLine("\n\n{0}\n\n", response);
          }
      }
  }
  ```

  Breaking it down:
  * `Main` calls `RunMainAsync` for the same reasons as in the SiloHost above.
  * `RunMainAsync` calls `StartClientWithRetries` to bootstrap the client-side runtime, it looks like. `ClientBuilder` looks to be the fluent API for constructing the client-side runtime, and I'm betting the configuration options here have to match (or be compatible with) the host's settings or Bad Things(TM) result. Exception being logging, of course, since that's almost always local to the process. At the end, though, we call `Connect` with a parameter of `RetryFilter` which is a method/function that appears to provide some retry logic for the client runtime to use as part of its built-in connection logic. Haven't seen this before, feels like a good aproach, but time will tell. **Investigate: looks like I specify a retry filter once per client runtime?**
  * `DoClientWork` then uses the client runtime to obtain a proxy to the grain (passing in what I'm guessing is supposed to be the primary key for the grain) and invoke the method on the grain itself.

* Run the application: `cd SiloHost; dotnet run` and `cd Client; dotnet run`. LOTS of verbosity from both, pretty typical stuff for a distributed object system. Interesting bits of note:
  * Appears we have some kind of "server GC" in place, thinking this is how Orleans knows to deactivate grains as described in the docs. Wonder if it's a lease-based approach, a la RMI/Jini?
  * This block is interesting to me:
    ```
    Loaded grain type summary for 7 types:
    Grain class HelloWorld.Grains.HelloWorld.Grains.HelloGrain [-262720675 (0xF057335D)] from GrainImpls.dll implementing interfaces: GrainInterfaces.IHelloWorld [1320694741 (0x4EB833D5)]
    Grain class Orleans.LogConsistency.Orleans.LogConsistency.LogConsistentGrain<TView> [-319513858 (0xECF49AFE)] from Orleans.Core.dll implementing interfaces: 
    Grain class Orleans.Runtime.Development.Orleans.Runtime.Development.DevelopmentLeaseProviderGrain [940524075 (0x380F422B)] from Orleans.Runtime.dll implementing interfaces: Orleans.Runtime.Development.IDevelopmentLeaseProviderGrain [-1234611069 (0xB6695483)]
    Grain class Orleans.Runtime.Management.Orleans.Runtime.Management.ManagementGrain [1954798034 (0x7483D9D2)] from Orleans.Runtime.dll implementing interfaces: Orleans.Runtime.IManagementGrain [-1734666656 (0x989B1660)]
    Grain class Orleans.Runtime.ReminderService.Orleans.Runtime.ReminderService.GrainBasedReminderTable [-55315191 (0xFCB3F509)] from Orleans.Runtime.dll implementing interfaces: Orleans.IReminderTableGrain [-1135060418 (0xBC585A3E)]
    Grain class Orleans.Runtime.Versions.Orleans.Runtime.Versions.VersionStoreGrain [331003096 (0x13BAB4D8)] from Orleans.Runtime.dll implementing interfaces: Orleans.Runtime.Versions.IVersionStoreGrain [-297600501 (0xEE42FA0B)], Orleans.IGrainWithStringKey [-1277021679 (0xB3E23211)]
    Grain class Orleans.Streams.Orleans.Streams.PubSubRendezvousGrain [1903070868 (0x716E8E94)] from Orleans.Runtime.dll implementing interfaces: Orleans.Streams.IPubSubRendezvousGrain [1746702088 (0x681C8F08)]      
    ```
    This suggests that Orleans uses some of its own infrastructure to provide its own infrastructure? In general I like that kind of referential integrity.
  * This block is also interesting:
    ```
    ProcessTableUpdate (called from TryUpdateMyStatusGlobalOnce) membership table: 1 silos, 1 are Active, 0 are Dead, Version=<2, 2>. All silos: [SiloAddress=S127.0.0.1:11111:346226086 SiloName=Silo_ff4c8 Status=Active]
    ```
    Looks like the ProcessTable might be the collection of grains and silos currently active inside the host?

### Investigation questions

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


