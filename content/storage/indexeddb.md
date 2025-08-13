title=IndexedDB
tags=storage, browser, embedded, key-value, document
summary=A low-level API for client-side storage of significant amounts of structured data, including files/blobs. This API uses indexes to enable high-performance searches of this data.
~~~~~~

"IndexedDB is a transactional database system, like an SQL-based RDBMS. However, unlike SQL-based RDBMSes, which use fixed-column tables, IndexedDB is a JavaScript-based object-oriented database. IndexedDB lets you store and retrieve objects that are indexed with a key; any objects supported by the structured clone algorithm can be stored. You need to specify the database schema, open a connection to your database, and then retrieve and update data within a series of transactions."

[Specification](https://w3c.github.io/IndexedDB/) | [Reference](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API) 

## Using

### Open the database
```
// Let us open our database
const request = window.indexedDB.open("MyTestDatabase", 3);
```

The open request doesn't open the database or start the transaction right away. The call to the open() function returns an IDBOpenDBRequest object with a result (success) or error value that you handle as an event. Most other asynchronous functions in IndexedDB do the same thing - return an IDBRequest object with the result or error. The result for the open function is an instance of an IDBDatabase.

The second parameter to the open method is the version of the database. The version of the database determines the database schema — the object stores in the database and their structure. If the database doesn't already exist, it is created by the open operation, then an `onupgradeneeded` event is triggered and you create the database schema in the handler for this event. If the database does exist but you are specifying an upgraded version number, an `onupgradeneeded` event is triggered straight away, allowing you to provide an updated schema in its handler. More on this later in "Creating or updating the version of the database" below, and the [`IDBFactory.open`](https://developer.mozilla.org/en-US/docs/Web/API/IDBFactory/open) page.

Warning: The version number is an `unsigned long long` number, which means that it can be a very big integer. It also means that you can't use a float, otherwise it will be converted to the closest lower integer and the transaction may not start, nor the upgradeneeded event trigger. So for example, don't use 2.4 as a version number: `const request = indexedDB.open("MyTestDatabase", 2.4); // don't do this, as the version will be rounded to 2`

#### Generating handlers
```
request.onerror = (event) => {
  // Do something with request.error!
};
request.onsuccess = (event) => {
  // Do something with request.result!
};
```

If the request succeeds, the success event is fired, and the function assigned to onsuccess is called. If the request fails, the error event is fired, and the function assigned to onerror is called.

The IndexedDB API is designed to minimize the need for error handling, so you're not likely to see many error events (at least, not once you're used to the API!). In the case of opening a database, however, there are some common conditions that generate error events. The most likely problem is that the user decided not to give your web app permission to create a database. One of the main design goals of IndexedDB is to allow large amounts of data to be stored for offline use. (To learn more about how much storage you can have for each browser, see How much data can be stored? on the Browser storage quotas and eviction criteria page.)

Obviously, browsers do not want to allow some advertising network or malicious website to pollute your computer, so browsers used to prompt the user the first time any given web app attempts to open an IndexedDB for storage. The user could choose to allow or deny access. Also, IndexedDB storage in browsers' privacy modes only lasts in-memory until the incognito session is closed.

Now, assuming that the user allowed your request to create a database, and you've received a success event to trigger the success callback; What's next? The request here was generated with a call to indexedDB.open(), so request.result is an instance of IDBDatabase, and you definitely want to save that for later.

#### Handling errors
As mentioned above, error events bubble. Error events are targeted at the request that generated the error, then the event bubbles to the transaction, and then finally to the database object. If you want to avoid adding error handlers to every request, you can instead add a single error handler on the database object, like so:

```
db.onerror = (event) => {
  // Generic error handler for all errors targeted at this database's
  // requests!
  console.error(`Database error: ${event.target.error?.message}`);
};
```

One of the common possible errors when opening a database is VER_ERR. It indicates that the version of the database stored on the disk is greater than the version that you are trying to open. This is an error case that must always be handled by the error handler.

#### Creating or updating the version of the database
When you create a new database or increase the version number of an existing database (by specifying a higher version number than you did previously, when Opening a database), the onupgradeneeded event will be triggered and an IDBVersionChangeEvent object will be passed to any onversionchange event handler set up on request.result (i.e., db in the example). In the handler for the upgradeneeded event, you should create the object stores needed for this version of the database:

