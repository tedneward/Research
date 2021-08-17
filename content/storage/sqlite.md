title=SQLite
tags=storage, relational, embedded, library
summary=A C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine.
~~~~~~

[Website](https://sqlite.org/index.html) | [C/C++ Interface](https://sqlite.org/c3ref/intro.html) | [TCL Interface](https://sqlite.org/tclsqlite.html) | [Source](https://sqlite.org/src) | [File format for SQLite databases](https://www.sqlite.org/fileformat2.html) | [SQLite as an "application format"](https://sqlite.org/appfileformat.html)

How does SQLite work? [Part 1](https://jvns.ca/blog/2014/09/27/how-does-sqlite-work-part-1-pages/) [Part 2](https://jvns.ca/blog/2014/10/02/how-does-sqlite-work-part-2-btrees/)

---

## Plugins/additions/enhancements

[SQLCypher](https://www.zetetic.net/sqlcipher/) is an extension to SQLite adding encryption. Open-source and commercial.

---

## Interesting articles
["A future for SQL on the Web"](https://jlongster.com/future-sql-web): Using [IndexedDB](../indexeddb) in the browser as a "file system" underneath a SQLite implementation compiled to WASM. Resulting project is [absurd-sql](https://github.com/jlongster/absurd-sql). Makes use of [sql.js](../sqljs) and a few source changes to it.

