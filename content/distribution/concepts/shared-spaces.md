title=Shared spaces
tags=distribution, concept, reading, shared space
summary=Notes and reading on the subject.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/Tuple_space)

The distributed shared memory (DSM) paradigm [Li and Hudak 1989; Tam et al. 1990] provides hosts in a distributed system with the view of a common shared space across disjoint address spaces, in which synchronization and communication between participants take place through operations on shared data. The notion of tuple space was originally integrated at the language level in Linda [Gelernter 1985], and provides a simple and powerful abstraction for accessing shared memory. A tuple space is composed of a collection of ordered tuples, equally accessible to all hosts of a distributed system. Communication between hosts takes place through the insertion/removal of tuples into/from the tuple space. Three main operations can be performed: out() to export a tuple into a tuple space, in() to import (and remove) a tuple from the tuple space, and read() to read (without removing) a tuple from the tuple space.

The interaction model provides time and space decoupling, in that tuple producers and consumers remain anonymous with respect to each other. The creator of a tuple needs no knowledge about the future use of that tuple or its destination. An inbased interaction implements one-of-n semantics (only one consumer reads a given tuple) whereas read-based interaction can be used to implement one-to-n message delivery (a given tuple can be read by all such consumers). Unlike the publish subscribe paradigm, the DSM model does not provide synchronization decoupling because consumers pull new tuples from the space in a synchronous style. This limits the scalability of the model due to the required synchronization between the participants. To compensate the lack of synchronization decoupling, some modern tuple space systems like JavaSpaces [Sun 2002], TSpaces [Lehman et al. 1999], and WCL [Rowstron 1998] extend the Linda tuple space model with asynchronous notifications.

A similar communication abstraction, called rendezvous, has been introduced in the Internet Indirection Infrastructure (I3) [Stoica et al. 2002]. Instead of explicitly sending a packet to a destination, each packet is associated with an identifier; this identifier is then used by the receiver to obtain delivery of the packet. This level of indirection decouples the act of sending from the act of receiving.

(Shared space: producers insert data asynchronously into the shared space, while consumers read data synchronously.)

Popularized by the [Linda](/languages/linda) programming language. Tuple spaces are collections of tuples.

*(IBM TSpaces were one of my favorite projects I never got to use.)*
