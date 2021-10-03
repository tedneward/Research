title=Garbage Collection (reading and references)
tags=reading, language, platform, vm, jvm, clr, python, ecmascript
summary=Papers, books, and thoughts around automatic memory management (GC).
~~~~~~

Primary reading: [*Garbage Collection Handbook*](https://gchandbook.org/), [*Garbage Collection*](https://www.cs.kent.ac.uk/people/staff/rej/gcbook/)

## Concepts/terminology

### "Regions" or "kinds" of allocation

* **Static**: The compiler, at the time of compilation (or the program's startup, either approach can work) has knowledge of the desired allocations, and creates space for them out of somewhere in the process' available space. These locations are fixed throughout the lifetime of the program, and cannot be expanded or shrunk--they are literally static throughout the entirety of the application's life. This is how C/C++ handle `static`-modified variable declarations, for example. Most C/C++ globals fall into this category.

* **Stack**: The stack is a region of RAM that gets created on every thread that your application is running on. It works in a LIFO (Last In, First Out) manner, meaning that as soon as you allocate – or “push” – memory on to the stack, that chunk of memory will be the first to be deallocated – or “popped.” Every time a function declares a new variable, it is “pushed” onto the stack, and after that variable falls out of scope (such as when the function closes), that variable will be deallocated from the stack automatically. Once a stack variable is freed, that region of memory becomes available for other stack variables.

	Due to the pushing and popping nature of the stack, memory management is very logical and is able to be handled completely by the CPU; this makes it very quick, especially since each byte in the stack tends to be reused very frequently which means it tends to be mapped to the processor’s cache. However, there are some cons to this form of strict management. The size of the stack is a fixed value, and allocating more onto the stack than it can hold will result in a stack overflow. The size of the stack is decided when the thread is created, and each variable has a maximum size that it can occupy based on its data type; this prevents certain variables such as integers from ever growing beyond a certain value, and forces more complex data types such as arrays to specify their size prior to runtime since the stack won’t let them be resized. Variables allocated on the stack also are always local in nature because they are always next in line to be popped (unless more variables are pushed prior to the popping of earlier variables).

* **Heap**: The heap is a memory set aside for runtime/dynamic memory allocation. Allocation is handled at runtime, and therefore is up to the program to determine structure, means, etc. Once you allocate space, that space can be accessed at any point in time not only throughout just the thread, but throughout the application’s entire life. Deallocation must occur at some point, if the space is to be reused. Most operating systems will, once an application ends, reclaim that space. (Usually by tearing down the process entirely--we're long past the days where programs are obtaining exclusive access to physical addresses.)

	Interaction with the heap is usually through some form of reference; in languages that support direct access, these are ‘pointers,’ which are variables whose values are the address of another variable, such as a memory location. By creating a pointer, you ‘point’ at a memory location on the heap, which is what signifies the initial location of your variable and tells the program where to access the value. Due to the dynamic nature of the heap, it is completely unmanaged by the CPU aside from initial allocation and heap resizing; in non-garbage collected languages such as C and C++, this requires you as the developer to manage memory and to manually free memory locations when they are no longer needed. Failing to do so can create memory leaks and cause memory to become fragmented, which will cause reads from the heap to take longer and makes it difficult to continuously allocate more memory onto the heap.

### Heap management (aka garbage collection) strategies

Automated memory management (GC) almost always refers to heap management; I've never heard it applied to any other (static or stack) form of memory allocation and reclamation. Several strategies are possible (and numerous hybrid approaches):

* **Allocate without reclamation**: Technically, this is a legal automatic memory management technique, though obviously it is optimized more for performance of allocation and reclamation (i.e., zero time spent reclamation) than longevity.

* **Reference counting**: Each allocated object has a count associated with it indicating how many references are currently pointing to it. When the reference count drops to zero, the object is eligible for reclamation. Reference counts can either be managed automatically (as in, the language/runtime manage it without programmer intervention required) or manually (programmers must ensure they call some kind of `release` method or function to indicate a finished state of use). Reference counting is highly vulnerable to mutually-referencing objects (cyclic object graphs) as a source of memory leaks.

    Historical note: Microsoft COM was the first "mainstream" platform to really embrace reference counting as a part of its formal semantics (the `IUnknown` interface had three methods, two of which--`AddRef` and `Release`--managed the reference count of the allocated component), with very mixed results. When COM went distributed (DCOM), reference counts jumped in severity, since now the garbage collection was distributed, and a missed or dropped call could keep an object alive forever. Similarly, CORBA used reference counting as well, with much the same result. Java RMI chose to use a different form of distributed garbage collection, using a "heartbeat" to keep an object alive, and if no such heartbeat came through every so often, the object was assumed to be unreachable and therefore eligible for reclamation.

* **Mark-Sweep**: 

* **Mark-Sweep-Compact**:

* **Copying**:

* **Generational**:

Ironically, many of these strategies could be used in custom allocation/deallocation schemes in C/C++, but typically aren't due to the complexity of memory management.

### Additional concepts

* **Smart pointers**: Most smart pointers are small "wrappers" around native pointers, carrying a reference count that tries to be as automatic as possible. Most popular in C++ implementations, though some languages (Rust) look to incorporate smart-pointer-type semantics directly into the language. These generally try to then utilize stack-based concepts to help automagically manage reference counts for allocated objects, but circular reference counts are still possible (and probable).

* **Reachability**: When moving beyond pointer/reference-based schemes, most automated memory systems need to know which objects are eligible for reclamation, and which aren't--in essence, which are still under the possibility of being used by code. (An automatic memory system should ***never*** deallocate an object that is in use.) This analysis is usually known as "reachability" analysis, that is, finding which objects are "reachable" by user code, and therefore unsafe to reclaim. Many systems have multiple possibilities of reachability: 
    * reachable (in use)
    * softly reachable: Softly-reachable objects are eligible for reclamation, but are not reclaimed except and until memory pressure is too great (in other words, the runtime will fail if space is not found). Useful for caching behavior.
    * weakly reachable: An object is weakly reachable when the garbage collector finds no strong or soft references, but at least one path to the object with a weak reference. Weakly reachable objects are finalized some time after their weak references have been cleared. The only real difference between a soft reference and a weak reference is that the garbage collector uses algorithms to decide whether or not to reclaim a softly reachable object, but always reclaims a weakly reachable object. Weak references work well in applications that need to, for example, associate extra data with an unchangeable object, such as a thread the application did not create. Systems with weak references usually have some form of notification system when the referent is cleared, such as Java's `ReferenceQueue` mechanic. If you make a weak reference to the thread with a reference queue, your program can be notified when the thread is no longer strongly reachable. Upon receiving this notification, the program can perform any required cleanup of the associated data object. This makes them useful for object-pooling kinds of behavior.
    * "f-reachable": an object queued by the runtime for reclamation but still requires its finalizer to run; thus it is reachable only by the finalizer thread/mechanism within the runtime.
    * phantom-reachable: An object is phantomly reachable when the garbage collector finds no strong, soft, or weak references, but at least one path to the object with a phantom reference. Phantomly reachable objects are objects that have been finalized, but not reclaimed. These are the hardest to use, but offer a mechanism by which to do cleanup after a finalizer has been executed, essentially providing another way to do resource cleanup.
    * unreachable (not in use)

    Reading: [Monica Pawlan's original article](http://pawlan.com/monica/articles/refobjs/) | [Java reference types](https://www.kdgregory.com/index.php?page=java.refobj)

* **Finalizers**: Blocks of code to be run to assist with object reclamation efforts, for those situations in which just releasing the memory occupied is not sufficient to release all allocated resources (files, connections, locks, etc). These need to be run prior to the object's deallocation, since the variable state inside the object is often necessary as part of the resource-deallocation process, but this is usually running on a thread owned by the runtime, which means this is a scenario in which user code is being run on a runtime-owned thread, which raises all sorts of negative possibilities.

## Papers/articles/notes

- [Memory Management Reference (site)](https://www.memorymanagement.org/)
- [CS 4120/5120 Lecture notes](https://www.cs.cornell.edu/courses/cs4120/2018sp/lectures/39gc/lec39-sp18.pdf) (Andrew Myers)

### .NET

- [.NET Weak References](https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/weak-references)

### Java

- [Plumbr Handbook Java GC](https://plumbr.io/java-garbage-collection-handbook)

### Python

- [Python GC](https://stackify.com/python-garbage-collection/)
- [CPython GC](https://devguide.python.org/garbage_collector/)
- [Memory Mgmt and GC in Python](https://towardsdatascience.com/memory-management-and-garbage-collection-in-python-c1cb51d1612c)
- [Python Weak References](https://www.python.org/dev/peps/pep-0205/)

