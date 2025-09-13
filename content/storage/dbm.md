title=DBM
tags=storage, key-value, native
summary=A concept of libraries to store an associative array on a permanent storage.
~~~~~~

DBM allows an application program to store key-value pairs in a file and reuse them later. Each of keys and values is a string or a sequence of bytes. The key of each record must be unique within the database and a value is associated to it. You can retrieve a stored record with its key very quickly. Thanks to simple structure of DBM, its performance can be extremely high.

## Implementations

- C++: [Tkrzw: a set of implementations of DBM](https://dbmx.net/tkrzw/): "Tkrzw is a C++ library implementing DBM with various algorithms. It features high degrees of performance, concurrency, scalability and durability. The following classes are provided.

    * HashDBM : File database manager implementation based on hash table.
    * TreeDBM : File database manager implementation based on B+ tree.
    * SkipDBM : File database manager implementation based on skip list.
    * TinyDBM : On-memory database manager implementation based on hash table.
    * BabyDBM : On-memory database manager implementation based on B+ tree.
    * CacheDBM : On-memory database manager implementation with LRU deletion.
    * Std(Hash|Tree)DBM : On-memory DBM implementations using std::unordered_map and std::map.
    * (Poly|Shard)DBM : Polymorphic and sharding database manager adapters.
    * AsyncDBM : Asynchronous database manager adapter.
    * (File|Mem)Index : Secondary index implementations.

    "You can use some bridging interfaces to use Tkrzw in other programming languages than C++. Currently, C, Java, Python, Ruby, and Go interfaces are provided. The C interface is bundled in the main package. The other interfaces are packaged separately."

- C++: [Kyoto Cabinet](https://dbmx.net/kyotocabinet/)
- C: [Tokyo Cabinet](https://dbmx.net/tokyocabinet/)

