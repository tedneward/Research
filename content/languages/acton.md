title=Acton
tags=language
summary=A fault tolerant distributed programming platform for building mission critical systems.
~~~~~~

[Website](https://www.acton-lang.org/) | [Source](https://github.com/actonlang/acton)

# Overview
Acton is a general purpose programming language, designed to be useful for a wide range of applications, from desktop applications to embedded and distributed systems. In a first approximation Acton can be described as a seamless addition of a powerful new construct to an existing language: Acton adds actors to Python. Our take on the actor model allows developers to write highly scalable and fault tolerant code, without needing to worry about explicit state checkpointing, synchronization primitives or giving up consistency.

Acton is a compiled language, offering the speed of C but with a considerably simpler programming model. There is no explicit memory management, instead relying on garbage collection.

Acton is statically typed with an expressive type language and type inference. Type inferrence means you don't have to explicitly declare types of every variable but that the compiler will infer the type and performs its checks accordingly. We can have the benefits of type safety without the extra overhead involved in declaring types.

The Acton Run Time System (RTS) offers a distributed mode of operation allowing multiple computers to participate in running one logical Acton system. Actors can migrate between compute nodes and load balance the application workload. The RTS offers exactly once message delivery guarantees and strong serial state consistency without sacrificing performance. By automatically checkpointing actor states and inter-actor messages to a integrated distributed database and messaging queues, failure of individual actors or compute nodes can be transparently recovered from by the runtime system. There is no need for explicit state checkpointing or use of synchronization primitives between actors. Your system can run forever!

# About
We believe the existence of a fault tolerant distributed programming environment with orthogonal persistence will make the world a better place. Acton was created to deliver on that belief.

We want a programming environment that offers persistence so that programmers do not need to spend time writing code to save program state to disk or a database (which in turn writes to disk, typically). There are few such languages in existence and even fewer, if any, in practical use. This is especially important as handling state persistence is particularly hard when writing distributed systems or working in cloud environments. The programmer should not need to spend much time dealing with state persistence.

We want to write small programs that can run together to form a large system. It needs to scale beyond the bounds of a single computer and we don't want the programmer to spend any extra effort to achieve this.

We want the system as a whole to be robust. It must tolerate failures to the hardware compute nodes used to run the system without loss of data or function. It should also help the programmer to write correct software without bugs. It's not practical to avoid bugs entirely but when we have a chance to detect and present them early, that is better than later.

We want a reasonably fast system. Performance is not the highest priority but one shouldn't have to needlessly buy newer or more hardware.

We want to lower the barrier of entry and enable people to build the robust systems that modern society needs and relies on.

### What makes Acton different?
Acton adopts the actor model and combines it with a simple to use syntax and a powerful type system. Many good things emanate from the combination of the actor model and a good type system.

In traditional languages, programs use shared memory to allow multiple threads or multiple processes to share state or communicate with each other. Shared memory involves locks to avoid race conditions. Checkpointing the state of a program is hard because it is hard to figure out what parts of the memory you need to checkpoint. It's all like a big hairy spaghetti ball and the safe choice is to checkpoint the entire memory of the program. This could work for small programs but we want to write large distributed programs! The key to efficiently checkpointing a program is to be able to work on smaller parts of the program and in order to do that, we need to get a grip on those smaller parts. That is hard with shared memory. There are papers on this topic with various techniques applied in attempts to realize barriers and snapshot chunks of memory but it is hard to make it work well in practice. In contrast, with actors, each actor has its own private memory which makes it possible to checkpoint the state of individual actors. Further, actors communicate with each other through messages. With our own database that implements queues inside the database, we can both read and modify database cells as well as reading, consuming or putting new items on the queues in the same transaction! This makes it possible to deal with actor checkpoints in a transactionally safe way. Many great things emanate from the actor model!

Actors do not fundamentally resolve the problem of snapshotting since it is still possible to construct a single giant actor that consumes 100GB of RAM and snapshotting that won't be fast. However, the actor model does encourage the use of many smaller actors for concurrency as well as logically splitting up your program in manageable units. In practice, it typically reduces the size and time taken to checkpoint by orders of magnitudes compared to a large traditional program. It brings persistence-through-checkpointing from theoretically feasible to practically viable.

Checkpointing needs to happen when there are externally visible effects. The actor models makes this trivial to determine since anything that is externally visible is going to be a message to another actor. To avoid explicit state checkpointing calls, synchronization primitives or explicit IPC calls that would be forced upon the application developer, we employ magic advanced techniques in the compiler, made possible by its inherent knowledge of the language. By analyzing the code of the program we can determine suitable locations for inserting checkpointing, and this is in fact what the Acton compiler does. It splits up a program into continuations that are executed by the Acton run time system. After a continuation has been executed, its result, including the actor state, any outgoing messages to other actors as well as the consumption of the incoming message that triggered this continuation to run, is committed atomically in one transaction to the database. All this is possible thanks to the language, compiler, run time system and database working together as one. It is only possible with a new language and that is why we wrote Acton.

With Acton, an application developer simply writes single threaded Acton code and relegates the complex tasks of ensuring state consistency, persistence, fault tolerance and load balancing to the compiler, database and run time system.

We hope you enjoy Acton!

