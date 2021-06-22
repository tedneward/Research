title=PouchDB
tags=storage, browser, nodejs, object
summary=Open-source JavaScript database inspired by CouchDB.
~~~~~~

[Website](http://pouchdb.com) | [Source](https://github.com/pouchdb/pouchdb)

PouchDB databases come in two flavors: local and remote.

To create a local database, you simply call new PouchDB and give it a name:

    var db = new PouchDB('kittens');

To create a remote database, you call new PouchDB and give it a path to a database in CouchDB.

    var db = new PouchDB('http://localhost:5984/kittens');

You can see basic information about the database by using the info() method.

    db.info().then(function (info) {
      console.log(info);
    })

The local database should show something like:

    {"doc_count":0,"update_seq":0,"db_name":"kittens"}

The remote database may have a bit more information:

    {"db_name":"kittens","doc_count":0,"doc_del_count":0,"update_seq":0,"purge_seq":0,"compact_running":false,"disk_size":79,"data_size":0,"instance_start_time":"1410722558431975","disk_format_version":6,"committed_update_seq":0}

You can also enable debug logging by doing:

    PouchDB.debug.enable('*');

And then disable it by doing:

    PouchDB.debug.disable();

During development, it's often useful to destroy the local database, so you can see what your users will experience when they visit your site for the first time. A page refresh is not enough, because the data will still be there!

In Chrome, you can use the Clear Cache extension, which will add a trashcan icon to your toolbar, which you can click to delete all local data (IndexedDB, WebSQL, LocalStorage, cookies, etc.).

In Firefox, you can use the Clear Recent History+ add-on, so when you right-click a page you can quickly clear all data.

In Safari, you can simply click Safari → Clear History and Website Data.

When you create a local PouchDB database, it uses whatever underlying datastore is available - IndexedDB in most browsers, WebSQL in older browsers, and LevelDB in Node.js.

When you create a remote PouchDB database, it communicates directly with the remote database – CouchDB, Cloudant, Couchbase, etc.

The goal of PouchDB is to allow you to seamlessly communicate with one or the other. You should not notice many differences between the two, except that of course the local one is much faster!

To store a document, you simply put it:

    var doc = {
      "_id": "mittens",
      "name": "Mittens",
      "occupation": "kitten",
      "age": 3,
      "hobbies": [
        "playing with balls of yarn",
        "chasing laser pointers",
        "lookin' hella cute"
      ]
    };
    db.put(doc);

Whenever you put() a document, it must have an _id field so that you can retrieve it later.

So now let's get() the document by using its _id:

    db.get('mittens').then(function (doc) {
      console.log(doc);
    });

You should see:

    {
      "name": "Mittens",
      "occupation": "kitten",
      "age": 3,
      "hobbies": [
        "playing with balls of yarn",
        "chasing laser pointers",
        "lookin' hella cute"
      ],
      "_id": "mittens",
      "_rev": "1-bea5fa18e06522d12026f4aee6b15ee4"
    }

The document looks exactly the same as when we put it, except... aha! What is this? There is a new field, _rev, the revision marker. It is a randomly-generated ID that changes whenever a document is created or updated.

For instance, to increment Mittens' age to 4, we would do:

    doc.age = 4;
    doc._rev = "1-bea5fa18e06522d12026f4aee6b15ee4";
    db.put(doc);

If you fail to include the correct _rev, you will get the following sad error:

    {
      "status": 409,
      "name": "conflict",
      "message": "Document update conflict"
    }

HTTP 409 is a standard HTTP error message that indicates a conflict.

So to update Mittens' age, we will first need to fetch Mittens from the database, to ensure that we have the correct _rev before we put them back. We don't need to manually assign the _rev value here (like we did above), as it is already in the doc we're fetching.

    // fetch mittens
    db.get('mittens').then(function (doc) {
      // update their age
      doc.age = 4;
      // put them back
      return db.put(doc);
    }).then(function () {
      // fetch mittens again
      return db.get('mittens');
    }).then(function (doc) {
      console.log(doc);
    });

Now you should see the following:

    {
      "name": "Mittens",
      "occupation": "kitten",
      "age": 4,
      "hobbies": [
        "playing with balls of yarn",
        "chasing laser pointers",
        "lookin' hella cute"
      ],
      "_id": "mittens",
      "_rev": "2-3e3fd988b331193beeeea2d4221b57e7"
    }

As you can see, we have successfully updated Mittens' age to 4 (they grow up so fast!), and their revision marker has also changed to "2-3e3fd988b331193beeeea2d4221b57e7". If we wanted to increment their age to 5, we would need to supply this new revision marker.

PouchDB provides a fully asynchronous API. This ensures that when you talk to PouchDB, the UI doesn't stutter, because the DOM is not being blocked by database operations. To make things as flexible as possible for PouchDB users, the API is provided in both callback format and promise format.

The callback format looks like this:

    db.get('mittens', function (error, doc) {
      if (error) {
        // oh noes! we got an error
      } else {
        // okay, doc contains our document
      }
    });

The promise format looks like this:

    db.get('mittens').then(function (doc) {
      // okay, doc contains our document
    }).catch(function (err) {
      // oh noes! we got an error
    });

Basically, if you include a callback as the last argument in a function, then PouchDB assumes you want the callback style. Otherwise it assumes you want the promise style.

The big advantage of working with Promises in asynchronous code is that you can always attach a catch function to the end of a big promise chain, and any errors that occur along the way will show up at the end.

This avoids endless if (err) {} checking in the callback world:

    doSomething(function (err, result) {
      if (err) {
        // handle error
      }
      doSomethingElse(function (err, result) {
        if (err) {
          // handle error again...
        }
        doSomethingYetAgain(function (err, result) {
          if (err) {
            // seriously? okay, handle error again...
          }
        });
      });
    });

Instead, in the promise world, you can have a long chain of asynchronous operations with a single catch at the end. To use PouchDB as an example:

    db.put({_id: 'charlie', age: 21}).then(function () {
      return db.get('charlie');
    }).then(function (charlie) {
      // increment Charlie's age
      charlie.age++;
      return db.put(charlie);
    }).then(function () {
      return db.get('charlie');
    }).then(function (charlie) {
      // increment Charlie's age again
      charlie.age++;
      return db.put(charlie);
    }).then(function () {
      return db.get('charlie');
    }).then(function (charlie) {
      console.log(charlie);
    }).catch(function (err) {
      console.log(err);
    });

You should see:

    {"age":23,"_id":"charlie","_rev":"3-e794618b4e39ed566cc68b56f5426e8e"}

You can see a live example of this code.

In this example, we put/get a document 3 times in a row. At the very end, there is a catch() statement to catch any errors along the way.

What kind of errors might we run into? Well, let's imagine that we accidentally misspell the id 'charlie' at some point. In this case, we will gracefully catch the error. Here's another live example.

You should see:

    {"status":404,"name":"not_found","message":"missing"}

This is really nice! No matter where the misspelling is, the error can be handled within a single function. That's much nicer than having to do if (err){} an endless number of times!

If you've been doing promises for awhile, you might have seen this instead:

    db.get('charlie').then(function (charlie) {
      // we got the charlie doc
    }, function (err) {
      // we got an error
    })

This is equivalent to:

    db.get('charlie').then(function (charlie) {
      // we got the charlie doc
    }).catch(function (err) {
      // we got an error
    })

The catch() method is just syntactic sugar. You can use either format.

Often in our code, we'll want to get() a document, and if it doesn't exist, we want to create some default. For instance, let's say we have a configuration object. We want to provide some reasonable defaults for our config:

    {
      _id: 'config',
      background: 'blue',
      foreground: 'white',
      sparkly: 'false'
    }

This is a pretty good default setting! So let's write the code to set it as our default.

Thankfully, promises make this rather easy:

    db.get('config').catch(function (err) {
      if (err.name === 'not_found') {
        return {
          _id: 'config',
          background: 'blue',
          foreground: 'white',
          sparkly: 'false'
        };
      } else { // hm, some other error
        throw err;
      }
    }).then(function (configDoc) {
      // sweet, here is our configDoc
    }).catch(function (err) {
      // handle any errors
    });

This code is doing the following:

* Try to get() a doc with _id equal to 'config'
* If it doesn't find it, return the default doc
* Otherwise, you'll just get back the existing document

A common question from new PouchDB/CouchDB users is: why do we have to deal with _rev at all? Why can't I just put() the document without providing a _rev?

The answer is: because _revs are what makes sync work so well. PouchDB asks for a little upfront effort with managing document revisions, so that later on, sync is a breeze.

In fact, you are probably already familiar with a system that forces you to go through a similar dance. This system is called Git.

PouchDB and CouchDB's document revision structure is very similar to Git's. In fact, each document's revision history is stored as a tree (exactly like Git), which allows you to handle conflicts when any two databases get out of sync.

    rev 3-a  rev 3-b
          \___/
            |
          rev 2
            |
          rev 1

Conflicts will be discussed later in this guide. For now, you can think of revisions as being a single lineage:

      rev 4
        |
      rev 3
        |
      rev 2
        |
      rev 1

When you remove() a document, it's not really deleted; it just gets a _deleted attribute added to it.

That is, the database saves a tombstone at the end of the revision tree.

    {_id: 'foo', _rev: '4-z', _deleted: true}
                |
    {_id: 'foo', _rev: '3-y'}
                |
    {_id: 'foo', _rev: '2-x'}
                |
    {_id: 'foo', _rev: '1-w'}

There are three ways of deleting a document, which are all equivalent:

1) You can call db.remove(doc):

    db.get('mydoc').then(function (doc) {
      return db.remove(doc);
    });

