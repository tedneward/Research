title=SushiVM
tags=vm
summary=A JIT-enabled virtual machine and scripting interpreter.
~~~~~~

[Source](https://github.com/eqela/sushivm)

Sushi is a fast and lightweight JIT-enabled virtual machine and dynamic language interpreter. It embeds and utilizes the LuaJIT interpreter and JIT engine and implements a fully custom-built cross-platform built-in API for Sushi applications. The entire virtual machine runs from a single executable and requires no particular installation. Executable Sushi programs can be compressed and appended to the executable, easily creating single-file executables that contain both the interpreter and application code. The executable size is about 400kb when dynamically linked and around 4MB when linked statically.

Sushi uses the Lua syntax as its native code format. While it is possible to write and execute hand-written Lua code on Sushi as well, the primary purpose of Sushi is to provide an optimal runtime environment for the Sling Programming Language.
