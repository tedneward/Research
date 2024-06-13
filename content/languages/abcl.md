title=ABCL
tags=language
summary=An Object-Oriented Concurrent System, looking to exploit both parallelism and object orientation.
~~~~~~

[Source](http://web.yl.is.s.u-tokyo.ac.jp/pl/abcl.html)

The tenet of our ABCL research project is to exploit both parallelism and object orientation. Parallelism is ubiquitous in our problem domains; parallelism is not only the source of computational power, but also promotes structural simplicity/naturalness in design and algorithm. Object-orientation accompanying parallelism, enhances system modularity, flexibility, and safety. Such an approach, called object-oriented concurrency, is summarized as follows:

* the software or algorithm to be designed/constructed is represented as a collection of concurrently executable (concurrent) objects, and
* the interaction among the system components is represented solely as message transmissions among such objects.

A concurrent object models the functions and properties of an entity appearing in a problem domain. It is an encapsulated (program) module which contain data and the associated procedures to operate on the data, and also perform message passing. Upon receiving a message, it becomes active and executes a procedure specified by the message. Message transmission may take place concurrently among objects, thus enabling objects to be active in parallel. The basic mode of message passing in our approach is asynchronous in the sense that an object can send a message whenever it wants to, irrespective of the mode of the receiver of the message. This expands the degree of parallelism allowed in a system. We also assume that an object is able to create new objects dynamically. The capability of dynamic object creation is indispensable in modeling and representing complex, open systems naturally. We believe that the asynchrony and this dynamicity are fundamental in our approach. We developed a parallel computation model ABCM/1 (An object-Based Concurrent computation Model 1) and its associated description language ABCL/1 (An object-Based Concurrent Language 1). ABCM/1 is based on our notion of "objects", while ABCL/1 serves as a programming language in which systems and algorithms are written based on objects defined in ABCM/1. From ABCM/1 and ABCL/1, our research project has stemmed mainly towards three directions: theory, implementation/environment, and application. In each direction, there are a number of research topics that have been identified and investigated.

