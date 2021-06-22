title=Coyote
tags=clr, language, research, static, compiled
summary=A statically-compiled research language from Microsoft around explicit state machine management.
~~~~~~

A set of libraries and tools for building reliable asynchronous software. [Website](https://microsoft.github.io/coyote/). [Github](https://github.com/microsoft/coyote/). Evolution of [P#](/languages/psharp). Part of [Microsoft Research](/places/msr.html).

#### Publications
[Reliable State Machines: A Framework for Programming Reliable Cloud Services](https://arxiv.org/abs/1902.09502): "Building reliable applications for the cloud is challenging because of unpredictable failures during a program’s execution. This paper presents a programming framework called Reliable State Machines (RSMs), that offers fault-tolerance by construction. Using our framework, a programmer can built an application as several (possibly distributed) RSMs that communicate with each other via messages, much in the style of actor-based programming. Each RSM is additionally fault-tolerant by design and offers the illusion of being “always-alive”. An RSM is guaranteed to process each input request exactly once, as one would expect in a failure-free environment. The RSM runtime automatically takes care of persisting state and rehydrating it on a failover. We present the core syntax and semantics of RSMs, along with a formal proof of failure-transparency.

We provide an implementation of the RSM framework and runtime on the .NET platform for deploying services to Microsoft Azure. We carried out an extensive performance evaluation on micro-benchmarks to show that one can build high-throughput applications with RSMs. We also present a case study where we rewrote a significant part of a production cloud service using RSMs. The resulting service has simpler code and exhibits production-grade performance."

## Concepts

### Programming model: asynchronous actors
The asynchronous actors programming model of Coyote is an actor-based programming model that encourages a message passing (or event based) programming model where all asynchronous actions happen by sending asynchronous events from one actor to another. This model is similar to how real people interact asynchronously via email.

Each Coyote actor has an inbox for events, event handlers, as well as normal class fields and methods. Actors run concurrently with respect to each other, but individually they handle their input queue in a sequential way. When an event arrives, the actor dequeues that event from the input queue and handles it by executing a sequence of operations. Each operation might update a field, create a new actor, or send an event to another actor. In Coyote, creating actors and sending events are both non-blocking operations. In the case of a send operation the message (or event) is simply enqueued into the input queue of the target actor and, most importantly, it does not wait for the message to be processed at the target before returning control to the sender.

The actor model also provides a specialized type of actor called a StateMachine. State machines are actors that have explicitly declared states and state transitions. Every object oriented class that has member variables is really also just a state machine where that state is updated as methods are called, but sometimes this gets really complicated and hard to test. Formal state machines help you model your states more explicitly and coyote tester can help you find bugs by exploring different state transitions using information you provide declaring how various types of events causes those state transitions.

#### Declaring and creating actors
An actor based program in Coyote is a normal .NET program that also uses the Actor or StateMachine base classes from the Microsoft.Coyote.Actors namespace, as well as the Event base class from the Microsoft.Coyote namespace. Actors can be declared in the following way:

    using Microsoft.Coyote.Actors;

    class Client : Actor { ... }

    class Server : Actor { ... }

The above code declares two actors named Client and Server. Being a C# class you can also declare fields, properties and methods.

An actor can create an instance of another actor and send Events using the following Actor methods:

    ActorId clientId = this.CreateActor(typeof(Client));
    this.SendEvent(this.ClientId, new PingEvent());

When an event is being sent, it is enqueued in the event queue of the target actor. The coyote runtime will at some point dequeue the received event, and allow the target actor to handle it asynchronously.

All actors in Coyote have an associated unique ActorId which identifies a specific instance of that type. Note that Coyote never gives you the actual object reference for an actor instance. This ensures your code does not get too tightly coupled.

By limiting yourself to the Coyote API’s for interacting with an actor, you also get all the benefits of coyote test in terms of understanding more deeply how to test all asynchronous interactions and ensure your specifications are maintained correctly. There is a lot of literature on actor models that explain in more depth the importance of this message passing programming model which is especially popular in the world of distributed systems. Event based programming is also popular in User Interface development and even shows up in low level embedded systems. It is a powerful tool for solving the tangled web of complexity that happens with less disciplined architectures.

#### Starting a Coyote actor-based program
To create the first instance of an Actor you need to initialize the Coyote actor runtime inside your C# process (typically in the Main method). An example of this is the following:

    using Microsoft.Coyote;
    using Microsoft.Coyote.Actors;
    using Microsoft.Coyote.SystematicTesting;
    using System;

    class Program
    {
        static void Main(string[] args)
        {
            IActorRuntime runtime = RuntimeFactory.Create();
            Execute(runtime);
            Console.ReadLine();
        }

        [Test]
        public static void Execute(IActorRuntime runtime)
        {
            ActorId serverId = runtime.CreateActor(typeof(Server));
        }
    }

You must first import the Coyote runtime library (Microsoft.Coyote.dll), which you can get from NuGet, then create a runtime instance (of type IActorRuntime) which you pass to a [Test] method.

The test method named Execute will be the entry point that is used during testing of your Coyote program. In this case it simply invokes the CreateActor method of the runtime to instantiate the first Coyote actor (of type Server in the above example).

The CreateActor method accepts as a parameter the type of the actor to be instantiated, and returns the ActorId representing that actor instance and this bootstraps a series of asynchronous events that handle initialization of that actor and any operations it performs during initialization.

Because CreateActor is an asynchronous method, we call the Console.ReadLine method, which pauses the main thread until some console input has been given, so that the host C# program does not exit prematurely.

The IActorRuntime interface also provides the SendEvent method for sending events to a Coyote actor. This method accepts as parameters an object of type ActorId and an event object. It also has a couple more advanced parameters which you don’t need to worry about right now.

An event can be created by sub-classing from Microsoft.Coyote.Event:

    class PingEvent : Event
    {
        public readonly ActorId Caller;

        public PingEvent(ActorId caller)
        {
            this.Caller = caller;
        }
    }

    class PongEvent : Event { }

An event can contain members of any type (including scalar values or references to object) and when an event is sent to a target actor there is no deep-copying of those members, for performance reasons. The target actor will be able to see the Event object and cast it to a specific type to extract the information it needs.

Now you can write a complete actor, declaring what type of events it can handle:

    [OnEventDoAction(typeof(PingEvent), nameof(HandlePing))]
    class Server : Actor
    {
        public void HandlePing(Event e)
        {
            PingEvent ping = (PingEvent)e;
            Console.WriteLine("Server handling ping");
            Console.WriteLine("Server sending pong back to caller");
            this.SendEvent(ping.Caller, new PongEvent());
        }
    }

This Server is an Actor that can receive PingEvent. The PingEvent contains the ActorId of the caller and the Server uses that to send back a PongEvent in response.

An event handler controls how a machine reacts to a received event. It is clearly just a method so you can do anything there, including creating one or more actor instances, sending one or more events, updating some private state or invoking some 3rd party library.

To complete this Coyote program, you can provide the following implementation of the Client actor:

    using System.Threading.Tasks;

    class SetupEvent : Event
    {
        public readonly ActorId ServerId;

        public SetupEvent(ActorId server)
        {
            this.ServerId = server;
        }
    }

    [OnEventDoAction(typeof(PongEvent), nameof(HandlePong))]
    class Client : Actor
    {
        public ActorId ServerId;

        protected override Task OnInitializeAsync(Event initialEvent)
        {
            Console.WriteLine("{0} initializing", this.Id);
            this.ServerId = ((SetupEvent)initialEvent).ServerId;
            Console.WriteLine("{0} sending ping event to server", this.Id);
            this.SendEvent(this.ServerId, new PingEvent(this.Id));
            return base.OnInitializeAsync(initialEvent);
        }

        void HandlePong()
        {
            Console.WriteLine("{0} received pong event", this.Id);
        }
    }

This Client is an Actor that sends PingEvents to a server. This means the Client needs to know the ActorId of the Server. This can be done using an initialEvent passed to OnInitializeAsync. The Client then uses this ActorId to send a PingEvent to the Server.

When the Server responds with a PongEvent the HandlePong method is called because of the OnEventDoAction declaration on the class. Notice in this case the HandlePong event handler takes no Event argument. The Event argument is optional on Coyote event handlers.

Note that HandlePong could also be defined as an async Task method. Async handlers are allowed so that you can call external async systems in your production code, but this has some restrictions. You are not allowed to directly create parallel tasks inside an actor (e.g. by using Task.Run) as that can introduce race conditions (if you need to parallelize a workload, you can simply create more actors). Also, during testing, you should not use Task.Delay or Task.Yield in your event handlers. It is ok to have truly async behavior in production, but at test time the coyote test tool wants to know about, so that it can control, all async behavior of your actor. If it detects some uncontrolled async behavior an error will be reported.

One last remaining bit of code is needed in your Program to complete this example, namely, you need to create the Client actor in the Execute method, in fact, you can create as many Client actors as you want to make this an interesting test:

    public static void Execute(IActorRuntime runtime)
    {
        ActorId serverId = runtime.CreateActor(typeof(Server));
        runtime.CreateActor(typeof(Client), new SetupEvent(serverId));
        runtime.CreateActor(typeof(Client), new SetupEvent(serverId));
        runtime.CreateActor(typeof(Client), new SetupEvent(serverId));
    }

The output of the program will be something like this:

    Client(3) initializing
    Client(3) sending ping event to server
    Client(1) initializing
    Client(2) initializing
    Client(2) sending ping event to server
    Client(1) sending ping event to server
    Server handling ping from Client(1)
    Server sending pong back to caller
    Client(1) received pong event
    Server handling ping from Client(3)
    Server sending pong back to caller
    Server handling ping from Client(2)
    Server sending pong back to caller
    Client(2) received pong event
    Client(3) received pong event

The CreateActor and SendEvent methods are non-blocking so you can see those operations are interleaved in the log output. The Coyote runtime will take care of all the underlying concurrency using the Task Parallel Library, which means that you do not need to explicitly create and manage tasks. However, you must be careful not to share data between actors because accessing that shared data from multiple actors at once could lead to race conditions.

You can reduce race conditions in your code if you use events to transfer data from one actor to another. But since it is a reference model without deep copy semantics, you can actually share data between actors if you really need to. See sharing objects for more information in this advanced topic.

### Assertions
Coyote also supports specifying invariants through assertions. You can do this by using the Assert method, which accepts as input a predicate that must always hold in that specific program point, e.g. this.Assert(k == 0), which holds if the integer k equals to 0. These Assert statement are useful for local invariants, i.e., they are about the state of a single actor. For global invariants it is recommended that you use Monitors.

#### The inbox is crucial to the Actor model
You can think of an Event declaration as a type of interface definition for Actors. Events really define the interface of an Actor because the caller will never get to see the Greeter class, so the caller can’t just call HandleGreeting directly. The caller only gets to see an ActorId, which is like a Coyote runtime handle to the actor.

**There is a really important reason for this.**

Events are queued in an inbox managed by the Actor base class. This serializes the incoming events so that at any given time, only one event is being handled in the Greeter. This greatly simplifies concurrent programming. For example, there is no need to use lock to protect against data race conditions, and therefore no need to worry about deadlocks. Each Actor instance can run in a separate thread, so all actors in the system can be hugely parallel, but at the same time the processing inside an Actor is incredibly simple. So you get the best of both worlds, code that scales but is also easy to write. An Actor receives messages, and can create other Actor objects, and can send events.

Notice the Greeter gets an ActorId from the RequestGreetingEvent and uses that to send a greeting back to the caller using SendEvent:

    this.SendEvent(ge.Caller, new GreetingEvent(greeting));

### State Machines
A Coyote state machine is a special type of Actor that inherits from the StateMachine class which lives in the Microsoft.Coyote.Actors namespace. A state machine adds State semantics with explicit information about how Events can trigger State changes in a StateMachine. You can write a state machine version of the Server class shown in Programming model: asynchronous actors like this:

    class ReadyEvent : Event { }

    class Server : StateMachine
    {
        [Start]
        [OnEntry(nameof(InitOnEntry))]
        [OnEventGotoState(typeof(ReadyEvent), typeof(Active))]
        class Init : State { }

        void InitOnEntry()
        {
            this.RaiseEvent(new ReadyEvent());
        }

        [OnEventDoAction(typeof(PingEvent), nameof(HandlePing))]
        class Active : State { }

        void HandlePing(Event e)
        {
            var pe = (PingEvent)e;
            Console.WriteLine("Server received ping event from {0}", pe.Caller.Name);
            this.SendEvent(pe.Caller, new PongEvent());
        }
    }

The above class declares a state machine named Server. The StateMachine class itself inherits from Actor so state machines are also actors and, of course, state machines are also normal C# classes. Actors and StateMachines can talk to each other by sending events. State machines in Coyote must also declare one or more states where a state is a nested class that inherits from the coyote State class which is a nested class inside StateMachine. The nested state classes can be private.

The above code snippet declares two states in the Server machine: Init and Active. You must use the Start attribute to declare one of the states the initial state, which will be the first state that the machine will transition to upon initialization. In this example, the Init state has been declared as the initial state of Server. A state declaration can optionally be decorated with a number of state-specific attributes, as seen in the [Init] state:

    [OnEntry(nameof(InitOnEntry))]
    [OnEventGotoState(typeof(ReadyEvent), typeof(Active))]

The OnEntry attribute denotes an action that will be executed when the machine transitions to the Init state, while the OnExit attribute denotes an action that will be executed when the machine leaves the state. Actions in Coyote are C# methods that take either no input parameters or a single input parameter of type Event, and return either void or async Task. OnExit actions cannot receive an Event argument. Note that Coyote actions are also referred to as event handlers, however these should not be confused with the System.EventHandler, which have a different prototype.

Notice that the InitOnEntry method declared above is similar to the original OnInitializeAsync method on the Server Actor. The RaiseEvent call is used to trigger the state transition defined in the OnEventGotoState custom attribute, in this case it is ready to transition to the Active state:

    this.RaiseEvent(new ReadyEvent());

The RaiseEvent call is used to send an event to yourself. Similar to SendEvent, when a machine raises an event on itself, it is also queued so that the method can continue execution until the InitOnEntry method is completed. When control returns to the coyote runtime, instead of dequeuing the next event from the inbox (if there is one), the machine immediately handles the raised event (so raised events are prioritized over any events in the inbox). This prioritization is important in the above case, because it guarantees that the Server will transition to the Active state before the PingEvent is received from the Client.

The attribute OnEventGotoState indicates that if the state machine receives the ReadyEvent event while it is currently in the Init state, it will automatically handle the ReadyEvent by exiting the Init state and transitioning to the Active state. This saves you from having to write that trivial event handler logic.

All this happens as a result of the simple RaiseEvent call and the OnEventGotoState attribute. The Coyote state machine programming model takes a lot of tedium out of managing explicit state machinery. If you ever find yourself building your own state machinery, then you definitely should consider using the Coyote state machine class instead. Note that on a given State of a state machine, you can only define one handler for a given event type.

When you run this new StateMachine based Server you will see the same output as before, with the addition of the state information from HandlePong:

    Program+Client(2) initializing
    Program+Client(2) sending ping event to server
    Program+Client(1) initializing
    Program+Client(1) sending ping event to server
    Program+Client(3) initializing
    Program+Client(3) sending ping event to server
    Server received ping event from Program+Client(2)
    Server received ping event from Program+Client(1)
    Server received ping event from Program+Client(3)
    Program+Client(2) received pong event
    Program+Client(3) received pong event
    Program+Client(1) received pong event

Unlike Actors which declare the events they can receive at the class level, StateMachines can also declare this information on the States. This gives StateMachines more fine grained control, for example, perhaps you want your state machine to only be able to receive a certain type of event when it is in a particular state. In an Actor you would need to check this yourself and throw an exception, whereas in a state machine this is more declarative and is enforced by the Coyote runtime; the Coyote runtime will report an error if an event is received on a State of a StateMachine that was not expecting to receive that event. This reduces the amount of tedious book keeping code you need to write, and keeps your code even cleaner.

For an example of a state machine in action see the state machine demo.

#### Goto, push and pop states
Besides RaiseEvent, state machine event handlers can request a state change in code rather than depending on OnEventGotoState attributes. This allows conditional goto operations as shown in the following example:

    void InitOnEntry()
    {
        if (this.Random())
        {
            this.RaiseGotoStateEvent<Active>();
        }
        else
        {
            this.RaiseGotoStateEvent<Busy>();
        }
    }

State machines can also push and pop states, effectively creating a stack of active states. Use [OnEventPushState(...)] or RaisePushStateEvent in code to push a new state:

    this.RaisePushStateEvent<Active>();

This will push the Active state on the stack, but it will also inherit some actions declared on the Init state. The Active state can pop itself off the stack, returning to the Init state using a RaisePopStateEvent call:

    void HandlePing()
    {
        Console.WriteLine("Server received ping event while in the {0} state", 
            this.CurrentState.Name);
        // pop the current state off the stack of active states.
        this.RaisePopStateEvent();  
    }

Note that this does not result in the OnEntry method being called again, because you never actually exited the Init state in this case. But if you used RaiseGotoStateEvent instead of RaisePushStateEvent and RaisePopStateEvent then InitOnEntry will be called again, and that would make our Server toggle back and forth between the Init and Active states.

The push and pop feature is considered an advanced feature of state machines. It is designed to help you reuse some of your event handling code, where you can put “common event handling” in lower states and more specific event handling in pushed states. If an event handler is defined more than once in the stack, the one closest to the top of the stack is used.

#### Only one Raise* operation per action
There is an important restriction on the use of the following. Only one of these operations can be queued up per event handling action:

    RaiseEvent
    RaiseGotoStateEvent
    RaisePushStateEvent
    RaisePopStateEvent
    RaiseHaltEvent

A runtime Assert will be raised if you accidentally try and do two of these operations in a single action. For example, this would be an error because you are trying to do two Raise operations in the InitOnEntry action:

    void InitOnEntry()
    {
        this.RaiseGotoStateEvent<Active>();
        this.RaiseEvent(new TestEvent());
    }

#### Deferring and ignoring events
Coyote also provides the capability to defer and ignore events while in a particular state:

    [DeferEvents(typeof(PingEvent), typeof(PongEvent))]
    [IgnoreEvents(typeof(ReadyEvent))]
    class SomeState : State { }

The attribute DeferEvents indicates that the PingEvent and PongEvent events should not be dequeued while the machine is in the state SomeState. Instead, the machine should skip over PingEvent and PongEvent (without dropping these events from the queue) and dequeue the next event that is not being deferred. Note that when a state decides to defer an event a subsequent pushed state can choose to receive that event if it wants to, but if the pushed state chooses not to receive the event then it is not an error and it remains deferred.

The attribute IgnoreEvents indicates that whenever ReadyEvent is dequeued while the machine is in SomeState, then the machine should drop ReadyEvent without invoking any action. Note that when a state decides to ignore an event a subsequent pushed state can choose to receive that event if it wants to, but if the pushed state chooses not to receive the event then it is not an error and the event will be ignored and dropped.

#### Default events
State machines support an interesting concept called default events. A state can request that something be done by default when there is nothing else to do.

    [OnEventDoAction(typeof(DefaultEvent), nameof(OnIdle))]
    class Idle : State { }

    public void OnIdle()
    {
        Console.WriteLine("OnIdle");
    }

The Coyote runtime will invoke this action handler when Idle is the current active state and the state machine has nothing else to do (the inbox has no events that can be processed). If nothing else happens, (no other actionable events are queued on this state machine) then the OnIdle method will be called over and over until something else changes. It is more efficient to use CreatePeriodicTimer for low priority work.

Default events can also invoke goto, and push state transitions, which brings up an interesting case where you can actually implement an infinite ping pong using the following:

    internal class PingPongMachine : StateMachine
    {
        [Start]
        [OnEntry(nameof(OnPing))]
        [OnEventGotoState(typeof(DefaultEvent), typeof(Pong))]

        public class Ping : State { }

        public void OnPing()
        {
            Console.WriteLine("OnPing");
        }

        [OnEntry(nameof(OnPong))]
        [OnEventGotoState(typeof(DefaultEvent), typeof(Ping))]
        public class Pong : State { }

        void OnPong()
        {
            Console.WriteLine("OnPong");
        }
    }

The difference between this and a timer based ping-pong is that this will run as fast as the Coyote runtime can go. So you have to be careful using DefaultEvents like this as it could use up a lot of CPU time.

#### WildCard events
State machines also support a special WildcardEvent which acts as a special pattern matching event that matches all event types. This means you can create generic actions, or state transitions as a result of receiving any event (except the DefaultEvent).

The following example shows how the WildcardEvent can be used:

    internal class WildMachine : StateMachine
    {
        [Start]
        [OnEntry(nameof(OnInit))]
        [OnEventGotoState(typeof(WildCardEvent), typeof(CatchAll))]

        public class Init : State { }

        public void OnInit()
        {
            Console.WriteLine("Entering state {0}", this.CurrentStateName);
        }

        [OnEntry(nameof(OnInit))]
        [OnEntry(nameof(OnCatchAll))]
        [OnEventDoAction(typeof(WildCardEvent), nameof(OnCatchAll))]
        public class CatchAll : State { }

        void OnCatchAll(Event e)
        {
            Console.WriteLine("Catch all state caught event of type {0}", e.GetType().Name);
        }
    }

The client of this state machine can send any event it wants and it will cause a transition to the CatchAll state where it will be handled by the OnCatchAll method. For example:

    class X : Event { };
    var actor = runtime.CreateActor(typeof(WildMachine));
    runtime.SendEvent(actor, new X());

And the output of this test is:

    Entering state Init
    Entering state CatchAll
    Catch all state caught event of type X

#### Precise semantics
There is a lot of interesting combinations of things that you can do with DeferEvents, IgnoreEvents, OnEventDoAction, OnEventGotoState or OnEventPushState and WildcardEvent. The following gives the precise semantics of these operations with regards to push and pop.

First of all only one action per specific event type can be defined on a given State, so the following would be an error:

    [DeferEvents(typeof(E1), typeof(E2))]
    [OnEventDoAction(typeof(E1), nameof(HandleE1))]
    class SomeState : State { }

Because the E1 has both a DeferEvents and OnEventDoAction defined on the same state.

Second, a pushed state inherits DeferEvents, IgnoreEvents, OnEventDoAction actions from all previous states on the active state stack, but it does not inherit OnEventGotoState or OnEventPushState actions.

If multiple states on the stack of active states define an action for a specific event type then the action closest to the top of the stack takes precedence. For example:

    [DeferEvents(typeof(E1))]
    [OnEventPushState(typeof(E1), typeof(S2))]
    class A : State { }

    [OnEventDoAction(typeof(E1), nameof(HandleE1))]
    class B : State { }

In state B the OnEventDoAction takes precedence over the inherited DeferEvents for event E1.

On a given state actions defined for a specific event type take precedence over actions involving WildcardEvent but a pushed state can override a specific event type action with a WildcardEvent action.

If an event cannot be handled by a pushed state then that state is automatically popped so handling can be attempted again on the lower states. If this auto-popping pops all states then an unhandled event error is raised.
