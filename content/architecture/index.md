title=Architecture
category=architecture
type=categorypage
summary=A collection of links around software architecture, which may or may not include distributed systems or networking.
tags=architecture
~~~~~~

["Software Architecture as a Set of Architectural Design Decisions"](https://www.ics.uci.edu/~andre/ics223w2006/jansenbosch.pdf): "Software architectures have high costs for change, are complex, and erode during evolution. We believe these problems are partially due to knowledge vaporization. Currently, almost all the knowledge and information about the design decisions the architecture is based on are implicitly embedded in the architecture, but lack a first-class representation. Consequently, knowledge about these design decisions disappears into the architecture, which leads to the aforementioned problems. In this paper, a new perspective on software architecture is presented, which views software architecture as a composition of a set of explicit design decisions. This perspective makes architectural design decisions an explicit part of a software architecture. Consequently, knowledge vaporization is reduced, thereby alleviating some of the fundamental problems of software architecture."

Tomas Petricek's writings on the subject:

* [Where programs live?](https://tomasp.net/blog/2023/vague-spaces/)
* [Programming as Architecture, Design, and Urban Planning](https://tomasp.net/academic/papers/metaphors/)
* [Timeless Way of Programming](http://tomasp.net/blog/2022/timeless-way/)
* [Software designers, not engineers](http://tomasp.net/blog/2021/software-designers/)
* [On architecture, urban planning, and software construction](http://tomasp.net/blog/2020/cities-and-programming/)
* [The design side of programming language design](http://tomasp.net/blog/2017/design-side-of-pl/)
* Book reference: [The Philosophy of Design](https://www.amazon.com/Philosophy-Design-Glenn-Parsons-ebook/dp/B0188340QK/ref=tmm_kin_swatch_0)

[Architecture of Open-Source Applications](https://www.aosabook.org/en/index.html) (books)

["Don't Call It a Platform"](https://samnewman.io/blog/2023/02/08/dont-call-it-a-platform/): "Habitability, in the broadest sense, describes how nice (or not) the experience is for the people who have to live in a system. ... I make the argument that we ignore habitability at our peril. Those of us in a place to shape the lived experiences of our colleagues have a duty of care to ensure that we take their needs to heart."

["DDD, Hexagonal, Onion, Clean, CQRS, ... How I put it all together"](https://herbertograca.com/2017/11/16/explicit-architecture-01-ddd-hexagonal-onion-clean-cqrs-how-i-put-it-all-together/)

["The cloudy layers of modern-day programming"](https://vickiboykis.com/2022/12/05/the-cloudy-layers-of-modern-day-programming/)

[Platform Engineering Teams Done Right...](https://adrianco.medium.com/platform-engineering-teams-done-right-b3b3d4a8ad23)

[The 12-Factor App](https://12factor.net/):

* I. Codebase: One codebase tracked in revision control, many deploys
* II. Dependencies: Explicitly declare and isolate dependencies
* III. Config: Store config in the environment
* IV. Backing services: Treat backing services as attached resources
* V. Build, release, run: Strictly separate build and run stages
* VI. Processes: Execute the app as one or more stateless processes
* VII. Port binding: Export services via port binding
* VIII. Concurrency: Scale out via the process model
* IX. Disposability: Maximize robustness with fast startup and graceful shutdown
* X. Dev/prod parity: Keep development, staging, and production as similar as possible
* XI. Logs: Treat logs as event streams
* XII. Admin processes: Run admin/management tasks as one-off processes

[Don't Start with Microservices--Monoliths are your friend](https://arnoldgalovics.com/microservices-in-production/)

[The Nature of Software](https://buttondown.email/natureofsoftware)

## Reading

* ["You're Slicing your Architecture Wrong!"](https://dev.to/somedood/youre-slicing-your-architecture-wrong-4ob9)
* [The Architect's Guide to Open Table Formats and Object Storage](https://thenewstack.io/the-architects-guide-to-open-table-formats-and-object-storage/)
* ["Architecture vs Model"](https://kalele.io/architecture-vs-model/): "One of the biggest problems with business software is that architecture gets promoted more than the domain model. Further, most domain models are ordinary, and could be implemented by school students for a lot less cost than the 7-9 figures often spent. Yet, often the software architecture supporting a model—almost certainly anemic—is generally over engineered."
* [Best Kept Secrets of Peer Code Review](http://smartbear.com/lp/ebook/collaborator/secrets-of-peer-code-review/)
* [Building Secure & Reliable Systems](./building_secure_and_reliable_systems.pdf) - Heather Adkins, Betsy Beyer, Paul Blankinship, Piotr Lewandowski, Ana Oprea & Adam Stubblefield (PDF)
* [Documents: The architect’s programming language](https://stackoverflow.blog/2025/08/20/documents-the-architect-s-programming-language/): "Senior developers know how to deploy code to systems made of code. Architects know how to deploy ideas to systems made of people."
* [Guide to the Software Engineering Body of Knowledge](https://www.computer.org/education/bodies-of-knowledge/software-engineering/v3) (email adddress *requested*)
* [How to Design Programs](http://www.htdp.org)
* [How to Write Unmaintainable Code](http://mindprod.com/jgloss/unmain.html)
* [Migrating to Cloud-Native Application Architectures](https://developers.redhat.com/books/migrating-microservice-databases-relational-monolith-distributed-data/) (email address *requested*) (PDF)
* [Shape Up - Stop Running in Circles and Ship Work that Matters](https://basecamp.com/shapeup) - Ryan Singer (PDF)
* [Sharding vs Partitioning](https://blog.algomaster.io/p/sharding-vs-partitioning)
* [Site Reliability Engineering](https://landing.google.com/sre/book/index.html)
* [Software Engineering for Internet Applications](http://philip.greenspun.com/seia/)
* [Test Driven Development, Extensive Tutorial](https://github.com/grzesiek-galezowski/tdd-ebook) - Grzegorz Gałęzowski
* [The Site Reliability Workbook](https://landing.google.com/sre/workbook/toc/) - Betsy Beyer, Niall Richard Murphy, David K. Rensin, Kent Kawahara and Stephen Thorne
* [Why a programmer might actually be a good urban planner](https://b1z0n.pro/why-the-programmers-might-be-good-urban-planners1/)
* [WSO2 Reference Architecture](https://github.com/wso2/reference-architecture):

    * [Cell-Based Architecture](https://github.com/wso2/reference-architecture/blob/master/reference-architecture-cell-based.md)
    * [Event-Driven APIs in Microservice Architectures](https://github.com/wso2/reference-architecture/blob/master/event-driven-api-architecture.md)
    * [Layered and Segmented Architecture](https://github.com/wso2/reference-architecture/blob/master/reference-architecture-layered-segmented.md)
    * [Cloud-Native Architecture](https://github.com/wso2/reference-architecture/blob/master/reference-cloud-native-architecture-digital-enterprise.md) 

## Patterns/Styles

* [10 Most Popular Software Architectural Patterns](https://nix-united.com/blog/10-common-software-architectural-patterns-part-1/)
* [Architectural Patterns](https://books.google.com/books/about/Architectural_Patterns.html?id=RvNFDwAAQBAJ&printsec=frontcover&source=kp_read_button&hl=en&newbks=1&newbks_redir=0&gboemv=1#v=onepage&q&f=false) (Book)
* [Architectural Styles and the Design of Network-based Software Architectures](http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm) - Roy Thomas Fielding
* [Control Flow - The Other Half of Integration Patterns](https://www.enterpriseintegrationpatterns.com/ramblings/queues_control_flow.html): "When Bobby and I wrote Enterprise Integration Patterns, we naturally spent most of the time on the data flow of messaging systems: how messages are generated, transformed, and routed. Some patterns, especially Endpoint Patterns such as Polling Consumer or Event-Driven Consumer clearly have a ring of control flow to it, but we never actually mention the term in the entire book (funnily there is one occurrence in Recipient List, but it's actually a verb and object: "In order for the Recipient List to control flow of information"). The term gets a few mentions in the blog, although we conclude that "Message-oriented API's steer towards a data flow architecture". So, it's time to make control flow a first-class citizen."
* [Software Architecture Patterns](http://www.oreilly.com/programming/free/software-architecture-patterns.csp) (email address *requested*, not required) - Mark Richards
* [Source Making Design Patterns and UML](https://sourcemaking.com/design_patterns)


## Interesting exemplars/templates/links

* [UK Ministry of Justice Modernisation Platform](https://github.com/ministryofjustice/modernisation-platform): A place for the core work of the Modernisation Platform -- This repository is defined and managed in Terraform. "The Modernisation Platform is a hosting platform where Ministry of Justice teams can host and modernise applications which are not suitable for the [Cloud Platform](https://user-guide.cloud-platform.service.justice.gov.uk/#cloud-platform-user-guide)."
* [UK Ministry of Justice Cloud Platform](https://github.com/ministryofjustice/cloud-platform)
* [UK Ministry of Justice "template repository"](https://github.com/ministryofjustice/template-repository): Github "template" repository, from which to create new MoJ Repositories with organisation defaults

## Interesting challenges

* [Gringotts](https://github.com/ssdug/Gringotts)
