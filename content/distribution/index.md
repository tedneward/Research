title=Distribution and Distributed Systems
category=distribution
type=categorypage
summary=A collection of links about distributed systems, including protocol definitions/specifications.
tags=distribution
~~~~~~

Distributed systems are the means by which programs on one machine communicate with another. Differ from architectures in that while an architecture may have a distributed system at its center, it's not a requirement, and while distributed systems may incorporate an architecture as part of their implementation, that architecture usually isn't imposed on the user of the distributed system. Includes networking topics, for example.

## Technology stacks/stack-related links:

* [Stack on a budget (Free-Tier Driven Development)](https://github.com/255kb/stack-on-a-budget): A collection of services with great free tiers for developers on a budget.

## Interesting links:

* [Fuck Off As A Service](http://foaas.com/)
* [DnD 5e API](https://github.com/5e-bits/5e-srd-api)
* [Another DnD 5e API](https://api.open5e.com/)
* [Poke API](https://pokeapi.co/)
* [My Little Pony: Friendship is Magic Episode information API](https://github.com/Xe/PonyAPI)
* [Streaming Movie of the Night API](https://www.movieofthenight.com/about/api)
* [Nessie, Capital One's Hackathon API](http://api.reimaginebanking.com/): Nessie provides access to some real public-facing data such as Capital One ATM and bank branch locations, along with some mock customer account data, and was designed for use in experiments like this.
* [Gamestonk Terminal](https://github.com/GamestonkTerminal/GamestonkTerminal): Investment research for everyone [Source](https://github.com/GamestonkTerminal/GamestonkTerminal) (open-source alternative to [Bloomberg](https://www.bloomberg.com/))
* [State of APIs](https://stateofapis.com/): Survey results on a yearly (2021, 2022, beyond?) basis.

## Interesting tools based on network APIs

* [imap-backup](https://github.com/joeyates/imap-backup): Backup GMail (or other IMAP) accounts to disk

## Auth-n-Auth and SSO

* ["Enabling user authentication in Swagger using Microsoft Identity"](https://www.josephguadagno.net/2022/06/03/enabling-user-authentication-in-swagger-using-microsoft-identity)

### Proprietary/Cloud

* Auth0
* [FusionAuth](https://fusionauth.io/): User authentication and session management framework [Source](https://github.com/FusionAuth/fusionauth-containers)
* Okta

### Open Source

* [Cerbos](https://cerbos.dev/): Granular access control [Source](https://github.com/cerbos/cerbos)
* [Keycloak](https://www.cloud-iam.com/): User authentication and session management framework [Source](https://github.com/keycloak/keycloak)
* [OPAL (Permit.io)](https://www.opal.ac/): Authorization administration framework (Open Policy) [Source](https://github.com/permitio/opal)
* [Ory](https://www.ory.sh/): Identity platform [Source](https://github.com/ory/kratos)
* [Oso](https://www.osohq.com/): Authorization building framework [Source](https://github.com/osohq/oso)
* [Supertokens](https://supertokens.io/): User authentication and session management framework [Source](https://github.com/supertokens/supertokens-core)

## Reading and reading lists:

* ["The Distributed Computing Manifesto"](https://www.allthingsdistributed.com/2022/11/amazon-1998-distributed-computing-manifesto.html): "Today, I am publishing the Distributed Computing Manifesto, a canonical document from the early days of Amazon that transformed the architecture of Amazon’s ecommerce platform. It highlights the challenges we were facing at the end of the 20th century, and hints at where we were headed." --Werner Vogels
* [dancres.github.io](https://dancres.github.io/Pages/)
* ["How we built r/Place"](https://www.redditinc.com/blog/how-we-built-rplace): Place was a project by Reddit where users could place a single colored tile on a collaborative canvas every few minutes. Each tile placed was relayed to observers in real-time. This article discusses how multiple engineering teams worked together to create Place.
* ["Goodbye Microservices: From 100s of problem children to 1 superstar"](https://segment.com/blog/goodbye-microservices/)
* ["Clocks and Causality -- Ordering Events in Distributed Systems"](https://www.exhypothesi.com/clocks-and-causality/): *In distributed systems, logical clocks play a key role in the ordering of system events. What are the various logical clock designs, and how do they help with event ordering? This article answers these questions.*

### Distributed systems patterns

* [Design Patterns and Principles That Support Large Scale Systems](https://medium.com/everything-full-stack/design-patterns-and-principles-that-support-large-scale-systems-f3c9adf89ad0)

    * Idempotence
    * Embracing Asynchronicity
    * Health Check (Heartbeat)
    * Circuit Breaker
    * Kill Switch/Feature Flag
    * Bulkhead: "a dividing wall or barrier between compartments a the bottom of a ship. Its job is to isolate an area in case there’s a hole at the bottom — to prevent water from flooding all the ship (it will flood only the compartment in which the hole was created)."
    * Service Discovery
    * Timeouts, Sleep, Retries
    * Fallbacks
    * Metrics, Monitoring, Alarms
    * Rate-limiting (User, Service, Geocentric)
    * Backpressure
    * Canary release: "Canary testing is a technique used to roll out changes gradually to production. When the monitoring system catches an issue — the canaries are rolled back automatically with minimal damage to production traffic."

* [A Design Guide for Building Offline First Apps](https://hasura.io/blog/design-guide-to-offline-first-apps/)

    * Make code available offline; make data available offline
    * Conflict resolution:
    
        1. Conflicts don't matter. (Users will correct the data later.)
        2. Version your objects.
        3. Use conflict-free replicated data types (CRDTs)
        4. Ship changes to server, store aggregates on server
    
    * Online-only things in an offline-first app: Authentication, Search, Attachments.

### Networking (Fundamentals, et al)

* [An Introduction to Computer Networks](http://intronetworks.cs.luc.edu) (HTML, PDF, Kindle)
* [Bits, Signals, and Packets: An Introduction to Digital Communications and Networks](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-02-introduction-to-eecs-ii-digital-communication-systems-fall-2012/readings/)
* [Code Connected vol.1](http://hintjens.wdfiles.com/local--files/main%3Afiles/cc1pe.pdf) (PDF) (book on ZeroMQ)
* [Computer Networking : Principles, Protocols and Practice](http://cnp3book.info.ucl.ac.be/1st/html/index.html) (HTML, ePub, PDF, Kindle)
* [Computer Networks: A Systems Approach](https://book.systemsapproach.org) - Larry Peterson and Bruce Davie (HTML, epub, mobi, PDF)
* [Distributed systems for fun and profit](http://book.mixu.net/distsys/single-page.html)
* [High-Performance Browser Networking](https://hpbn.co) - Ilya Grigorik
* [IPv6 for IPv4 Experts](https://sites.google.com/site/yartikhiy/home/ipv6book) - Yar Tikhiy (PDF)
* [Kafka gentle introduction](https://www.gentlydownthe.stream) - Mitch Seymour
* [Kafka, The definitive Guide](https://assets.confluent.io/m/1b509accf21490f0/original/20170707-EB-Confluent_Kafka_Definitive-Guide_Complete.pdf) - Neha Narkhede (PDF)
* [Network Science](http://networksciencebook.com) - Albert-Laszló Barabási
* [Securing Wireless Networks for the Home User Guide](https://mohamedation.github.io/securing-wifi/index-en.html) - Mohamed Adel (HTML)
* [The TCP/IP Guide](http://www.tcpipguide.com/free/t_toc.htm)
* [Understanding IP Addressing: Everything you ever wanted to know](http://pages.di.unipi.it/ricci/501302.pdf) (PDF)
* [ZeroMQ Guide](http://zguide.zeromq.org/page%3Aall)

### HTTP API Design/Implementation/Usage

* [Web API Design](https://pages.apigee.com/rs/apigee/images/api-design-ebook-2012-03.pdf) - Brian Mulloy (PDF)
* [Working with Web APIs](https://launchschool.com/books/working_with_apis) - Launch School
* [Your API Is Bad](https://leanpub.com/yourapiisbad/read) - Paddy Foran

