title=Stateless
tags=clr, library, state machine
summary=A simple library for creating state machines in C# code.
~~~~~~

[Github](https://github.com/dotnet-state-machine/stateless) (.NET) | [Github](https://github.com/stateless4j/stateless4j) (Java)

"Create state machines and lightweight state machine-based workflows directly in .NET code:

```
var phoneCall = new StateMachine<State, Trigger>(State.OffHook);

phoneCall.Configure(State.OffHook)
    .Permit(Trigger.CallDialled, State.Ringing);
	
phoneCall.Configure(State.Ringing)
    .Permit(Trigger.CallConnected, State.Connected);
 
phoneCall.Configure(State.Connected)
    .OnEntry(() => StartCallTimer())
    .OnExit(() => StopCallTimer())
    .Permit(Trigger.LeftMessage, State.OffHook)
    .Permit(Trigger.PlacedOnHold, State.OnHold);

// ...

phoneCall.Fire(Trigger.CallDialled);
Assert.AreEqual(State.Ringing, phoneCall.State);
```

"Create state machines and lightweight state machine-based workflows directly in Java code:"

```
StateMachineConfig<State, Trigger> phoneCallConfig = new StateMachineConfig<>();

phoneCallConfig.configure(State.OffHook)
        .permit(Trigger.CallDialed, State.Ringing);

phoneCallConfig.configure(State.Ringing)
        .permit(Trigger.HungUp, State.OffHook)
        .permit(Trigger.CallConnected, State.Connected);

// this example uses Java 8 method references
// a Java 7 example is provided in /examples
phoneCallConfig.configure(State.Connected)
        .onEntry(this::startCallTimer)
        .onExit(this::stopCallTimer)
        .permit(Trigger.LeftMessage, State.OffHook)
        .permit(Trigger.HungUp, State.OffHook)
        .permit(Trigger.PlacedOnHold, State.OnHold);

// ...

StateMachine<State, Trigger> phoneCall =
        new StateMachine<>(State.OffHook, phoneCallConfig);

phoneCall.fire(Trigger.CallDialed);
assertEquals(State.Ringing, phoneCall.getState());
```

## Articles

* ["Modelig Workflows with Finite State Machines in .NET"](https://www.lloydatkinson.net/posts/2022/modelling-workflows-with-finite-state-machines-in-dotnet/)

