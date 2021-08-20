title=Yarr
tags=language, clr, lisp
summary=A Lisp-based scripting language for .NET with many features borrowed from Common Lisp. It has numerous extensibility features, and can serve as the basis for domain-specific languages. Includes sample console and WPF applications showing how to host the Yarr runtime.
~~~~~~

[CodePlex Archive](https://archive.codeplex.com/?p=yarr) | [Archived download](Yarr.zip)

### Introduction
Yarr is a dynamic lisp-based scripting language for the Microsoft .NET framework. It was originally developed (as LSharp) by Rob Blackwell at Active Web Solutions, and released under GPL. Extensive modifications have been made to the original LSharp code base to improve interoperability between scripts and .NET classes, to add more Common Lisp features to the language, and to make the language easier to integrate into existing .NET based systems.

**Yarr is extensible** Yarr is an excellent starting point for developing a Domain Specific Language:

* Yarr uses a Common Lisp-like reader, based on readtables, which allows the hosting application to customize the language syntax
* .NET methods and objects from the hosting application can be bound directly into the Yarr environment, and invoked from Yarr scripts as if they were built-in primitives. In fact, all of Yarr's built-in functions are implemented this way
* Functions defined in Yarr scripts can be directly invoked by the hosting application via delegates provided by the Yarr runtime

**Language features**

* Objects, Methods, and Types are all first-class objects in Yarr
* Yarr supports all built-in and user-defined .NET types, including generics
* Yarr provides traditional Lisp functionality, including macros, property lists, lexical scoping, and a varierty of map/reduce functions
* Yarr functions support Common Lisp-like parameters such as &optional, &key, etc. Host methods bound into the Yarr environment can have Yarr automatically process these parameters for them
