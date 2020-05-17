title=Message passing
tags=reading, language, distribution, actors
summary=A mechanism of communication or control flow in which a block of data is explicitly constructed and communicated to the recipient.
~~~~~~

Message-passing is often at the heart of dynamic programming languages like [Objective-C](/languages/objc.html). For example, the [ObjC runtime](https://developer.apple.com/documentation/objectivec/objective-c_runtime) (also described [here](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008048)) is a library for creating instances of objects, obtaining "selectors" to the names of message-receivers (methods) that the object can process, and even do some [MOP](metaobjectprotocol.html) operations on the objects.

In more widespread distributed systems literature, this is often called "message-oriented middleware" and typically involves messages dispatched over network links to "queues" where they are stored until examined (and possibly consumed) by messaging clients. Those who produce messages are often called "producers"; those who consume them, "consumers".