```
// This event is only implemented in recent browsers
request.onupgradeneeded = (event) => {
  // Save the IDBDatabase interface
  const db = event.target.result;

  // Create an objectStore for this database
  const objectStore = db.createObjectStore("name", { keyPath: "myKey" });
};
```

In this case, the database will already have the object stores from the previous version of the database, so you do not have to create these object stores again. You only need to create any new object stores, or delete object stores from the previous version that are no longer needed. If you need to change an existing object store (e.g., to change the keyPath), then you must delete the old object store and create it again with the new options. (Note that this will delete the information in the object store! If you need to save that information, you should read it out and save it somewhere else before upgrading the database.)

Trying to create an object store with a name that already exists (or trying to delete an object store with a name that does not already exist) will throw an error.

If the onupgradeneeded event exits successfully, the onsuccess handler of the open database request will then be triggered.

#### Structuring the database
Now to structure the database. IndexedDB uses object stores rather than tables, and a single database can contain any number of object stores. Whenever a value is stored in an object store, it is associated with a key. There are several different ways that a key can be supplied depending on whether the object store uses a key path or a key generator.

The following table shows the different ways the keys are supplied:

Key Path (keyPath) | Key Generator (autoIncrement) | Description
------------------ | ----------------------------- | -----------
No | No | This object store can hold any kind of value, even primitive values like numbers and strings. You must supply a separate key argument whenever you want to add a new value.
Yes | No | This object store can only hold JavaScript objects. The objects must have a property with the same name as the key path.
No | Yes | This object store can hold any kind of value. The key is generated for you automatically, or you can supply a separate key argument if you want to use a specific key.
Yes | Yes | This object store can only hold JavaScript objects. Usually a key is generated and the value of the generated key is stored in the object in a property with the same name as the key path. However, if such a property already exists, the value of that property is used as key rather than generating a new key.

You can also create indices on any object store, provided the object store holds objects, not primitives. An index lets you look up the values stored in an object store using the value of a property of the stored object, rather than the object's key.

Additionally, indexes have the ability to enforce simple constraints on the stored data. By setting the unique flag when creating the index, the index ensures that no two objects are stored with both having the same value for the index's key path. So, for example, if you have an object store which holds a set of people, and you want to ensure that no two people have the same email address, you can use an index with the unique flag set to enforce this.

That may sound confusing, but this simple example should illustrate the concepts. First, we'll define some customer data to use in our example:

```
// This is what our customer data looks like.
const customerData = [
  { ssn: "444-44-4444", name: "Bill", age: 35, email: "bill@company.com" },
  { ssn: "555-55-5555", name: "Donna", age: 32, email: "donna@home.org" },
];
```

Of course, you wouldn't use someone's social security number as the primary key to a customer table because not everyone has a social security number, and you would store their birth date instead of their age, but let's ignore those unfortunate choices for the sake of convenience and move along.

Now let's look at creating an IndexedDB to store our data:

```
const dbName = "the_name";

const request = indexedDB.open(dbName, 2);

request.onerror = (event) => {
  // Handle errors.
};
request.onupgradeneeded = (event) => {
  const db = event.target.result;

  // Create an objectStore to hold information about our customers. We're
  // going to use "ssn" as our key path because it's guaranteed to be
  // unique - or at least that's what I was told during the kickoff meeting.
  const objectStore = db.createObjectStore("customers", { keyPath: "ssn" });

  // Create an index to search customers by name. We may have duplicates
  // so we can't use a unique index.
  objectStore.createIndex("name", "name", { unique: false });

  // Create an index to search customers by email. We want to ensure that
  // no two customers have the same email, so use a unique index.
  objectStore.createIndex("email", "email", { unique: true });

  // Use transaction oncomplete to make sure the objectStore creation is
  // finished before adding data into it.
  objectStore.transaction.oncomplete = (event) => {
    // Store values in the newly created objectStore.
    const customerObjectStore = db
      .transaction("customers", "readwrite")
      .objectStore("customers");
    customerData.forEach((customer) => {
      customerObjectStore.add(customer);
    });
  };
};
```

