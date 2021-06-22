title=Pattern-Oriented Software Architecture 2 (POSA2)
tags=reading, books, patterns
summary=Another collection of patterns.
~~~~~~
*(by Douglas Schmidt, Michael Stal, Hans Rohnert, Frank Buschmann (Wiley, 2000, ISBN 0-471-60695-2) )*


### Service Access and Configuration

* **Wrapper-Facade** (47) encapsulates the functions and data provided by existing non-object-oriented APIs within more concise, robust, portable, maintainable and cohesive object-oriented class interfaces
* **Component Configurator** (75) allows an application to link and unlink its component implementations at run-time without having to modify, recompile, or statically relink the application. It further supports the reconfiguration of components into different application processes without having to shut down and re-start running processes
* **Interceptor** (109) allows services to be added transparently to a framework and triggered automatically when certain events occur
* **Extension Interface** (141) allows multiple interfaces to be exported by a component, to prevent bloating of interfaces and breaking of client code when developers extend or modify the functionality of the component


### Event Handling

* **Reactor** (179) allows event-driven applications to demultiplex and dispatch service requests that are delivered to an application from one or more clients
* **Proactor** (215) allows event-driven applications to efficiently demultiplex and dispatch service requests triggered by the completion of asynchronous operations, to achieve the performance benefits of concurrency without incurring certain of its liabilities
* **Asynchronous Completion Token** (261) allows an application to demultiplex and process efficiently the responses of asynchronous operations it invokes on services
* **Acceptor-Connector** (285) decouples the connection and initialization of cooperating peer services in a networked system from the processing performed by the peer services after they are connected and initialized


### Synchronization

* **Scoped Locking** (325) is a C++ idiom that ensures that a lock is acquired when control enters a scope and released automatically when control leaves the scope, regardless of the return path from the scope
* **Strategized Locking** (333) parameterizes synchronization mechanisms that protect a component's critical sections from concurrent access
* **Thread-Safe Interface** (345) minimizes locking overhead and ensures that intra-component method calls do not incur self-deadlock by trying to reacquire a lock that is held by the component already
* **Double-Checked Locking Optimization** (353) reduces contention and synchronization overhead whenever critical sections of code must acquire locks in a thread-safe manner just once during program execution


### Concurrency

* **Active Object** (369) decouples method execution from method invocation to enhance concurrency and simplify synchronized access to objects that reside in their own threads of control
* **Monitor Object** (399) synchronizes concurrent method execution to ensure that only one method at a time runs within an object. It also allows an object's methods to cooperatively schedule their execution sequences
* **Half-Sync/Half-Async** (423) decouples asynchronous and synchronous service processing in concurrent systems, to simplify programming without unduly reducing performance. The pattern introduces two intercommunicating layers, one for asynchronous and one for synchronous service processing
* **Leader/Followers** (447) provides an efficient concurrency model where multiple threads take turns sharing a set of event sources in order to detect, demultiplex, dispatch and process service requests that occur on the event sources
* **Thread-Specific Storage** (475) allows multiple threads to use one 'logically global' access point to retrieve an object that is local to a thread, without incurring locking overhead on each object access