2) You can call db.remove(doc._id, doc._rev):

    db.get('mydoc').then(function (doc) {
      return db.remove(doc._id, doc._rev);
    });

3) You can call db.put(doc) with _deleted set to true:

    db.get('mydoc').then(function (doc) {
      doc._deleted = true;
      return db.put(doc);
    });

Of course, you will want to add catch() to the end of all these, unless you like to live dangerously.

You can get(), put(), and remove() single documents to your heart's content, but a database isn't a database unless it can handle many operations at once!

PouchDB provides two methods for bulk operations - bulkDocs() for bulk writes, and allDocs() for bulk reads.

Attachments are where PouchDB can get really fun. The big difference between storage engines like WebSQL/IndexedDB and the older localStorage API is that you can stuff a lot more data in it. PouchDB attachments allow you to use that to full advantage to store images, MP3s, zip files, or whatever you want. As their name implies, attachments are attached to documents. You can work with attachments either in base64-encoded format, or as a Blob.

For example, here is a very simple document with a plain text attachment, stored as base64.

    db.put({
      _id: 'mydoc',
      _attachments: {
        'myattachment.txt': {
          content_type: 'text/plain',
          data: 'aGVsbG8gd29ybGQ='
        }
      }
    });

Our document has the usual _id field, but it also has a special _attachments field that holds the attachments. Documents can have as many attachments as you want.

