title=Storage
type=categorypage
category=storage
summary=Everything to do with data storage, organization, query, and analysis.
tags=storage
~~~~~~

Storage is typically data, but the degree of structure is flexible. Unstructured storage is essentially a filesystem (although even then filesystems have structure to them). Structured storage is often called a "database system" in some particular shape.

## Some various data sources

* [Pokedex](https://github.com/veekun/pokedex)

## Link sites

* [NoSQL](https://hostingdata.co.uk/nosql-database/)

## "Shapes" to data

### [Relational](/tags/relational.html)

Built, more or less, on the Codd model of relationships between tuples of data.

* [Database Design – 2nd Edition](https://opentextbc.ca/dbdesign01/) - Adrienne Watt, Nelson Eng @ BCcampus Open Pressbooks (HTML, PDF, EPUB, Kindle)
* [Database Explorations](http://www.dcs.warwick.ac.uk/~hugh/TTM/Database-Explorations-revision-2.pdf) (PDF)
* [Database Fundamentals](http://public.dhe.ibm.com/software/dw/db2/express-c/wiki/Database_fundamentals.pdf) (PDF)
* [Databases, Types, and The Relational Model: The Third Manifesto](http://www.dcs.warwick.ac.uk/~hugh/TTM/DTATRM.pdf) (PDF)
* [Foundations of Databases](http://webdam.inria.fr/Alice/)
* [Readings in Database Systems, 5th Ed.](http://www.redbook.io)
* [Temporal Database Management](http://people.cs.aau.dk/~csj/Thesis/) - Christian S. Jensen
* [The Theory of Relational Databases](http://web.cecs.pdx.edu/~maier/TheoryBook/TRD.html)
* [The Third Manifesto](http://www.thethirdmanifesto.com/)
* [Why Are There No Relational DBMSs?](https://www.dcs.warwick.ac.uk/~hugh/TTM/Why-Are-There-No-Relational-DBMSs.pdf) - Hugh Darwen

Some interesting relational-oriented sites

* [PokemonSQLTutorial](https://github.com/decentralion/PokemonSQLTutorial)

### [Document-oriented](/tags/document.html)

Structure is conceptually "star"-like, with minimal (or no) relationships outside of the document recognized by the storage system. (Developers can, and usually will, store unique data elements across documents as a way of putting structure in at the application level, but this is typically unrecognized by the storage system itself.)

### [Graph-oriented](/tags/graph.html)
[Wikipedia](https://en.wikipedia.org/wiki/Graph_database)

"A graph is a structure composed of vertices and edges. Both vertices and edges can have an arbitrary number of key/value-pairs called properties. Vertices denote discrete objects such as a person, a place, or an event. Edges denote relationships between vertices. For instance, a person may know another person, have been involved in an event, and/or have recently been at a particular place. Properties express non-relational information about the vertices and edges. Example properties include a vertex having a name and an age, and an edge having a timestamp and/or a weight.

"If a user's domain is composed of a heterogeneous set of objects (vertices) that can be related to one another in a multitude of ways (edges), then a graph may be the right representation to use. In a graph, each vertex is seen as an atomic entity (not simply a "row in a table") that can be linked to any other vertex or have properties added or removed at will. This empowers the data modeler to think in terms of actors within a world of complex relations as opposed to, in relational databases, statically-typed tables joined in aggregate. Once a domain is modeled, that model must then be exploited in order to yield novel, differentiating information. Graph computing has a rich history that includes not only query languages devoid of table-join semantics, but also algorithms that support complex reasoning: path analysis, vertex clustering and ranking, subgraph identification, and more. The world of applied graph computing offers a flexible, intuitive data structure along with a host of algorithms able to effectively leverage that structure." -- from [Apache TinkerPop](http://tinkerpop.apache.org/)

List of graph dbs to add (from TinkerPop page):

* [Alibaba Graph Database](https://cn.aliyun.com/product/gdb) - A real-time, reliable, cloud-native graph database service that supports property graph model.
* [Amazon Neptune](https://aws.amazon.com/neptune/) - Fully-managed graph database service.
* [Bitsy](https://github.com/lambdazen/bitsy/wiki) - A small, fast, embeddable, durable in-memory graph database.
* [Blazegraph](https://github.com/blazegraph) - RDF graph database with OLTP support.
* [ChronoGraph](https://github.com/MartinHaeusler/chronos/tree/master/org.chronos.chronograph) - A versioned graph database.
* [DSEGraph](https://www.datastax.com/products/datastax-enterprise-graph) - DataStax graph database with OLTP and OLAP support.
* [GRAKN.AI](https://grakn.ai/) - Distributed OLTP/OLAP knowledge graph system.
* Hadoop (Spark) - OLAP graph processor using Spark.
* [HGraphDB](https://github.com/rayokota/hgraphdb) - OLTP graph database running on Apache HBase.
* [Huawei Graph Engine Service](https://www.huaweicloud.com/en-us/product/ges.html) - Fully-managed, distributed, at-scale graph query and analysis service that provides a visualized interactive analytics platform.
* [IBM Graph](https://console.ng.bluemix.net/catalog/services/ibm-graph/) - OLTP graph database as a service.
* [neo4j-gremlin-bolt](https://github.com/SteelBridgeLabs/neo4j-gremlin-bolt) - OLTP graph database (using Bolt Protocol).
* [Apache S2Graph](https://s2graph.apache.org/) - OLTP graph database running on Apache HBase.
* [Sqlg](https://github.com/pietermartin/sqlg) - OLTP implementation on SQL databases.
* [Stardog](https://stardog.com/) - RDF graph database with OLTP and OLAP support.
* [TinkerGraph](https://tinkerpop.apache.org/docs/current/reference/#tinkergraph-gremlin) - In-memory OLTP and OLAP reference implementation.
* [Unipop](https://github.com/rmagen/unipop) - OLTP Elasticsearch and JDBC backed graph.

### [Column-oriented (columnar)](/tags/columnar.html)

* Cassandra

### [Key-value store](/tags/keyvalue.html)

* Redis

## Topology options

### [Network](/tags/network.html) access
One makes network calls to access the storage engine. Most storage engines follow this model, whether inside of the same network (a la "on-prem") or cloud.

### [Embedded](/tags/embedded.html)
The storage engine is access in-process inside of the using program. Often cannot be accessed by other running programs. Often managing files directly, and the storage engine shuts down when the host process does. Excellent for standalone, self-contained installations that have no external dependencies beyond the fileystem. Fastest of all the relationships, with possible exception of code hosted inside the database (a la stored procedures).

### [Code hosting](/tags/code-hosting.html)
Some storage engines also allow for code-hosting, in which code executes inside the same process(es) as the storage engine itself, a la "stored procedures".

## Automation

* ["Database Gyms"](https://www.cidrdb.org/cidr2023/papers/p27-lim.pdf): "In the past decade, academia and industry have embraced machine learning (ML) for database management system (DBMS) automation. These efforts have focused on designing ML models that predict DBMS behavior to support picking actions (e.g., building indexes) that improve the system’s performance. Recent developments in ML have created automated methods for finding good models. Such advances shift the bottleneck from DBMS model design to obtaining the training data necessary for building these models. But generating good training data is challenging and requires encoding subject matter expertise into DBMS instrumentation.
    "Existing methods for training data collection are bespoke to individual DBMS components and do not account for (1) how workload trends affect the system and (2) the subtle interactions between internal system components. Consequently, the models created from this data do not support holistic tuning across subsystems and require frequent retraining to boost their accuracy.
    "This paper presents the architecture of a database gym, an integrated environment that provides a unified API of pluggable components for obtaining high-quality training data. The goal of a database gym is to simplify ML model training and evaluation to accelerate autonomous DBMS research. But unlike gyms in other domains that rely on custom simulators, a database gym uses the DBMS itself to create simulation environments for ML training. Thus, we discuss and prescribe methods for overcoming challenges in DBMS simulation, which include demanding requirements for performance, simulation fidelity, and DBMS-generated hints for guiding training processes."

## Datamining

* [A Programmer's Guide to Data Mining](http://guidetodatamining.com) - Ron Zacharski (Draft)
* [Data Jujitsu: The Art of Turning Data into Product](http://www.oreilly.com/data/free/data-jujitsu.csp) (email address *requested*, not required)
* [Data Mining Algorithms In R](https://en.wikibooks.org/wiki/Data_Mining_Algorithms_In_R) - Wikibooks
* [Elements of Data Science](https://allendowney.github.io/ElementsOfDataScience/README.html) - Allen B. Downey
* [Internet Advertising: An Interplay among Advertisers, Online Publishers, Ad Exchanges and Web Users](http://arxiv.org/pdf/1206.1754v2.pdf) (PDF)
* [Introduction to Data Science](https://docs.google.com/file/d/0B6iefdnF22XQeVZDSkxjZ0Z5VUE/edit?pli=1) - Jeffrey Stanton
* [Introduction to Data Science](https://leanpub.com/datasciencebook) - Rafael A Irizarry *(Leanpub account or valid email requested)*
* [Mining of Massive Datasets](http://infolab.stanford.edu/~ullman/mmds/book.pdf) - Jure Leskovec, Anand Rajaraman, Jeffrey D. Ullman (PDF)
* [School of Data Handbook](http://schoolofdata.org/handbook/)
* [Statistical inference for data science](https://leanpub.com/LittleInferenceBook/read) - Brian Caffo
* [The Ultimate Guide to 12 Dimensionality Reduction Techniques (with Python codes)](https://www.analyticsvidhya.com/blog/2018/08/dimensionality-reduction-techniques-python/) - Pulkit Sharma
* [Theory and Applications for Advanced Text Mining](http://www.intechopen.com/books/theory-and-applications-for-advanced-text-mining)

## Information Retrieval

* [Information Retrieval: A Survey](http://www.csee.umbc.edu/csee/research/cadip/readings/IR.report.120600.book.pdf) (PDF)
* [Introduction to Information Retrieval](http://nlp.stanford.edu/IR-book/information-retrieval-book.html)

## Storage and retrieval

["Don't use your ORM entities for everything--embrace the SQL!"](https://www.blackparrotlabs.io/post/architecture-pitfalls-dont-use-your-orm-entities-for-everything)

## Implementation

* [Mini-LSM](https://skyzh.github.io/mini-lsm/): Build a simple key-value storage engine in a week. Extend it in the second and third weeks.
* [LibraDB](https://github.com/amit-davidson/LibraDB): "... a simple, persistent key/value store written in pure Go. The project aims to provide a working yet simple example of a working database."
* [simpledb](https://github.com/awelm/simpledb): A simple database built from scratch that has some the basic RDBMS features (SQL query parser, transactions, query optimizer)
* C: [Let's Write a Database](https://cstack.github.io/db_tutorial/) (a SQLite clone in C)
* C++: [Build Your Own Redis from Scratch](https://build-your-own.org/redis)
* C#: [Build Your Own Database](https://www.codeproject.com/Articles/1029838/Build-Your-Own-Database)
* Clojure: [An Archaeology-Inspired Database](http://aosabook.org/en/500L/an-archaeology-inspired-database.html)
* Crystal: [Why you should build your own NoSQL Database](https://medium.com/@marceloboeira/why-you-should-build-your-own-nosql-database-9bbba42039f5)
* Go: [Build Your Own Database from Scratch: Persistence, Indexing, Concurrency](https://build-your-own.org/database/)
* Go: [Build Your Own Redis from Scratch](https://www.build-redis-from-scratch.dev/)
* Go: [gosqldb](https://github.com/krasun/gosqldb): A key-value persistent database that supports SQL queries over B+ and LSM trees
* JavaScript: [Dagoba: an in-memory graph database](http://aosabook.org/en/500L/dagoba-an-in-memory-graph-database.html)
* Python: [DBDB: Dog Bed Database](http://aosabook.org/en/500L/dbdb-dog-bed-database.html)
* Python: [Write your own miniature Redis with Python](http://charlesleifer.com/blog/building-a-simple-redis-server-with-python/)
* Ruby: [Build your own fast, persistent KV store in Ruby](https://dineshgowda.com/posts/build-your-own-persistent-kv-store/)
* Rust: [Build your own Redis client and server](https://tokio.rs/tokio/tutorial/setup)
* Rust: [YourSQL](https://github.com/yywe/yoursql)
* Rust: [OxidSQL](https://github.com/mzinsmeister/OxidSQL)
* Rust: [erdb](https://github.com/radogost/erdb): An educational relational database
* [Subreddit: /r/databasedevelopment](https://www.reddit.com/r/databasedevelopment/)
* [B-Tree Implementation](https://www.codeproject.com/Articles/7410/Implementation-of-a-B-Tree-Database-Class)
* [The SimpleDB Data System](http://cs.bc.edu/~sciore/simpledb/): "... a multi-user transactional database server written in Java, which interacts with Java client programs via JDBC. The system is intended for pedagogical use only. The code is clean and compact. The APIs are straightforward. The learning curve is relatively small.  Everything about it is geared towards improving the experience of a database system internals course.  Consequently, the system is intentionally bare-bones. It implements only a small fraction of SQL and JDBC, and does little or no error checking. The SimpleDB code is an integral part of my textbook [Database Design and Implementation](https://www.amazon.com/dp/3030338355/), published by Springer."
* [Building a NoSQL database from zero](https://github.com/amit-davidson/Building-a-NoSQL-database-from-zero)
* ["How to build a relational database from scratch"](https://medium.com/swlh/how-to-build-a-relational-database-from-scratch-e208061027c7) (Medium members only)
* [Build a NoSQL database from scratch in 1000 lines of code](https://betterprogramming.pub/build-a-nosql-database-from-the-scratch-in-1000-lines-of-code-8ed1c15ed924) (in Go)
* [Building BerkeleyDB](https://transactional.blog/building-berkeleydb/)

### DBaaS: Database-as-a-Service

* ["Building an Open-Source Private DBaaS"](https://thenewstack.io/building-an-open-source-private-dbaas/)

## Books

* [CouchDB: The Definitive Guide](http://guide.couchdb.org)
* [Extracting Data from NoSQL Databases: A Step towards Interactive Visual Analysis of NoSQL Data](http://publications.lib.chalmers.se/records/fulltext/155048.pdf) - Petter Nasholm (PDF)
* [Graph Databases](http://graphdatabases.com)
* [How To Manage a Redis Database](https://www.digitalocean.com/community/books/how-to-manage-a-redis-database-ebook) - Mark Drake (PDF, EPUB)
* [NoSQL Databases](http://www.christof-strauch.de/nosqldbs.pdf) - Christof Strauch (PDF)
* [Redis in Action](https://redis.com/ebook/redis-in-action/) - Josiah L. Carlson
* [The Little Redis Book](http://openmymind.net/2012/1/23/The-Little-Redis-Book/) - K. Seguin (PDF, Epub)
