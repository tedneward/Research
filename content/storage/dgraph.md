title=DGraph
tags=storage, graph
summary=Native GraphQL Database with graph backend.
~~~~~~

[Website](https://dgraph.io/) | [Source](https://github.com/dgraph-io/dgraph)

Dgraph is a horizontally scalable and distributed GraphQL database with a graph backend. It provides ACID transactions, consistent replication, and linearizable reads. It's built from the ground up to perform for a rich set of queries. Being a native GraphQL database, it tightly controls how the data is arranged on disk to optimize for query performance and throughput, reducing disk seeks and network calls in a cluster.

Using the official Dgraph image: `docker pull dgraph/dgraph:latest`

Run a Quick Standalone Cluster: `docker run -it -p 8080:8080 -p 9080:9080 -v ~/dgraph:/dgraph dgraph/standalone:latest`

