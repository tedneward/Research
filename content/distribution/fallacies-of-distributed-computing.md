title=Fallacies of Distributed Computing
tags=distribution, architecture
summary=The set of mistakes that everybody makes when thinking about distributed systems.
~~~~~~

L. Peter Deutsch, 1994, a presentation given at Sun Microsystems. Started with a few (4 or 5?) and others have added to the list over time.

# The network is reliable

# Latency is zero

# Bandwidth is infinite

# The network is secure

# The topology never changes

# There is only one administrator

# Transport cost is zero

# The network is homogeneous

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
