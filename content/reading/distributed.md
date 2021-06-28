title=Distribution (networking, distributed systems, etc) reading
tags=reading, distribution
summary=Generalized reading topics about spreading code around the network.
~~~~~~

[Distributed programming book](https://github.com/heathermiller/dist-prog-book) ([Website](http://dist-prog-book.com/chapter/1/rpc.html)): "Source repo for the book that I and my students in my course at Northeastern University, CS7680 Special Topics in Computing Systems: Programming Models for Distributed Computing, are writing on the topic of programming models for distributed systems."
> This is a book about the programming constructs we use to build distributed systems. These range from the small, RPC, futures, actors, to the large; systems built up of these components like MapReduce and Spark. We explore issues and concerns central to distributed systems like consistency, availability, and fault tolerance, from the lens of the programming models and frameworks that the programmer uses to build these systems.


#### Ideas and theory
* [Fallacies of Distributed Computing](https://en.wikipedia.org/wiki/Fallacies_of_distributed_computing) - Peter Deutsch
* [Why Distributed Computing?](https://www.artima.com/weblogs/viewpost.jsp?thread=4247) - Jim Waldo
* [A Note on Distributed Computing](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.41.7628) - Waldo, Wollrath et al
* [Harvest, Yield and Scalable Tolerant Systems](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.33.411) - Real world applications of CAP from Brewer et al
* [On Designing and Deploying Internet Scale Services](https://mvdirona.com/jrh/talksAndPapers/JamesRH_Lisa.pdf) - James Hamilton
* [The Perils of Good Abstractions](https://web.archive.org/web/20181006111158/http://www.addsimplicity.com/adding_simplicity_an_engi/2006/12/the_perils_of_g.html) - Building the perfect API/interface is difficult
* [Chaotic Perspectives](https://web.archive.org/web/20180821164750/http://www.addsimplicity.com/adding_simplicity_an_engi/2007/05/chaotic_perspec.html) - Large scale systems are everything developers dislike - unpredictable, unordered and parallel
* [Stevey's Google Platforms Rant](https://web.archive.org/web/20190319154842/https://plus.google.com/112678702228711889851/posts/eVeouesvaVX) - Yegge's SOA platform experience
* [Latency Exists, Cope!](https://web.archive.org/web/20181004043647/http://www.addsimplicity.com/adding_simplicity_an_engi/2007/02/latency_exists_.html) - Commentary on coping with latency and it's architectural impacts
* [Latency - the new web performance bottleneck](https://www.igvita.com/2012/07/19/latency-the-new-web-performance-bottleneck/) - not at all new (see Patterson), but noteworthy
* [The Tail At Scale](https://research.google/pubs/pub40801/) - the latency challenges inherent of dealing with latency in large scale systems
* [The Byzantine Generals Problem](https://lamport.azurewebsites.net/pubs/byz.pdf)
* [Distributed Computing Economics](https://arxiv.org/pdf/cs/0403019.pdf) - Jim Gray
* [Rules of Thumb in Data Engineering](https://www.microsoft.com/en-us/research/publication/rules-of-thumb-in-data-engineering/) - Jim Gray and Prashant Shenoy
* [Impossibility of distributed consensus with one faulty process](https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf) - also known as FLP
* [Unreliable Failure Detectors for Reliable Distributed Systems](https://www.cs.utexas.edu/~lorenzo/corsi/cs380d/papers/p225-chandra.pdf) A method for handling the challenges of FLP
* [Lamport Clocks](https://lamport.azurewebsites.net/pubs/time-clocks.pdf) - How do you establish a global view of time when each computer's clock is independent
* [Lazy Replication: Exploiting the Semantics of Distributed Services](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.17.469)
* [Scalable Agreement - Towards Ordering as a Service](https://www.usenix.org/legacy/event/hotdep10/tech/full_papers/Kapritsos.pdf)
* [Scalable Eventually Consistent Counters over Unreliable Networks](https://arxiv.org/pdf/1307.3207v1.pdf) - Scalable counting is tough in an unreliable world
  
Pat Helland's works
* [Data on the Outside versus Data on the Inside](http://cidrdb.org/cidr2005/papers/P12.pdf) - Pat Helland
* [Memories, Guesses and Apologies](https://channel9.msdn.com/Shows/ARCast.TV/ARCastTV-Pat-Helland-on-Memories-Guesses-and-Apologies) - Pat Helland
* [SOA and Newton's Universe](https://web.archive.org/web/20190719121913/https://blogs.msdn.microsoft.com/pathelland/2007/05/20/soa-and-newtons-universe/) - Pat Helland
* [Building on Quicksand](https://arxiv.org/abs/0909.1788) - Pat Helland
* [Life Beyond Distributed Transactions](https://docs.microsoft.com/en-us/archive/blogs/pathelland/link-to-quotlife-beyond-distributed-transactions-an-apostates-opinion) - Helland
* [If you have too much data, then 'good enough' is good enough](https://queue.acm.org/detail.cfm?id=1988603) - NoSQL, Future of data theory - Pat Helland

CAP Theorem
* [CAP Conjecture](https://web.archive.org/web/20190629112250/https://www.glassbeam.com/sites/all/themes/glassbeam/images/blog/10.1.1.67.6951.pdf) - Consistency, Availability, Parition Tolerance cannot all be satisfied at once
* [Consistency, Availability, and Convergence](https://www.cs.utexas.edu/users/dahlin/papers/cac-tr.pdf) - Proves the upper bound for consistency possible in a typical system
* [CAP Twelve Years Later: How the "Rules" Have Changed](https://www.infoq.com/articles/cap-twelve-years-later-how-the-rules-have-changed) - Eric Brewer expands on the original tradeoff description
* [You Can't Sacrifice Partition Tolerance](https://codahale.com/you-cant-sacrifice-partition-tolerance/) - Additional CAP commentary

Vogels' works
* [Consistency and Availability](https://www.infoq.com/news/2008/01/consistency-vs-availability) - Vogels
* [Eventual Consistency](https://www.allthingsdistributed.com/2007/12/eventually_consistent.html) - Vogels

Transactions and commits
* [Avoiding Two-Phase Commit](https://web.archive.org/web/20180821165044/http://www.addsimplicity.com/adding_simplicity_an_engi/2006/12/avoiding_two_ph.html) - Two phase commit avoidance approaches
* [2PC or not 2PC, Wherefore Art Thou XA?](https://web.archive.org/web/20180821164931/http://www.addsimplicity.com/adding_simplicity_an_engi/2006/12/2pc_or_not_2pc_.html) - Two phase commit isn't a silver bullet
* [Starbucks doesn't do two phase commit](https://www.enterpriseintegrationpatterns.com/docs/IEEE_Software_Design_2PC.pdf) - Asynchronous mechanisms at work
* [Optimistic Replication](https://www.hpl.hp.com/techreports/2002/HPL-2002-33.pdf) - Relaxed consistency approaches for data replication

#### Languages and Tools
* [Programming Distributed Erlang Applications: Pitfalls and Recipes](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.137.9417&rep=rep1&type=pdf) - Building reliable distributed applications isn't "just" using Erlang/OTP.

#### Infrastructure
* [Principles of Robust Timing over the Internet](https://queue.acm.org/detail.cfm?id=1773943) - Managing clocks is essential for even basics such as debugging

#### Storage
* [Consistent Hashing and Random Trees](https://www.akamai.com/us/en/multimedia/documents/technical-publication/consistent-hashing-and-random-trees-distributed-caching-protocols-for-relieving-hot-spots-on-the-world-wide-web-technical-publication.pdf)
* [Amazon's Dynamo Storage Service](https://www.allthingsdistributed.com/2007/10/amazons_dynamo.html)

#### Paxos Consensus and other consensus papers
* [Paxos Made Simple](https://lamport.azurewebsites.net/pubs/paxos-simple.pdf) - Leslie Lamport - read first
* [The Part-Time Parliament](https://lamport.azurewebsites.net/pubs/lamport-paxos.pdf) - Leslie Lamport
* [Paxos Made Live - An Engineering Perspective](https://static.googleusercontent.com/media/research.google.com/en/us/archive/paxos_made_live.pdf) - Chandra et al
* [Revisiting the Paxos Algorithm](https://groups.csail.mit.edu/tds/paxos.html) - Lynch et al
* [How to build a highly available system with consensus](http://bwl-website.s3-website.us-east-2.amazonaws.com/58-Consensus/Acrobat.pdf) - Butler Lampson
* [Reconfiguring a State Machine](https://www.microsoft.com/en-us/research/publication/reconfiguring-a-state-machine/) - Lamport et al - changing cluster membership
* [Implementing Fault-Tolerant Services Using the State Machine Approach: a Tutorial](https://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.20.4762) - Fred Schneider
* [Mencius: Building Efficient Replicated State Machines for WANs](https://www.usenix.org/legacy/event/osdi08/tech/full_papers/mao/mao_html/) - consensus algorithm for wide-area network
* [In Search of an Understandable Consensus Algorithm](https://raft.github.io/raft.pdf) - The extended version of the RAFT paper, an alternative to PAXOS.

#### Gossip Protocols (Epidemic Behaviours)
* [How robust are gossip-based communication protocols?](https://infoscience.epfl.ch/record/109302?ln=en)
* [Astrolabe: A Robust and Scalable Technology For Distributed Systems Monitoring, Management, and Data Mining](https://www.cs.cornell.edu/home/rvr/papers/astrolabe.pdf)
* [Epidemic Computing at Cornell](https://www.allthingsdistributed.com/historical/archives/000456.html)
* [Fighting Fire With Fire: Using Randomized Gossip To Combat Stochastic Scalability Limits](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.5.4000%22)
* [Bi-Modal Multicast](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.17.7959)
* [ACM SIGOPS Operating Systems Review - Gossip-based computer networking](https://dl.acm.org/toc/sigops/2007/41/5)
* [SWIM: Scalable Weakly-consistent Infection-style Process Group Membership Protocol](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.18.9737)

#### P2P
* [Chord](https://pdos.csail.mit.edu/papers/ton:chord/paper-ton.pdf): A Scalable Peer-to-peer Lookup Protocol for Internet Applications
* [Kademlia](https://pdos.csail.mit.edu/~petar/papers/maymounkov-kademlia-lncs.pdf): A Peer-to-peer Information System Based on the XOR Metric
* [Pastry](https://rowstron.azurewebsites.net/PAST/pastry.pdf): Scalable, decentralized object location and routing for large-scale peer-to-peer systems
* [PAST](http://research.microsoft.com/en-us/um/people/antr/PAST/hotos.pdf): A large-scale, persistent peer-to-peer storage utility - storage system atop Pastry
* [SCRIBE](https://rowstron.azurewebsites.net/PAST/jsac.pdf): A large-scale and decentralised application-level multicast infrastructure - wide area messaging atop Pastry

#### Amazon, Google
Reading--some tech, some culture

* [A Conversation with Werner Vogels](https://queue.acm.org/detail.cfm?id=1142065) - Coverage of Amazon's transition to a service-based architecture
* [Discipline and Focus](https://queue.acm.org/detail.cfm?id=1388773) - Additional coverage of Amazon's transition to a service-based architecture
* [Vogels on Scalability](https://web.archive.org/web/20130729204944id_/http://itc.conversationsnetwork.org/shows/detail1634.html)
* [SOA creates order out of chaos @ Amazon](http://searchwebservices.techtarget.com/originalContent/0,289142,sid26_gci1195702,00.html)
* [MapReduce](https://research.google/pubs/pub62/)
* [Chubby Lock Manager](https://research.google/pubs/pub27897/)
* [Google File System](https://research.google/pubs/pub51/)
* [BigTable](https://research.google/pubs/pub27898/)
* [Data Management for Internet-Scale Single-Sign-On](https://www.usenix.org/legacy/event/worlds06/tech/prelim_papers/perl/perl.pdf)
* [Dremel: Interactive Analysis of Web-Scale Datasets](https://research.google/pubs/pub36632/)
* [Large-scale Incremental Processing Using Distributed Transactions and Notifications](https://research.google/pubs/pub36726/)
* [Megastore: Providing Scalable, Highly Available Storage for Interactive Services](http://cidrdb.org/cidr2011/Papers/CIDR11_Paper32.pdf) - Smart design for low latency Paxos implementation across datacentres.
* [Spanner](https://research.google/pubs/pub39966/) - Google's scalable, multi-version, globally-distributed, and synchronously-replicated database.
* [Photon](https://research.google/pubs/pub41318/) - Fault-tolerant and Scalable Joining of Continuous Data Streams. Joins are tough especially with time-skew, high availability and distribution.
* [Mesa: Geo-Replicated, Near Real-Time, Scalable Data Warehousing](https://research.google/pubs/pub42851/) - Data warehousing system that stores critical measurement data related to Google's Internet advertising business.

Some links on this page copied from [A Distributed Systems Reading List](https://dancres.github.io/Pages/)
