title=Patterns
type=categorypage
category=patterns
tags=patterns
summary=A collection of links and notes on patterns.
~~~~~~

## Patterns Reading

* [A Primer on Design Patterns](https://leanpub.com/aprimerondesignpatterns) - Rahul Batra (HTML, PDF, EPUB, Kindle) *(Leanpub account or valid email requested)*
* [Understanding the Power of Abstraction in Patterns](https://www.researchgate.net/publication/3249379_Understanding_the_Power_of_Abstraction_in_Patterns)

### Architecture patterns

* [Software Architecture Patterns](http://www.oreilly.com/programming/free/software-architecture-patterns.csp) (email address *requested*, not required)

### Design patterns

* [A Functional Pattern System for Object-Oriented Design](https://homepages.ecs.vuw.ac.nz/~tk/fps/) ([PDF](../fps-sans-escher.pdf))
* [Envoy: A Pattern Language for Managing State in a Functional Program](https://www.cs.uni.edu/~wallingf/patterns/envoy.pdf) ([PDF](../envoy.pdf))
* [Object-Oriented Reengineering Patterns](http://scg.unibe.ch/download/oorp/) - S. Demeyer, S. Ducasse and O. Nierstrasz
* [Source Making Design Patterns and UML](https://sourcemaking.com/design_patterns)

### Reactive
[Reactive Extensions](http://reactivex.io/) aren't really patterns but it does fit the idea of categorizing a collection of design approaches

[Reactive Manifesto](http://www.reactivemanifesto.org/)

StackOverflow: [Is it possible to build a Reactive Application using a non-Functional language?](https://stackoverflow.com/questions/20751115/is-it-possible-to-build-a-reactive-application-using-a-non-functional-language)

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

### Web application patterns

* [Webapp patterns](https://www.patterns.dev/): Collection of patterns and web-app idioms. Mix of GOF and some very specific-to-browsers idioms.