As indicated previously, onupgradeneeded is the only place where you can alter the structure of the database. In it, you can create and delete object stores and build and remove indices.

Object stores are created with a single call to createObjectStore(). The method takes a name of the store, and a parameter object. Even though the parameter object is optional, it is very important, because it lets you define important optional properties and refine the type of object store you want to create. In our case, we've asked for an object store named "customers" and defined a keyPath, which is the property that makes an individual object in the store unique. That property in this example is "ssn" since a social security number is guaranteed to be unique. "ssn" must be present on every object that is stored in the objectStore.

We've also asked for an index named "name" that looks at the name property of the stored objects. As with createObjectStore(), createIndex() takes an optional options object that refines the type of index that you want to create. Adding objects that don't have a name property still succeeds, but the objects won't appear in the "name" index.

We can now retrieve the stored customer objects using their ssn from the object store directly, or using their name by using the index. To learn how this is done, see the section on using an index.

#### Using a key generator
Setting up an autoIncrement flag when creating the object store would enable the key generator for that object store. By default this flag is not set.

With the key generator, the key would be generated automatically as you add the value to the object store. The current number of a key generator is always set to 1 when the object store for that key generator is first created. Basically the newly auto-generated key is increased by 1 based on the previous key. The current number for a key generator never decreases, other than as a result of database operations being reverted, for example, the database transaction is aborted. Therefore deleting a record or even clearing all records from an object store never affects the object store's key generator.

We can create another object store with the key generator as below:

```
// Open the indexedDB.
const request = indexedDB.open(dbName, 3);

request.onupgradeneeded = (event) => {
  const db = event.target.result;

  // Create another object store called "names" with the autoIncrement flag set as true.
  const objStore = db.createObjectStore("names", { autoIncrement: true });

  // Because the "names" object store has the key generator, the key for the name value is generated automatically.
  // The added records would be like:
  // key : 1 => value : "Bill"
  // key : 2 => value : "Donna"
  customerData.forEach((customer) => {
    objStore.add(customer.name);
  });
};
```

For more details about the key generator, see Key generators in the spec.

### Adding, retrieving, and removing data
Before you can do anything with your new database, you need to start a transaction. Transactions come from the database object, and you have to specify which object stores you want the transaction to span. Once you are inside the transaction, you can access the object stores that hold your data and make your requests. Next, you need to decide if you're going to make changes to the database or if you just need to read from it. Transactions have three available modes: readonly, readwrite, and versionchange.

To change the "schema" or structure of the database—which involves creating or deleting object stores or indexes—the transaction must be in versionchange mode. This transaction is opened by calling the IDBFactory.open method with a version specified.

To read the records of an existing object store, the transaction can either be in readonly or readwrite mode. To make changes to an existing object store, the transaction must be in readwrite mode. You open such transactions with IDBDatabase.transaction. The method accepts two parameters: the storeNames (the scope, defined as an array of object stores that you want to access) and the mode (readonly or readwrite) for the transaction. The method returns a transaction object containing the IDBIndex.objectStore method, which you can use to access your object store. By default, where no mode is specified, transactions open in readonly mode.

You can speed up data access by using the right scope and mode in the transaction. Here are a couple of tips:

When defining the scope, specify only the object stores you need. This way, you can run multiple transactions with non-overlapping scopes concurrently.
Only specify a readwrite transaction mode when necessary. You can concurrently run multiple readonly transactions with overlapping scopes, but you can have only one readwrite transaction for an object store. To learn more, see the definition for transaction in the IndexedDB key characteristics and basic terminology article.

#### Adding data to the database
If you've just created a database, then you probably want to write to it. Here's what that looks like:

    const transaction = db.transaction(["customers"], "readwrite");
    // Note: Older experimental implementations use the deprecated constant IDBTransaction.READ_WRITE instead of "readwrite".
    // In case you want to support such an implementation, you can write:
    // const transaction = db.transaction(["customers"], IDBTransaction.READ_WRITE);

The transaction() function takes two arguments (though one is optional) and returns a transaction object. The first argument is a list of object stores that the transaction will span. You can pass an empty array if you want the transaction to span all object stores, but don't do it because the spec says an empty array should generate an InvalidAccessError. If you don't specify anything for the second argument, you get a read-only transaction. Since you want to write to it here you need to pass the "readwrite" flag.