As it turns out, 'aGVsbG8gd29ybGQ=' is just the string 'hello world' encoded in base64. You can use the atob() and btoa() methods in your browser to verify.

btoa('hello world')      // "aGVsbG8gd29ybGQ="
atob('aGVsbG8gd29ybGQ=') // "hello world"
Let's see what happens after we store this document. If you try to get() it normally, you may be surprised to see that the attachment data itself isn't returned:

db.get('mydoc').then(function (doc) {
  console.log(doc);
});
The returned document will look like this:

{
  "_attachments": {
    "myattachment.txt": {
      "content_type": "text/plain",
      "digest": "md5-XrY7u+Ae7tCTyyK7j1rNww==",
      "stub": true
    }
  },
  "_id": "mydoc",
  "_rev": "1-e8a84187bb4e671f27ec11bdf7320aaa"
}
You can see a live example of this code.

By default, PouchDB will only give you an attachment stub, which contains a digest, i.e. the md5sum of the binary attachment.

To get the full attachments when using get() or allDocs(), you need to specify {attachments: true}:

db.get('mydoc', {attachments: true}).then(function (doc) {
  console.log(doc);
});
Then you'll get back the full attachment, base64-encoded:

{
  "_attachments": {
    "myattachment.txt": {
      "content_type": "text/plain",
      "digest": "md5-XrY7u+Ae7tCTyyK7j1rNww==",
      "data": "aGVsbG8gd29ybGQ="
    }
  },
  "_id": "mydoc",
  "_rev": "1-e8a84187bb4e671f27ec11bdf7320aaa"
}
You can see a live example of this code.

Plaintext is cool and all, but you know what would be really awesome? Storing images.

