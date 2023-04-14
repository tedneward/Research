title=Simple State Machine Library
tags=library, clr, state machine
summary=A simple library for realization state machines in C# code.
~~~~~~

[Website](https://www.tomware.ch/2018/04/30/building-a-simple-workflow-system-with-asp-net-core/) | [Source](https://github.com/SimpleStateMachine/SimpleStateMachineLibrary)

```
StateMachine stateMachine = new StateMachine("scheme.xml");

stateMachine.GetState("State1").OnExit(Action1);
stateMachine.GetState("State2").OnEntry(Action2);
stateMachine.GetTransition("Transition1").OnInvoke(Action3);
stateMachine.OnChangeState(Action4);

stateMachine.Start();
```

