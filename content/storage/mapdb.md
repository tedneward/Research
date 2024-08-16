title=MapDB
tags=storage, jvm
summary=Provides concurrent Maps, Sets and Queues backed by disk storage or off-heap-memory. It is a fast and easy to use embedded Java database engine.
~~~~~~

[Website](https://mapdb.org/) | [Source](https://github.com/jankotek/mapdb/) | [Docs](https://jankotek.gitbooks.io/mapdb/content/)

Hello world:

```
//import org.mapdb.*
DB db = DBMaker.memoryDB().make();
ConcurrentMap map = db.hashMap("map").make();
map.put("something", "here");
```

