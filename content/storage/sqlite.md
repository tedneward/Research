title=SQLite
tags=storage, relational, embedded, native, library
summary=A C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine.
~~~~~~

[Website](https://sqlite.org/index.html) | [C/C++ Interface](https://sqlite.org/c3ref/intro.html) | [TCL Interface](https://sqlite.org/tclsqlite.html) | [Source](https://sqlite.org/src) | [File format for SQLite databases](https://www.sqlite.org/fileformat2.html) | [SQLite as an "application format"](https://sqlite.org/appfileformat.html)

How does SQLite work? [Part 1](https://jvns.ca/blog/2014/09/27/how-does-sqlite-work-part-1-pages/) | [Part 2](https://jvns.ca/blog/2014/10/02/how-does-sqlite-work-part-2-btrees/)

[CG/SQL](https://cgsql.dev/) is a code generation system for the popular SQLite library that allows developers to write stored procedures in a variant of Transact-SQL (T-SQL) and compile them into C code that uses SQLite’s C API to do the coded operations. CG/SQL enables engineers to create highly complex stored procedures with very large queries, without the manual code checking that existing methods require. (Produces C source that can be compiled, and the language is flexible enough to do a fair amount of typical C dev without leaving CQL.)

- [Docs](https://cgsql.dev/docs/introduction)
- [Language Guide](https://cgsql.dev/cql-guide/ch01)
- Internals [Part 1](https://cgsql.dev/cql-guide/int01), [Part 2](https://cgsql.dev/cql-guide/int02): An interesting look into how it works
- [Source](https://github.com/facebookincubator/CG-SQL)

---

## Plugins/additions/enhancements

[SQLCypher](https://www.zetetic.net/sqlcipher/) is an extension to SQLite adding encryption. Open-source and commercial.

---

## Interesting articles
["A future for SQL on the Web"](https://jlongster.com/future-sql-web): Using [IndexedDB](../indexeddb) in the browser as a "file system" underneath a SQLite implementation compiled to WASM. Resulting project is [absurd-sql](https://github.com/jlongster/absurd-sql). Makes use of [sql.js](../sqljs) and a few source changes to it.

