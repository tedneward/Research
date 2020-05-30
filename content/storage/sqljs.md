title=SQL.js (SQLite in JavaScript)
tags=storage, relational, embedded, browser, nodejs
summary=A javascript library to run SQLite on the web.
~~~~~~

"sql.js is a port of [SQLite](sqlite.html) to Webassembly, by compiling the SQLite C code with Emscripten, with contributed math and string extension functions included. It uses a virtual database file stored in memory, and thus doesn't persist the changes made to the database. However, it allows you to import any existing sqlite file, and to export the created database as a JavaScript typed array.

"There are no C bindings or node-gyp compilation here, sql.js is a simple JavaScript file, that can be used like any traditional JavaScript library. If you are building a native application in JavaScript (using Electron for instance), or are working in node.js, you will likely prefer to use a native binding of SQLite to JavaScript."

[Source](https://github.com/sql-js/sql.js)