Now that you have a transaction you need to understand its lifetime. Transactions are tied very closely to the event loop. If you make a transaction and return to the event loop without using it then the transaction will become inactive. The only way to keep the transaction active is to make a request on it. When the request is finished you'll get a DOM event and, assuming that the request succeeded, you'll have another opportunity to extend the transaction during that callback. If you return to the event loop without extending the transaction then it will become inactive, and so on. As long as there are pending requests the transaction remains active. Transaction lifetimes are really very simple but it might take a little time to get used to. A few more examples will help, too. If you start seeing TRANSACTION_INACTIVE_ERR error codes then you've messed something up.

Transactions can receive DOM events of three different types: error, abort, and complete. We've talked about the way that error events bubble, so a transaction receives error events from any requests that are generated from it. A more subtle point here is that the default behavior of an error is to abort the transaction in which it occurred. Unless you handle the error by first calling stopPropagation() on the error event then doing something else, the entire transaction is rolled back. This design forces you to think about and handle errors, but you can always add a catchall error handler to the database if fine-grained error handling is too cumbersome. If you don't handle an error event or if you call abort() on the transaction, then the transaction is rolled back and an abort event is fired on the transaction. Otherwise, after all pending requests have completed, you'll get a complete event. If you're doing lots of database operations, then tracking the transaction rather than individual requests can certainly aid your sanity.

Now that you have a transaction, you'll need to get the object store from it. Transactions only let you have an object store that you specified when creating the transaction. Then you can add all the data you need.

    // Do something when all the data is added to the database.
    transaction.oncomplete = (event) => {
      console.log("All done!");
    };

    transaction.onerror = (event) => {
      // Don't forget to handle errors!
    };

    const objectStore = transaction.objectStore("customers");
    customerData.forEach((customer) => {
      const request = objectStore.add(customer);
      request.onsuccess = (event) => {
        // event.target.result === customer.ssn;
      };
    });

The result of a request generated from a call to add() is the key of the value that was added. So in this case, it should equal the ssn property of the object that was added, since the object store uses the ssn property for the key path. Note that the add() function requires that no object already be in the database with the same key. If you're trying to modify an existing entry, or you don't care if one exists already, you can use the put() function, as shown below in the Updating an entry in the database section.

### Removing data from the database
Removing data is very similar:

    const request = db
      .transaction(["customers"], "readwrite")
      .objectStore("customers")
      .delete("444-44-4444");
    request.onsuccess = (event) => {
      // It's gone!
    };

### Getting data from the database
Now that the database has some info in it, you can retrieve it in several ways. First, the simple get(). You need to provide the key to retrieve the value, like so:

    const transaction = db.transaction(["customers"]);
    const objectStore = transaction.objectStore("customers");
    const request = objectStore.get("444-44-4444");
    request.onerror = (event) => {
      // Handle errors!
    };
    request.onsuccess = (event) => {
      // Do something with the request.result!
      console.log(`Name for SSN 444-44-4444 is ${request.result.name}`);
    };

That's a lot of code for a "simple" retrieval. Here's how you can shorten it up a bit, assuming that you handle errors at the database level:

    db
      .transaction("customers")
      .objectStore("customers")
      .get("444-44-4444").onsuccess = (event) => {
      console.log(`Name for SSN 444-44-4444 is ${event.target.result.name}`);
    };

See how this works? Since there's only one object store, you can avoid passing a list of object stores you need in your transaction and just pass the name as a string. Also, you're only reading from the database, so you don't need a "readwrite" transaction. Calling transaction() with no mode specified gives you a "readonly" transaction. Another subtlety here is that you don't actually save the request object to a variable. Since the DOM event has the request as its target you can use the event to get to the result property.

Updating an entry in the database
Now we've retrieved some data, updating it and inserting it back into the IndexedDB is pretty simple. Let's update the previous example somewhat:

    const objectStore = db
      .transaction(["customers"], "readwrite")
      .objectStore("customers");
    const request = objectStore.get("444-44-4444");
    request.onerror = (event) => {
      // Handle errors!
    };
    request.onsuccess = (event) => {
      // Get the old value that we want to update
      const data = event.target.result;

      // update the value(s) in the object that you want to change
      data.age = 42;

      // Put this updated object back into the database.
      const requestUpdate = objectStore.put(data);
      requestUpdate.onerror = (event) => {
        // Do something with the error
      };
      requestUpdate.onsuccess = (event) => {
        // Success - the data is updated!
      };
    };

