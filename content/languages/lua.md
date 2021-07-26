title=Lua
tags=language, native, gamedev, object
summary=Scripting language often embedded into game engines for extensibility.
~~~~~~

[Website](https://www.lua.org/)

### Additional Implementations

* C: [LuaJIT](http://luajit.org/): Fully compatible with Lua 5.1. Has a built-in C FFI library. Very fast.
* CLR: [MoonSharp](https://www.moonsharp.org/): CLR Based Lua implementation that is 99% compatible with Lua 5.2.
* Erlang: [luerl](https://github.com/rvirding/luerl): An implementation of Lua 5.2 in pure Erlang with some features like goto absent.
* Go: [Go-Lua](https://github.com/Shopify/go-lua): Implements a subset of Lua 5.2.
* Go: [GopherLua](https://github.com/yuin/gopher-lua): Implements Lua 5.1 with the added support for Go's channels. Lacks the debug hooks and several functions from the C version.
* [ljs](https://github.com/mingodad/ljs): Lua 5.3, Lua 5.1, and LuaJIT with a C/C++/Java/JavaScript syntax. Can convert Lua source code to ljs.
* JVM: [LuaJ](https://sourceforge.net/projects/luaj/): A Lua 5.2 spec-compliant interpreter written in Java for JME and JSE. Compiles Lua directly to JVM bytecode.
* OCaml: [LuaML](https://github.com/lindig/lua-ml): Embeddable Lua 2.5 reimplementation that integrates with OCaml type and module system. It's possible to extend or even replace the standard library with your own modules.


### Inspired by Lua

* [MetaLua](https://github.com/fab13n/metalua): Metalua is a Lua code analysis tool, as well as a compiler for a superset of Lua 5.1 supporting Compile-Time Meta-Programming. It's separated into two LuaRocks, metalua-parser and metalua-compiler.
* [Shine](https://github.com/richardhundt/shine): A language based on Lua with additional safety and expressiveness features implemented as a fork of LuaJIT.
* [Squirrel](../squirrel)
* [SquiLu](https://github.com/mingodad/squilu): A fork of Squirrel. Changes the syntax to accept a subset of JavaScript and C/C++. Implements Lua's features like string pattern matching and global table manipulation functions. Adds extensions for database access (SQLite3, MySQL, PostgreSQL), sockets, and other features.
* [Wu](../wu)