title=ArcadeDB
tags=storage, relational, graph, key-value, document, jvm
summary=a conceptual fork of OrientDB, a multi-model database, one DBMS that supports SQL, Cypher, Gremlin, HTTP/JSON, MongoDB and Redis; also supports Vector Embeddings.
~~~~~~

[Website](https://arcadedb.com/) | [Source](https://github.com/ArcadeData/arcadedb)

ArcadeDB is fully transactional DBMS with support for ACID transactions, structured and unstructured data, native graph engine (no joins but links between records), full-text indexing, geospatial querying, and advanced security.

ArcadeDB supports the following models:

* Graph Database (compatible with Neo4j Cypher, Apache Tinkerpop Gremlin and OrientDB SQL)
* Document Database (compatible with the MongoDB driver + MongoDB queries and OrientDB SQL)
* Key/Value (compatible with the Redis driver)
* Search Engine
* Time Series
* Vector Embedding

ArcadeDB understands multiple languages:

* SQL (from OrientDB SQL)
* Neo4j Cypher (Open Cypher)
* Apache Gremlin (Apache Tinkerpop v3.7.x)
* GraphQL Language
* MongoDB Query Language

ArcadeDB can be used as:

* Embedded from any language on top of the Java Virtual Machine
* Remotely by using HTTP/JSON
* Remotely by using a Postgres driver (ArcadeDB implements Postgres Wire protocol)
* Remotely by using a Redis driver (only a subset of the operations are implemented)
* Remotely by using a MongoDB driver (only a subset of the operations are implemented)

