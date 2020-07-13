title=RedisGraph
tags=storage, graph
summary=A graph database module for Redis.
~~~~~~

RedisGraph is the first queryable Property Graph database to use sparse matrices to represent the adjacency matrix in graphs and linear algebra to query the graph.

Primary features:

* Based on the Property Graph Model
* Nodes (vertices) and Relationships (edges) that may have attributes
* Nodes that can be labeled
* Relationships have a relationship type
* Graphs represented as sparse adjacency matrices
* [Cypher](/languages/cypher.html) as query language
* Cypher queries translated into linear algebra expressions

[Website](https://oss.redislabs.com/redisgraph/) | [Source](https://github.com/RedisGraph/RedisGraph/)

To quickly try out RedisGraph, launch an instance using docker: `docker run -p 6379:6379 -it --rm redislabs/redisgraph`

Give it a try ¶
After you load RedisGraph, you can interact with it using redis-cli.

Here we'll quickly create a small graph representing a subset of motorcycle riders and teams taking part in the MotoGP league. Once created, we'll start querying our data.

With redis-cli ¶
```
$ redis-cli
127.0.0.1:6379> GRAPH.QUERY MotoGP "CREATE (:Rider {name:'Valentino Rossi'})-[:rides]->(:Team {name:'Yamaha'}), (:Rider {name:'Dani Pedrosa'})-[:rides]->(:Team {name:'Honda'}), (:Rider {name:'Andrea Dovizioso'})-[:rides]->(:Team {name:'Ducati'})"
1) 1) Labels added: 2
   2) Nodes created: 6
   3) Properties set: 6
   4) Relationships created: 3
   5) "Query internal execution time: 0.399000 milliseconds"
```
Now that our MotoGP graph is created, we can start asking questions. For example: Who's riding for team Yamaha?


```
127.0.0.1:6379> GRAPH.QUERY MotoGP "MATCH (r:Rider)-[:rides]->(t:Team) WHERE t.name = 'Yamaha' RETURN r.name, t.name"
1) 1) "r.name"
   2) "t.name"
2) 1) 1) "Valentino Rossi"
      2) "Yamaha"
3) 1) "Query internal execution time: 0.625399 milliseconds"
```

How many riders represent team Ducati?

```
127.0.0.1:6379> GRAPH.QUERY MotoGP "MATCH (r:Rider)-[:rides]->(t:Team {name:'Ducati'}) RETURN count(r)"
1) 1) "count(r)"
2) 1) 1) (integer) 1
3) 1) "Query internal execution time: 0.624435 milliseconds"
```
