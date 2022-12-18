title=Nitrite
tags=storage, embedded, jvm, document
summary=An open source nosql embedded document store written in Java with MongoDB like API that supports both in-memory and single file based persistent store.
~~~~~~

[Website](https://www.dizitart.org/nitrite-database.html) | [Source](https://github.com/nitrite/nitrite-java)

## Example

```java
Nitrite db = Nitrite.builder()
    .compressed()
    .filePath("/tmp/test.db")
    .openOrCreate("user", "password");

// Create a Nitrite Collection
NitriteCollection collection = db.getCollection("test");

// create a document to populate data
Document doc = createDocument("firstName", "John")
     .put("lastName", "Doe")
     .put("birthDay", new Date())
     .put("data", new byte[] {1, 2, 3})
     .put("fruits", new ArrayList<String>() {{ add("apple"); add("orange"); }})
     .put("note", "a quick brown fox jump over the lazy dog");

// insert the document
collection.insert(doc);

// update the document
collection.update(eq("firstName", "John"), createDocument("lastName", "Wick"));
```

## Articles

* ["Nitrite as an embedded NoSQL database for Java"](https://tkainrad.dev/posts/nitrite-embedded-nosql-db/)
