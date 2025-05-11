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
* [SAM (State-Action-Model)](https://sam.js.org/): a software engineering pattern that helps manage the application state and reason about temporal aspects with precision and clarity. Modern Software Engineering practices are essentially based on Functions (Actions) and Types which encourage a sprawl of unstructured assignments and event handlers. SAM's founding principle is that State Mutations must be first class citizens of the programming model. Once that principle is accepted, proper temporal semantics can be articulated.

### Patterns miscellany

* [Avoiding the soft delete anti-pattern](https://www.cultured.systems/2024/04/24/Soft-delete/): The main problem with soft deletion is that you’re systematically misleading the database. ... (foreign key constraints, uniqueness constraints) ... Because you’re misleading the database, you also encounter problems with querying the data. You can no longer rely on SELECTs to only return live data; you have to remember to check the deletion marker in each WHERE clause (and in each JOIN; I nearly forgot about that while writing this, a reflection of the many times I’ve forgotten about it while implementing this).

    * Alternative 1: YOLO. Just delete.
    * Alternative 2: Lifecycle. For entities that have a lifecycle, one option is to consider end-of-life as part of that lifecycle. 
    * Alternative 3: Temporal tables. The previous approach involves moving deletion from an irritating persistence detail to a first- class part of the application logic. The mirror image is to instead make it a first-class feature of the database.
    * Alternative 4: Delete them all and let the data warehouse sort it out. As I said above, problems with soft deletion apply primarily to databases containing an application’s current state. It’s increasingly common for an application to have multiple databases (one database per microservice, for instance), and multiple other data sources (3rd-party analytics services, for example), raising the need for some further data store (a data lake and/or warehouse) to integrate these multiple data sources. You typically want a data warehouse to surface historical data anyway for reporting purposes, so it makes sense to outsource your historical record keeping to this data infrastructure; in that case, you can delete from the application’s own data store with impunity.