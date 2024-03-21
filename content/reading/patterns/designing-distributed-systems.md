title=Designing Distributed Systems
tags=reading, books, distribution, patterns
summary=A relatively short distributed patterns book.
~~~~~~
*(by Brendan Burns)*

1. Introduction

# Part I: Single-Node Patterns
Containers are the foundational building block for the patterns in this book, but in the end, groups of containers co-located on a single machine make up the atomic elements of distributed system patterns.

## Chapter 2. The Sidecar Pattern
The sidecar pattern is a single-node pattern made up of two containers. The first is the application container. It contains the core logic for the application. Without this container, the application would not exist. In addition to the application container, there is a sidecar container. The role of the sidecar is to augment and improve the application container, often without the application container’s knowledge. In its simplest form, a sidecar container can be used to add functionality to a container that might otherwise be difficult to improve. Sidecar containers are coscheduled onto the same machine via an atomic container group, such as the pod API object in Kubernetes. In addition to being scheduled on the same machine, the application container and sidecar container share a number of resources, including parts of the filesystem, hostname and network, and many other namespaces.

## Chapter 3. Ambassadors
The ambassador pattern, where an ambassador container brokers interactions between the application container and the rest of the world. As with other single-node patterns, the two containers are tightly linked in a symbiotic pairing that is scheduled to a single machine. The value of the ambassador pattern is twofold. First, as with the other single-node patterns, there is inherent value in building modular, reusable containers. The separation of concerns makes the containers easier to build and maintain. Likewise, the ambassador container can be reused with a number of different application containers. This reuse speeds up application development because the container’s code can be reused in a number of places. Additionally the implementation is both more consistent and of a higher quality because it is built once and used in many different contexts.

## Chapter 4. Adapters

# Part II. Serving Patterns

## Chapter 5. Replicated Load-Balanced Services

## Chapter 6. Sharded Services

## Chapter 7. Scatter/Gather

## Chapter 8. Functions And Event-Driven Processing

## Chapter 9. Ownership Election

# Part III. Batch Computational Patterns

## Chapter 10. Work Queue Systems

## Chapter 11. Event-Driven Batch Processing

## Chapter 12. Coordinated Batch Processing
