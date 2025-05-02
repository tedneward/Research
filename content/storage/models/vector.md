title=Vector storage model
tags=storage, model, vector
summary=Thoughts and links.
~~~~~~

"A vector database is a data storage system used to manage, index, and query high-dimensional vector data. Vectors, in this context, represent data points in multi-dimensional space, often used in machine learning, data mining, and other advanced analytical applications. Vector databases are useful in tasks involving the computation of distances or similarities between vectors, such as recommendation systems, image and video recognition, and natural language processing. Unlike traditional databases that manage structured rows and columns, vector databases handle more complex, high-dimensional data representations, which are essential for applications requiring efficient similarity searches and pattern recognition. Some general purpose databases, such as PostgreSQL and Cassandra, now support both traditional data formats and vector data." --[NetApp Instaclustr](https://www.instaclustr.com/education/vector-database/top-10-open-source-vector-databases/)

## Implementations

* [Pinecone](https://www.pinecone.io/) (Commercial?)
* [Chroma](https://www.trychroma.com/) [Source](https://github.com/chroma-core/chroma): the open-source AI application database. Batteries included.
* [turbopuffer](https://turbopuffer.com/) - Commercial?
* [Weaviate](https://github.com/weaviate/weaviate) ([Docs](https://weaviate.io/developers/weaviate)): an open source, AI-native vector database.
* [Milvus](https://milvus.io/) [Source](https://github.com/milvus-io/milvus): an open-source vector database built for GenAI applications.
* [Qdrant](https://qdrant.tech/) [Source](https://github.com/qdrant/qdrant): a vector similarity search engine and vector database.
* [PostgresQL](../../postgresql) via pgvector
* [Cassandra](../../cassandra)
* [Redis](../../redis)
* Valkey
* [CockroachDB](../../cockroachdb)

