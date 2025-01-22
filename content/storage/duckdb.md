title=DuckDB
tags=storage, relational
summary=An in-process SQL OLAP database management system.
~~~~~~

[Website](https://duckdb.org/) | [Source](https://github.com/duckdb/duckdb)

When to use DuckDB

* Processing and storing tabular datasets, e.g. from CSV or Parquet files
* Interactive data analysis, e.g. Joining & aggregate multiple large tables
* Concurrent large changes, to multiple large tables, e.g. appending rows, adding/removing/updating columns
* Large result set transfer to client

When to not use DuckDB

* High-volume transactional use cases (e.g. tracking orders in a webshop)
* Large client/server installations for centralized enterprise data warehousing
* Writing to a single database from multiple concurrent processes
* Multiple concurrent processes reading from a single writable database

## Articles

["DuckDB: In-Process Python Analytics for Not-Quite-Big Data"](https://thenewstack.io/duckdb-in-process-python-analytics-for-not-quite-big-data/)