So here we're creating an objectStore and requesting a customer record out of it, identified by its ssn value (444-44-4444). We then put the result of that request in a variable (data), update the age property of this object, then create a second request (requestUpdate) to put the customer record back into the objectStore, overwriting the previous value.

Note: In this case we've had to specify a readwrite transaction because we want to write to the database, not just read from it.

Using a cursor
Using get() requires that you know which key you want to retrieve. If you want to step through all the values in your object store, then you can use a cursor. Here's what it looks like:

    const objectStore = db.transaction("customers").objectStore("customers");

    objectStore.openCursor().onsuccess = (event) => {
      const cursor = event.target.result;
      if (cursor) {
        console.log(`Name for SSN ${cursor.key} is ${cursor.value.name}`);
        cursor.continue();
      } else {
        console.log("No more entries!");
      }
    };

The openCursor() function takes several arguments. First, you can limit the range of items that are retrieved by using a key range object that we'll get to in a minute. Second, you can specify the direction that you want to iterate. In the above example, we're iterating over all objects in ascending order. The success callback for cursors is a little special. The cursor object itself is the result of the request (above we're using the shorthand, so it's event.target.result). Then the actual key and value can be found on the key and value properties of the cursor object. If you want to keep going, then you have to call continue() on the cursor. When you've reached the end of the data (or if there were no entries that matched your openCursor() request) you still get a success callback, but the result property is undefined.

One common pattern with cursors is to retrieve all objects in an object store and add them to an array, like this:

    const customers = [];

    objectStore.openCursor().onsuccess = (event) => {
      const cursor = event.target.result;
      if (cursor) {
        customers.push(cursor.value);
        cursor.continue();
      } else {
        console.log(`Got all customers: ${customers}`);
      }
    };

Note: Alternatively, you can use getAll() to handle this case (and getAllKeys()). The following code does precisely the same thing as above:

    objectStore.getAll().onsuccess = (event) => {
      console.log(`Got all customers: ${event.target.result}`);
    };

There is a performance cost associated with looking at the value property of a cursor, because the object is created lazily. When you use getAll() for example, the browser must create all the objects at once. If you're just interested in looking at each of the keys, for instance, it is much more efficient to use a cursor than to use getAll(). If you're trying to get an array of all the objects in an object store, though, use getAll().

### Using an index
Storing customer data using the SSN as a key is logical since the SSN uniquely identifies an individual. (Whether this is a good idea for privacy is a different question, and outside the scope of this article.) If you need to look up a customer by name, however, you'll need to iterate over every SSN in the database until you find the right one. Searching in this fashion would be very slow, so instead you can use an index.

    // First, make sure you created index in request.onupgradeneeded:
    // objectStore.createIndex("name", "name");
    // Otherwise you will get DOMException.

    const index = objectStore.index("name");

    index.get("Donna").onsuccess = (event) => {
      console.log(`Donna's SSN is ${event.target.result.ssn}`);
    };

The "name" index isn't unique, so there could be more than one entry with the name set to "Donna". In that case you always get the one with the lowest key value.

If you need to access all the entries with a given name you can use a cursor. You can open two different types of cursors on indexes. A normal cursor maps the index property to the object in the object store. A key cursor maps the index property to the key used to store the object in the object store. The differences are illustrated here:

    // Using a normal cursor to grab whole customer record objects
    index.openCursor().onsuccess = (event) => {
      const cursor = event.target.result;
      if (cursor) {
        // cursor.key is a name, like "Bill", and cursor.value is the whole object.
        console.log(
          `Name: ${cursor.key}, SSN: ${cursor.value.ssn}, email: ${cursor.value.email}`,
        );
        cursor.continue();
      }
    };

    // Using a key cursor to grab customer record object keys
    index.openKeyCursor().onsuccess = (event) => {
      const cursor = event.target.result;
      if (cursor) {
        // cursor.key is a name, like "Bill", and cursor.primaryKey is the SSN.
        // No way to directly get the rest of the stored object.
        console.log(`Name: ${cursor.key}, SSN: ${cursor.primaryKey}`);
        cursor.continue();
      }
    };

