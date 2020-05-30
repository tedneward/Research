title=Storage
type=categorypage
category=storage
summary=Everything to do with data storage, organization, query, and analysis.
~~~~~~

Storage is typically data, but the degree of structure is flexible. Unstructured storage is essentially a filesystem (although even then filesystems have structure to them). Structured storage is often called a "database system" in some particular shape.

## Link sites
[NoSQL](https://hostingdata.co.uk/nosql-database/)


## "Shapes" to data

### [Relational](/tags/relational.html)

Built, more or less, on the Codd model of relationships between tuples of data.

### [Document-oriented](/tags/document.html)

Structure is conceptually "star"-like, with minimal (or no) relationships outside of the document recognized by the storage system. (Developers can, and usually will, store unique data elements across documents as a way of putting structure in at the application level, but this is typically unrecognized by the storage system itself.)

MongoDB

### [Graph-oriented](/tags/graph.html)
"A graph is a structure composed of vertices and edges. Both vertices and edges can have an arbitrary number of key/value-pairs called properties. Vertices denote discrete objects such as a person, a place, or an event. Edges denote relationships between vertices. For instance, a person may know another person, have been involved in an event, and/or have recently been at a particular place. Properties express non-relational information about the vertices and edges. Example properties include a vertex having a name and an age, and an edge having a timestamp and/or a weight.

"If a user's domain is composed of a heterogeneous set of objects (vertices) that can be related to one another in a multitude of ways (edges), then a graph may be the right representation to use. In a graph, each vertex is seen as an atomic entity (not simply a "row in a table") that can be linked to any other vertex or have properties added or removed at will. This empowers the data modeler to think in terms of actors within a world of complex relations as opposed to, in relational databases, statically-typed tables joined in aggregate. Once a domain is modeled, that model must then be exploited in order to yield novel, differentiating information. Graph computing has a rich history that includes not only query languages devoid of table-join semantics, but also algorithms that support complex reasoning: path analysis, vertex clustering and ranking, subgraph identification, and more. The world of applied graph computing offers a flexible, intuitive data structure along with a host of algorithms able to effectively leverage that structure." -- from [Apache TinkerPop](http://tinkerpop.apache.org/)

List of graph dbs to add (from TinkerPop page):
* [Alibaba Graph Database](https://cn.aliyun.com/product/gdb) - A real-time, reliable, cloud-native graph database service that supports property graph model.
* [Amazon Neptune](https://aws.amazon.com/neptune/) - Fully-managed graph database service.
* [ArangoDB](https://github.com/ArangoDB-Community)
* [Bitsy](https://github.com/lambdazen/bitsy/wiki) - A small, fast, embeddable, durable in-memory graph database.
* [Blazegraph](https://github.com/blazegraph) - RDF graph database with OLTP support.
* [ChronoGraph](https://github.com/MartinHaeusler/chronos/tree/master/org.chronos.chronograph) - A versioned graph database.
* [DSEGraph](https://www.datastax.com/products/datastax-enterprise-graph) - DataStax graph database with OLTP and OLAP support.
* [GRAKN.AI](https://grakn.ai/) - Distributed OLTP/OLAP knowledge graph system.
* Hadoop (Spark) - OLAP graph processor using Spark.
* [HGraphDB](https://github.com/rayokota/hgraphdb) - OLTP graph database running on Apache HBase.
* [Huawei Graph Engine Service](https://www.huaweicloud.com/en-us/product/ges.html) - Fully-managed, distributed, at-scale graph query and analysis service that provides a visualized interactive analytics platform.
* [IBM Graph](https://console.ng.bluemix.net/catalog/services/ibm-graph/) - OLTP graph database as a service.
* [JanusGraph](http://janusgraph.org/) - Distributed OLTP and OLAP graph database with BerkeleyDB, Apache Cassandra and Apache HBase support.
* Neo4j - OLTP graph database (embedded and high availability).
* [neo4j-gremlin-bolt](https://github.com/SteelBridgeLabs/neo4j-gremlin-bolt) - OLTP graph database (using Bolt Protocol).
* [OrientDB](https://github.com/orientechnologies) - OLTP graph database
* [Apache S2Graph](https://s2graph.apache.org/) - OLTP graph database running on Apache HBase.
* [Sqlg](https://github.com/pietermartin/sqlg) - OLTP implementation on SQL databases.
* [Stardog](https://stardog.com/) - RDF graph database with OLTP and OLAP support.
* [TinkerGraph](https://tinkerpop.apache.org/docs/current/reference/#tinkergraph-gremlin) - In-memory OLTP and OLAP reference implementation.
* [Titan](https://thinkaurelius.github.io/titan/) - Distributed OLTP and OLAP graph database with BerkeleyDB, Apache Cassandra and Apache HBase support.
* [Unipop](https://github.com/rmagen/unipop) - OLTP Elasticsearch and JDBC backed graph.

### [Column-oriented (columnar)](/tags/columnar.html)

### [Key-value store](/tags/keyvalue.html)

## Topology options

### [Network](/tags/network.html) access
One makes network calls to access the storage engine. Most storage engines follow this model, whether inside of the same network (a la "on-prem") or cloud.

### [Embedded](/tags/embedded.html)
The storage engine is access in-process inside of the using program. Often cannot be accessed by other running programs. Often managing files directly, and the storage engine shuts down when the host process does. Excellent for standalone, self-contained installations that have no external dependencies beyond the fileystem. Fastest of all the relationships, with possible exception of code hosted inside the database (a la stored procedures).

### [Code hosting](/tags/code-hosting.html)
Some storage engines also allow for code-hosting, in which code executes inside the same process(es) as the storage engine itself, a la "stored procedures".

