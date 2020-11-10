title=HyperGraphDB
tags=storage, graph
summary=A general purpose, extensible, portable, distributed, embeddable, open-source data storage mechanism. It is a graph database designed specifically for artificial intelligence and semantic web projects, it can also be used as an embedded object-oriented database for projects of all sizes.
~~~~~~

[Website](http://www.hypergraphdb.org/) | [Source](https://github.com/hypergraphdb/hypergraphdb)

### Example: Hello World
```
HyperGraph graph = new HyperGraph("/path/to/workdir/bje");
String hello = graph.get(graph.add("Hello World")); 
System.out.println(hello.toLowerCase());
graph.close();
```

* graph.add returns something that graph.get consumes - HGHandle, that's how atoms are referred to.
* graph.get returns a String object with working toLowerCase method - this shows that hypergraphDB is also an object-oriented database.
* if you manage several hypergraph instances, use HGEnvironment.get(location).
* do not forget to close after usage, because that might lead to corruption. It's recommended to wrap your code in a try block, and ensure graph.close() in a finally block.


### Example: Store/retrieve data
```
String someObject = "Lorem ipsum";
HGHandle handle1 = graph.add(someObject);
System.out.println(graph.get(handleToSomeObject));
System.out.println(((String) graph.get(handle1)).toUpperCase());
```

* graph.add(...) returnes a "handle" with which you can access the datum directly (as seen in graph.get a line below). A handle generally is an auto-generated database ID.
* using add/get to store and retrieve data is not necessarily the typical way hypergraphdb is used because:
    * graph.get() requires you to know the handle. This is often not the case, especially when you want data that you did not store just moments ago (hence most of the time! :-) ). Therefore most accesses typically happen by querying.
    * If graph.add(someObject) is called more than once (for example by accident, each time you run a given program), you would end up with duplicates that can be disturbing when querying.
* the second println demonstrate that we get a fully functional java object, in that case, it has a working toUpperCase method. This shows that hypergraphDB is not only a graph-database, but also a full object-oriented database.


### Example: Store and retrieve data without knowing the handle - querying basics
Querying is done conveniently by using the static helper class "hg":

```
import org.hypergraphdb.HGQuery.hg.*;
```

We stored only one element in our database, so we would immediately find "Lorem ipsum" simply by querying for type String:

```
System.out.println(hg.getOne(graph, hg.type(String.class)));
-> "Lorem ipsum";
```

hg.getOne returns you any one (of possibly many) matching result as a ready-to-use object, just as did graph.get. But often we have several items that match a certain criteria. We get can get those packed in a List, with hg.getAll: In order to have two atoms, we just add the same object as above:

```
HGHandle handle2 = graph.add(someObject);
```

and then query for all Strings:

```
for (Object s : hg.getAll(graph, hg.type(String.class)))
    System.out.println(s);
-> Lorem ipsum Lorem ipsum
```

We get two results here, that happen to be distinct duplicate copies of the same data (we prove that later).

As you see, querying is generally used in one of this ways:

```
hg.getOne (graphInstance, QueryCondition); // ->  any one matching object.
hg.getAll (graphInstance, QueryCondition); // ->  all matching objects as a List.
```
where "QueryCondition" in our example is hg.type(String.class), but of course there is more.

### Query
Sometimes you need handles and also you do not want to dereference and deserialize all results of a query into memory. To query by returning handles is easy. It's the same as with getOne/getAll, but instead of h.getOne you use hg.findOne. Instead of hg.getAll, use hg.findAll.

We use this to confirm that we created actual duplicate atoms in the "Lorem ipsum" example above. We printout the handles, and check for equality with the handles obtained before:

```
for (Object s : hg.findAll(graph, hg.type(String.class)))
{
  System.out.println(s);
  System.out.println((s.equals(handle1) || s.equals(handle2)));
}
-> 259b3dbd-4e4f-4566-b850-1029f99e6d1b true dceadb0c-318b-4249-917a-559d2f077fcc true
```

### Store data uniquely
How to make sure that a given data is stored only once, even when -by accident or not- the data is stored twice?

```
String object2 = "dolor sit amet";
HGHandle noDup1 = hg.assertAtom(graph, object2);
HGHandle noDup2 = hg.assertAtom(graph, object2);  //trying hard to duplicate
System.out.println("Are those two handles duplicates, i.e. two distinct handles? : " + (!noDup1.equals(noDup2)));
-> "Are those two handles duplicates, i.e. two distinct handles? : false"
```

Note that logically there is a cost associated with checking if a given datum already exists. If you don't need unique atoms, graph.add is faster.

### Create Links and query for Links
Till now there was nothing graph, only object-oriented database functionality. We also did not do particularly interesting queries.

Let's make a link and query for it:

```
HGHandle duplicateLink = graph.add(new HGPlainLink(handle1, handle2));
List<HGHandle> dupsList = hg.findAll(graph, hg.link(handle1, handle2));
System.out.println("querying for link returned that duplicate Link? :" + dupsList.contains(duplicateLink));
=> querying for link returned that duplicate Link? :true
```

