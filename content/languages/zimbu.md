title=Zimbu
tags=language, native, browser
summary=Language experiment around wide-scope system-to-application programming.
~~~~~~

[Website](http://www.zimbu.org/)

From the website:

Goals:
* easy to read back - code is read N times more often than it is written
* avoid common mistakes - make it difficult to write bad code (but you can write hacks if you really want to)
* keep it short and clear, don't state the same thing twice - no header files, do not repeat type specs
* the effect of a statement should be predictable and not depend on something in another file
* efficient execution: no startup delay, reasonable memory use - no Just In Time compiler effects, minimize "stop the world" garbage collection.
* support a wide range of applications - Zimbu can be used to write an OS kernel, a short script and a big GUI application
* portable - be able to compile and run on almost any system
* many standard data types, modules and classes - most things you need are already there

Choices:
* convert the program to C and use the C compiler to produce machine code (could be something else later)
* also produce Javascript, so that Zimbu code can be run in a web browser.
* mainly use static type checking, also support runtime type checking
* object oriented, all data is handled like an object, but there also are simple types
* support for functional programming, with callbacks and lambda methods
* an import defines one symbol, this avoids name conflicts in large projects
* the standard modules and classes are available without an import statement
* many modules are part of the language, no need for third party libraries
* all keywords are in capitals, you can use all other names without worrying about the next version breaking your program
