title=Graph storage model
tags=storage, model, graph
summary=Thoughts/articles on the graph model of storage.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/Graph_database)

"A graph is a structure composed of vertices and edges. Both vertices and edges can have an arbitrary number of key/value-pairs called properties. Vertices denote discrete objects such as a person, a place, or an event. Edges denote relationships between vertices. For instance, a person may know another person, have been involved in an event, and/or have recently been at a particular place. Properties express non-relational information about the vertices and edges. Example properties include a vertex having a name and an age, and an edge having a timestamp and/or a weight.

"If a user's domain is composed of a heterogeneous set of objects (vertices) that can be related to one another in a multitude of ways (edges), then a graph may be the right representation to use. In a graph, each vertex is seen as an atomic entity (not simply a "row in a table") that can be linked to any other vertex or have properties added or removed at will. This empowers the data modeler to think in terms of actors within a world of complex relations as opposed to, in relational databases, statically-typed tables joined in aggregate. Once a domain is modeled, that model must then be exploited in order to yield novel, differentiating information. Graph computing has a rich history that includes not only query languages devoid of table-join semantics, but also algorithms that support complex reasoning: path analysis, vertex clustering and ranking, subgraph identification, and more. The world of applied graph computing offers a flexible, intuitive data structure along with a host of algorithms able to effectively leverage that structure." -- from [Apache TinkerPop](http://tinkerpop.apache.org/)

List of graph dbs to add (from TinkerPop page):

* [Alibaba Graph Database](https://cn.aliyun.com/product/gdb) - A real-time, reliable, cloud-native graph database service that supports property graph model.
* [Amazon Neptune](https://aws.amazon.com/neptune/) - Fully-managed graph database service.
* [Apache S2Graph](https://s2graph.apache.org/) - OLTP graph database running on Apache HBase.
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
* [Sqlg](https://github.com/pietermartin/sqlg) - OLTP implementation on SQL databases.
* [Stardog](https://stardog.com/) - RDF graph database with OLTP and OLAP support.
* [TinkerGraph](https://tinkerpop.apache.org/docs/current/reference/#tinkergraph-gremlin) - In-memory OLTP and OLAP reference implementation.
* [Unipop](https://github.com/rmagen/unipop) - OLTP Elasticsearch and JDBC backed graph.

## Reading

### Books

* [Graph Databases](http://graphdatabases.com)