### Specifying the range and direction of cursors
If you would like to limit the range of values you see in a cursor, you can use an IDBKeyRange object and pass it as the first argument to openCursor() or openKeyCursor(). You can make a key range that only allows a single key, or one that has a lower or upper bound, or one that has both a lower and upper bound. The bound may be "closed" (i.e., the key range includes the given value(s)) or "open" (i.e., the key range does not include the given value(s)). Here's how it works:

    // Only match "Donna"
    const singleKeyRange = IDBKeyRange.only("Donna");

    // Match anything past "Bill", including "Bill"
    const lowerBoundKeyRange = IDBKeyRange.lowerBound("Bill");

    // Match anything past "Bill", but don't include "Bill"
    const lowerBoundOpenKeyRange = IDBKeyRange.lowerBound("Bill", true);

    // Match anything up to, but not including, "Donna"
    const upperBoundOpenKeyRange = IDBKeyRange.upperBound("Donna", true);

    // Match anything between "Bill" and "Donna", but not including "Donna"
    const boundKeyRange = IDBKeyRange.bound("Bill", "Donna", false, true);

    // To use one of the key ranges, pass it in as the first argument of openCursor()/openKeyCursor()
    index.openCursor(boundKeyRange).onsuccess = (event) => {
      const cursor = event.target.result;
      if (cursor) {
        // Do something with the matches.
        cursor.continue();
      }
    };

Sometimes you may want to iterate in descending order rather than in ascending order (the default direction for all cursors). Switching direction is accomplished by passing prev to the openCursor() function as the second argument:

    objectStore.openCursor(boundKeyRange, "prev").onsuccess = (event) => {
      const cursor = event.target.result;
      if (cursor) {
        // Do something with the entries.
        cursor.continue();
      }
    };

If you just want to specify a change of direction but not constrain the results shown, you can just pass in null as the first argument:

    objectStore.openCursor(null, "prev").onsuccess = (event) => {
      const cursor = event.target.result;
      if (cursor) {
        // Do something with the entries.
        cursor.continue();
      }
    };

Since the "name" index isn't unique, there might be multiple entries where name is the same. Note that such a situation cannot occur with object stores since the key must always be unique. If you wish to filter out duplicates during cursor iteration over indexes, you can pass nextunique (or prevunique if you're going backwards) as the direction parameter. When nextunique or prevunique is used, the entry with the lowest key is always the one returned.

    index.openKeyCursor(null, "nextunique").onsuccess = (event) => {
      const cursor = event.target.result;
      if (cursor) {
        // Do something with the entries.
        cursor.continue();
      }
    };

Please see "IDBCursor Constants" for the valid direction arguments.

### Version changes while a web app is open in another tab
When your web app changes in such a way that a version change is required for your database, you need to consider what happens if the user has the old version of your app open in one tab and then loads the new version of your app in another. When you call open() with a greater version than the actual version of the database, all other open databases must explicitly acknowledge the request before you can start making changes to the database (an onblocked event is fired until they are closed or reloaded). Here's how it works:

    const openReq = mozIndexedDB.open("MyTestDatabase", 2);

    openReq.onblocked = (event) => {
      // If some other tab is loaded with the database, then it needs to be closed
      // before we can proceed.
      console.log("Please close all other tabs with this site open!");
    };

    openReq.onupgradeneeded = (event) => {
      // All other databases have been closed. Set everything up.
      db.createObjectStore(/* … */);
      useDatabase(db);
    };

    openReq.onsuccess = (event) => {
      const db = event.target.result;
      useDatabase(db);
    };

    function useDatabase(db) {
      // Make sure to add a handler to be notified if another page requests a version
      // change. We must close the database. This allows the other page to upgrade the database.
      // If you don't do this then the upgrade won't happen until the user closes the tab.
      db.onversionchange = (event) => {
        db.close();
        console.log(
          "A new version of this page is ready. Please reload or close this tab!",
        );
      };

      // Do stuff with the database.
    }

You should also listen for VersionError errors to handle the situation where already opened apps may initiate code leading to a new attempt to open the database, but using an outdated version.

