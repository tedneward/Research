title=J (programming language)
tags=languages, native, windows, macos, linux, ios, android
summary=A high-level, general-purpose programming language that is particularly suited to the mathematical, statistical, and logical analysis of data.
~~~~~~
[Website](https://www.jsoftware.com/#/) | [Source](https://github.com/jsoftware/jsource)

From the website:
> It is a powerful tool for developing algorithms and exploring problems that are not already well understood.

> Jd ( J database) is a high-performance columnar RDBMS written in J that is geared toward storing and analyzing large amounts of data. Jd is free for non-commercial use. Jd lives openly and dynamically in the J execution and development environment, so that the full power of J is available to the application developer. For example, Jd columns are mapped to J nouns, so built-in J primitives can apply directly to the data. It works well with large tables (millions of rows to billions), multiple tables connected by joins, structured data, numerical data, and complex queries and aggregations.

### [Jd details](https://code.jsoftware.com/wiki/Jd/Overview) (quotes)
Jd has one or more databases. A database has one or more tables. A table is rows (unnamed) and columns (named). Data in a column is of the same type (integer, float, datetime, fixed length characters, variable length characters, etc.). Tables can be joined with other tables to function as if they were that large table. Rows and columns can be retrieved by queries on the joined tables. Retrieved data from a query can be aggregated, grouped, and sorted. Rows can be deleted, updated, and inserted.

The Jd API is SQL like. Similar enough that if you are a guru in another RDBMS you'll pick up the Jd way of thinking without much trouble. And if you're new, then Jd with its tutorials and examples will give you a leg up on getting at your data.

The key difference between Jd and most other database systems is that Jd comes with a fully integrated and mature programming language. Jd is implemented in J and lives openly and dynamically in the J execution and development environment. Jd is a natural extension of J and the full power of J is available to the Jd database application developer. The integration is not just available to you, it is unabashedly pushed to you for exploitation.

J is a modern, array-oriented, high-performance, general-purpose programming language. In J the natural unit of information is a list (of booleans or integers or floats or datetimes or fixed length character strings or variable length character strings or etc). In J, the list of all the license numbers is a noun (named data object). And that noun can be mapped (memory mapped files) directly to a file in the file system by the host OS. So the Jd table column of license numbers is a single file. J can map that file to single J noun and work directly on all that data. Jd table column -> file -> J noun.

