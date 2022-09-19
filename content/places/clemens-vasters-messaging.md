title=Clemens Vasters' Messaging Repo
tags=place, distribution, messaging, pub-sub
summary=Clemens' collection of messaging material and terminology.
~~~~~~

[Repo](https://github.com/clemensv/messaging)

CV is one of the best minds on messaging-oriented communication and distribution I know. Highly recommended reading.

Selectively quoting from the README:

# Asynchronous Messaging and Eventing Resources

[Why would I care?](#why-would-i-care) | [Definitions: Messaging or eventing infrastructure](#definitions-messaging-or-eventing-infrastructure) | [Resources: Introductions and Patterns](#introductions-and-patterns) | [Resources: Open Standards](#open-standards) | [Resources: Products & Cloud Services](#products--cloud-services)

![service patterns](https://github.com/clemensv/messaging/images/service-patterns.png)

## "Why would I care?"

Generally, if you are building software that requires more than one computer to do its job, you should know about asynchronous messaging concepts.

"Asynchronous" means here: Your application sends a message or event and then carries on doing something else. It does not sit around waiting for an outcome.

For many developers, that is the first giant mental hurdle, since we've all been raised on "imperative" programming models. You make a function call and cause some work to happen and only once that work has been reported as done (or failed) your own code continues with its work.

Yet, we all use asynchronous messaging every day in the physical world. If we want to send a gift to someone in a different city, we will go to the post office and entrust the postal service with the package. The postal service takes care of getting it to the destination and also tracks and reports whether the package has been delivered successfully. Once the package has been delivered, your friend might then call you and excitedly thank you for the gift you sent. If you ask for it you will get feedback, but maybe on a different channel and after however long the handling and delivery took and usually with a clear reference to the package you sent.

That is what asynchronous messaging infrastructure does, but for your apps.

* Decoupling: A system handling work behind a messaging infrastructure can be running at capacity and yet not be overwhelmed and can even be down while the messaging infrastructure still accepts messages on its behalf.
* Delivery: You can entrust over your messages and the messaging system will try its best not lose them. It will then attempt to deliver them to the right parties and will retry as often as necessary.
* Buffering: A messaging infrastructure is generally great at accepting bursts of messages at once and organizing them for later retrieval. The retrieval can then occur at the pace that your application can handle. That is also called load-leveling.
* Network-Bridging: Messaging infrastructures can often be attached to multiple networks, allowing information to pass between applications in those networks without there being IP-level connectivity between them.

## Definitions: Messaging or eventing infrastructure

"Message broker", "queue", "service bus", "event router", "event stream engine", "event aggregator", are all names for asynchronous messaging and eventing infrastructure elements and the list is by no means exhaustive. I will give you a brief definitions for all the words in those names for orientation.

* **Producer** - A producer (or _sender_ or _publisher_) is a role in a software system that wants to share/distribute information and therefore produces messages and makes them available via a messaging infrastructure.
* **Consumer**  - A consumer (or _receiver_ or _subscriber_) is a role in a software system that retrieves/gets messages from an messaging infrastructure and consumes them. Consuming often, but not always, means to act on the information.
* **Content** - Content (or _payload_ or _body_) is the information the producer wants the consumer(s) to receive and handle. Content may be any kind of data in any format.
* **Message** - A message is an envelope that wraps the content for transfer. It contains metadata annotations that helps the messaging infrastructure and frameworks understand how to route and handle the information, just like the addressing information and "express" stickers on a postal package or letter envelope.
* **Event** - An event is a variation of a message whose content reflects a fact. A fact is a historical statement of some past activity: "the milk carton dropped on the floor" is a fact that will forever be true when looking back at the morning of this day if it happened to you. The great thing about facts is that they can be easily distributed and cached and copied and transformed because the exact information they carry will forever be true and never again change. "Discrete" events are independent of other events (unlike those in a _stream_, see below) and are usually immediately actionable. (These philosophical considerations matter a lot for arriving at smart architectures).
* **Job** - A job is a variation of a message whose content reflects an intent. The producer sends content with the intent of a consumer doing some work based on that content. "I just took this purchase order from a customer, please package and deliver these goods". Getting the job done might again involve multiple parties that handle parts if it, each being instructed through jobs.
* **Queue** - A queue is a messaging infrastructure entity that assigns the exclusive ownership and temporary control over the lifecycle of a message to one of potentially many competing consumers. The consumer can decide to finally accept the message which removes it from the queue and thus prevents the work from being performed again or to make it again available for consumption if an error prevented the work from being completed such that a retry is possible. The message can also be rejected and sidelined if it cannot be processed even with a retry. Message queues may also provide ordering assurances which are defining for the "queue" data structure in computer science, but that is optional.
* **Router** - A router ( or _topic_) is a messaging infrastructure entity that accepts messages from producers and dispatches them onwards to other messaging infrastructure entities or to consumers, often considering rules that inspect the message metadata annotations. Routers may often be configured dynamically and at runtime to deliver messages to interested parties, which are then called subscribers. 
* **Stream** - An event stream (or _event series_) is a sequence of related events, which typically stem from the same producer or at least the same producer context (i.e. multiple producers create events about the same thing). An event stream engine may multiplex delivery of many concurrent event streams (occasionally also called _topic_) and may split those up across several physical logs (partitions) while keeping any one event stream together on a partition to ensure preserving order.
* **Checkpoint** - Event streams are usually processed by taking several events at a time. Since events are not jobs and therefore do not require exclusive handling, event stream engines therefore shift the burden of keeping track of what events have and have not been consumed to the consumer themselves. Consumer will periodically note a checkpoint relative to the stream and/or partition and resume from that noted checkpoint when needed. Some event stream brokers have internal facilities that help with noting those checkpoints.
* **Broker** - Broker (or _service bus_) is the term for a server or infrastructure that brokers messages and does so via queues or routers or streams. Brokers generally only act on metadata of messages and do not consider the content of the message.
* **Aggregator** - An aggregator or **stream processor** or **stream analytics** engine is a compute service that takes one more more event streams as input and yields one or more event streams or derived discrete events as output. The output(s) might be a filtered view of the input stream or consist of computed aggregates of input eventsor it might be a join of multiple streams or streams with reference data. Contrary to brokers, aggregators will consider the content of events.
  
## Introductions and Patterns

* [Talk: "What is a message queue and why would I use one?", We Are Developers Berlin (2022)](https://www.youtube.com/watch?v=bHSV916YbHE) <br> Introduction to queues in general and message queues in particular and where and why they are used. 
* [Talk: "Messaging Patterns for Developers"
  (2021)](https://www.youtube.com/watch?v=ef1DK76rseM). <br>This is a .NET talk, but
  conceptually also applicable to all other programming languages.
* [Talk: "Eventing, Serverless, and the Extensible Enterprise", Voxxed Athens
  2018](https://www.youtube.com/watch?v=qCNXUUlhJJE). <br>In this talk I discuss
  (Micro-)services and serverless functions in context with messaging and
  eventing.
* [Talk: "Events, data Points, and Messages", Thingmonk
  2017](https://www.youtube.com/watch?v=ITrlLErsqzY&feature=emb_imp_woyt). <br>This
  is a short talk from where I drew the lines between events and messages.
* [Events, Data Points, and Messages - Choosing the right Azure messaging
  service for your
  data](https://azure.microsoft.com/en-us/blog/events-data-points-and-messages-choosing-the-right-azure-messaging-service-for-your-data/). <br>A blog article explaining the differences between the services we offer.
* [Asynchronous messaging
  options](https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/messaging).<br>Azure architecture center article that lays out those options in more detail.
* [Samples: Streaming at scale in
  Azure](https://docs.microsoft.com/en-us/samples/azure-samples/streaming-at-scale/streaming-at-scale/),
  [(repo)](https://github.com/Azure-Samples/streaming-at-scale)<br>A repository
  with many examples of composite usage of Azure services for event streaming.

## Open Standards

* [Talk: "Azure Messaging: Standards Matter", Azure & AI Conference 2022](https://youtu.be/FVOhLqE9fzw)<br>Discussion of patterns and standards.

## Books

An incomplete list of books about product-/project-neutral messaging and
eventing principles and patterns. I am an impatient book reader and prefer going
straight to authoritative documents, therefore I am happy to take PRs for this
section from readers who've been helped by particular books.

* [Enterprise Patterns by Gregor Hohpe, 2003](https://www.enterpriseintegrationpatterns.com/gregor.html) - Timeless classic. Truth.
* [Flow Architectures by James Urquhart, 2021](https://www.goodreads.com/book/show/51771839-flow-architectures) -
  This is a very current, conceptual overview of various aspects of eventing; don't expect a
  "how-to" book, but one that introduces the notion of application architectures
  enabled by data in motion.

## Products & Cloud Services

### Apache 

The [Apache Software Foundation](/places/apache) hosts several popular open source projects that
produce message and event broker infrastructures.

* [ActiveMQ](/distribution/activemq) - transactional queue and pubsub broker family (ActiveMQ "Classic" and Artemis)
* [Qpid](https://qpid.apache.org/) - transactional queue and pubsub broker family, also including an AMQP router
* [Pulsar](/distribution/pulsar) - event stream engine and queue broker
* [Kafka](https://kafka.apache.org/) - event stream engine
* [Camel](https://camel.apache.org/) - integration framework with hundreds of components and several patterns 

### CNCF

The Cloud Native Computing Foundation also hosts a few messaging and eventing
centric projects.

* [NATS](https://www.cncf.io/projects/nats/) - fast, simple pubsub message broker 
* [Pravega](https://cncf.pravega.io/) - stream-oriented replicated storage 
* [Strimzi](https://www.cncf.io/projects/strimzi/) - Kubernetes operator for Apache Kafka, 
  curiously in CNCF and not in the ASF and the Apache Kafka project, which says something 
  about the latter.

### Eclipse

The Eclipse Foundation has a strong IoT focus and hosts various MQTT-related
projects. It is also hosting the Jakarta Messaging project that carries forward
the popular JMS standard.

* [Mosquitto](https://mosquitto.org/) - reference MQTT broker implementation 
* [Paho](https://www.eclipse.org/paho/) - MQTT librarry collection for several programming languages
* [Jakarta Messaging (JMS)](https://projects.eclipse.org/projects/ee4j.messaging) - the one-and-sadly-only universal 
  Java API for message brokers, with an sadly-ultra-opinionated topology concept. Needs a thorough overhaul, 
  but is here and very useful.
