title=Storage
type=categorypage
category=storage
summary=Everything to do with data storage, organization, query, and analysis.
~~~~~~

Storage is typically data, but the degree of structure is flexible. Unstructured storage is essentially a filesystem (although even then filesystems have structure to them). Structured storage is often called a "database system" in some particular shape.

## "Shapes" to data

### [Relational](/tags/relational.html)

Built, more or less, on the Codd model of relationships between tuples of data.

### [Document-oriented](/tags/document.html)

Structure is conceptually "star"-like, with minimal (or no) relationships outside of the document recognized by the storage system. (Developers can, and usually will, store unique data elements across documents as a way of putting structure in at the application level, but this is typically unrecognized by the storage system itself.)

MongoDB

### Graph-oriented

Neo4J

### Column-oriented (columnar)

### [Key-value store](/tags/keyvalue.html)

## Topology options

### [Network](/tags/network.html) access
One makes network calls to access the storage engine. Most storage engines follow this model, whether inside of the same network (a la "on-prem") or cloud.

### [Embedded](/tags/embedded.html)
The storage engine is access in-process inside of the using program. Often cannot be accessed by other running programs. Often managing files directly, and the storage engine shuts down when the host process does. Excellent for standalone, self-contained installations that have no external dependencies beyond the fileystem. Fastest of all the relationships, with possible exception of code hosted inside the database (a la stored procedures).

### [Code hosting](/tags/code-hosting.html)
Some storage engines also allow for code-hosting, in which code executes inside the same process(es) as the storage engine itself, a la "stored procedures".

