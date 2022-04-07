title=OrioleDB
tags=storage
summary=A new storage engine for PostgreSQL, bringing a modern approach to database capacity, capabilities and performance to the world's most-loved database platform.
~~~~~~

[Source](https://github.com/orioledb/orioledb)

OrioleDB consists of an extension, building on the innovative table access
method framework and other standard Postgres extension interfaces. By extending
and enhancing the current table access methods, OrioleDB opens the door to
a future of more powerful storage models that are optimized for cloud and
modern hardware architectures.

OrioleDB is currently distributed under the standard PostgreSQL license.

1. Designed for modern hardware.  OrioleDB design avoids legacy CPU bottlenecks
   on modern servers containing dozens and hundreds CPU cores, providing
   optimized usage of modern storage technologies such as SSD and NVRAM.

2. Reduced maintenance needs.  OrioleDB implements the concepts of undo log
   and page-mergins, eliminating the need for dedicated garbage collection
   processes.  Additionally, OrioleDB implements default 64-bit transaction
   identifiers, thus eliminating the well-known and painful wraparound problem.

3. Designed to be distributed.  OrioleDB implements a row-level write-ahead
   log with support for parallel apply.  This log architecture is optimized
   for raft consensus-based replication allowing the implementation of
   active-active multimaster.

The key technical differentiations of OrioleDB are as follows:

1. No buffer mapping and lock-less page reading.  In-memory pages in OrioleDB
   are connected with direct links to the storage pages.  This eliminates the
   need for in-buffer mapping along with its related bottlenecks. Additionally,
   in OrioleDB in-memory page reading doesn't involve atomic operations.
   Together, these design decisions bring vertical scalability for Postgres
   to the whole new level.

2. MVCC is based on the UNDO log concept.  In OrioleDB, old versions of tuples
   do not cause bloat in the main storage system, but eviction into the undo
   log comprising undo chains.  Page-level undo records allow the system
   to easily reclaim space occupied by deleted tuples as soon as possible.
   Together with page-mergins, these mechanisms eliminate bloat in the majority
   of cases.  Dedicated VACUUMing of tables is not needed as well, removing
   a significant and common cause of system performance deterioration and
   database outages.

3. Copy-on-write checkpoints and row-level WAL.  OrioleDB utilizes
   copy-on-write checkpoints, which provides a structurally consistent snapshot
   of data every moment of time.  This is friendly for modern SSDs and allows
   row-level WAL logging.  In turn, row-level WAL logging is easy to
   parallelize (done), compact and suitable for active-active
   multimaster (planned).
