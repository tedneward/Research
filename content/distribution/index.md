title=Distribution and Distributed Systems
category=distribution
type=categorypage
summary=A collection of links about distributed systems, including protocol definitions/specifications.
tags=distribution
~~~~~~

Distributed systems are the means by which programs on one machine communicate with another. Differ from architectures in that while an architecture may have a distributed system at its center, it's not a requirement, and while distributed systems may incorporate an architecture as part of their implementation, that architecture usually isn't imposed on the user of the distributed system. Includes networking topics, for example.

- ["Distributed System Models in the Real World"](https://sookocheff.com/post/distributed-systems/distributed-system-models-in-the-real-world/): "There are three primary components that make up a complete system model: *processes* that execute operations, communication *links* that facilitate the passing of messages between processes, and *timing* assumptions that model the reliability and time bounds on operations and message passing within the system."

## Concepts

["An introduction to distributed systems"](https://www.distributed-systems.net/my-data/papers/2016.computing.pdf): "A distributed system is a collection of autonomous computing elements that appears to its users as a single coherent system."

[Distributed programming book](https://github.com/heathermiller/dist-prog-book) ([Website](http://dist-prog-book.com/chapter/1/rpc.html)): "Source repo for the book that I and my students in my course at Northeastern University, CS7680 Special Topics in Computing Systems: Programming Models for Distributed Computing, are writing on the topic of programming models for distributed systems."
> This is a book about the programming constructs we use to build distributed systems. These range from the small, RPC, futures, actors, to the large; systems built up of these components like MapReduce and Spark. We explore issues and concerns central to distributed systems like consistency, availability, and fault tolerance, from the lens of the programming models and frameworks that the programmer uses to build these systems.

[Notes on Distributed Systems for Young Bloods](https://www.somethingsimilar.com/2013/01/14/notes-on-distributed-systems-for-young-bloods/): Distributed systems are different because they fail often; Implement backpressure throughout your system; Find ways to be partially available; Use percentiles, not averages; Learn to estimate your capacity; Feature flags are how infrastructure is rolled out; Choose id spaces wisely; Writing cached data back to persistent storage is bad; Extract services.

* [Why Distributed Computing?](https://www.artima.com/weblogs/viewpost.jsp?thread=4247) - Jim Waldo
* [A Note on Distributed Computing](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.41.7628) - Waldo, Wollrath et al
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
* [Models of Distributed Systems](https://www.ida.liu.se/~TDDD25/lectures/02-Models.pdf)
* [Distributed Computing Models](https://www.cs.usfca.edu/~srollins/courses/cs682-s08/web/notes/models.html)

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
* [Harvest, Yield and Scalable Tolerant Systems](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.33.411) - Real world applications of CAP from Brewer et al

Vogels' works

* [Consistency and Availability](https://www.infoq.com/news/2008/01/consistency-vs-availability) - Vogels
* [Eventual Consistency](https://www.allthingsdistributed.com/2007/12/eventually_consistent.html) - Vogels

Transactions and commits

* [Avoiding Two-Phase Commit](https://web.archive.org/web/20180821165044/http://www.addsimplicity.com/adding_simplicity_an_engi/2006/12/avoiding_two_ph.html) - Two phase commit avoidance approaches
* [2PC or not 2PC, Wherefore Art Thou XA?](https://web.archive.org/web/20180821164931/http://www.addsimplicity.com/adding_simplicity_an_engi/2006/12/2pc_or_not_2pc_.html) - Two phase commit isn't a silver bullet
* [Starbucks doesn't do two phase commit](https://www.enterpriseintegrationpatterns.com/docs/IEEE_Software_Design_2PC.pdf) - Asynchronous mechanisms at work
* [Optimistic Replication](https://www.hpl.hp.com/techreports/2002/HPL-2002-33.pdf) - Relaxed consistency approaches for data replication

## Implementation abstraction concepts

* [Actors](/distribution/concepts/actor-model)
* [Message-passing](/distribution/concepts/message-passing)
* [Message queuing](/distribution/concepts/message-queuing)
* [Publish/subscribe](/distribution/concepts/publish-subscribe)
* [RPC](/distribution/concepts/rpc)
* [Shared spaces](/distribution/shared-spaces)

## Technology stacks/stack-related links:

* [Stack on a budget (Free-Tier Driven Development)](https://github.com/255kb/stack-on-a-budget): A collection of services with great free tiers for developers on a budget.

## Interesting links:

* [Public APIs](https://github.com/public-apis/public-apis): A collection of public APIs to use
* [Fuck Off As A Service](http://foaas.com/)
* [DnD 5e API](https://github.com/5e-bits/5e-srd-api)
* [Another DnD 5e API](https://api.open5e.com/)
* [Poke API](https://pokeapi.co/)
* [My Little Pony: Friendship is Magic Episode information API](https://github.com/Xe/PonyAPI)
* [Streaming Movie of the Night API](https://www.movieofthenight.com/about/api)
* [Nessie, Capital One's Hackathon API](http://api.reimaginebanking.com/): Nessie provides access to some real public-facing data such as Capital One ATM and bank branch locations, along with some mock customer account data, and was designed for use in experiments like this.
* [Gamestonk Terminal](https://github.com/GamestonkTerminal/GamestonkTerminal): Investment research for everyone [Source](https://github.com/GamestonkTerminal/GamestonkTerminal) (open-source alternative to [Bloomberg](https://www.bloomberg.com/))
* [State of APIs](https://stateofapis.com/): Survey results on a yearly (2021, 2022, beyond?) basis.
* [JSONPlaceholder API](https://jsonplaceholder.typicode.com/)
* [100 Free APIs for Developers in 2024](https://dev.to/hanzla-baig/100-free-apis-for-developers-in-2024-1jfi)

## Interesting tools based on network APIs

* [imap-backup](https://github.com/joeyates/imap-backup): Backup GMail (or other IMAP) accounts to disk

## Auth-n-Auth and SSO

* ["Enabling user authentication in Swagger using Microsoft Identity"](https://www.josephguadagno.net/2022/06/03/enabling-user-authentication-in-swagger-using-microsoft-identity)

### Proprietary/Cloud

* [FusionAuth](https://fusionauth.io/): User authentication and session management framework [Source](https://github.com/FusionAuth/fusionauth-containers)
* [Okta](https://www.okta.com/): Identity provider; bought up Auth0 a few years back

### Open Source

* [Cerbos](https://cerbos.dev/): Granular access control [Source](https://github.com/cerbos/cerbos)
* [Keycloak](https://www.cloud-iam.com/): User authentication and session management framework [Source](https://github.com/keycloak/keycloak)
* [OPAL (Permit.io)](https://www.opal.ac/): Authorization administration framework (Open Policy) [Source](https://github.com/permitio/opal)
* [Ory](https://www.ory.sh/): Identity platform [Source](https://github.com/ory/kratos)
* [Oso](https://www.osohq.com/): Authorization building framework [Source](https://github.com/osohq/oso)
* [Supertokens](https://supertokens.io/): User authentication and session management framework [Source](https://github.com/supertokens/supertokens-core)


## Ideas and theory


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

## Distributed Locking
For starters, don't do it. Even if you think you need to, don't.

["How to do distributed locking"](https://martin.kleppmann.com/2016/02/08/how-to-do-distributed-locking.html)

Some links on this page copied from [A Distributed Systems Reading List](https://dancres.github.io/Pages/)

## People

### People on Fundamentals of Distributed Computing Theory
* [Leslie Lamport](http://www.lamport.org/)
  * [The Writings of Leslie Lamport](http://lamport.azurewebsites.net/pubs/pubs.html)
* [Butler W. Lampson](http://research.microsoft.com/en-us/um/people/blampson/)
* [Barbara Liskov](http://www.pmg.csail.mit.edu/~liskov/)
* [Nancy A. Lynch](http://people.csail.mit.edu/lynch/)
  * [Publications](http://groups.csail.mit.edu/tds/lynch-pubs.html)
  > Distributed computing, real-time computing, algorithms, lower bounds,
  formal modelling and verification, wireless network algorithms,
  and biological distributed algorithms.
* [Hagit Attiya](http://hagit.net.technion.ac.il/)
  * [Publications](http://hagit.net.technion.ac.il/publications/)
  > Distributed computation and theoretical computer science;
  in particular: Fault-tolerance; Timing-based and asynchronous algorithms.
* [Faith Ellen](http://www.cs.toronto.edu/~faith/)
  > My research is in the theory of distributed computing.
  I particularly like proving lower bounds on the complexity of concrete problems
  with the goal of understanding how parameters of various models of computation affect their computational power.
  I also study data structures in distributed and sequential models.
* [Philipp Woelfel](http://pages.cpsc.ucalgary.ca/~woelfel/)
    > - Theory of Distributed Computing
    > - Randomized Algorithms and Data Structures
    > - Computational Complexity
* [James Aspnes](http://cs-www.cs.yale.edu/homes/aspnes/)
* [Keren Censor-Hillel](http://ckeren.net.technion.ac.il/)
  * [Publications](http://ckeren.net.technion.ac.il/publications/)
  > My research interests are mainly in distributed computing,
  especially probabilistic algorithms and lower bounds,
  and theory of computing in general.
* [Sergio Rajsbaum](http://www.matem.unam.mx/rajsbaum/) 
  > My research interests are in the theory of distributed computing, 
  especially issues related to coordination, complexity and computability.
* [Sam Toueg](http://www.cs.cornell.edu/annual_report/toueg.htm):
  * [DBLP](http://www.informatik.uni-trier.de/~ley/pers/hd/t/Toueg:Sam.html)
  * [Work on Failure Detectors](http://www.cs.cornell.edu/home/sam/FDpapers.html)
* [Joseph Y. Halpern](http://www.cs.cornell.edu/home/halpern/)
  * [Joseph Y. Halpern's Publications](https://www.cs.cornell.edu/home/halpern/node8.html)
  > My research focuses on the interface between game and decision theory and computer science, 
  on reasoning about knowledge and uncertainty, and on causality. 
  
  > I described myself as someone with a Ph.D. in mathematics, 
  who calls himself a computer scientist,
  and is giving a talk to economists about a subject mainly studied by philosophers.
* [Marcos K. Aguilera](http://mkaguilera.kawazoe.org/)
  > Theory and Practice of Distributed Systems
* [Idit Keidar](http://webee.technion.ac.il/~idish/index.html)
* [Gadi Taubenfeld](http://www.faculty.idc.ac.il/gadi/)
  >  My primary research interests are in concurrent and distributed computing.
* [Jennifer Welch](https://parasol.tamu.edu/~welch/)
* [Michel Raynal](http://www.irisa.fr/prive/raynal/) 
* [Wojciech M. Golab](http://dblp.uni-trier.de/pers/hd/g/Golab:Wojciech_M=)
* [Carole Delporte-Gallet](https://www.irif.fr/~cd/)
  * [DBLP](http://dblp.uni-trier.de/pers/hd/d/Delporte=Gallet:Carole.html)
* [Eli Gafni](http://web.cs.ucla.edu/~eli/eli.html)
* [Sebastian Burckhardt](https://www.microsoft.com/en-us/research/people/sburckha/)
> My research interest are programming models to program distributed, parallel, 
  or concurrent or systems conveniently, efficiently, and correctly.

### People on Fundamentals of Multiprocessor Programming Theory
* [Maurice Herlihy](http://cs.brown.edu/~mph/)
* [Nir Shavit @MIT](http://people.csail.mit.edu/shanir/)
  
* [Victor Luchangco @ Oracle Labs](https://labs.oracle.com/pls/apex/f?p=labs:bio:0:76)
> Victor Luchangco works in the Scalable Synchronization Group of Oracle Labs. 
  His research focuses on developing algorithms and mechanisms to support concurrent programming on large-scale distributed systems.

* [Mark Moir @ Oracle Labs](https://labs.oracle.com/pls/apex/f?p=labs:bio:0:86)
> Moir's main research interests concern practical and theoretical aspects of concurrent, distributed, and real-time systems, 
  particularly hardware and software support for programming constructs 
  that facilitate scalable synchronization in shared memory multiprocessors.

* [Sarita V. Adve](http://dblp.uni-trier.de/pers/hd/a/Adve:Sarita_V=) 
> On memory models.

### People on Programming Languages (including Consistency Models and (Weak) Memory Models)
* [Alexey Gotsman](http://software.imdea.org/~gotsman/)
> My research interests are in methods and tools for developing correct concurrent and distributed software.
* [Sebastian Burckhardt](https://www.microsoft.com/en-us/research/people/sburckha/)
> My research interests are programming models to program distributed, parallel, or concurrent or systems conveniently, efficiently, and correctly.
  * [Publications](https://www.microsoft.com/en-us/research/people/sburckha/#!publications)
* [Marko Vukolić @ IBM Research](http://vukolic.com/)
> My research interests lie in the broad area of distributed systems.
Some more specific topics that I am (currently) interested in include fault-tolerance, 
blockchain and distributed ledgers, cloud computing security and distributed storage.
* [Jade Alglave](http://www0.cs.ucl.ac.uk/staff/j.alglave/)
* [Michael Emmi](http://michael-emmi.github.io/)
> Michael’s research enables the construction of reliable software by developing the foundations 
for effective programming abstractions and informative program analysis tools.

### People on the Theory of Distributed Systems
* [Lidong Zhou @ Microsoft Research](http://research.microsoft.com/en-us/people/lidongz/)
* [Haifeng Yu](http://www.comp.nus.edu.sg/~yuhf/)
* [Peter Bailis](http://www.bailis.org/)
* [Brian F. Cooper](http://www.brianfrankcooper.net/)
> I am a software engineer at Google. Before that, I was a principal research scientist at Yahoo! Research. Before that I was an assistant professor at Georgia Tech, and before that I was a PhD student at Stanford.


## Research Groups
* [TDS: Theory of Distributed Systems Group](http://groups.csail.mit.edu/tds/people.html)
  * Faculty: Nancy A. Lynch
* [Idit Keidar's Research Group](http://webee.technion.ac.il/~idish/students.html)
* [Google Research Group](http://research.google.com/)
* [Yahoo! Labs](http://research.yahoo.com/)
* [The IMDEA Software Institute](https://software.imdea.org/index.html)

## Conferences, Journals, Workshops, and Magazines (By Topics)

### SIGs:
* [SIGACT](http://www.sigact.org/)
* [SIGOPS](http://www.sigops.org/)
* [SIGMOD](http://www.sigmod.org/)
* [SIGPLAN](http://www.sigplan.org/) `Special Interest Group on Programming Languages`

### General Theory of Computer Science
#### Conferences
* [FOCS: Foundations of Computer Science](http://dblp.uni-trier.de/db/conf/focs/)
* [STOC: Symposium on the Theory of Computing](http://dblp.uni-trier.de/db/conf/stoc/)
* [SODA: Symposium on Discrete Algorithms](http://dblp.uni-trier.de/db/conf/soda/)
* [ICALP: International Colloquium on Automata, Languages and Programming](http://dblp.uni-trier.de/db/conf/icalp/)
* [MFCS: Mathematical Foundations of Computer Science](http://dblp.uni-trier.de/db/conf/mfcs/)
* [ALGO](https://algo2017.ac.tuwien.ac.at/)
  
  The annual ALGO congress is the leading international gathering of researchers on Algorithms in Europe.

#### Journals
* [JACM: Journal of the ACM](http://jacm.acm.org/) 
  * [JACM@DBLP](http://www.dblp.org/search/index.php#query=venue:j_acm_jacm_:&qp=H1.40:W1.1:F1.4:F2.1:F3.4:F4.1)
* [SICOMP: SIAM Journal on Computing](http://epubs.siam.org/journal/smjcat)
  * [SICOMP@DBLP](http://www.dblp.org/search/index.php#query=venue:siam_j_comput_siamcomp_:&qp=H1.1000:W1.1:F1.4:F2.1:F3.4:F4.1)
* [TCS](http://www.sciencedirect.com/science/journal/03043975?sdc=1)
  * [TCS@DBLP](http://dblp.uni-trier.de/db/journals/tcs/)

### Distributed Computing Theory
* [PODC](http://dblp.uni-trier.de/db/conf/podc/)
* [DISC](http://www.dblp.org/search/index.php#query=venue:disc:&qp=H1.587:W1.1:F1.4:F2.1:F3.4:F4.2)
* [SIROCCO: Structural Information & Communication Complexity](http://dblp.uni-trier.de/db/conf/sirocco/)
* [OPODIS](http://dblp.uni-trier.de/db/conf/opodis)
* [SSS](http://dblp.uni-trier.de/db/conf/sss/)
* [Distributed Computing (DC)](http://www.springer.com/computer/communication+networks/journal/446); [DC in DBLP](http://www.dblp.org/search/index.php#query=venue:distributed_computing_dc_:&qp=H1.519:W1.1:F1.4:F2.1:F3.4:F4.1)
* [Bulletin of EATCS (European Association for Theoretical Computer Science)](http://www.eatcs.org/index.php/on-line-issues)
* [Distributed Computing Column of Bulletin of EATCS](http://webee.technion.ac.il/~idish/sigactNews/)

### Programming Languages and Concurrency Theory
* [PLDI](http://dblp.uni-trier.de/search/publ?q=venue%3APLDI%3A);
* [POPL](http://dblp.uni-trier.de/search/publ?q=venue%3APOPL%3A);
* [SPAA](http://dblp.uni-trier.de/search/publ?q=venue%3ASPAA%3A)
* [PPoPP: Principles & Practice of Parallel Programming](http://dblp.uni-trier.de/db/conf/ppopp/)
* [CONCUR](http://dblp.uni-trier.de/search/publ?q=venue%3ACONCUR%3A)
* [Concurrency Column of Bulletin of EATCS](http://www.ru.is/faculty/luca/BEATCS/)
* [ESOP: European Symposium on Programming](https://dblp.org/db/conf/esop/)

### Distributed Systems (and More General)
* [NSDI: Networked Systems Design and Implementation](http://dblp.uni-trier.de/db/conf/nsdi/)
* [OSDI: Operating Systems Design and Implementation](http://dblp.uni-trier.de/db/conf/osdi/)
* [SOSP: Symposium on Operating Systems Principles](http://dblp.uni-trier.de/db/conf/sosp/)
* [DSN: Dependable Systems and Networks](http://dblp.uni-trier.de/db/conf/dsn/)
* [ICDCN: International Conference of Distributed Computing and Networking](http://dblp.uni-trier.de/db/conf/icdcn/)
* [ICDCS: International Conference on Distributed Computing Systems](http://dblp.uni-trier.de/db/conf/icdcs/)
* [SRDS: Symposium on Reliable Distributed Systems](http://dblp.uni-trier.de/db/conf/srds/)
* [SoCC: Symposium on Cloud Computing](http://dblp.uni-trier.de/db/conf/cloud/)
  * [2016](http://dblp.uni-trier.de/db/conf/cloud/socc2016.html)

### Formal Methods (Logic)
* [FME: Formal Methods Europe](http://www.fmeurope.org/)
* [LICS: Logic in Computer Science](http://dblp.uni-trier.de/db/conf/lics/)
* [CAV: Computer Aided Verification](http://dblp.uni-trier.de/db/conf/cav/)
* [VMCAI: Verification, Model Checking and Abstract Interpretation](http://dblp.uni-trier.de/db/conf/vmcai/)
* [FM: Formal Methods](http://dblp.uni-trier.de/db/conf/fm/)
* [FMSD: Formal Methods in System Design](http://dblp.uni-trier.de/db/journals/fmsd/)
* [FAC: Formal Aspects of Computing](http://dblp.uni-trier.de/db/journals/fac/)
* [ABZ](http://dblp.uni-trier.de/db/conf/asm/)

### Database Systems
* [PODS: Symposium on Principles of Database Systems](https://dblp.uni-trier.de/db/conf/pods/index.html)

### Databases
#### Journals
* [ACM Transactions on Computer Systems (TOCS)](http://tocs.acm.org/) 
  * [DBLP](http://www.dblp.org/search/#query=TOCS&qp=H1.407:W1.3:F1.4:F2.4:F3.4:F4.2)
* [The VLDB Journal](http://dl.acm.org/citation.cfm?id=J869)

## Workshops
- [Dagstuhl Seminar 13081 – Consistency in Distributed Systems](http://drops.dagstuhl.de/opus/volltexte/2013/4014/pdf/dagrep_v003_i002_p092_s13081.pdf)
- [PaPoC 2015 - Workshop on Principles and Practice of Consistency for Distributed Data](http://papoc.di.uminho.pt/)
- [Epidemic Algorithms and Processes: From Theory to Applications](http://www.dagstuhl.de/en/program/calendar/semhp/?semnr=13042)
> January 20 – 25 , 2013, Dagstuhl Seminar 13042
- [And: the report  from Dagstuhl Seminar 13042](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.310.104&rep=rep1&type=pdf)
- [And the slides from Dagstuhl Seminar 13042](http://boemund.dagstuhl.de/mat//index.en.phtml?13081)
- [Lower Bounds for Distributed Computing (09w5114)](https://www.birs.ca/events/2009/5-day-workshops/09w5114)
> This workshop will bring together experts in the field (and some exceptional graduate students and postdocs) to discuss fundamental distributed computing problems whose computational complexities have not been resolved and the limitations of current techniques for obtaining lower bounds for these problems.
- [FuDiCo: Future Directions in Distributed Computing 2004](http://www.cs.utexas.edu/users/lorenzo/sos/); [FuDiCo @ DBLP'2003](http://dblp.uni-trier.de/search/publ?q=Future%20Directions%20in%20Distributed%20Computing)

## Prizes and Awards
* [The Edsger W. Dijkstra Prize in Distributed Computing](http://www.podc.org/dijkstra/)
* [The Donald E. Knuth Prize for outstanding contributions to the foundations of computer science](http://www.sigact.org/Prizes/Knuth/)
* [The Godel Prize for outstanding papers in the area of theoretical computer science](http://www.sigact.org/Prizes/Godel/)
    * [2004 Godel Prize](http://www.sigact.org/Prizes/Godel/2004.html)
``The discovery of the topological nature of distributed computing provides a new perspective on the area and represents one of the most striking examples, possibly in all of applied mathematics, of the use of topological structures to quantify natural computational phenomena.``
    * [2000 Godel Prize: Moshe Vardi and Pierre Wolper](http://www.sigact.org/Prizes/Godel/2000.html)
``Reasoning about infinite computations: This paper is a reworking and extension of a conference contribution of FOCS'83, which has become a major reference in the automata-theoretic approach to temporal logic.``
    * [1997 Godel Prize: Joseph Halpern and Yoram Moses](http://www.sigact.org/Prizes/Godel/1997.html)
``The Halpern-Moses paper provided a new and effective way of reasoning about distributed systems, providing rigorous and powerful new techniques based on epistemic logic.``
* [Best Paper Award (maintained by Jeff Huang)](http://jeffhuang.com/best_paper_awards.html)
* [EAPLS Best PhD Dissertation Awards](http://eapls.org/pages/phd_award/#.WiC8ZenXaV5)
> The European Association for Programming Languages and Systems has established a Best Dissertation Award 
  in the international research area of programming languages and systems.

## Reports
* [Dagstuhl Reports@DBLP](http://dblp.dagstuhl.de/db/journals/dagstuhl-reports/index.html)

## Courses & Paper Reading Lists
* [Distributed Algorithms (by Nancy A. Lynch)](http://stellar.mit.edu/S/course/6/fa11/6.852/index.html)
* [Synthesis Lectures on Distributed Computing Theory by Nancy A. Lynch](http://www.morganclaypool.com/toc/dct/1/1#lecturesAvailableOnline)
* [Distributed Algorithms: New Topics and Techniques (by Nancy A Lynch, Keren Censor)](http://stellar.mit.edu/S/course/6/sp11/6.885/index.html)
* [CSCE 668: Distributed Algorithms and Systems @ Fall 2011 (By Welch)](https://parasol.tamu.edu/people/welch/teaching/668.f11/#links)
* [CSCE 668: Lecture notes (ppt)](https://parasol.tamu.edu/people/welch/teaching/668.f11/#calendar)
* [ETH: Principles of Distributed Computing](http://www.dcg.ethz.ch/lectures/podc/)
> This course introduces the principles of distributed computing, emphasizing the fundamental issues underlying the design of distributed systems and networks: communication, coordination, fault-tolerance, locality, parallelism, self-organization, symmetry breaking, synchronization, uncertainty. We explore essential algorithmic ideas and lower bound techniques, basically the "pearls" of distributed computing.

* [6.824: Distributed Systems @ MIT](http://pdos.csail.mit.edu/6.824-2011/schedule.html)
> It will present abstractions and implementation techniques for engineering distributed systems. Topics include multithreading, remote procedure call, client/server designs, peer-to-peer designs, consistency, fault tolerance, and security, as well as several case studies of distributed systems.

* [6.852/18.437 Fall 2009 Distributed Algorithms @ MIT by Nancy Ann Lynch](http://stellar.mit.edu/S/course/6/fa09/6.852/)
* [6.852 Supplementary course bibliography](http://courses.csail.mit.edu/6.852/01/papers/suppl.html)

* [Distributed Algorithms for Mobile Wireless Ad Hoc Networks (by Fabian Daniel Kuhn, Nancy A Lynch)](http://stellar.mit.edu/S/course/6/fa08/6.885/index.html)
* [Distributed Algorithms B (by Hagit Attiya)](http://webcourse.cs.technion.ac.il/236755/Spring2013/en/ho.html)
* [ECE 526 Distributed Algorithms @ UIUC Spring 2013](https://courses.engr.illinois.edu/ece526/sp2013/)
* [ECE 526 Lectures](https://courses.engr.illinois.edu/ece526/sp2013/lectures.html)
* [Seminar in Distributed Algorithms: Designing correct concurrent algorithms (by Hagit Attiya)](http://webcourse.cs.technion.ac.il/236825/Spring2013/en/ho.html)
* [Distributed Computing with Notes on Theory of Distributed Systems (by James Aspnes) 2011](http://cs-www.cs.yale.edu/homes/aspnes/classes/465/notes.pdf)
* [Topics in Reliable Distributed Computing (by Idit Keidar)](http://webee.technion.ac.il/~idish/048961/)
* [Distributed Systems @ WISC](http://pages.cs.wisc.edu/~swift/classes/cs739-sp12/wiki/pmwiki.php/Main/ReadingList)
* [Principles of Computer Systems @ MIT (by Butler Lampson)](http://web.mit.edu/6.826/www/notes/)
* [CS 371D Distributed Computing @ UTEXAS (by Lorenzo Alvisi)](http://www.cs.utexas.edu/~lorenzo/corsi/cs371d/08F/)
> The Lecture Notes (ppt) is elegant.
> Topics will include the majority (we are going to shoot for all and see what happens) of the following: Global states and event ordering; Logical clocks; Vector clocks; Consistent cuts and global property detection; Rollback-recovery and message-logging protocols; State machine approach; Agreement protocols; Failure detectors; Replication and consistency; Byzantine fault tolerance; Atomic Commit

* [COMP 660L: Topics in Computer and Communication Networks: Cloud Computing](http://www.cse.ust.hk/~lingu/course/comp660l-2009/2009Fall/)
* [COMP 660L Reading List](http://www.cse.ust.hk/~lingu/course/comp660l-2009/2009Fall/reading.html)
> This course studies the organization of cloud computing systems and survey research problems in this area.

* [15-799 :: Advanced Topics in Database Systems Fall 2013](http://www.cs.cmu.edu/~pavlo/courses/fall2013/)
* [15-799 :: Advanced Topics in Database Systems Fall 2013](http://www.cs.cmu.edu/~pavlo/courses/fall2013/reading-list.html)
> Big Ideas. Big Money. Big Data.

* [Cornell Fact Sheet: CS 614](http://www.cs.cornell.edu/Info/Courses/Spring-97/CS614/)
* [Paper reading list of Cornell Fact Sheet](http://www.cs.cornell.edu/Info/Courses/Spring-97/CS614/)
> The primary emphasis is on operating systems and distributed systems. A secondary emphasis is on protocol implementation and next-generation network protocols. The focus when covering these topics is the extent to which they impact end-system design and implementation.

* [CS 525: Advanced Distributed Systems Spring 2011](http://courses.engr.illinois.edu/cs525/sp2011/sched.htm)
* [Randomized Algorithms 2013 (by James Aspnes)](http://cs-www.cs.yale.edu/homes/aspnes/classes/469/notes.pdf)
* [Algorithms (by James Aspnes)](http://pine.cs.yale.edu/pinewiki/CS365/Notes)
* [Algorithms Quals @ UIUC](http://valis.cs.uiuc.edu/~sariel/research/algorithms/quals/)
* [CS294-17:  Reading the Classics @ MIT by Christos H. Papadimitriou](http://www.cs.berkeley.edu/~christos/classics/cs298.html)
* [INF346: Foundations of Distributed Systems](http://perso.telecom-paristech.fr/~kuznetso/INF346/)
> Lecture notes: [Robust Concurrent Computing](http://perso.telecom-paristech.fr/~kuznetso/MPRI13/book-ln.pdf)
> It also provides a list of papers to read.

* [CPS 212: Distributed Information Systems@Duke University](https://www.cs.duke.edu/courses/fall07/cps212/index.html)
> CPS 212 is a graduate-level course dealing with techniques for storing and sharing information in computer networks, large and small. We will cover a range of core distributed systems topics, with an emphasis on the issues faced by networked utility services, scalable Internet services, and enterprise storage systems.

* [CPS212: Its Topics](https://www.cs.duke.edu/courses/fall07/cps212/topics.html)

* [Distributed Storage Systems@Stanford CS240d](http://www.scs.stanford.edu/06wi-cs240d/)
> This class will examine file system implementation, low-level database storage techniques, and distributed programming. Lectures will cover basic file system structures, journaling and logging, I/O system performance, RAID, the RPC abstraction, and numerous systems illustrating these concepts.

* [CS 6464: Spring 2009 Advanced Distributed Storage Systems@Cornell University](http://www.cs.cornell.edu/Courses/cs6464/2009sp/sched.htm)
> This course broadly examines distributed storage systems in its many manifestations. It explores how to harness and maintain the collective storage capabilities in storage systems from global-scale enterprises and cloud computing to peer-to-peer, ad hoc, and home networks.

* [Video lecture of CSCI 1760 - FALL 2012: The Art of Multiprocessor Programming](http://www.brown.edu/cis/sta/dev/herlihy_csci1760_fa12/#vid)

* [CSE 552 Fall 2013: Distributed and Parallel Systems](https://courses.cs.washington.edu/courses/cse552/13au/calendar/lecturelist.html)
> Principles, techniques, and examples related to the design, implementation, and analysis of distributed and parallel computer systems.

## Computer Science Ph.D. Thesis

* [New York University](http://cs.nyu.edu/web/Research/theses.html)
* [Brown CS](http://cs.brown.edu/research/pubs/theses/phd/)

## Tools

* [Emulab - Network Emulation Testbed Home](http://www.emulab.net/)
* [Prism - A Probabilistic Model Checker](https://www.prismmodelchecker.org/)
* [APALACHE](http://forsyte.at/research/apalache/)
> Abstraction-based parameterized TLA+ checker: Bringing state-of-the-art model checking to TLA+

## Blogs

### English
* [SYSLOG: the Cambridge System Research Group???s blog](http://www.syslog.cl.cam.ac.uk/)
* [All Things Distributed](http://www.allthingsdistributed.com/)
``Werner Vogels' weblog on building scalable and robust distributed systems.``
* [Paper Trail: Wading through academic treacle](http://the-paper-trail.org/blog/)
* [Perspectives: James Hamilton's Blog](http://perspectives.mvdirona.com/)
* [CSE 708 Seminar on Distributed Systems and Distributed Computing](http://cse708.blogspot.com/)
* [Umbrant by Andrew Wang](http://www.umbrant.com/)
``My name is Andrew Wang. I'm a software engineer at Cloudera on the HDFS team.``
* [Metadata by Murat](http://muratbuffalo.blogspot.com/)
``I am a computer science and engineering professor at SUNY Buffalo. I work on distributed and networked systems and fault-tolerance.``
* [High Scalability: Building bigger, faster, more reliable websits](http://highscalability.com/all-posts/)
* [Operational Dynamics on Storage](http://blogs.operationaldynamics.com/)
* [Riak on Distributed Storage](http://docs.basho.com/index.html)
* [The Fallacies of Distributed Computing Reborn: The Cloud Era](http://blog.newrelic.com/2011/01/06/the-fallacies-of-distributed-computing-reborn-the-cloud-era/)

### Other Articles
* [OSDI, SOSP and CS departments](http://blog.csdn.net/celestialwy/article/details/2766402)
* [HIT CS: Skills in CS](http://www.1point3acres.com/bbs/thread-26964-1-1.html)

## Videos
* [Fulbright Distinguished Chair Lecture: Prof. Maurice Herlihy](http://www.youtube.com/watch?v=e8Hz9zoKxPs)
* [Combinatorial Topology and Distributed Computing (01): Prof. Maurice Herlihy](http://www.youtube.com/watch?v=05knu1z3zOg)

### From Leslie Lamport
* [What is Computation: Dr. Leslie Lamport, Microsoft](http://www.youtube.com/watch?v=BDPHfRuAFnU)
* [Thinking Above the Code](http://research.microsoft.com/apps/video/default.aspx?id=221174&l=i)
``Architects draw detailed blueprints before a brick is laid or a nail is hammered. Programmers and software engineers seldom do. A blueprint for software is called a specification. The need for extremely rigorous specifications before coding complex or critical systems should be obvious—especially for concurrent and distributed systems. This talk explains why some sort of specification should be written for any software.``

## Books
- [Synthesis Lectures on Distributed Computing Theory](http://www.morganclaypool.com/toc/dct/1/1)
> Synthesis Lectures on Distributed Computing Theory is edited by Jennifer Welch of Texas A&M University and Nancy Lynch of the Massachusetts Institute of Technology. The series publishes  50- to 150-page publications on topics pertaining to distributed computing theory. The scope largely follows the purview of premier information and computer science conferences, such as ACM PODC, DISC, SPAA, OPODIS, CONCUR, DialM-POMC, ICDCS, SODA, Sirocco, SSS, and related conferences. Potential topics include, but not are limited to: distributed algorithms and lower bounds, algorithm design methods, formal modeling and verification of distributed algorithms, and concurrent data structures.
