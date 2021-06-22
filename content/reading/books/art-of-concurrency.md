title=The Art of Concurrency
tags=reading, books, concurrency
summary=Thoughts on implementation using concurrent mechanics.
~~~~~~
*(by (author), (publisher))*

# 8 Simple Rules for Designing Multithreaded Applications 
1. Identify truly independent computations
2. Implement concurrency at the highest level possible
3. Plan early for scalability
4. Make use of thread-safe libraries
5. Use the right threading model (don't use explicit threads if an implicit model will do)
6. Never assume a particular order of execution
7. Use thread-local storage or associate locks to specific data
8. Dare to change the algorithm for a better chance of concurrency

# Terminology

**Barrier** -- sync object that blocks all threads until every thread has arrived; upon arrival of last thread, all threads are released to continue

**Benign Data Race** -- data race w/no adverse consequences

**Complete Binary Tree** -- binary tree in which each level (except perhas the deepest) is full; leaf nodes placed as far left as possible

**CRCW/CREW/ERCW/EREW** -- Concurrent vs Exclusive Read vs Write

**Data Decomposition** -- identify independent work forcusing on dividing large data sets that can be processed concurrently

**Data Flow Parallelism** -- execute an instruction when args are ready (as opposed to the original sequence in which instruction was written)

**Data Race** -- 2+ threads accessing same resource/location where one is attempting to update

**Deadlock** -- 1+ threads are waiting for an event that will never occur

**Fork-Join Parallelism** -- threads are forked/spawned, execute, and join before continuing

**Livelock** -- threads doing same computation are unable to proceed due to the actions of some other thread (Robin Hood & Little John meeting on the log bridge)

**Modulo Locks** -- associate multiple indexed objects w/ single lock

**Mutex/Mutual Exclusion** -- only allow one thread to execute given portion of code

**Race Condition** -- flaw in which result depends on timing or sequence of multiple threads' execution

**Reduction** -- computation that takes large data set and computes a value from that data; operation performed must be associative & commutative

**Semaphore** -- Sync object w/ associated non-negative count w/2 operations: post (increment count) & wait (if ct != 0, decrement count, else block until ct > 0)

**Starvation** -- thread is not allowed to proceed (usually due to higher-priority threads getting scheduled first)

**Task Decomposition** -- identify independent work focusing on the computations to be performed by the threads
