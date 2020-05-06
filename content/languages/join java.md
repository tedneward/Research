title=Join Java
tags=language, jvm, concurrency
summary=Language based on the join-pattern of join-calculus.
~~~~~~

[Website](http://joinjava.unisa.edu.au/) was unresponsive on 6 May 2020 | [Wikipedia](https://en.wikipedia.org/wiki/Join_Java)

The Join Java extension introduces three new language constructs:

* Join methods
* Asynchronous methods
* Order class modifiers for determining the order that patterns are matched

Concurrency in most popular programming languages is implemented using constructs such as semaphores and monitors. Libraries are emerging (such as the Java concurrency library JSR-166) that provide higher-level concurrency semantics. Communicating Sequential Processes (CSP), Calculus of Communicating Systems (CCS) and Pi have higher-level synchronization behaviours defined implicitly through the composition of events at the interfaces of concurrent processes. Join calculus, in contrast, has explicit synchronization based on a localized conjunction of events defined as reduction rules. Join semantics try to provide explicit expressions of synchronization without breaching the object-oriented idea of modularization, including dynamic creation and destruction of processes and channels.

The Join Java language can express virtually all published concurrency patterns without explicit recourse to low-level monitor calls. In general, Join Java programs are more concise than their Java equivalents. The overhead introduced in Join Java by the higher-level expressions derived from the Join calculus is manageable. The synchronization expressions associated with monitors (wait and notify) which are normally located in the body of methods can be replaced by Join Java expressions (the Join methods) which form part of the method signature.

##### Join methods
A Join method is defined by two or more Join fragments. A Join method will execute once all the fragments of the Join pattern have been called. If the return type is a standard Java type then the leading fragment will block the caller until the Join pattern is complete and the method has executed. If the return type is of type signal then the leading fragment will return immediately. All trailing fragments are asynchronous so will not block the caller.

Example:
```
 class JoinExample {
    int fragment1() & fragment2(int x) {
       //will return value of x
       //to caller of fragment1
       return x;
    }
 }
```

##### Ordering modifiers
Join fragments can be repeated in multiple Join patterns so there can be a case when multiple Join patterns are completed when a fragment is called. Such a case could occur in the example below if B(), C() and D() then A() are called. The final A() fragment completes three of the patterns so there are three possible methods that may be called. The ordered class modifier is used here to determine which Join method will be called. The default and when using the unordered class modifier is to pick one of the methods at random. With the ordered modifier the methods are prioritised according to the order they are declared.

Example:

```
 class ordered SimpleJoinPattern {
    void A() & B() {
    }
    void A() & C() {
    }
    void A() & D() {
    }
    signal D() & E() {
    }
 }
```

##### Asynchronous methods
Asynchronous methods are defined by using the signal return type. This has the same characteristics as the void type except that the method will return immediately. When an asynchronous method is called a new thread is created to execute the body of the method.

Example:

```
 class ThreadExample {
    signal thread(SomeObject x) {
       //this code will execute in a new thread
    }
 }
```

Polyphonic C# offered join semantics, which later grew into Cw (C-omega), from Erik Meijer, before that got shut down and (parts of it) moved into C# as LINQ.