So let's do it! In this example, we'll put a document with a small icon attachment, represented as a base64-encoded string. Then we'll fetch it and display the icon as a normal <img> tag:

    db.put({
      _id: 'meowth',
      _attachments: {
        'meowth.png': {
          content_type: 'image/png',
          data: 'iVBORw0KGgoAAAANSUhEUgAAACgAAAAkCAIAAAB0Xu9BAAAABGdBTUEAALGPC/xhBQAAAuNJREFUWEetmD1WHDEQhDdxRMYlnBFyBIccgdQhKVcgJeQMpE5JSTd2uqnvIGpVUqmm9TPrffD0eLMzUn+qVnXPwiFd/PP6eLh47v7EaazbmxsOxjhTT88z9hV7GoNF1cUCvN7TTPv/gf/+uQPm862MWTL6fff4HfDx4S79/oVAlAUwqOmYR0rnazuFnhfOy/ErMKkcBFOr1vOjUi2MFn4nuMil6OPh5eGANLhW3y6u3aH7ijEDCxgCvzFmimvc95TekZLyMSeJC68Bkw0kqUy1K87FlpGZqsGFCyqEtQNDdFUtFctTiuhnPKNysid/WFEFLE2O102XJdEE+8IgeuGsjeJyGHm/xHvQ3JtKVsGGp85g9rK6xMHtvHO9+WACYjk5vkVM6XQ6OZubCJvTfPicYPeHO2AKFl5NuF5UK1VDUbeLxh2BcRGKTQE3irHm3+vPj6cfCod50Eqv5QxtwBQUGhZhbrGVuRia1B4MNp6edwBxld2sl1splfHCwfsvCZfrCQyWmX10djjOlWJSSy3VQlS6LmfrgNvaieRWx1LZ6s9co+P0DLsy3OdLU3lWRclQsVcHJBcUQ0k9/WVVrmpRzYQzpgAdQcAXxZzUnFX3proannrYH+Vq6KkLi+UkarH09mC8YPr2RMWOlEqFkQClsykGEv7CqCUbXcG8+SaGvJ4a8d4y6epND+pEhxoN0vWUu5ntXlFb5/JT7JfJJqoTdy9u9qc7ax3xJRHqJLADWEl23cFWl4K9fvoaCJ2BHpmJ3s3z+O0U/DmzdMjB9alWZtg4e3yxzPa7lUR7nkvxLHO9+tvJX3mtSDpwX8GajB283I8R8a7D2MhUZr1iNWdny256yYLd52DwRYBtRMvE7rsmtxIUE+zLKQCDO4jlxB6CZ8M17GhuY+XTE8vNhQiIiSE82ZsGwk1pht4ZSpT0YVpon6EvevOXXH8JxVR78QzNuamupW/7UB7wO/+7sG5V4ekXb4cL5Lyv+4IAAAAASUVORK5CYII='
        }
      }
    }).then(function () {
      return db.getAttachment('meowth', 'meowth.png');
    }).then(function (blob) {
      var url = URL.createObjectURL(blob);
      var img = document.createElement('img');
      img.src = url;
      document.body.appendChild(img);
    }).catch(function (err) {
      console.log(err);
    });

You should be unsurprised to see a cat smiling back at you. If the kitten theme bothers you, then you haven't been on the Internet very long.

How does this code work? First off, we are making use of the URL.createObjectURL() method, which is a standard HTML5 method that converts a Blob to a URL that we can easily use as the src of an img.

Second off, we are using the getAttachment() API, which returns a Blob rather than a base64-encoded string. To be clear: we can always convert between base64 and Blobs, but in this case, getAttachment() is just more convenient.

Up to now, we've been supplying our attachments as base64-encoded strings. But we can also create the Blobs ourselves and store those directly in PouchDB.

Another shortcut we can use is the putAttachment() API, which simply modifies the existing document to hold a new attachment. Or, if the document does not exist, it will create an empty one.

In Node.js, PouchDB uses Buffers instead of Blobs. Otherwise, the same rules apply.
For instance, we can read the image data from an <img> tag using a canvas element, and then directly write that Blob to PouchDB:

    function convertImgToBlob(img, callback) {
      var canvas = document.createElement('canvas');
      var context = canvas.getContext('2d');
      context.drawImage(img, 0, 0);

        // Warning: toBlob() isn't supported by every browser.
        // You may want to use blob-util.
      canvas.toBlob(callback, 'image/png');
    }

    var catImage = document.getElementById('cat');
    convertImgToBlob(catImage, function (blob) {
      db.putAttachment('meowth', 'meowth.png', blob, 'image/png').then(function () {
        return db.get('meowth', {attachments: true});
      }).then(function (doc) {
        console.log(doc);
      });
    });

This stores exactly the same image content as in the other example, which you can confirm by checking the base64-encoded output.

