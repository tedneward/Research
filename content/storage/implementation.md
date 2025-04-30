title=Database/Data storage implementation
tags=storage
summary=Resources on how to build a database
~~~~~~

[Subreddit: /r/databasedevelopment](https://www.reddit.com/r/databasedevelopment/)

## Build your own....

* [B-Tree Implementation](https://www.codeproject.com/Articles/7410/Implementation-of-a-B-Tree-Database-Class)
* [Building BerkeleyDB](https://transactional.blog/building-berkeleydb/)
* [Building a NoSQL database from zero](https://github.com/amit-davidson/Building-a-NoSQL-database-from-zero)
* [Build a NoSQL database from scratch in 1000 lines of code](https://betterprogramming.pub/build-a-nosql-database-from-the-scratch-in-1000-lines-of-code-8ed1c15ed924) (in Go)
* [Mini-LSM](https://skyzh.github.io/mini-lsm/): Build a simple key-value storage engine in a week. Extend it in the second and third weeks.
* [LibraDB](https://github.com/amit-davidson/LibraDB): "... a simple, persistent key/value store written in pure Go. The project aims to provide a working yet simple example of a working database."
* [simpledb](https://github.com/awelm/simpledb): A simple database built from scratch that has some the basic RDBMS features (SQL query parser, transactions, query optimizer)
* ["How to build a relational database from scratch"](https://medium.com/swlh/how-to-build-a-relational-database-from-scratch-e208061027c7) (Medium members only)
* **C**: [_Let's Build a Simple Database_](https://cstack.github.io/db_tutorial/) Build a clone of sqlite from scratch ([Source](https://github.com/cstack/db_tutorial))
* **C++**: [_Build Your Own Redis from Scratch_](https://build-your-own.org/redis)
* **C++**: [_Implementation of a B-Tree Class_](https://www.codeproject.com/Articles/7410/Implementation-of-a-B-Tree-Database-Class)
* **C#**: [_Build Your Own Database_](https://www.codeproject.com/Articles/1029838/Build-Your-Own-Database) ([Source](https://github.com/nam178/FooDB))
* **Clojure**: [_An Archaeology-Inspired Database_](http://aosabook.org/en/500L/an-archaeology-inspired-database.html)
* **Crystal**: [_Why you should build your own NoSQL Database_](https://medium.com/@marceloboeira/why-you-should-build-your-own-nosql-database-9bbba42039f5) ([Source](https://github.com/marceloboeira/bojack), Archived)
* **Go**: [_Build Your Own Database from Scratch: Persistence, Indexing, Concurrency_](https://build-your-own.org/database/)
* **Go**: [_Build Your Own Redis from Scratch_](https://www.build-redis-from-scratch.dev/)
* **Go**: [gosqldb](https://github.com/krasun/gosqldb): A key-value persistent database that supports SQL queries over B+ and LSM trees
* **Java**: Electric's [B-Tree](http://megacz.com/software/btree.html) (Source JAR file)
* **Java**: [_JDBM3_](https://github.com/jankotek/JDBM3): Work was paused and redirected to JDBM4-renamed-MapDB
* **Java**: [_MapDB_](https://mapdb.org/): MapDB provides concurrent Maps, Sets and Queues backed by disk storage or off-heap-memory. It is a fast and easy to use embedded Java database engine. ([Source](https://github.com/jankotek/mapdb/))
* **Java**: [The SimpleDB Data System](http://cs.bc.edu/~sciore/simpledb/): "... a multi-user transactional database server written in Java, which interacts with Java client programs via JDBC. The system is intended for pedagogical use only. The code is clean and compact. The APIs are straightforward. The learning curve is relatively small.  Everything about it is geared towards improving the experience of a database system internals course.  Consequently, the system is intentionally bare-bones. It implements only a small fraction of SQL and JDBC, and does little or no error checking. The SimpleDB code is an integral part of my textbook [Database Design and Implementation](https://www.amazon.com/dp/3030338355/), published by Springer."
* **JavaScript**: [_Dagoba: an in-memory graph database_](http://aosabook.org/en/500L/dagoba-an-in-memory-graph-database.html)
* **Python**: [_DBDB: Dog Bed Database_](http://aosabook.org/en/500L/dbdb-dog-bed-database.html)
* **Python**: [_Write your own miniature Redis with Python_](http://charlesleifer.com/blog/building-a-simple-redis-server-with-python/)
* **Ruby**: [_Build your own fast, persistent KV store in Ruby_](https://dineshgowda.com/posts/build-your-own-persistent-kv-store/)
* **Rust**: [_Build your own Redis client and server_](https://tokio.rs/tokio/tutorial/setup)
* **Rust**: [YourSQL](https://github.com/yywe/yoursql)
* **Rust**: [OxidSQL](https://github.com/mzinsmeister/OxidSQL)
* **Rust**: [erdb](https://github.com/radogost/erdb): An educational relational database

## Reading

* [Ask HN: Books about database implementation](https://news.ycombinator.com/item?id=18410692)
* [Bitcask paper](https://riak.com/assets/bitcask-intro.pdf)
* [Btree (Wikipedia)](https://en.wikipedia.org/wiki/B-tree)
* [B-trees: More than I thought I'd want to know](https://benjamincongdon.me/blog/2021/08/17/B-Trees-More-Than-I-Thought-Id-Want-to-Know/)
* [B-tree](https://www.programiz.com/dsa/b-tree)
* [Data Replication Design Spectrum](https://transactional.blog/blog/2024-data-replication-design-spectrum)
* [How Databases Store and Retrieve Data with B-Trees](https://www.lucavall.in/blog/how-databases-store-and-retrieve-data-with-b-trees)
* [Introduction of B-tree](https://www.geeksforgeeks.org/introduction-of-b-tree-2/)

### Transactions

* ["Decomposing Transactional Systems"](https://transactional.blog/blog/2025-decomposing-transactional-systems): "Every transactional system does four things:
    
    * It *executes* transactions.
    * It *orders* transactions.
    * It *validates* transactions.
    * It *persists* transactions.

    *Executing* a transaction means evaluating the body of the transaction to produce the intended reads and writes. There is still notable variety across systems as to how the body of a transaction is executed. Writes might be applied to storage during this phase, or they might be buffered locally and submitted as a batch at the end. A transaction might be executed more than once for different purposes.

    *Ordering* a transaction means assigning the transaction some notion of a time at which it occurred. This could be a version, a timestamp, a log sequence number, or a more complex description of transaction IDs it happened before or after. MVCC databases may assign two versions: an initial read version, and a final commit version. In this case, we’re mainly focused on the specific point at which the commit version is chosen — the time at which the database claims all reads and writes occurred atomically.

    *Validating* a transaction means enforcing concurrency control, or more rarely, domain-specific semantics. If a transaction is going to be rejected for a system defined reason, such as having serializability conflicts with existing transactions, it will happen here. When validation happens after ordering, it checks to see if the assigned order is valid. When validation happens before ordering, it provides a range of acceptable commit versions, and the ordering step chooses one of them.

    *Persisting* a transaction makes making it durable, generally to disk. Sometimes writes are incrementally made durable during transaction execution, but the key point in persistence is when all writes and the commit record marking the transaction as committed are durable. Often this is noting how the system performs replication and persists the outcome of its atomic commitment protocol. (And sometimes the lines between those two aren’t very clear.)

    All four of these things must be done before the system may acknowledge a transaction’s result to a client. However, these steps can be done in any order. They can be done concurrently. Different systems achieve different tradeoffs by reordering these steps. ... A classic optimistic concurrency control database will execute a transaction, and record the read and write sets. Once execution finishes, a commit version is allocated, and concurrent transactions are checked for conflicts. If no conflicts were found, the transaction is made durable, and acknowledged as committed. ... A classic pessimistic concurrency control database executes a transaction and acquires locks as it runs to exclude conflicting transactions. When the transaction finishes, it acquires a commit version, and then is persisted to disk. Then it releases the locks.
