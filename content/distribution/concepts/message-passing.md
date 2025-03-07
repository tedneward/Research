title=Message-passing
tags=distribution, concept, messaging
summary=Notes and reading on the subject.
~~~~~~

Message passing can be viewed as the ancestor of distributed interactions. Message passing represents a low-level form of distributed communication, in which participants communicate by simply sending and receiving messages. Although complex interaction schemes are still built on top of such primitives, message passing is nowadays rarely used directly for developing distributed applications, since physical addressing and data marshaling, and sometimes even flow control (e.g., retransmission), become visible to the application layer. Message passing is asynchronous for the producer, while message consumption is generally synchronous. (Message passing interaction: the producer sends messages asynchronously through a communication channel (previously set up for that purpose). The consumer receives messages by listening synchronously on that channel.) The producer and the consumer are coupled both in time and space: they must both be active at the same time and the recipient of a message is known to the sender.

## Reading

* [In-memory mesasage bus in type-safe Typescript](https://event-driven.io/en/inmemory_message_bus_in_typescript/)