Blobs can be tricky to work with, especially when it comes to cross-browser support. You may find blob-util to be a useful addition to the attachment API. For instance, it has an imgSrcToBlob() method that will work cross-browser.

You can also upload a file with the HTML5 File API and store it directly in the database, because the data you get from the <input type="file"> element is already a Blob. (See: Blob API and File API, which inherits properties from the Blob Interface.)

Here is an example of allowing a user to choose a file from their filesystem:

    <input type="file">

And then "uploading" that file directly into PouchDB:

    var input = document.querySelector('input');
    input.addEventListener('change', function () {
      var file = input.files[0]; // file is a Blob

      db.put({
        _id: 'mydoc',
        _attachments: {
          filename: {
            type: file.type,
            data: file
          }
        }
      }).catch(function (err) {
        console.log(err);
      });
    });

Select a file and you will see the stored file, size, and type, which are valid Blob properties. If you choose an image, it will also show the image!

Whether you supply attachments as base64-encoded strings or as Blobs/Buffers, PouchDB will try to store them in the most efficient way.

So when you insert your attachments, either format is acceptable. For instance, you can put Blobs/Buffers using put():

    db.put({
      _id: 'mydoc',
      _attachments: {
        'myattachment.txt': {
          content_type: 'text/plain',
          data: myBlob
        }
      }
    });

And you can also pass base64-encoded strings to putAttachment():

    db.putAttachment('mydoc', 'myattachment.png', myBase64String, 'image/png');

You can also insert multiple attachments at once using put():

    db.put({
      _id: 'mydoc',
      _attachments: {
        'myattachment1.txt': {
          content_type: 'text/plain',
          data: myBlob1
        },
        'myattachment2.txt': {
          content_type: 'text/plain',
          data: myBlob2
        },
        'myattachment3.txt': {
          content_type: 'text/plain',
          data: myBlob3
        },
        // etc.
      }
    });

The bulkDocs() and post() APIs also accept attachments in either format.

When you fetch attachments, however, getAttachment() will always return Blobs/Buffers.

The other "read" APIs, such as get(), allDocs(), changes(), and query() have an {attachments: true} option that returns the attachments base64-encoded strings. If you add {binary: true}, though, they will return Blobs/Buffers.

Performance tip: If you can insert and retrieve your attachments using only Blobs/Buffers, then you will typically get better performance, especially when it comes to memory usage. The base64 string format is mostly provided for developer convenience and debugging.

Blobs have their own type, but there is also a content_type that you specify when you store it in PouchDB:

    var myBlob = new Blob(['I am plain text!'], {type: 'text/plain'});
    console.log(myBlob.type); // 'text/plain'

    db.put({
      _id: 'mydoc',
      _attachments: {
        'myattachment.txt': {
          content_type: 'text/plain',
          data: myBlob
        }
      }
    });

The reason for this redundancy is 1) Buffers in Node do not have a type, and 2) the CouchDB attachment format requires it.

So for best results, you should ensure that your Blobs have the same type as the one reported to PouchDB. Otherwise you may see inconsistent behavior (e.g. in IndexedDB, where the Blob is stored as-is on compatible browsers).

PouchDB and CouchDB were designed for one main purpose: sync. Jason Smith has a great quote about this:

> The way I like to think about CouchDB is this: CouchDB is bad at everything, except syncing. And it turns out that's the most important feature you could ever ask for, for many types of software."

When you first start using CouchDB, you may become frustrated because it doesn't work quite like other databases. Unlike most databases, CouchDB requires you to manage revisions (_rev), which can be tedious.

However, CouchDB was designed with sync in mind, and this is exactly what it excels at. Many of the rough edges of the API serve this larger purpose. For instance, managing your document revisions pays off in the future, when you eventually need to start dealing with conflicts.

CouchDB sync has a unique design. Rather than relying on a master/follower architecture, CouchDB supports a multi-master architecture. You can think of this as a system where any node can be written to or read from, and where you don't have to care which one is the "master" and which one is the "follower." In CouchDB's egalitarian world, every citizen is as worthy as another.

When you use PouchDB, CouchDB, and other members of the Couch family, you don't have to worry which database is the "single source of truth." They all are. According to the CAP theorem, a database can only have at most 2 of 3 properties: Consistency, Availability, or Partition-Tolerance. Typical relational databases such as MySQL are CP, which means they are consistent and tolerant to node partitions, at the expense of availability. CouchDB is an AP database, meaning that it's Partition-Tolerant, every node is Available at all times, but it's only eventually Consistent.

