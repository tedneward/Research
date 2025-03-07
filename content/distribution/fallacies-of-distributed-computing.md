title=Fallacies of Distributed Computing
tags=distribution, architecture
summary=The set of mistakes that everybody makes when thinking about distributed systems.
~~~~~~

L. Peter Deutsch, 1994, a presentation given at Sun Microsystems. Started with a few (4 or 5?) and others have added to the list over time.

[Wikipedia](https://en.wikipedia.org/wiki/Fallacies_of_distributed_computing)

# The network is reliable
Developers and architects alike assume that the network is reliable, but it is not. While networks have become more reliable over time, the fact of the matter is that networks still remain generally unreliable. This is significant for all distributed architecture styles, because they rely on the network for communicating to, from, and between services.

# Latency is zero
Latency, in any distributed architecture, is not zero–yet most architects ignore this fallacy, insisting that they have fast networks. Ask yourself: do you know what the average round-trip latency is for a RESTful call in your production environment? Is it 60 milliseconds? Is it 500 milliseconds?

# Bandwidth is infinite
Bandwidth is usually not a concern in monolithic architectures, because once a business request goes into a monolith, little or no bandwidth is required to process it. However, once a system is broken apart into smaller deployment units (services) in a distributed architecture, such as microservices, communication to and between these services uses significant bandwidth. This slows the network, impacting latency (fallacy #2) and reliability (fallacy #1).

*Stamp coupling* is when a service consumes significant amounts of bandwidth in distributed architectures. Stamp coupling (in an HTTP-based API) can be resolved by:

* Creating private RESTful API endpoints
* Using field selectors in contracts
* Using GraphQL to decouple contracts
* Using value-driven contracts with consumer-driven contracts
* Using internal messaging endpoints

Regardless of the technique used, the best way to address this fallacy in a distributed architecture is to ensure that services or systems transmit only the necessary data.

# The network is secure
The surface area for threats and attacks increases by magnitudes when moving from a monolithic to a distributed architecture, making security much more challenging. Securing every endpoint, even in interservice communication, is another reason performance tends to be slower in synchronous, highly distributed architecture styles, such as microservices and service-based architectures.

# The topology never changes
This fallacy refers to the overall network topology, including all of its routers, hubs, switches, firewalls, networks, and appliances. Architects assume that the topology is fixed and never changes. Of course it changes. It changes all the time. Architects must be in constant communication with operations and network administrators about what is changing and when, so that they can make adjustments to avoid such surprises. 

# There is only one administrator
Architects fall into this fallacy all the time: assuming they only need to collaborate and communicate with one administrator. There are dozens of network administrators in a typical large company. With whom should the architect talk about latency or topology changes? This fallacy points to the complexity of distributed architecture and the amount of coordination that must happen to get everything working correctly. A monolithic application, with its single deployment unit, doesn’t require this level of communication and collaboration.

# Transport cost is zero
Many software architects confuse this fallacy with fallacy 2 (latency is zero). Transport cost here refers not to latency, but to the actual monetary cost of making a “simple RESTful call.” Architects incorrectly assume that the necessary and sufficient infrastructure is already in place for making a simple RESTful call or breaking apart a monolithic application. It is usually not. Distributed architectures cost significantly more than monolithic architectures, primarily due to increased needs for hardware, servers, gateways, firewalls, new subnets, proxies, and so on. We encourage architects embarking on a distributed architecture to analyze their current server and network topology with regard to capacity, bandwidth, latency, and security zones, to avoid getting surprised by this fallacy.

*(I'm not 100% certain that they're interpreting this correctly, but this fallacy has always struck me as one that's slightly out-of-phase with the others. I wish whomever added this to Deutsch's list had been more clear with the wording.)*

# The network is homogeneous
Most architects and developers assume that a network is homogeneous—that it’s made up of network hardware from only one vendor. Nothing could be further from the truth. Most companies’ infrastructures have multiple network-hardware vendors. So what? The significance of this fallacy is that not all of those heterogeneous hardware vendors play together well. Does Juniper hardware integrate seamlessly with Cisco hardware? Most of it works, and networking standards have evolved over the years, making this less of an issue. However, not all situations, loads, and circumstances have been fully tested, so network packets do occasionally get lost. This in turn affects network reliability and assumptions and assertions about latency and bandwidth. In other words, this fallacy ties back into all of the other fallacies, forming an endless loop of confusion and frustration when dealing with networks (which is inescapable when using distributed architectures).

# Addenda

Mark Richards/Neal Ford add the following:

## Versioning is easy
When two services need to communicate, they pass information in a contract, which includes information required for the communication. Often, a service’s internal implementation evolves over time, changing fields that the service accepts and passes to other services. One way to solve this problem is to use versioning for the contract–that is, create different versions for the old and new contracts including different sets of information. However, this seemingly simple decision leads to a host of trade-offs:

- Should the team version at the individual service level or for the whole system?
- How far should the versioning reach? What portion of the architecture will need to support it?
- How many versions should the team support at any given time? (Some teams accidentally find themselves honoring dozens of different versions for different purposes.)
- Should the team deprecate older versions at the system level or service by service?

While versioning is a reasonable approach for evolving communication between services, it has a host of trade-offs that architects should anticipate.

## Compensating updates always work
Compensating Updates is an architectural pattern in which some mechanism (like an orchestrator service) makes sure that several related services all update jointly. If they don’t, the orchestrator reverses the update. The compensating update is the one from the orchestrator that issues a reversing operation to put the state back to what it was before.

This is a common pattern, which most architects blithely assume always works… but it doesn’t. What happens if the compensating update fails? When architects demonstrate how complex interactions in distributed architectures like microservices work, they must also show how compensating updates work. Thus, architects designing transactional workflows in microservices should accommodate the “normal” compensation workflow, but must also consider how to recover if the update and the compensating update (or a portion of it) both fail.

## Observability is optional (for distributed architectures)
A common architectural characteristic for architects to prioritize in distributed architectures is observability: the ability to observe each service’s interactions with other services and the ecosystem, as captured through monitors or logs. While logging is useful in monolithic architectures, it is critical in distributed architectures, which offer many communication failure modes that are hard to debug without comprehensive interaction logs.
