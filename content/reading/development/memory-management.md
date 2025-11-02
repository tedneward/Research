title=Memory Management and Garbage Collection (reading and references)
tags=reading, language, platform, vm, jvm, clr, python, ecmascript
summary=Papers, books, and thoughts around manual and automatic memory management (GC).
~~~~~~

Primary reading: [*Garbage Collection Handbook*](https://gchandbook.org/), [*Garbage Collection*](https://www.cs.kent.ac.uk/people/staff/rej/gcbook/) | [GC FAQ](https://www.iecc.com/gclist/GC-faq.html), [GC Techniques and algorithms](https://www.iecc.com/gclist/GC-algorithms.html), [GC Language Interfaces](https://www.iecc.com/gclist/GC-lang.html), and ["more difficult topics"](https://www.iecc.com/gclist/GC-harder.html) | [Ravenbrook Memory Management Reference](http://www.memorymanagement.org/)

## Concepts/terminology

### Memory

- [What Every Programmer Should Know About Memory](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf) ([PDF](/reading/development/cpumemory.pdf)): "As CPU cores become both faster and more numerous, the limiting factor for most programs is now, and will be for some time, memory access. Hardware designers have come up with ever more sophisticated memory handling and acceleration techniques–such as CPU caches–but these cannot work optimally without some help from the programmer. Unfortunately, neither the structure nor the cost of using the memory subsystem of a computer or the caches on CPUs is well understood by most programmers. This paper explains the structure of memory subsystems in use on modern commodity hardware, illustrating why CPU caches were developed, how they work, and what programs should do to achieve optimal performance by utilizing them."

### Memory Allocation schemes (high-level)

* **Static**: The compiler, at the time of compilation (or the program's startup, either approach can work) has knowledge of the desired allocations, and creates space for them out of somewhere in the process' available space. These locations are fixed throughout the lifetime of the program, and cannot be expanded or shrunk--they are literally static throughout the entirety of the application's life. This is how C/C++ handle `static`-modified variable declarations, for example. Most C/C++ globals fall into this category.

* **Stack**: The stack is a region of RAM that gets created on every thread that your application is running on. It works in a LIFO (Last In, First Out) manner, meaning that as soon as you allocate – or “push” – memory on to the stack, that chunk of memory will be the first to be deallocated – or “popped.” Every time a function declares a new variable, it is “pushed” onto the stack, and after that variable falls out of scope (such as when the function closes), that variable will be deallocated from the stack automatically. Once a stack variable is freed, that region of memory becomes available for other stack variables.

	Due to the pushing and popping nature of the stack, memory management is very logical and is able to be handled completely by the CPU; this makes it very quick, especially since each byte in the stack tends to be reused very frequently which means it tends to be mapped to the processor’s cache. However, there are some cons to this form of strict management. The size of the stack is a fixed value, and allocating more onto the stack than it can hold will result in a stack overflow. The size of the stack is decided when the thread is created, and each variable has a maximum size that it can occupy based on its data type; this prevents certain variables such as integers from ever growing beyond a certain value, and forces more complex data types such as arrays to specify their size prior to runtime since the stack won’t let them be resized. Variables allocated on the stack also are always local in nature because they are always next in line to be popped (unless more variables are pushed prior to the popping of earlier variables).

* **Heap**: The heap is a memory set aside for runtime/dynamic memory allocation. Allocation is handled at runtime, and therefore is up to the program to determine structure, means, etc. Once you allocate space, that space can be accessed at any point in time not only throughout just the thread, but throughout the application’s entire life. Deallocation must occur at some point, if the space is to be reused. Most operating systems will, once an application ends, reclaim that space. (Usually by tearing down the process entirely--we're long past the days where programs are obtaining exclusive access to physical addresses.)

	Interaction with the heap is usually through some form of reference; in languages that support direct access, these are ‘pointers,’ which are variables whose values are the address of another variable, such as a memory location. By creating a pointer, you ‘point’ at a memory location on the heap, which is what signifies the initial location of your variable and tells the program where to access the value. Due to the dynamic nature of the heap, it is completely unmanaged by the CPU aside from initial allocation and heap resizing; in non-garbage collected languages such as C and C++, this requires you as the developer to manage memory and to manually free memory locations when they are no longer needed. Failing to do so can create memory leaks and cause memory to become fragmented, which will cause reads from the heap to take longer and makes it difficult to continuously allocate more memory onto the heap.

### Heap management (aka garbage collection) strategies

[Wikipedia: Tracing garbage collection](https://en.wikipedia.org/wiki/Tracing_garbage_collection)

Automated memory management (GC) almost always refers to heap management; I've never heard it applied to any other (static or stack) form of memory allocation and reclamation. Several strategies are possible (and numerous hybrid approaches):

* **Allocate without reclamation**: Technically, this is a legal automatic memory management technique, though obviously it is optimized more for performance of allocation and reclamation (i.e., zero time spent reclamation) than longevity. The JVM has one such allocator, called the Epsilon GC, and is typically used for specific purposes (such as benchmarking or diagnostics).

* **Compile-time**: Compile-time garbage collection is a form of static analysis allowing memory to be reused and reclaimed based on invariants known during compilation.

    This form of garbage collection has been studied in the Mercury programming language, and it saw greater usage with the introduction of LLVM's automatic reference counter (ARC) into Apple's ecosystem (iOS and OS X) in 2011.

* **Reference counting**: Each allocated object has a count associated with it indicating how many references are currently pointing to it. When the reference count drops to zero, the object is eligible for reclamation. Reference counts can either be managed automatically (as in, the language/runtime manage it without programmer intervention required) or manually (programmers must ensure they call some kind of `release` method or function to indicate a finished state of use). Reference counting is highly vulnerable to mutually-referencing objects (cyclic object graphs) as a source of memory leaks.

    Historical notes: 
    
    * Microsoft COM was the first "mainstream" platform to really embrace reference counting as a part of its formal semantics (the `IUnknown` interface had three methods, two of which--`AddRef` and `Release`--managed the reference count of the allocated component), with very mixed results. When COM went distributed (DCOM), reference counts jumped in severity, since now the garbage collection was distributed, and a missed or dropped call could keep an object alive forever. 
    
    * CORBA used reference counting as well, with much the same result.
    
    * Java RMI chose to use a different form of distributed garbage collection, using a "heartbeat" to keep an object alive, and if no such heartbeat came through every so often, the object was assumed to be unreachable and therefore eligible for reclamation.

    * Objective-C used reference counting, then later moved to "automatic reference counts" (ARC) which was then pushed under the covers by the Swift language.

    Some additional ideas/concepts around ref-counting:

    * **Deferred reference counting**: In deferred reference counts, local updates to the reference count (that is, those arising from assignments to and from local variables) are "deferred", as long as it is known that the reference count will remain positive when it should be positive. For example, the code to swap the (reference-counted) values contained in two variables a and b naively performs the following operations:

                incrc(a); tmp := a;
                incrc(b); decrc(a); a := b;
                incrc(tmp); decrc(b); b := tmp
                decrc(tmp); (tmp goes out of scope)

        After all the dust has cleared, after six reference count operations, the reference counts of the objects referred to by a and b (now by b and a) are unchanged. It is more efficient to recognize this and leave the reference counts unchanged.

    * **Lazy Freeing**: Note that naive reference counting can take arbitrarily long to return from a decrement, because freeing one object may recursively trigger the freeing of other objects whose counts drop to zero. Instead, an object whose reference count falls to zero may be placed on a queue/list/stack of objects that are no longer in use, but not yet processed onto the free list. Alternatively, when an object is allocated off the free list, the pointers to objects within it may be scanned. This is also known as "Weizenbauming", at least in some circles.

    * **One-bit reference counting**: William Stoye's trick in his combinator machine. Reference counts are frequently one, and noting this in the pointer, rather than the object, can save space, cut memory references, and allow the easy recycling of vast amounts of garbage. In a combinator machine, the actual primitives can be parameterized by the reference counts of their operands to recycle memory in place. Note, however, that a combinator machine generates vast amounts of garbage to begin with; this technique is unlikely to work as well in general use.

* **Smart pointers**: Most smart pointers are small "wrappers" around native pointers, carrying a reference count that tries to be as automatic as possible. Most popular in C++ implementations, though some languages (Rust) look to incorporate smart-pointer-type semantics directly into the language. These generally try to then utilize stack-based concepts to help automagically manage reference counts for allocated objects, but circular reference counts are still possible (and probable). In languages like Java or C#, one might imagine that all object references are smart, in that they are known to the platform. (Note: the CLR specifically has object reference pointers--what the CLI Spec calls "managed references"--as well as "native pointers", which are raw locations in memory, without the additional CLR-backed support, for interop with native code.)

* **Reachability**: When moving beyond pointer/reference-based schemes, most automated memory systems need to know which objects are eligible for reclamation, and which aren't--in essence, which are still under the possibility of being used by code. (An automatic memory system should ***never*** deallocate an object that is in use.) This analysis is usually known as "reachability" analysis, that is, finding which objects are "reachable" by user code, and therefore unsafe to reclaim. Many systems have multiple possibilities of reachability: 
    * *reachable* (in use)
    * *softly reachable*: Softly-reachable objects are eligible for reclamation, but are not reclaimed except and until memory pressure is too great (in other words, the runtime will fail if space is not found). Useful for caching behavior.
    * *weakly reachable*: An object is weakly reachable when the garbage collector finds no strong or soft references, but at least one path to the object with a weak reference. Weakly reachable objects are finalized some time after their weak references have been cleared. The only real difference between a soft reference and a weak reference is that the garbage collector uses algorithms to decide whether or not to reclaim a softly reachable object, but always reclaims a weakly reachable object. Weak references work well in applications that need to, for example, associate extra data with an unchangeable object, such as a thread the application did not create. Systems with weak references usually have some form of notification system when the referent is cleared, such as Java's `ReferenceQueue` mechanic. If you make a weak reference to the thread with a reference queue, your program can be notified when the thread is no longer strongly reachable. Upon receiving this notification, the program can perform any required cleanup of the associated data object. This makes them useful for object-pooling kinds of behavior.
    * *finalizer-reachable* or *"f-reachable"*: an object queued by the runtime for reclamation but still requires its finalizer to run; thus it is reachable only by the finalizer thread/mechanism within the runtime.
    * *phantom-reachable*: An object is phantomly reachable when the garbage collector finds no strong, soft, or weak references, but at least one path to the object with a phantom reference. Phantomly reachable objects are objects that have been finalized, but not reclaimed. These are the hardest to use, but offer a mechanism by which to do cleanup after a finalizer has been executed, essentially providing another way to do resource cleanup.
    * *unreachable* (not in use): There is no path from any executing code to this object, so there is no way this object could be used, making it safe to eliminate.

    Reading: [Monica Pawlan's original article](http://pawlan.com/monica/articles/refobjs/) | [Java reference types](https://www.kdgregory.com/index.php?page=java.refobj)

    Note: This is using the JVM terminology; the CLR does not have soft or phantom references, and I've never heard of Python or Ruby having anything beyond weak references, either. Any GC language has reachable/unreachable, and any language which has some kind of concept of "destructor" or "finalizer" has to have f-reachable (or it goes to great lengths to invoke those destructors/finalizers the moment the last reference is dropped, which usually implies either some very sophisticated compiler analysis or a reference count buried under the surface, as in Swift/Obj-C's automatic reference counting (ARC).)

* [**Mark-Sweep**](https://www.memorymanagement.org/glossary/m.html#term-mark-sweep): A garbage collection pass occurs in two phases: a "mark" phase, to identify the difference between collectible objects and non-collectible objects, and a "sweep" phase, in which the collectible objects are finalized and collected. **Pros**: simple, **Cons**: tends to lead to major fragmentation of the heap; the mark phase may require all activity in the garbage collector to cease (so as to avoid problems of marking an object collectible if concurrently it's becoming reachable again--but I think this isn't possible for a lot of systems; see "concurrent mark-and-sweep" below); as the heap gets larger, taking the time to crawl the heap becomes exponentially greater.

    ![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Animation_of_the_Naive_Mark_and_Sweep_Garbage_Collector_Algorithm.gif/330px-Animation_of_the_Naive_Mark_and_Sweep_Garbage_Collector_Algorithm.gif)

    Some variations on mark-sweep:

    * **Tricolor marking**: Because of these performance problems, most modern tracing garbage collectors implement some variant of the tri-color marking abstraction, but simple collectors (such as the mark-and-sweep collector) often do not make this abstraction explicit. Tri-color marking works as described below.

        Three sets are created – white, black and gray:

        ![](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Animation_of_tri-color_garbage_collection.gif/330px-Animation_of_tri-color_garbage_collection.gif)

        * The white set, or condemned set, is the set of objects that are candidates for having their memory recycled.
        * The black set is the set of objects that can be shown to have no outgoing references to objects in the white set, and to be reachable from the roots. Objects in the black set are not candidates for collection.
        * The gray set contains all objects reachable from the roots but yet to be scanned for references to "white" objects. Since they are known to be reachable from the roots, they cannot be garbage-collected and will end up in the black set after being scanned.

        In many algorithms, initially the black set starts as empty, the gray set is the set of objects which are directly referenced from roots and the white set includes all other objects. Every object in memory is at all times in exactly one of the three sets. The algorithm proceeds as following:

        1. Pick an object from the gray set and move it to the black set.
        2. Move each white object it references to the gray set. This ensures that neither this object nor any object it references can be garbage-collected.
        3. Repeat the last two steps until the gray set is empty.

        When the gray set is empty, the scan is complete; the black objects are reachable from the roots, while the white objects are not and can be garbage-collected.

        Since all objects not immediately reachable from the roots are added to the white set, and objects can only move from white to gray and from gray to black, the algorithm preserves an important invariant – no black objects reference white objects. This ensures that the white objects can be freed once the gray set is empty. This is called the tri-color invariant. Some variations on the algorithm do not preserve this invariant but use a modified form for which all the important properties hold.

        The tri-color method has an important advantage – it can be performed "on-the-fly", without halting the system for significant periods of time. This is accomplished by marking objects as they are allocated and during mutation, maintaining the various sets. By monitoring the size of the sets, the system can perform garbage collection periodically, rather than as needed. Also, the need to touch the entire working set on each cycle is avoided.

    * **Mark-and-don't-sweep**: This might also be regarded as "lazy sweep" or "incremental sweep". Whenever memory is needed, the allocator scans objects until it discovers one that is marked "unused" and is also large enough for the request. All objects scanned, whether large enough or not, are marked "used". When the scan pointer reaches the end of memory, the sense of the mark bits is reversed (that is, if the current assignment is 0==used and 1==unused, then the new assignment is 0==unused, 1==used). Temporarily, all objects on the heap are now marked "unused". Next, a mark phase is run, which tags all reachable objects as "used" so that they will not be reallocated later.

    * **Snapshot mark-and-sweep**: Snapshot mark-and-sweep uses the observation that the set of unreachable objects does not shrink. It is possible (using, for instance, copy-on-write page mapping) to quickly make a copy of the address space, process it concurrently to determine what is garbage, and send that information back to the running process. More garbage may have been generated in the interim, but that is ok, because it will be found in the next collection.

    * **Concurrent mark-and-sweep**:

        Articles:

        - ["Very Concurrent Mark and Sweep Garbage Collection without Fine-Grain Synchronization"](http://doc.cat-v.org/inferno/concurrent_gc/) ([pdf](http://doc.cat-v.org/inferno/concurrent_gc/concurrent_gc.pdf)): We describe a new incremental algorithm for the concurrent reclamation of a program’s allocated, yet unreachable, data. Our algorithm is a variant of mark-&-sweep collection that—unlike prior designs—runs mutator, marker, and sweeper threads concurrently without explicit fine-grain synchronization on shared-memory multiprocessors. A global, but infrequent, synchronization coordinates the per-object coloring marks used by the three threads; ne-grain synchronization is achieved without locking via the basic memory consistency guarantees commonly provided by multiprocessor hardware. We have implemented two versions of this algorithm (called VCGC): in the Inferno operating system and in the SML/NJ ML compiler. Measurements, compared to a sequential generational collector, indicate that VCGC can substantially reduce worst-case pause latencies as well as reduce overall memory usage. We remark that the degrees of freedom on the rates of marking and sweeping enable exploration of a range of resource tradeoffs, but makes "optimal” tuning for even a small set of applications difficult.

* [**Mark-Sweep-Compact**](https://www.memorymanagement.org/glossary/m.html#term-mark-compact): A mark-sweep algorithm that also takes the time after the sweep to rearrange the objects in memory so as to put available spaces next to one another, reducing fragmentation and making it easier to satisfy future requests. Takes longer, and requires objects in memory to be movable (either by adding a layer of indirection on access, or by allowing pointers to be "fixed up" later to point to the right location).

* [**Copying**](https://www.memorymanagement.org/glossary/c.html#term-copying-garbage-collection): 

* **Generational**: A form of copying collector. Based on the observation that most objects have short lifetimes, it is useful to restrict garbage collection to the most recently allocated objects. A generational collector maintains several ``generations'' of objects. Newly created objects are all put in the ``youngest'' generation, and when the space allocated for that generation is full, the collector will use the root set (and any pointers from older generations to the youngest generation -- see below) to reclaim dead objects from the youngest generation only, leaving the ``older'' generations untouched. Objects that survive after several (perhaps just one) collection of the youngest generation are ``promoted'' to the next older generation, and when that generation becomes full, it and all the generations younger than it are collected.

    The difficulty with generational collectors is the identification of pointers from older generations into younger ones. An observation is that such references are uncommon in most programs: new objects typically point to older objects; this is clearly true in pure functional languages where assignment is prohibited, but is common for many programs and languages. Nonetheless, such references do exist, and a collector must handle them. When a pointer to a younger generation object is written into an old object, the pointer (or just the old object) is recorded so it can be scanned when the younger generation is collected.

* **Conservative Collection**: Conservative garbage collection makes use of the observation that if you are not relocating (copying) objects, then you need not be quite so certain about exactly what is a pointer. It suffices to scan the root set (and objects) for any pointer-like bit patterns, and treat those pointer-like bit patterns as actual pointers while marking. The result is that the "true" reachable objects are all found, along with a few others. This works surprisingly well in practice (if a few additional tricks are added) and often permits the use of garbage collection with oblivious source code and compilers.
    Conservative collection is very important because it permits the use of garbage collection with programs that were not written with garbage collection in mind. That is, it simpifies the use of garbage collection with existing (non-garbage-collected) libraries of code.

Ironically, many of these strategies could be used in custom allocation/deallocation schemes in C/C++, but typically aren't due to the complexity of memory management; specifically, C++'s inability to allow for the "movement" of objects as part of the process. This inability to move objects around in memory (that is, specifically, to track where the object ends up and "backport" the new location to the already-existing pointers pointing to it) leads to excessive fragmentation over time, and that in turn can lead to inability to satisfy an allocation request--no one "hole" in the memory space is large enough to accommodate the request, despite there being enough *total* memory to do so.

### Additional concepts

* **Finalizers**: Blocks of code to be run to assist with object reclamation efforts, for those situations in which just releasing the memory occupied is not sufficient to release all allocated resources (files, connections, locks, etc). These need to be run prior to the object's deallocation, since the variable state inside the object is often necessary as part of the resource-deallocation process, but this is usually running on a thread owned by the runtime, which means this is a scenario in which user code is being run on a runtime-owned thread, which raises all sorts of negative possibilities.

### Glossary/Jargon

* **root set**: The data that is immediately available to a program, without following any pointers. Typically this would include local variables from the activation stack, values in machine registers, and global, static, or module variables.
* **reachable data**: Data that is accessible by following pointers (references) from the root set. Reachability is a conservative approximation of liveness and is used by most garbage collectors.
* **live data**: Data that is reachable, and that the program will actually make use of in the future. Garbage collectors typically cannot tell the difference between live and reachable data, but programmers and compilers sometimes can.
* **garbage**: Data that is not reachable.
* **semantic garbage**: Data that is reachable, but not live.
* **precise**: A garbage collector that can determine unambiguously whether a given value is a pointer or not. This can be seen as a requirement on the run-time the collector operates within that it is possible to identify whether some datum is a pointer.
* **conservative**: A garbage collector which can scan data without needing to determine with certainty whether an object is a pointer.
* **semi-conservative**, **mostly-precise**: A collector which permits a mixture of precisely and conservatively identified values. For example, values in registers and on the stack might be treated conservatively, but objects on the heap would be fully described and precisely scanned.
* **incremental**: An incremental collector interleaves collection activity with the actual work of the program. The interleaving is usually orderly; that is, the collector and mutator do not simultaneously access and modify data. If the collector and mutator are viewed as separate threads, then they are scheduled as coroutines. However, the sum of the incremental phases takes longer to complete than one batch garbage collection pass, so these garbage collectors may yield lower total throughput.
* **concurrent**: In a concurrent collector, the collector and mutator may simultaneously access and modify data. The interleaving is disorderly, and preemption may occur at any time. However, the sum of the concurrent phases takes longer to complete than one batch garbage collection pass, so these garbage collectors may yield lower total throughput.
* **stop-the-world**, **stop-and-collect**: Simple stop-the-world garbage collectors completely halt execution of the program to run a collection cycle, thus guaranteeing that new objects are not allocated and objects do not suddenly become unreachable while the collector is running. This has the disadvantage that the program can perform no useful work while a collection cycle is running (sometimes called the "embarrassing pause"). Stop-the-world garbage collection is therefore mainly suitable for non-interactive programs. Its advantage is that it is both simpler to implement and faster than incremental garbage collection.
* **real-time**: A real-time garbage collector (yes, it is possible) guarantees that the garbage collection costs associated with any single operation are bounded by a small time constant. The cost of this guarantee is typically reduced throughput, higher memory overheads, and custom code generation. When hard real-time scheduling is not required, an incremental or concurrent collector is probably a better choice.
* **forwarding-pointer**: In a collector which moves objects, a forwarding pointer is a reference installed by the garbage collector from an old location to the new one. Some systems (notably the Lisp machines) have hardware support for forwarding pointers, which allow both the old and new address to be used interchangably without explicit checks for forwarding pointers.
* **flip**: In a copying collector, when an arena has had all active objects removed from it, and is eligible for refilling, the sense of the arenas is changed -- that is, an "old" arena is now a "new" arena, and some "new" arena becomes "old". This is referred to as a flip.
* **weak reference**, **weak pointer**: A pointer to an object which does not prevent the object from being reclaimed. If the only pointers to an object are from weak references, the object may disappear, in which case the reference is replaced with some distinguished value, typically a language's equivalent of a NULL pointer. Weak references are often used for implementing caches.
* **write barrier**, **read barrier**: A write barrier is a mechanism for executing some memory management code when a write to some object takes place (that object is then "behind the write barrier", or - informally - "write barrier-ed", or - sloppily - "write-protected"). It can take the form of inlined code (if memory management is integral to the compiler), or a memory-protection fault which is handled by the memory management code. There are also "read barriers", the nature of which is obvious.
The roles a write barrier can play in GC are a little trickier to explain to a novice, but I'll give it a stab.

    1. Consider a simple generational stop-and-collect collector, such as the one which SML/NJ used to have. "Generational" means that data is partitioned into old and new. This partition is useful to the GC for two reasons: (a) because data tends to die young, collecting just new data will probably free a lot of space, and (b) because pointers tend to point from new objects to old objects, and not vice versa, it is cheap to find all the pointers to new objects.
        
        Property (b) is only true if you can tell when a pointer to a new object has been written into an old object. Otherwise you have to scan all the old objects to find pointers to new objects, which loses one of the main advantages of generational GC. So you put the old data behind a write barrier, and record those writes. When you come to GC the new data, you know the only pointers from old to new are those which you have recorded.

    2. Consider a tracing GC (see note below) which is incremental or concurrent, i.e. the user's program (the 'mutator') can run before the GC is complete. Now there is an invariant: black objects do not point to white objects. If the mutator writes a white pointer into a black object, this invariant is broken and the GC can fail. There are two basic solutions: prevent the mutator from seeing white objects ("read barriers") or prevent the mutator from writing white pointers into black objects ("write barriers"). The write barrier solution puts the black objects behind a write barrier. When a white-on-black write takes place there are various fixes: incrementally grey the white object, regrey the black object, &c.
        
        (note) For a tracing collector (marking or copying), one conceptually colours the data white (not yet seen by the collector), black (alive and scanned by the collector) and grey (alive but not yet scanned by the collector). The collector proceeds by scanning grey objects for pointers to white objects. The white objects found are turned grey, and the grey objects scanned are turned black. When there are no more grey objects, the collection is complete and all the white objects can be recycled.

    The overhead of write barriers is more likely to be noticeable in an imperative-style program which frequently writes pointers into existing data structures than in a functional-style program which constructs data only once and never changes them.

* **remembered set**: A list of all the interesting references between two sets of objects maintained separately, so you don't have to find them by scanning. In generational garbage collection, this technique is used for references from an older generation to a younger one. Typically, remembered sets are maintained by write barriers (q.v.).
* **register set partitioning**: Garbage-collected languages often partition the set of registers a priori into those always traced and updated (if necessary) by the collector and those ignored by it. The language always maintains the former in a format understood by the collector; and never uses the latter to hold pointers to collectable objects. More complicated schemes are also possible.
* **big bag of pages**: Big Bag of Pages, or BIBOP, is the technique of using an object's address (page number) to encode information about the object. For example, all objects allocated on a particular page might be the same size, or the same type. This technique can be used to avoided allocating object header bits or header tags.

## Papers/articles/notes

- [Memory Management Reference (site)](https://www.memorymanagement.org/)
- [CS 4120/5120 Lecture notes](https://www.cs.cornell.edu/courses/cs4120/2018sp/lectures/39gc/lec39-sp18.pdf) (Andrew Myers)
- [Visualizing garbage collection algorithms](https://spin.atomicobject.com/2014/09/03/visualizing-garbage-collection-algorithms/) ([Source](https://github.com/kenfox/gc-viz)): Demonstrates NoGC, ref-counting, mark-sweep, mark-compact, and copying.

### C/C++

- [Boehm-Weiser collector](https://hboehm.info/gc/)

### .NET

- [.NET Weak References](https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/weak-references)
- [Garbage Collection Algorithms](https://courses.cs.washington.edu/courses/csep521/07wi/prj/rick.pdf): covers mark-sweep, semi-space, variations, and then gets into open problems. General overview, pretty light, feels like somebody's book report on the subject.

### Java

- [Plumbr Handbook Java GC](https://plumbr.io/java-garbage-collection-handbook)
- [Java HotSpot Architecture](https://www.oracle.com/java/technologies/whitepaper.html)
- [Garbage collectors: Serial vs parallel vs CMS vs G1](https://www.overops.com/blog/garbage-collectors-serial-vs-parallel-vs-cms-vs-the-g1-and-whats-new-in-java-8/); targets Java8, so a little out of date
- [Improve App Performance with These Advanced GC Techniques](https://www.overops.com/blog/improve-your-application-performance-with-garbage-collection-optimization/); a newer (2021) version of the previous article

### Python

- [Python GC](https://stackify.com/python-garbage-collection/)
- [CPython GC](https://devguide.python.org/garbage_collector/)
- [Memory Mgmt and GC in Python](https://towardsdatascience.com/memory-management-and-garbage-collection-in-python-c1cb51d1612c)
- [Python Weak References](https://www.python.org/dev/peps/pep-0205/)

