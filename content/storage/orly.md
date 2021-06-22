title=Orly
tags=storage, graph
summary=An open-source graph database
~~~~~~

[Website](https://github.com/orlyatomics/orly/wiki) | [Source](https://github.com/orlyatomics/orly)

## Orly ("oh-really") features:

* **Points of View**: This is our version of optimistic locking or isolation. In traditional databases, clients have to lock the entire database (or at least large swaths of it) before updating it to ensure data remains consistent. In Orly, clients make changes in their own private points of view, which are like small sandboxes. Changes in private points of view eventually propagate into shared points of view and eventually reach the global point of view, which is the whole database. Updates to private points of view don't lock anything: Orly determines later whether, when, and how to reconcile changes from different points of view. We also encourage field calls rather than field changes (e.g., `x += 1` is better than `x = x + 1`).
* **Time Travel**: We use something called the _Flux Capacitor_ to keep a history of changes made to the database and to resolve conflicts as they come into shared points of view and the global point of view. This permits us to perform consistent read for any point in time. Orly defines its "time line" by causality rather than clock time. Instead of manipulating timestamps, Orly records an ordering of events (e.g., update A affects update B, so A "happens before" B).)
* **Query Language**: Orly has its own high-level, compiled, type-safe, functional language called _Orlyscript_. Orlyscript is not just a query language: You can write general-purpose programs in it complete with compile-time unit tests. Orly comes with a compiler that transforms Orlyscript into shared libraries (.so files on Linux), which Orly servers load as packages.
* **Scalability and Availability**: While we eventually plan to develop a sharded Orly machine (and actively design so that we can build such a machine), our current single-node server with fail-over/replication can handle hundreds of thousands of transactions per second. We like to say that Orly will function on a "planetary scale": Your data and computations will not only distribute across a data center, but also across many data centers across the globe. This means that no disaster short of nuking the planet fifty times over or colliding with a gigantic asteroid will destroy your data. (Even those might not be catastrophic: Maybe we'll have data centers running Orly with your replicated data on the moon or Mars.)

