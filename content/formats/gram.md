title=Gram
tags=format, graph
summary=A textual format for data; we have CSV for tables, JSON for documents, and gram for data graphs.
~~~~~~

[Website](https://gram-data.github.io/)

[JS website](https://gram-data.github.io/gram-js/) | [JS Source](https://github.com/gram-data/gram-js)

[Article](https://neo4j.com/blog/developer/gram-a-data-graph-format/) (Neo4j)

```
(a:A)-->(b:B)<--(c:C)-->(a), (c)-->(d), (c)-->(e)

(g:Text:Data { name: "Gram", stars: 42, since: date`2020-06-06`, weight: 22kg })

(g:Text:Data   { name: "Gram", stars: 42, since: date`2020-06-06`, weight: 22kg })
(a:Ast:Data    { specification: "@gram-data/gram-ast", extends:"unist" })
(j:Object:Data { language: "javascript" })

(g)-->(a)-->(j)
```

Website is a JS project that also has a parser and AST as part of it.

*(No updates since 2021, but does it need any more?)*

