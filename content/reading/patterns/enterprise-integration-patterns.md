title=Enterprise Integration Patterns
tags=reading, distribution, books, patterns, message-passing
summary=Hohpe/Woolf's classic messaging text.
~~~~~~
*(by Gregor Hohpe, Bobby Woolf (Addison-Wesley, 2004, ISBN 0-321-20068-3) )*


### Integration Styles: How can I integrate multiple applications so that they work together and can exchange information?

* **File Transfer** (43)
* **Shared Database** (47)
* **Remote Procedure Invocation** (50)
* **Messaging** (53)


### Messaging Systems

* **Message Channel** (60): How does one application communicate with another using messaging?
* **Message** (66): How can two applications connected by a message channel exchange a piece of information?
* **Pipes and Filters** (70): How can we perform complex processing on a message while maintaining independence and flexibility?
* **Message Router** (78): How can you decouple individual processing steps so that messages can be passed to different filters depending on a set of conditions?
* **Message Translator** (85): How can systems using different data formats communicate with each other using messaging?
* **Message Endpoint** (95): How does an application connect to a messaging channel to send and receive Messages (66)?

### Messaging Channels

* **Point-to-Point Channel** (103): How can the caller be sure that exactly one receiver will receive the document or perform the call?
* **Publish-Subscribe Channel** (106): How can the sender broadcast an event to all interested receivers?
* **Datatype Channel** (111): How can the application send a data item such that the receiver will know how to process it?
* **Invalid Message Channel** (115): How can a messaging receiver gracefully handle receiving a message that makes no sense?
* **Dead Letter Channel** (119): What will the messaging system do with a message it cannot deliver?
* **Guaranteed Delivery** (122): How can the sender make sure that a message will be delivered even if the messaging system fails?
* **Channel Adapter** (127): How can you connect an application to the messaging system so that it can send and receive messages?
* **Messaging Bridge** (133): How can multiple messaging systems be connected so that messages available on one are also available on the others?
* **Message Bus** (137): What architecture enables separate applications to work together but in a decoupled fashion such that applications can be easily added or removed without affecting the others?


### Message Construction

* **Command Message** (145): How can messaging be used to invoke a procedure in another application?
* **Document Message** (147): How can messaging be used to transfer data between applications?
* **Event Message** (151): How can messaging be used to transmit events from one application to another?
* **Request-Reply** (154): When an application sends a message, how can it get a response form the receiver?
* **Return Address** (159): How does a replier know where to send the reply?
* **Correlation Identifier** (163): How does a requestor that has received a reply know which request this is the reply for?
* **Message Sequence** (170): How can messaging transmit an arbitrarily large amount of data?
* **Message Expiration** (176): How can a sender indicate when a message should be considered stale and thus shouldn't be processed?
* **Format Indicator** (180): How can a message's data format be designed to allow for possible future changes?


### Message Routing

* **Content-Based Router** (230): How do we handle a situation in which the implementation of a single logical function is spread across multiple physical systems?
* **Message Filter** (237): How can a component avoid receiving uninteresting messages?
* **Dynamic Router** (243): How can you avoid the dependency of the router on all possible destinations while maintaining its efficiency?
* **Recipient List** (249): How do we route a message to a dynamic list of recipients?
* **Splitter** (259): How can we process a message if it contains multiple elements, each of which may have to be processed in a different way?
* **Aggregator** (268): How do we combine the results of individual but related message so that they can be processed as a whole?
* **Resequencer** (283): How can we get a stream of related but out-of-sequence messages back into the correct order?
* **Composed Message Processor** (294): How can yo maintain the overall message flow when processing a message consisting of multiple elements, each of which may require different processing?
* **Scatter-Gather** (297): How do you maintain the overall message flow when a message must be sent to multiple recipients, each of which may send a reply?
* **Routing Slip** (301): How do we route a message consecutively through a series of processing steps when the sequence of steps is not known at design time and may vary for each message?
* **Process Manager** (312): How do we route a message through multiple processing steps when the required steps may not be known at design time and may not be sequential?
* **Message Broker** (322): How can you decouple the destination of a message from the sender and maintain central control over the flow of messages?


### Message Transformation

* **Envelope Wrapper** (330): How can existing systems participate in a messaging exchange that places specific requirements, such as message header fields or encryption, on the message format?
* **Content Enricher** (336): How do we communicate with another system if the message originator does not have all the required data items available?
* **Content Filter** (342): How do you simplify dealing with a large message when you are interested only in a few data items?
* **Claim Check** (346): How can we reduce the data volume of messages sent across the system without sacrificing information content?
* **Normalizer** (352): How do you process messages that are semantically equivalent but arrive in a different format?
* **Canonical Data Model** (355): How can you minimize dependencies when integrating applications that use different data formats?


### Messaging Endpoints

* **Messaging Gateway** (468): How do you encapsulate access to the messaging system from the rest of the application?
* **Messaging Mapper** (477): How do you move data between domain objects and the messaging infrastructure while keeping the two independent of one another?
* **Transactional Client** (484): How can a client control its transactions with the messaging system?
* **Polling Consumer** (494): How can an application consume a message when the application is ready?
* **Event-Driven Consumer** (498): How can an application automatically consume messages as they become available?
* **Competing Consumers** (502): How can a messaging client process multiple messages concurrently?
* **Message Dispatcher** (508): How can multiple consumers on a single channel coordinate their message processing?
* **Selective Consumer** (515): How can a message consumer select which messages it wishes to receive?
* **Durable Subscriber** (522): How can a subscriber avoid missing messages while it's not listening for them?
* **Idempotent Receiver** (528): How can a message receiver deal with duplicate messages?
* **Service Activator** (532): How can an application design a service to be invoked both via various messaging technologies and via non-messaging techniques?


### System Management

* **Control Bus** (540): How can we effectively administer a messaging system that is distributed across multiple platforms and a wide geographic area?
* **Detour** (545): How can you route a message through intermediate steps to perform validation, testing, or debugging functions?
* **Wire Tap** (547): How do you inspect messages that travel on a Point-to-Point Channel (103)?
* **Message History** (551): How can we effectively analyze and debug the flow of messages in a loosely coupled system?
* **Message Store** (555): How can we report against message information without disturbing the loosely coupled and transient nature of a messaging system?
* **Smart Proxy** (558): How can you track messages on a service that publishes reply messages to the Return Address specified by the requestor?
* **Test Message** (569): What happens if a component is actively processing messages but garbles outgoing messages due to an internal fault?
* Channel Purger (572): How can you keep leftover messages on a channel from disturbing tests or running systems?
