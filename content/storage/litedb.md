title=LiteDB
tags=storage, clr, embedded, document
summary=An open source MongoDB-like database with zero conﬁguration - mobile ready.
~~~~~~

[Website](https://www.litedb.org/) | [Source](https://github.com/mbdavid/litedb)

Features:

* Portable UWP and Xamarin iOS/Android
* ACID transactions
* Single datafile (like SQLite)
* Recovery data in writing failure (WAL mode)
* Map your POCO class to BsonDocument
* Fluent API for custom mapping
* Cross collections references (DbRef)
* Store files and stream data (like GridFS in MongoDB)
* LINQ query support

Nearly 1-for-1 feature parity with any Mongo-esque document database.

Quick example:
```cs
// Create your POCO class entity
public class Customer
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string[] Phones { get; set; }
    public bool IsActive { get; set; }
}

// Open database (or create if doesn't exist)
using(var db = new LiteDatabase(@"C:\Temp\MyData.db"))
{
    // Get a collection (or create, if doesn't exist)
    var col = db.GetCollection<Customer>("customers");

    // Create your new customer instance
    var customer = new Customer
    { 
        Name = "John Doe", 
        Phones = new string[] { "8000-0000", "9000-0000" }, 
        IsActive = true
    };
	
    // Insert new customer document (Id will be auto-incremented)
    col.Insert(customer);
	
    // Update a document inside a collection
    customer.Name = "Jane Doe";
	
    col.Update(customer);
	
    // Index document using document Name property
    col.EnsureIndex(x => x.Name);
	
    // Use LINQ to query documents (filter, sort, transform)
    var results = col.Query()
        .Where(x => x.Name.StartsWith("J"))
        .OrderBy(x => x.Name)
        .Select(x => new { x.Name, NameUpper = x.Name.ToUpper() })
        .Limit(10)
        .ToList();

    // Let's create an index in phone numbers (using expression). It's a multikey index
    col.EnsureIndex(x => x.Phones); 

    // and now we can query phones
    var r = col.FindOne(x => x.Phones.Contains("8888-5555"));
}
```

Custom class mapping
```cs
BsonMapper.Global.RegisterType<DateTimeOffset>
(
    serialize: obj =>
    {
        var doc = new BsonDocument();
        doc["DateTime"] = obj.DateTime.Ticks;
        doc["Offset"] = obj.Offset.Ticks;
        return doc;
    },
    deserialize: doc => new DateTimeOffset(doc["DateTime"].AsInt64, new TimeSpan(doc["Offset"].AsInt64))
);
```

File (binary) storage
```cs
// Get file storage with Int Id
var storage = db.GetStorage<int>();

// Upload a file from file system to database
storage.Upload(123, @"C:\Temp\picture-01.jpg");

// And download later
storage.Download(123, @"C:\Temp\copy-of-picture-01.jpg");
```

