title=Finite State Machines
tags=reading
summary=Collection of articles on finite state machines.
~~~~~~

[Wikipedia](http://en.wikipedia.org/wiki/Finite-state_machine)

From [here](https://excalidraw.com/) there is a really nice summary of FSMs:

1. What is a state machine?

    A state machine is an abstract concept that describes

    * being in only one 'finite state' at any time
    * where there is an "initial state"
    * and "transitions" between states triggered by "events"

2. States: A finite state describes some "mode" or "status" that a system (e.g., an app or component) is in. State machines always start in an initial state. Final states mark that a machine is "done". Extended state describes contextual data that is not finite, but relevant to the machine. Don't confuse finite ("countable") states with extended ("infinite") states!

3. Events & Transitions: An event is a "signal" that something happened. Events can trigger "transitions" between states. Transitions are always zero-time; they happen instantaneously. (Promises & async can still be modeled as a state machine. Just think of "awaiting" as a finite state.) Events are distinguished by a finite set of types and sometimes carry extra data.

4. Actions: Actions are side-effects that are executed due to events. Transition ("do") actions are executed due to transitions. (These are characterisitic of Mealy machines). Entry actions are executed whenever a state is entered. Exit actions are executed whenever a state is exited. (These are characteristic of Moore machines.)
    

---

[Modeling AI](http://blog.manuvra.com/modeling-a-simple-ai-behavior-using-a-finite-state-machine/)

