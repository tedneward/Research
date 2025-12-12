title=Vector storage model
tags=storage, model, vector
summary=Thoughts and links.
~~~~~~

"A vector database is a data storage system used to manage, index, and query high-dimensional vector data. Vectors, in this context, represent data points in multi-dimensional space, often used in machine learning, data mining, and other advanced analytical applications. Vector databases are useful in tasks involving the computation of distances or similarities between vectors, such as recommendation systems, image and video recognition, and natural language processing. Unlike traditional databases that manage structured rows and columns, vector databases handle more complex, high-dimensional data representations, which are essential for applications requiring efficient similarity searches and pattern recognition. Some general purpose databases, such as PostgreSQL and Cassandra, now support both traditional data formats and vector data." --[NetApp Instaclustr](https://www.instaclustr.com/education/vector-database/top-10-open-source-vector-databases/)

[What is a vector database?](https://www.pinecone.io/learn/vector-database/): "A vector database indexes and stores vector embeddings for fast retrieval and similarity search, with capabilities like CRUD operations, metadata filtering, horizontal scaling, and serverless."

[What is a vector database?](https://www.oracle.com/database/vector-database/): "A lesser-known data type, vectors, has seized the spotlight recently as an enabler of generative AI. But vectors—and databases capable of storing and analyzing them—have been toiling backstage for many years. They’re used in geospatial mapping and analysis for city planning, transportation logistics, and environmental analysis. More recently, vectors have been used in recommendation engines for retail products as well as music and video streaming sites."

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

## Reading

### Articles

- https://thenewstack.io/how-to-master-vector-databases/
- [Vector databases: Shiny object syndrome and the case of a missing unicorn](https://venturebeat.com/ai/vector-databases-shiny-object-syndrome-and-the-case-of-a-missing-unicorn)
- [From shiny object to sober reality: The vector database story, two years later](https://venturebeat.com/ai/from-shiny-object-to-sober-reality-the-vector-database-story-two-years-later)