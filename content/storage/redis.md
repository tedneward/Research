title=Redis
tags=storage, key-value
summary=An in-memory database that persists on disk. The data model is key-value, but many different kind of values are supported: Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, Bitmaps.
~~~~~~

[Website](http://redis.io/) | [Source](https://github.com/redis/redis)

Docker: `docker run -p 6379:6379 -it --rm redis`

[Commands](https://redis.io/commands/)

## [Docs](https://redis.io/docs/) (notes)
Redis is a data structure server. At its core, Redis provides a collection of native data types that help you solve a wide variety of problems, from caching to queuing to event processing.

### Keys
Redis keys are binary safe, this means that you can use any binary sequence as a key, from a string like "foo" to the content of a JPEG file. The empty string is also a valid key.

Very long keys are not a good idea. For instance a key of 1024 bytes is a bad idea not only memory-wise, but also because the lookup of the key in the dataset may require several costly key-comparisons. Even when the task at hand is to match the existence of a large value, hashing it (for example with SHA1) is a better idea, especially from the perspective of memory and bandwidth.

Very short keys are often not a good idea. There is little point in writing "u1000flw" as a key if you can instead write "user:1000:followers". The latter is more readable and the added space is minor compared to the space used by the key object itself and the value object. While short keys will obviously consume a bit less memory, your job is to find the right balance.

Try to stick with a schema. For instance "object-type:id" is a good idea, as in "user:1000". Dots or dashes are often used for multi-word fields, as in "comment:4321:reply.to" or "comment:4321:reply-to".

The maximum allowed key size is 512 MB.

### Strings
Redis strings are the most basic Redis data type, representing a sequence of bytes.

The Redis String type is the simplest type of value you can associate with a Redis key. It is the only data type in Memcached, so it is also very natural for newcomers to use it in Redis.

Since Redis keys are strings, when we use the string type as a value too, we are mapping a string to another string. The string data type is useful for a number of use cases, like caching HTML fragments or pages.



### Lists
Redis lists are lists of strings sorted by insertion order.

### Sets
Redis sets are unordered collections of unique strings that act like the sets from your favorite programming language (for example, Java HashSets, Python sets, and so on). With a Redis set, you can add, remove, and test for existence O(1) time (in other words, regardless of the number of set elements).

### Hashes
Redis hashes are record types modeled as collections of field-value pairs. As such, Redis hashes resemble Python dictionaries, Java HashMaps, and Ruby hashes.

### Sorted sets
Redis sorted sets are collections of unique strings that maintain order by each string's associated score.

### Streams
A Redis stream is a data structure that acts like an append-only log. Streams help record events in the order they occur and then syndicate them for processing.

### Geospatial indexes
Redis geospatial indexes are useful for finding locations within a given geographic radius or bounding box.

### Bitmaps
Redis bitmaps let you perform bitwise operations on strings.

### Bitfields
Redis bitfields efficiently encode multiple counters in a string value. Bitfields provide atomic get, set, and increment operations and support different overflow policies.

### HyperLogLog
The Redis HyperLogLog data structures provide probabilistic estimates of the cardinality (i.e., number of elements) of large sets.

### Extensions
To extend the features provided by the included data types, use one of these options:

* Custom server-side functions in Lua.
* Custom Redis modules using the modules API or check out the community-supported modules.
* Use JSON, querying, time series, and other capabilities provided by Redis Stack.

