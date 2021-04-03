title=Noms
tags=storage, distribution, relational
summary=The versioned, forkable, syncable database.
~~~~~~

[Source](https://github.com/attic-labs/noms)

Noms is a decentralized database philosophically descendant from the Git version control system.

Like Git, Noms is:

* Versioned: By default, all previous versions of the database are retained. You can trivially track how the database evolved to its current state, easily and efficiently compare any two versions, or even rewind and branch from any previous version.
* Synchronizable: Instances of a single Noms database can be disconnected from each other for any amount of time, then later reconcile their changes efficiently and correctly.

Unlike Git, Noms is a database, so it also:

* Primarily stores structured data, not files and directories (see: the Noms type system)
* Scales well to large amounts of data and concurrent clients
* Supports atomic transactions (a single instance of Noms is CP, but Noms is typically run in production backed by S3, in which case it is "effectively CA")
* Supports efficient indexes (see: Noms prolly-trees)
* Features a flexible query model (see: GraphQL)

A Noms database can reside within a file system or in the cloud:

* The (built-in) NBS ChunkStore implementation provides two back-ends which provide persistence for Noms databases: one for storage in a file system and one for storage in an S3 bucket.

Finally, because Noms is content-addressed, it yields a very pleasant programming model.

Working with Noms is declarative. You don't INSERT new data, UPDATE existing data, or DELETE old data. You simply declare what the data ought to be right now. If you commit the same data twice, it will be deduplicated because of content-addressing. If you commit almost the same data, only the part that is different will be written.
