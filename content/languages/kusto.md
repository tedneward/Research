title=Kusto (query language)
tags=language, storage, azure
summary=Query language for use with Azure Data Explorer.
~~~~~~

[MSDN docs](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)

> A Kusto query is a read-only request to process data and return results. The request is stated in plain text, using a data-flow model designed to make the syntax easy to read, author, and automate. The query uses schema entities that are organized in a hierarchy similar to SQL's: databases, tables, and columns.

> The query consists of a sequence of query statements, delimited by a semicolon (;), with at least one statement being a tabular expression statement which is a statement that produces data arranged in a table-like mesh of columns and rows. The query's tabular expression statements produce the results of the query.

> The syntax of the tabular expression statement has tabular data flow from one tabular query operator to another, starting with data source (e.g. a table in a database, or an operator that produces data) and then flowing through a set of data transformation operators that are bound together through the use of the pipe (|) delimiter.

> For example, the following Kusto query has a single statement, which is a tabular expression statement. The statement starts with a reference to a table called StormEvents (the database that hosts this table is implicit here, and part of the connection information). The data (rows) for that table are then filtered by the value of the StartTime column, and then filtered by the value of the State column. The query then returns the count of "surviving" rows.

```
StormEvents 
| where StartTime >= datetime(2007-11-01) and StartTime < datetime(2007-12-01)
| where State == "FLORIDA"  
| count
```

