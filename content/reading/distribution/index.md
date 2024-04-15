title=Essays on distribution and networking
tags=reading, distribution, networking
summary=A collection of links to essays.
~~~~~~

* [The 2022 Turing Award](https://rjlipton.wpcomstaging.com/2023/03/25/the-2022-turing-award/): "Bob Metcalfe is the sole winner of the 2022 Turing Award. He keyed the development of Ethernet technology growing out of his PhD thesis while at Xerox PARC in the early 1970s. Previous recognitions of his work include the IEEE Medal of Honor and the National Medal of Technology and Innovation. Congrats Bob. If you wish to know the key to what he invented it was the insight: ***Listen before you talk.***"
* ["The Distributed Computing Manifesto"](https://www.allthingsdistributed.com/2022/11/amazon-1998-distributed-computing-manifesto.html): "Today, I am publishing the Distributed Computing Manifesto, a canonical document from the early days of Amazon that transformed the architecture of Amazon’s ecommerce platform. It highlights the challenges we were facing at the end of the 20th century, and hints at where we were headed." --Werner Vogels
* [dancres.github.io](https://dancres.github.io/Pages/)
* ["How we built r/Place"](https://www.redditinc.com/blog/how-we-built-rplace): Place was a project by Reddit where users could place a single colored tile on a collaborative canvas every few minutes. Each tile placed was relayed to observers in real-time. This article discusses how multiple engineering teams worked together to create Place.
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

