title=LokiJS
tags=storage, ecmascript, browser, nodejs, document
summary=Super fast in-memory javascript document oriented database.
~~~~~~

[Website](http://techfort.github.io/LokiJS/) | [Source](https://github.com/techfort/LokiJS)

LokiJS is a document oriented database written in javascript, published under MIT License. Its purpose is to store javascript objects as documents in a nosql fashion and retrieve them with a similar mechanism. Runs in node (including cordova/phonegap and node-webkit), nativescript and the browser. LokiJS is ideal for the following scenarios:

* client-side in-memory db is ideal (e.g., a session store)
* performance critical applications
* cordova/phonegap mobile apps where you can leverage the power of javascript and avoid interacting with native databases
* data sets loaded into a browser page and synchronised at the end of the work session
* node-webkit desktop apps
* nativescript mobile apps that mix the power and ubiquity of javascript with native performance and ui

LokiJS supports indexing and views and achieves high-performance through maintaining unique and binary indexes (indices) for data.

If you're working in a node.js environment, run `npm install lokijs` and make sure to call `var loki = require('lokijs')`

Creating the db:

```
var db = new loki('Example');
```

Create a collection, specifying name, Type, index fields and whether the collection is transactional:

```
var users = db.addCollection('users', { indices: ['email'] });
// note that indices can be a single string or an array of strings
```

Note that indexes and transactional flag are optional parameters. Transactions in LokiJS simply allow you to run operations and automatically restore the database to the stage it was before the beginning of the transaction if an error occurred.

Add a bunch of users in the database:

```
var odin = users.insert( { name : 'odin', email: 'odin.soap@lokijs.org', age: 38 } );
var thor = users.insert( { name : 'thor', email : 'thor.soap@lokijs.org', age: 25 } );
var stan = users.insert( { name : 'stan', email : 'stan.soap@lokijs.org', age: 29 } );
var oliver = users.insert( { name : 'oliver', email : 'oliver.soap@lokijs.org', age: 31 } );
var hector = users.insert( { name : 'hector', email : 'hector.soap@lokijs.org', age: 15} );
var achilles = users.insert( { name : 'achilles', email : 'achilles.soap@lokijs.org', age: 31 } );
```

Operate an update:

```
stan.name = 'Stan Laurel';
// update object (this really only syncs the index)
users.update(stan);
```

DynamicViews (recommended approach):

```
var dv = users.addDynamicView('a_complex_view');
dv.applyWhere(function aCustomFilter(obj){
  return obj.name.length  < 5 && obj.age > 30;
});
//view the data
console.log(dv.data());

// apply some changes
users.insert({ name: 'ratatosk', email: 'rata@tosk.r', age: 10320 });
// behold the dynamicview updating itself by inspecting the data
console.log(dv.data());
```

'Where' filter functions:

```
function ageView(obj){
  return obj.age > 30;
}
// a little more complicated, users with names longer than 3 characters and age over 30
function aCustomFilter(obj){
  return obj.name.length  < 5 && obj.age > 30;
}

// test the filters
var result = users.where(ageView);
var anotherResult = users.where(aCustomFilter);
```

Map Reduce (live example on lokijs.org ):

```
function getDuration( obj ){
  return obj.complete ? null : obj.duration;
}


function getAverage( array ){
  var cumulator = 0;
  var i = array.length >>> 0;
  var actual = 0;
  while(i--){
    if(array[i] != null){
      cumulator += array[i];
      actual++;
    }
  }
  return ( cumulator / actual).toFixed(2);
}

var avgDuration = todos.mapReduce( getDuration, getAverage );
```

Querying via method chaining :

```
users.chain()
  .find({'age':{'$gt': 25}})
  .where(function(obj){ return obj.name.indexOf("in") != -1 })
  .simplesort("age")
  .offset(50)
  .limit(10)
  .data()
```

Simple named transform :

```
users.addTransform('progeny', [
  {
    type: 'find',
    value: {
      'age': {'$lte': 40}
    }
  },
  {
    type: 'simplesort',
    property: 'age',
    desc: true
  }
]);

var results = users.chain('progeny').data();
```

[Examples](https://github.com/techfort/LokiJS/tree/master/examples)