To illustrate, imagine a multi-node architecture with CouchDB servers spread across several continents. As long as you're willing to wait, the data will eventually flow from Australia to Europe to North America to wherever. Users around the world running PouchDB in their browsers or Couchbase Lite/Cloudant Sync in their smartphones experience the same privileges. The data won't show up instantaneously, but depending on the Internet connection speed, it's usually close enough to real-time.

In cases of conflict, CouchDB will choose an arbitrary winner that every node can agree upon deterministically. However, conflicts are still stored in the revision tree (similar to a Git history tree), which means that app developers can either surface the conflicts to the user, or just ignore them.

In this way, CouchDB replication "just works."

As you already know, you can create either local PouchDBs:

    var localDB = new PouchDB('mylocaldb')

or remote PouchDBs:

    var remoteDB = new PouchDB('http://localhost:5984/myremotedb')

This pattern comes in handy when you want to share data between the two.

The simplest case is unidirectional replication, meaning you just want one database to mirror its changes to a second one. Writes to the second database, however, will not propagate back to the master database.

To perform unidirectional replication, you simply do:

    localDB.replicate.to(remoteDB).on('complete', function () {
      // yay, we're done!
    }).on('error', function (err) {
      // boo, something went wrong!
    });

Congratulations, all changes from the localDB have been replicated to the remoteDB.

However, what if you want bidirectional replication? You could do:

    localDB.replicate.to(remoteDB);
    localDB.replicate.from(remoteDB);

However, to make things easier for your poor tired fingers, PouchDB has a shortcut API:

    localDB.sync(remoteDB);

These two code blocks above are equivalent. And the sync API supports all the same events as the replicate API:

    localDB.sync(remoteDB).on('complete', function () {
      // yay, we're in sync!
    }).on('error', function (err) {
      // boo, we hit an error!
    });

Live replication (or "continuous" replication) is a separate mode where changes are propagated between the two databases as the changes occur. In other words, normal replication happens once, whereas live replication happens in real time.

To enable live replication, you simply specify {live: true}:

    localDB.sync(remoteDB, {
      live: true
    }).on('change', function (change) {
      // yo, something changed!
    }).on('error', function (err) {
      // yo, we got an error! (maybe the user went offline?)
    });

However, there is one gotcha with live replication: what if the user goes offline? In those cases, an error will be thrown and replication will stop.

You can allow PouchDB to automatically handle this error, and retry until the connection is re-established, by using the retry option:

    localDB.sync(remoteDB, {
      live: true,
      retry: true
    }).on('change', function (change) {
      // yo, something changed!
    }).on('paused', function (info) {
      // replication was paused, usually because of a lost connection
    }).on('active', function (info) {
      // replication was resumed
    }).on('error', function (err) {
      // totally unhandled error (shouldn't happen)
    });

This is ideal for scenarios where the user may be flitting in and out of connectivity, such as on mobile devices.

Sometimes, you may want to manually cancel replication – for instance, because the user logged out. You can do so by calling cancel() and then waiting for the 'complete' event:

    var syncHandler = localDB.sync(remoteDB, {
      live: true,
      retry: true
    });

    syncHandler.on('complete', function (info) {
      // replication was canceled!
    });

    syncHandler.cancel(); // <-- this cancels it

The replicate API also supports canceling:

    var replicationHandler = localDB.replicate.to(remoteDB, {
      live: true,
      retry: true
    });

    replicationHandler.on('complete', function (info) {
      // replication was canceled!
    });

    replicationHandler.cancel(); // <-- this cancels it

One thing to note about replication is that it tracks the data within a database, not the database itself. If you destroy() a database that is being replicated to, the next time the replication starts it will transfer all of the data again, recreating the database to the state it was before it was destroyed. If you want the data within the database to be deleted you will need to delete via remove() or bulkDocs(). The pouchdb-erase plugin can help you remove the entire contents of a database.

Any PouchDB object can replicate to any other PouchDB object. So for instance, you can replicate two remote databases, or two local databases. You can also replicate from multiple databases into a single one, or from a single database into many others.

This can be very powerful, because it enables lots of fancy scenarios. For example:

You have an in-memory PouchDB that replicates with a local PouchDB, acting as a cache.

You have many remote CouchDB databases that the user may access, and they are all replicated to the same local PouchDB.

You have many local PouchDB databases, which are mirrored to a single remote CouchDB as a backup store.

The only limits are your imagination and your disk space.
