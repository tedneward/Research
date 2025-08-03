title=P
tags=language
summary=A state machine based statically-compiled research programming language from Microsoft for formally modeling and specifying complex distributed systems.
~~~~~~

[Website](https://p-org.github.io/P/) | [Source](https://github.com/p-org/P) | [Case Studies](https://p-org.github.io/P/casestudies/)

Related to [P#](psharp.html)

### Introduction to P:
> P is a domain-specific language for implementing asynchronous event-driven systems. The goal of P is to provide language primitives to succinctly and precisely capture protocols that are inherent to communication among components in asynchronous systems. The computational model underlying a P program is state machines communicating via messages, an approach commonly used in building embedded, networked, and distributed systems. Each state machine has an input queue, states, transitions, event handlers, and machine-local store for a collection of variables. The state machines run concurrently with each other, each executing an event handling loop that dequeues a message from the input queue, examines the local store, and can execute a sequence of operations. Each operation either updates the local store, sends messages to other machines, or creates new machines. In P, a send operation is non-blocking; the message is simply enqueued into the input queue of the target machine.

**P is a programming language.** P is a state machine based programming language and hence, just like any other imperative programming language it supports basic data types, expressions, and statements that enable programmers to capture complex distributed systems protocol logic as a collection of event-handlers or functions (in P state machines).

**P State machines.** The underlying model of computation for P state machines is similar to that of [Gul Agha's Actor-model-of-computation](https://dspace.mit.edu/handle/1721.1/6952) (wiki). A P program is a collection of concurrently executing state machines that communicate with eachother by sending events (or messages) asynchronously. Each P state machine has an unbounded FIFO buffer associated with it. Sends are asynchronous, i.e., executing a send operation send t,e,v; adds event e with payload value v into the FIFO buffer of the target machine t. Each state in the P state machine has an entry function associated with it which gets executed when the state machine enters that state. After executing the entry function, the machine tries to dequeue an event from the input buffer or blocks if the buffer is empty. Upon dequeuing an event from the input queue of the machine, the attached handler is executed which might transition the machine to a different state. We will provide more details about the P state machines in tutorials as well as the language manual. For detailed formal semantics of P state machines, we refer the readers to the original P paper and the more recent paper with updated semantics.

There are two main distinctions with actor model of computation: (1) P adds the syntactic sugar of state machines to actors, and (2) each state machine in P has an unbounded FIFO buffer associated with it instead of an unbounded bag in actors (semantic difference).

**P Monitors.** Specifications in P are written as global runtime monitors. These global monitors observe the execution of the system and can assert any global safety or liveness invariants on the system. Note that the monitors are synchronously composed with the P state machines. Details are explained in the language manual and we provide examples in the tutorial.

When reasoning about the correctness of a distributed system, it is really important to specify both safety as well as liveness specifications.

**P Checker.** The P Checker explores different possible behaviors of the P program arising out of: (1) concurrency: different interleavings of events from concurrently executing state machines as well as (2) data nondeterminism: different data input choices in the P program modeled using the choose (see) operation. The P checker explores different executions of the system that can happen because of these two forms of nondeterminism and asserts that for each of these executions the system satisfies the desired properties specified by the P Monitors.

[Installation](https://p-org.github.io/P/getstarted/install/#step-1-install-net-core-sdk) requires both .NET SDK and Java runtime.

## Reading

[Model-based Testing Distributed Systems with P Language](https://www.mydistributed.systems/2021/06/p-language.html) (2021): "It is important to note that unlike other model-checking tools for distributed systems like TLA+, P is not designed for exhaustive model-checking that we use to make sure of the correctness of our protocol in every possible execution. Instead, P is designed for model-based testing. Thus, P cannot be used to prove that a given protocol is correct, and just like any other testing method, its goal is actually to prove that our system is incorrect by finding bugs."

### [State Machines](https://p-org.github.io/P/manual/statemachines/)

A P program is a collection of concurrently executing state machines that communicate with each other by sending events (or messages) asynchronously.

#### Semantics

The underlying model of computation is similar to that of Gul Agha's Actor-model-of-computation (wiki). Here is a summary of important semantic details:

* Each P state machine has an unbounded FIFO buffer associated with it.
* Sends are asynchronous, i.e., executing a send operation send t,e,v; adds event e with payload value v into the FIFO buffer of the target machine t.
* Variables and functions declared within a machine are local, i.e., they are accessible only from within that machine.
* Each state in a machine has an entry and an exit function associated with it. The entry function gets executed when the machine enters that state, and similarly, the exit function gets executed when the machine exits that state on an outgoing transition.
* After executing the entry function, a machine tries to dequeue an event from its input buffer or blocks if the buffer is empty. Upon dequeuing an event from its input queue, a machine executes the attached event handler which might transition the machine to a different state.

For detailed formal semantics of P state machines, we refer the readers to the original P paper and the more recent paper with updated semantics.

Formal grammar:

```
# State Machine in P
machineDecl : machine name machineBody

# State Machine Body
machineBody : LBRACE machineEntry* RBRACE;
machineEntry
  | varDecl
  | funDecl
  | stateDecl
  ;

# Variable Decl
varDecl : var iden : type ;

# State Declaration in P
stateDecl : start? (hot | cold)? state name { stateBody* }

# State Body
stateBody:
  | entry anonFunction                # StateEntryFunAnon
  | entry funName ;                   # StateEntryFunNamed
  | exit noParamAnonFunction          # StateExitFunAnon
  | exit funName;                     # StateExitFunNamed

  ## Transition or Event Handlers in each state
  | defer eventList ;                               # StateDeferHandler
  | ignore eventList ;                              # StateIgnoreHandler
  | on eventList do anonFunction                    # OnEventDoNamedHandler
  | on eventList do funName ;                       # OnEventDoAnonHandler
  | on eventList goto stateName ;                   # OnEventGotoState
  | on eventList goto stateName with anonFunction   # OnEventGotoStateWithAnonHandler
  | on eventList goto stateName with funName ;      # OnEventGotoStateWithNamedHandler
  ;
```

