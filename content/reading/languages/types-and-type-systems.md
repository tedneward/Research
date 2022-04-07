title=Types and type systems (reading)
tags=reading, language
summary=Reading and notes about types and type systems in programming languages (and related).
~~~~~~

A [type](https://en.wikipedia.org/wiki/Type_system), also known as a data type, is a classification identifying one of various types of "things" used within a programming language or platform. More prosaically, a type describes the possible values of a "thing" (such as a variable), the semantic meaning of that "thing", and how the values of that "thing" can be stored in memory. 

A type system is a collection of rules that assign a property called type to various constructs in a computer program, such as variables, expressions, functions or modules, with the end goal of reducing the number of bugs by verifying that data is represented properly throughout a program. 

Most types break out into the following categories:

* **Primitives**: the atoms of the programming language; usually things like integers, strings, booleans, and so on. The internal representation of a primitive is usually entirely opaque to the programmer without significant effort (like taking memory addresses and poking around). 
	* **Booleans**: true/false values
	* **Integrals**: non-fractional/whole numbers, often using the first bit to indicate sign (positive or negative). Using twos-complement math, this gives a fairly large range of integral numbers, depending on how many bytes are used for the integral:
		* 1-byte/8-bit: -128 to +127/0 to 255
		* 2-byte/16-bit: -32k to +32k/0 to 64k
		* 4-byte/32-bit: -2,147,483,648 to +2,147,483,647/0 to 4gb
		* 8-byte/64-bit: if you have to ask...
		* 16-byte/128-bit: if you have to ask...
		* "word" or "natural" sized, which is the natural "size" of the CPU (typically, in 2021, this is 64 bits)
	* **Floating-points**: fractional numbers, usually represented in [IEEE 754](https://ieeexplore.ieee.org/document/8766229) ([Wikipedia](https://en.wikipedia.org/wiki/IEEE_754)) format.
	* **Pointers**: One common primitive type is a pointer to a memory location (whether directly manipulable by the programmer or not); Java, for example, talks about `Object o = new Object();` as allocating an object `o`, but in truth `o` is a reference to the object created, not the object itself. The reference `o` is allocated on the stack, whereas the object `o` points to is allocated out of the heap. Pointers/references are almost always word/natural-sized.

* **Composite**: these are the various "structures" that a programmer can build up out of primitives. Some are built within the language (arrays within C/C++/Java/C#, etc), some are built using language constructs (`class` or `struct` within C++/Java/C#/etc). I tend to break these into "simple composite types" (composites provided by the language itself) and "complex composite types" (composites defined by the developer), also sometimes known as "user-defined types" (UDTs).

* **Abstract data types**: these are types that do not have specific implementation, and could thus be represented by multiple concrete types. ADTs are usually defined by `interface`s in Java/C#, but one does not need an interface keyword to have an ADT.

### [Type-checking](https://en.wikipedia.org/wiki/Type_system#Type_checking)

The existence of types is useless without a process of verifying that those types make logical sense in the program so that the program can be executed successfully. Type checking is the process of verifying and enforcing the constraints of types, and it can occur either at ahead-of-(execution-)time (i.e. statically) or at runtime/execution time (i.e. dynamically). Type checking is all about ensuring that the program will not encounter errors due to inappropriate or undefined intersection of types; a type error is an erroneous program behavior in which an operation occurs (or trys to occur) on a particular data type that it’s not meant to occur on.

When a program is considered not type-safe, there is no single standard course of action that happens upon reaching a type error. Many programming languages throw type errors which halt the runtime or compilation of the program, while other languages have built-in safety features to handle a type error and continue running (allowing developers to exhibit poor type safety).

[What to know before debating type systems](https://cdsmith.wordpress.com/2011/01/09/an-old-article-i-wrote/)

* [Static](/tags/static): A language is statically-typed if the type of a variable is known at ahead-of-(execution-)time instead of at runtime. Since most ahead-of-time checking is considered compilation, most statically-type-checked languages are compilation-based languages, though certainly nothing stops an interpreter from statically-type-checking a program when it is first loaded. Consequences include:

	* Many type errors, because they are often programmer mental mistakes, can be caught early in the development cycle and thus never appear to the user.
	* Static typing information can be used to optimize compiled code that executes more quickly because when the compiler knows the exact data types that are in use, it can produce better machine code (i.e. faster and/or using less memory).
	* A static type-checker will quickly detect type errors in rarely used code paths. Without static type checking, even code coverage tests with 100% coverage may be unable to find such type errors.
	* Static type-checkers make it nearly impossible to manually raise a type error in code because even if that code block hardly gets called, the type-checker would almost always find a situation/codepath that will yield the possibility of that type error occurring at runtime and thus prevent compilation/execution (because a type error was raised).
	* Many/most static type checkers evaluate only the type information that can be determined at compile time, but are able to verify that the checked conditions hold for all possible executions of the program, which eliminates the need to repeat type checks every time the program is executed; this can also yield faster startup times.

* [Dynamic](/tags/dynamic): Dynamic type checking is the process of verifying the type safety of a program at runtime.

	Most type-safe languages include some form of runtime/dynamic type checking, even if they also have a static type checker; many useful features or properties are difficult or impossible to verify statically. Languages frequently want to allow a programmer to assert (cast) that a given returned value is, in fact, of a different type; the assumption is that the programmer has awareness of how the code will execute at runtime that the compiler cannot verify. However, humans are fallible creatures, and blindly accepting the cast could yield significant error or corruption. Therefore, a dynamic check is needed to verify that the operation is safe. Consequences:
	
	* In contrast to static type checking, dynamic type checking may cause a program to fail at runtime due to type errors.

	* In some programming languages, it is possible to anticipate and recover from these failures – either by error handling or blindly carrying on assuming everything will work out. In others, type checking errors are considered fatal. Because type errors are more difficult to determine in dynamic type checking, it is a common practice to supplement development in these languages with unit testing.

	* Dynamic type checking typically results in less optimized code than does static type checking. (Modern runtimes and JIT compilers can offset this, but usually by doing static type analysis at runtime and then generating/compiling code for direct execution--in essence, just pushing the compilation process to the last possible moment before execution.)

	* Dynamic type checking forces runtime checks to occur for every execution of the program (instead of just at compile-time).

	* It opens up the doors for more powerful language features and makes certain other development practices significantly easier. For example, metaprogramming – especially when using `eval` functionality – is not impossible in statically-typed languages, but it is much, much easier to work with in dynamically-typed languages.

Note that while these terms usually are applied most directly to programming languages, there's a strong case to be made that they apply to other areas of programming, too, like storage. A relational database, for example, could be said to be a strongly-type-safe (because it insists on only integers in INTEGER columns) and statically-type-checked (since it parses SQL and does type-checking).

### Type-safety

* Strong: A strongly-typed language is one in which variables are bound to specific data types, and will result in type errors if types to not match up as expected in the expression. A simple way to think of strong typing is to consider it to be a guarantor of high degrees of type safety. 

* Weak: A weakly-typed language on the other hand is a language in which variables are not bound to a specific data type; they still have a type, but type safety constraints are lower compared to strongly-typed languages. 

Note that while these terms usually are applied most directly to programming languages, there's a strong case to be made that they apply to other areas of programming, too, like storage. A relational database, for example, could be said to be a strongly-type-safe (because it insists on only integers in INTEGER columns) and statically-type-checked (since it parses SQL and does type-checking).
