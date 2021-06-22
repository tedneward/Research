title=SILK (Simple Interpreted Language Kit)
tags=language, clr
summary=A .NET class library that makes it easy to add scripting and automation to your .NET applications.
~~~~~~

The library includes three main components. A compiler, a compiled program, and a runtime. The compiler compiles the Silk source code to bytecode. This allows faster execution and also catches all source code syntax errors before running the Silk program. The compiler produces a compiled program. A compiled program can be saved to a file, and later read from a file. This allows you to load and run a Silk program without recompiling it each time. Finally, the runtime component executes a compiled program.

The main power of this library is that it allows you to register your own functions and variables with the compiler and those functions and variables can be called from the Silk program. When one of your registered functions is called, the Function event is raised, allowing the host application to provide key functionality specific to the host application's domain.

[Source](https://github.com/SoftCircuits/Silk)

C-like procedural language implementation
