title=Retlang
tags=library, clr, actors, message-passing
summary=A high performance C# threading library (see Jetlang for a version in Java). The library is intended for use in message based concurrency similar to event based actors in Scala. The library does not provide remote messaging capabilities. It is designed specifically for high performance in-memory messaging.
~~~~~~

[Website](https://code.google.com/archive/p/retlang/) (Archived) | [Source](https://code.google.com/archive/p/retlang/source/default/source) [Archived source, local copy](../libraries/retlang-0.2.2.zip)

### Features
All messages to a particular IFiber are delivered sequentially. Components can easily keep state without synchronizing data access or worrying about thread races.
* Single IFiber interface that can be backed by a dedicated thread, a thread pool, or a WinForms/WPF message pump.
* Supports single or multiple subscribers for messages. * Subscriptions for single events or event batching.
* Single or recurring event scheduling.
* High performance design optimized for low latency and high scalability.
* Publishing is thread safe, allowing easy integration with other threading models.
* Low Lock Contention - Minimizing lock contention is critical for performance. Other concurrency solutions are limited by a single lock typically on a central thread pool or message queue. Retlang is optimized for low lock contention. Without a central bottleneck, performance easily scales to the needs of the application. * Synchronous/Asynchronous request-reply support. 
* Single assembly with no dependencies except the CLR (4.0+).

Retlang relies upon four abstractions: IFiber, IQueue, IExecutor, and IChannel. An IFiber is an abstraction for the context of execution (in most cases a thread). An IQueue is an abstraction for the data structure that holds the actions until the IFiber is ready for more actions. The default implementation, DefaultQueue, is an unbounded storage that uses standard locking to notify when it has actions to execute. An IExecutor performs the actual execution. It is useful as an injection point to achieve fault tolerance, performance profiling, etc. The default implementation, DefaultExecutor, simply executes actions. An IChannel is an abstraction for the conduit through which two or more IFibers communicate (pass messages).

### Quick Start
#### Fibers
Four implementations of IFibers are included in Retlang. 
* ThreadFiber - an IFiber backed by a dedicated thread. Use for frequent or performance-sensitive operations. 
* PoolFiber - an IFiber backed by the .NET thread pool. Note execution is still sequential and only executes on one pool thread at a time. Use for infrequent, less performance-sensitive executions, or when one desires to not raise the thread count.
* FormFiber/DispatchFiber - an IFiber backed by a WinForms/WPF message pump. The FormFiber/DispatchFiber entirely removes the need to call Invoke or BeginInvoke to communicate with a window from a different thread.
* StubFiber - useful for deterministic testing. Fine grain control is given over execution to make testing races simple. Executes all actions on the caller thread.

#### Channels
The main IChannel included in Retlang is simply called Channel. Below are the main types of subscriptions.
* Subscribe - callback is executed for each message received. 
* SubscribeToBatch - callback is executed on the interval provided with all messages received since the last interval. 
* SubscribeToKeyedBatch - callback is executed on the interval provided with all messages received since the last interval where only the most recent message with a given key is delivered. 
* SubscribeToLast - callback is executed on the interval provided with the most recent message received since the last interval.


