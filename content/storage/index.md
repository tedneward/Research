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

## Conceptual thoughts

Feels like a database implementation is made up of primarily three components:

* a model/"shape" for its data (relational, document, etc)
* a "storage" (storage engine) where the raw data lives (disk, in-memory, distributed disk)
* a topology (network, embedded, hosting, distributed/clustered)

### Models/"Shapes" to data

* [Document-oriented](/storage/models/document)
* [Event-Sourcing](/storage/models/event-sourcing)
* [Graph-oriented](/storage/models/graph)
* [Hierarchical](/storage/models/hierarchical)
* [Key-value store](/storage/models/key-value)
* [Object](/storage/models/object)
* [Raw](/storage/models/raw): "Bring your own format/structure"
* [Relational](/storage/models/relational)
* [Spatial](/storage/models/spatial)
* [Text](/storage/models/text): Usually user-facing or user-accessible prose data
* [Time-series](/storage/models/time-series)
* [Vector](/storage/models/vector)
* [Wide Column-oriented (columnar)](/storage/models/columnar)

### Storage

* In-memory: disappears whenever the database process(es) go away
* Disk: data is written to the underlying disk
* Distributed disk: data is written to one of a number of disks, perhaps redundantly (for resiliency)
* Cloud: data is written to a cloud host (?)

### Topology options

* [Network](/tags/network.html) access: One makes network calls to access the storage engine. Most storage engines follow this model, whether inside of the same network (a la "on-prem") or cloud.

* [Embedded](/tags/embedded.html): The storage engine is accessed in-process inside of the using program. Often cannot be accessed by other running programs. Often managing files directly, and the storage engine shuts down when the host process does. Excellent for standalone, self-contained installations that have no external dependencies beyond the fileystem. Fastest of all the relationships, with possible exception of code hosted inside the database (a la stored procedures).

* [Code hosting](/tags/code-hosting.html): Some storage engines also allow for code-hosting, in which code executes inside the same process(es) as the storage engine itself, a la "stored procedures". The difference between this and embedding is simply which starts up first: the hosting program or the database.

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

* ["Don't use your ORM entities for everything--embrace the SQL!"](https://www.blackparrotlabs.io/post/architecture-pitfalls-dont-use-your-orm-entities-for-everything)

### DBaaS: Database-as-a-Service

* ["Building an Open-Source Private DBaaS"](https://thenewstack.io/building-an-open-source-private-dbaas/)

## Articles

* ["15 Databases, 15 Use Cases--Stop Using the Wrong Database for the Right Problem"](https://hackernoon.com/15-databases-15-use-casesstop-using-the-wrong-database-for-the-right-problem):

    1. [Relational](/storage/models/relational/)
    2. [Wide Column](/storage/models/wide-column/) (Cassandra)
    3. [Time-Series](/storage/models/time-series/) (InfluxDB, Prometheus, Kdb+, etc)
    4. Ledger (Amazon Quantum)
    5. [Graph](/storage/models/graph/) (Neo4j, ArangoDB, Amazon Neptune, etc)
    6. [OODBMS](/storage/models/object/) (ObjectDB, db4o, etc) *(Sadly these are more or less extinct at this point)*
    7. Hierarchical (IMS, Windows Registry, Filesystems, etc)
    8. Document (MongoDB, ArangoDB, CouchDB)
    9. Key-Value (Couchbase, DataStax, Redis)
    10. Blob (Amazon S3)
    11. In-Memory (Redis, Memcached, Apache Ignite, Aerospike, Hazlecast)
    12. Text Search (Elastic Search)
    13. Spatial (PostGIS, Oracle Spatial, SpatiaLite)
    14. Vector (Pinecone, Chroma)
    15. Embedded (SQLite, RocksDB, BerkeleyDB)

## Books

* [Extracting Data from NoSQL Databases: A Step towards Interactive Visual Analysis of NoSQL Data](http://publications.lib.chalmers.se/records/fulltext/155048.pdf) - Petter Nasholm (PDF)
* [NoSQL Databases](http://www.christof-strauch.de/nosqldbs.pdf) - Christof Strauch (PDF)
