title=Cypher
tags=language, storage, graph
summary=A graph database query language first popularized by Neo4j.
~~~~~~

[Website](http://www.opencypher.org/) | [Source](https://github.com/opencypher/openCypher)



## Core syntax
General:

* ASCII art inspired; "what you draw is what you store"
* nodes represented by `()`
* attributes represented by `{}` with comma-separated `name = value` pairs
* labels are colon-prefixed
* relationships are represented by `-[]->`
* relationships/arcs are node-relationship->node
* results are bound to variables and used in other places in the query
* verbs can operate on multiple expressions: `CREATE ({})` creates one node, `CREATE ({}), ({}), ({})` creates three nodes, `CREATE ({})-[]->({})` creates two nodes with a relationship connecting them, and so on. Bound variables can then be used to re-use a given node in multiple expressions.
* we can have constraints on nodes: `CREATE CONSTRAINT no_duplicate_cities FOR (p:Place) REQUIRE (p.country, p.city) IS NODE KEY` means Place nodes need a unique composite key composed from a combination of `city` and `country` properties.

Key verbs:
* `CREATE`: construct new instances of nodes, relationships, constraints
* `DELETE`: deconstruct a node, but will refuse if the node is linked via relationships; `MATCH (n) DELETE n` will delete any nodes but cleanly aborts if it leaves relationships dangling; `MATCH ()-[r]->() DELETE r` deletes any relationships (I think?)
* `DETACH DELETE`: delete nodes and any relationships attached; `MATCH (n) DETACH DELETE n` effectively empties the database
* `MATCH`: compare user-defined patterns to the underlying graph/datastore; `MATCH (n) RETURN n` is the "find all nodes and return them", like a `SELECT * FROM *` kind of super-query; `MATCH ()-[r]->()` matches any relationships (I think?)
* `MERGE`: a mix of `MATCH` and `CREATE` it will either match *whole* patterns or create new record that match the pattern *in its entirety*.
* `RETURN`: return the set of nodes to the query caller
* `SET`: add/update an attribute on a node/relationship
* `REMOVE`: remove an attribute on a node/relationship

## Random notes

Nodes can have zero-to-many labels

