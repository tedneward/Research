title=P
type=page
tags=language
status=published
summary=A statically-compiled research language from Microsoft around explicit state machine management.
~~~~~~

Research language from Microsoft. Related to [P#](psharp.html). [Github](https://github.com/p-org/P)

### Introduction to P:
> P is a domain-specific language for implementing asynchronous event-driven systems. The goal of P is to provide language primitives to succinctly and precisely capture protocols that are inherent to communication among components in asynchronous systems. The computational model underlying a P program is state machines communicating via messages, an approach commonly used in building embedded, networked, and distributed systems. Each state machine has an input queue, states, transitions, event handlers, and machine-local store for a collection of variables. The state machines run concurrently with each other, each executing an event handling loop that dequeues a message from the input queue, examines the local store, and can execute a sequence of operations. Each operation either updates the local store, sends messages to other machines, or creates new machines. In P, a send operation is non-blocking; the message is simply enqueued into the input queue of the target machine.


https://github.com/p-org/P
A state machine based programming language for formally modeling and specifying complex distributed systems.
