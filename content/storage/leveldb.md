title=LevelDB
tags=storage, browser, embedded, keyvalue
summary=A very fast and lightweight, embedded database; part of the Chrome browser (exposed as IndexedDB).
~~~~~~

You are probably using LevelDB without knowing it since it's part of the Chrome browser (exposed as [IndexedDB](indexeddb.html)). If we compare it to Redis, it's even lighter, has more reliable writes and, unlike Redis, you don't store your entire data in memory but in the file system. Another difference is Redis has more data structures (sets, lists, etc.) that LevelDB is lacking. The similarity is that both store key-value pairs and both can save JSON. C/C++ library.

[Github](https://github.com/google/leveldb) | [Documentation](https://github.com/google/leveldb/blob/master/doc/index.md) is bundled with the source

## Features and limitations
Keys and values are arbitrary byte arrays.

Data is stored sorted by key.

Callers can provide a custom comparison function to override the sort order.

The basic operations are Put(key,value), Get(key), Delete(key).

Multiple changes can be made in one atomic batch.

Users can create a transient snapshot to get a consistent view of data.

Forward and backward iteration is supported over the data.

Data is automatically compressed using the Snappy compression library.

External activity (file system operations etc.) is relayed through a virtual interface so users can customize the operating system interactions.

This is not a SQL database. It does not have a relational data model, it does not support SQL queries, and it has no support for indexes.

Only a single process (possibly multi-threaded) can access a particular database at a time.

There is no client-server support builtin to the library. An application that needs such support will have to wrap their own server around the library.

What situations is it good for?
* Whenever you need an easy way to persist data without worrying about RAM but with speed very close to memory access
* Smartphones, Raspberry Pi or similar small device
* Offline web apps - if you use LevelDB on the server you might be able to use the same code for the browser storage ([IndexedDB](indexeddb.html))
* Building block for a database. LevelDB (or a variant) is used in BigTable, Hadoop’s HBase, Cassandra and Riak.

### Example (in NodeJS)

`npm install [levelup](https://www.npmjs.com/package/levelup)`: most popular node package for LevelDB

```
var levelup = require('levelup')
var db = levelup('./mydb')

db.put('post!' + Date.now(), {author: 'fred', title: 'Angular', content: '<p> bla bla bla </p>'}, {encoding:'json'}, function (err) {
  if (err) return console.log('Ooops!', err) // some kind of I/O error

  db.put('post!' + Date.now(), {author: 'fred', title: 'Responsive Design', content: '<p> blu blu blu </p>'}, {encoding:'json'}, function (err) {
    if (err) return console.log('Ooops!', err) // some kind of I/O error

    // to get a stream of all posts in reverse chronological order
    db.createReadStream({ reverse: true, encoding: 'json' })
     .on('data', function (data) {
        console.log(data.key, '=', data.value)
      })
      .on('error', function (err) {
        console.log('Oh my!', err)
      })
      .on('close', function () {
        console.log('Stream closed')
      })
      .on('end', function () {
        console.log('Stream ended')
      })
  })
});
```

API is very simple (basic CRUD ops). Keys must be unique, hence the use of Date.now() (which returns a ridiculous number of seconds representing now); keys are strings.

## Resources
* Podcast episode about LevelDB - http://nodeup.com/fortyone
* Blog post about LevelDB Internals - http://www.igvita.com/2012/02/06/sstable-and-log-structured-storage-leveldb/
* Slides by the creator of LevelUp - Rod Vagg - http://rvagg.github.com/presentations/nodejsdub/#/
* GUI for LevelDB, built by Paolo Fragomeni - https://github.com/hij1nx/levelweb

