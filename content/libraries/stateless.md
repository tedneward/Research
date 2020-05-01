title=Stateless
type=page
tags=clr, library, state machine
status=published
summary=A simple library for creating state machines in C# code.
~~~~~~

[Github](https://github.com/dotnet-state-machine/stateless)

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
