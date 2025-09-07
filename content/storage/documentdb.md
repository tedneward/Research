title=DocumentDB
tags=storage, document
summary=An open-source document database platform.
~~~~~~

[Website](https://documentdb.io/) | [Source](https://github.com/documentdb/documentdb) | [Docs](https://documentdb.io/docs/)

It offers a native implementation of document-oriented NoSQL database, enabling seamless CRUD operations on BSON data types within a PostgreSQL framework. Beyond basic operations, DocumentDB empowers you to execute complex workloads, including full-text searches, geospatial queries, and vector embeddings on your dataset, delivering robust functionality and flexibility for diverse data management needs.

The project comprises of two PostgreSQL primary components, which work together to support document operations.

* pg_documentdb_core : PostgreSQL extension introducing BSON datatype support and operations for native Postgres.
* pg_documentdb : The public API surface for DocumentDB providing CRUD functionality on documents in the store.

## Articles

- ["DocumentDB: Open-Source Announcement"](https://opensource.microsoft.com/blog/2025/01/23/documentdb-open-source-announcement/)

