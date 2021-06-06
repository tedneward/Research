title=Titan
tags=storage, graph, distribution
summary=A scalable graph database optimized for storing and querying graphs containing hundreds of billions of vertices and edges distributed across a multi-machine cluster.
~~~~~~

[Website](http://titan.thinkaurelius.com/) | [Source](https://github.com/thinkaurelius/titan/)

Titan is a transactional database that can support thousands of concurrent users executing complex graph traversals in real time.

In addition, Titan provides the following features:

* Elastic and linear scalability for a growing data and user base.
* Data distribution and replication for performance and fault tolerance.
* Multi-datacenter high availability and hot backups.
* Support for ACID and eventual consistency.
* Support for various storage backends:
    * Apache [Cassandra](../cassandra)
    * Apache [HBase](../hbase)
    * Oracle [BerkeleyDB](../berkeleydb)
* Support for global graph data analytics, reporting, and ETL through integration with big data platforms:
    * Apache Spark
    * Apache Giraph
    * Apache Hadoop
* Support for geo, numeric range, and full-text search via:
    * ElasticSearch
    * Solr
    * Lucene
* Native integration with the TinkerPop graph stack:
    * Gremlin graph query language
    * Gremlin graph server
    * Gremlin applications

### Quick start
```
<dependency>
   <groupId>com.thinkaurelius.titan</groupId>
   <artifactId>titan-core</artifactId>
   <version>1.0.0</version>
</dependency>
<!-- core, all, cassandra, hbase, berkeleyje, es, lucene -->
```
then
```
// who is hercules' grandfather?
g.V.has('name','hercules').out('father').out('father').name
```
