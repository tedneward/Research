title=WhiteDB
tags=storage, key-value, rdf, native
summary=A lightweight NoSQL database library written in C, operating fully in main memory.
~~~~~~

[Website](http://whitedb.org/) | [Source](https://github.com/priitj/whitedb)

### Project goals

* speed
* portability
* simplicity and small footprint
* low memory usage
* easy to use in embedded systems
* graph database applications
* extended rdf database applications
* fast interprocess communication
For the next version we're working on JSON support and a REST tool.

### Data storage
Data is kept in shared memory by default, making all the data accessible to separate processes.

Each database record is a tuple of N elements, encoded in WhiteDB-s simple compact format. You can store both conventional datatypes and direct pointers to records: the latter enables highly efficient traversal of complex data.

### Supported features

* indexes (T-tree)
* persistence through logging and memory dumps
* concurrency through locking
* limited queries (conjunctive only)
* CSV and RDF support
* Linux and Windows
* Python bindings
* command line utility tools

