title=MongoDB
tags=storage, document, network
summary=Document-oriented network storage.
~~~~~~

[Website](https://www.mongodb.com/) | [Source](https://github.com/mongodb/mongo) | [Docs](https://docs.mongodb.com/manual/) | [Cloud-hosted](https://www.mongodb.com/cloud/atlas)

["Fake Mongo", aka fongo](https://github.com/fakemongo/fongo): faked out in-memory mongo for java

## Books

* [Introduction to MongoDB](https://www.tutorialspoint.com/mongodb) - Tutorials Point
* [Learning MongoDB](https://riptutorial.com/Download/mongodb.pdf) - Based on Unaffiliated  Stack Overflow Documentation (PDF)
* [MongoDB Koans](https://github.com/chicagoruby/MongoDB_Koans)
* [MongoDB Notes for Professionals](https://goalkicker.com/MongoDBBook/) - Compiled from StackOverflow Documentation (PDF)
* [MongoDB Succinctly, Syncfusion](https://www.syncfusion.com/resources/techportal/ebooks/mongodb) (PDF, Kindle) (email address *requested*, not required)
* [The Little MongoDB Book](http://openmymind.net/2011/3/28/The-Little-MongoDB-Book/)

---

[Store a JS function on the server](https://docs.mongodb.com/manual/tutorial/store-javascript-function-on-server/): "(NOTE: There are performance limitations to running JavaScript inside of MongoDB.) There is a special system collection named `system.js` that can store JavaScript functions for reuse. To store a function, you can use the `db.collection.save()`, as in the following examples:
```
db.system.js.save(
   {
     _id: "echoFunction",
     value : function(x) { return x; }
   }
)

db.system.js.save(
   {
     _id : "myAddFunction" ,
     value : function (x, y){ return x + y; }
   }
);
```
Once you save a function in the `system.js` collection, you can use the function from any JavaScript context; e.g. `$where` operator, `mapReduce` command or `db.collection.mapReduce()`."

