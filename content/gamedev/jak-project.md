title=GOAL (part of Jak-Project)
tags=gamedev, language, linux, windows
summary=Port Jak 1 (NTSC "black label" version) to PC; over 99% of this game is written in GOAL, a custom Lisp language developed by Naughty Dog.
~~~~~~

[Jak-Project Source](https://github.com/water111/jak-project)

[GOAL Website](https://water111.github.io/jak-project/) | [GOAL Documentation](https://water111.github.io/jak-project/api-docs.html#/)

*(Everything is a quote from the docs unless italicized like this)*

*(There is a lot of stuff in this language that's "interesting", starting with the idea that it's a combination of Lisp and C/C++, static and dynamic, and compiled to object code.)*

### Overview
OpenGOAL is a compiled language. Source code is stored in .gc files. Each .gc file is compiled into a .o file. These .o files are then loaded by the game. When they are loaded, it has the effect of running every "top level" expression in the file. Usually these are function, type, and method declarations, but you can also use this for initialization code. For example, it is common to first define types, functions, and methods, then set up global instances.

There are effectively three different "languages":

1. OpenGOAL - the normal compiled language.
2. OpenGOAL compiler commands - simple commands to run the compiler, listener, and debugger. These run in the compiler only.
3. GOOS macro language. This is used in OpenGOAL macros and runs at compile-time. These macros generate OpenGOAL compiler commands or OpenGOAL source which is then processed. These run in the compiler only.

The OpenGOAL language uses a LISP syntax, but on the inside is closer to C or C++. There is no protection against use-after-free or other common pointer bugs.

Unlike a C/C++ compiler, the OpenGOAL compiler has a state. It remembers functions/methods/types/macros/constants/enums/etc defined in previous files.

#### Type System Introduction
OpenGOAL has a type system. Every expression and object in OpenGOAL has a type. With the exception of three special types (none, _varags_, and _types_), every type has a parent type, and the root of all types is object. Types themselves are objects in the runtime that contain some basic information and their method table.

One annoying detail of OpenGOAL is that the type system has some slightly different types for variables and places in memory, and automatic conversions between them.

Another annoying detail is that there are a totally separate set of rules for 128-bit integer types (or children of these). Nothing in this section applies to these.

Some types are boxed vs. unboxed. If you have an object of boxed type, it is possible to figure out its type at runtime. If you have an object of unboxed type, you can't. If you have an unboxed type, you can't tell if it's a boxed or unboxed object.

Some types are value or reference. A value type means it has value semantics, it is passed by value everywhere. A reference type is like a C/C++ pointer or reference, where there is memory allocated for the data somewhere, and the you just pass around a reference to this memory.

### Type System

This document explains the GOAL type system.  The GOAL type system supports runtime typing, single inheritance, virtual methods, and dynamically sized structures.

There's a single type system library, located in `common/type_system`.  It will be used in both the decompiler and compiler. The plan is to have a single `all_types.gc` file which contains all type information (type definitions and types of globals). The decompiler will help generate this, but some small details may need to be filled in manually for some types.  Later versions of the decompiler can use this information to figure out what fields of types are being accessed.  We can also add a test to make sure that types defined in the decompiled game match `all_types.gc`.

The main features are:

- `TypeSystem` stores all type information and provides a convenient way to add new types or request information about existing types.
- `Type` information about a GOAL Type.  A "base GOAL type" is identified by a single unique string. Examples: `function`, `string`, `vector3h`.
- `TypeSpec` a way to specify either `Type` or a "compound type".  Compound types are used to create types which represent specific function types (function which takes two integer arguments and returns a string), or specific pointer/array types (pointer to an integer).  These can be represented as (possibly nested) lists, like `(pointer integer)` or `(function (integer integer) string)`.
- Type Checking for compiler
- Parsing of type definitions for compiler
- Lowest common ancestor implementation for compiler to figure out return types for branching forms.
- Logic to catch multiple incompatible type definitions for both compiler warnings and decompiler sanity checks

The type system will store:
- The types of all global variables (this includes functions)
- Information about all types:
  - Fields/specific details on how to load from memory, alignment, sign extension, size in arrays, etc...
  - Parent type
  - Methods not defined for the parent.

It's important that all of the type-related info is stored/calculated in a single location. The proof of concept compiler did not have the equivalent of `TypeSystem` and scattered field/array access logic all over the place.  This was extremely confusing to get right.

If type information is specified multiple times, and is also inconsistent, the TypeSystem can be configured to either throw an exception or print a warning.

This will be a big improvement over the "proof of concept" compiler which did not handle this situation well.  When debugging GOAL you will often put the same file through the compiler again and again, changing functions, but not types.  In this case, there should be no warnings. If the type does change, it should warn (as old code may exist that uses the old type layout), but shouldn't cause the compiler to abort, error, or do something very unexpected.

#### Compile-time vs Run-time

The types in the runtime are only a subset of the compile time types. Here are the rules I've discovered so far
- Any compound types become just the first type. So `(pointer my-type)` becomes `pointer`.
- The `inline-array` class just becomes `pointer`.
- Some children of integers disappear, but others don't. The rules for this aren't known yet.

#### Types of Types

Everything in GOAL has a type at compile time.  A subset of compile-time types are also available in the runtime as objects with the same name as the type.  For example, there is a `string` type, and at runtime there is a global object named `string` which is an object of type `type` containing information about the `string` type.

Some objects have runtime type information, and others don't.  Objects which have runtime type information can have their type identified at runtime, and are called "boxed objects".  Objects without runtime type information are called "unboxed objects".  An unboxed object cannot reliably be detected as a unboxed object - you can't write a function that takes an arbitrary object and tells you if its boxed or not.  However, boxed objects can always be recognized as boxed.

All types have a parent type, and all types descend from the parent type `object`, except for the special type `none` (and maybe `_type_`, but more on this later). The `none` type doesn't exist in the runtime and is used to represent an invalid value that the compiler should not use.  For example, the return type of a function which doesn't return anything is `none`, and attempting to use this value should cause an error.

Here are some important special types:
- `object` - the parent of all types
- `structure` - parent type of any type with fields
- `basic` - parent type of any `structure` with runtime type information.

##### Value Types

Some GOAL types are "value types", meaning they are passed by value when used as arguments to functions, return values from functions, local variables, and when using `set!`.  These are always very small and fit directly into the CPU registers.  Some example value types:
- Floating point numbers
- Integers

##### Reference Types

Other GOAL types are "reference types", meaning they act like a reference to data when used as arguments to functions, return values from functions, local variables, and when using `set!`.  The data can be allocated on a heap, on the stack, or as part of static data included when loading code (which is technically also on a heap).  All structure/basic types are reference types.

You can think of these like C/C++ pointers or references, which is how it is implemented.  The difference is that there's no special notation for this.  A GOAL `string` object is like a C/C++ `string*` or `string&`.  A GOAL "pointer to reference type" is like a C/C++ `my_type**`.

Note - this is quite a bit different from C/C++. In C++ you can have a structure with value semantics (normal), or reference semantics (C++ reference or pointer).  In GOAL, there is no value semantics for structures!  This is great because it means function arguments/variables always fit into registers.

##### Dynamic Size Types

Any type which ends with a dynamic array as the last field is dynamic. For these, it's a good idea to implement the `asize-of` method.

##### Compound Types

A compound type is a type like "a pointer to an int64" or "a function which takes int as an argument and returns a string". These exist only at compile time, and get simplified at runtime. For example, all pointers become `pointer` and all functions become `function`. (The one exception to this seems to be `inline-array-class` stuff, but this is not yet supported in OpenGOAL).

###### Pointer

Pointers work like you would expect. They can only point to memory types - you can't have a `(pointer int)`, instead you must have a `(pointer int32)` (for example).  Note that a `(pointer basic)` is like a C++ `basic**` as `basic` is already like a C++ pointer to struct. You can nest these, like `(pointer (pointer int64))`.  If you want a pointer with no type, (like C++ `void*`) just use a plain `pointer`. The `(pointer none)` type is invalid.

Like in C/C++, you can use array indexing with a pointer. One thing to note is that a `(pointer basic)` (or pointer to any reference type) is like a C++ "array of pointers to structs". To get the C++ "array of structs", you need an `inline-array`.

###### Arrays

For value types, arrays work as you expect.  They have type `(pointer your-type)`.  Arrays of references come in two versions:
- Array of references: `(pointer your-type)`, like a C array of pointers
- Array of inline objects: `(inline-array your-type)`, like a C array of structs

The default alignment of structs is 16 bytes, which is also the minimum alignment of `kmalloc`, and the minimum alignment used when using a reference type as an inline field.  However, it's possible to violate this rule in a `(inline-array your-type)` to be more efficient.  The `your-type` can set a flag indicating it should be packed in an inline array.

I believe the alignment then becomes the maximum of the minimum alignment of the `your-type` fields.  So if you have a type with two `uint32`s (alignment 4 bytes), an `(inline-array your-type)` can then have spacing of 8 bytes, instead of the usual minimum 16.  The behavior of a `(field-name your-type :inline #t)` is unchanged and will still align at the minimum of 16 bytes. I _believe_ that the first element of the array will still have an alignment of 16.

####### Inline Arrays

These are only valid for reference types. They refer to an array of the actual data (like C array of structs) rather than an array of reference (like C array of pointers to structs, or GOAL `(pointer structure)`).  At runtime, `inline-array` becomes pointer.

For an inline array of basics, elements are 16-byte aligned. For `structure`s that aren't `basic`, the alignment is usually the minimum alignment of all members of the structure, but there is an option to make it 16-byte aligned if needed.

For information about how to create these arrays, see `deftype` (fields in a type) and `new` (create just an array) sections.

###### Function

Function compound types look like this `(function arg0-type arg1-type... return-type)`. There can be no arguments. The `return-type` must always be specified, and should be `none` if there is no return value.  The argument types themselves can be compound types.  In order to call a function, you must have a compound function type - a `function` by itself cannot be called.

##### Field Definitions

GOAL field definitions look like this:

`(name type-name [optional stuff])`

where optional stuff can include these, in any order:

- `:inline #t` (default is false), to mark field as inline. This can only be done for a reference type, and indicates that the data should be stored inline, in the type, rather than just storing a reference to data stored elsewhere.
- `:dynamic #t` (default is false), to mark field as dynamically-sized array (must be the last field in the type)
- a number, to give an array size.
- `:offset x` where x is a number, to manually specify where the field is located

There are many combinations of reference/value, dynamic/not-dynamic, inline/not-inline, array-size/no-array-size, and it can be confusing.  This list explains all that are valid.

- Value type, no modifiers: a single value is stored in the field. The field type is the value type.
- Value type, `:dynamic #t`: the field marks the beginning of an array (of unknown size). Field type is `(pointer your-type)`
- Value type, with array size: the field marks the beginning of an array (of known size). Field type is `(pointer your-type)`
- Value type, with `:inline #t`: invalid in all cases.
- Reference type, no modifiers: a single reference is stored in the type. Type of field is `your-type` (a C++ pointer).
- Reference type, `:inline #t`: a single object is stored inside the type. Type of field is `your-type` still (a C++ pointer). The access logic is different to make this work.
- Reference type, `:dynamic #t` or array size: the field marks the beginning of an **array of references**. Field type is `(pointer your-type)`.  Like C array of pointers.
- Reference type, `:inline #t` and (`:dynamic #t` or array size): the field marks the beginning of an **array of inline objects**. Field type is `(inline-array your-type)`. Like C array of structs.

Bonus ones, for where the array is stored _outside_ of the type:
- A dynamically typed GOAL array, stored outside your type (think `std::vector`): use `(name (array your-type))`
- A dynamically typed GOAL array, stored inside your type: Not allowed, `array` is dynamic!
- An array of value types, stored outside your type: use `(name (pointer your-type))`
- An array of references (C++ array of pointers), stored outside your type: use `(name (pointer your-ref-type))`
- An array of objects of reference type (C++ array of structs), stored outside your type: use `(name (inline-array your-ref-type))`

Of course, you can combine these, to get even more confusing types! But this seems uncommon.

###### Field Placement

The exact rules for placing fields in GOAL types is unknown, but the simple approach of "place the next field as close as possible to the end of the last field" seems to get it right almost all the time. However, we need to be extra certain that we lay out type fields correctly because many GOAL types have overlapping fields.

The theory I'm going with for now is:
- The order of fields in the `inspect` method is the order fields are listed in in the type definition
- In the rare cases this is wrong, this is due to somebody manually specifying an offset.

As a result, we should specify offsets like this:
- If we think a field was manually placed, use `:offset` to override. This is certain to be right
- If we think a field was automatically placed, use `:offset-assert` to inform the compiler where we expect it to be.  In this case it will still place the field automatically, but if the result is different from the `:offset-assert`, it will throw an error.
- Avoid defining any fields without `:offset` or `:offset-assert`

#### Built-in Types

There are a number of built-in types. I use "abstract" type to refer to a type that is only a parent type.

##### `none`
This is a special type that represents "no information". This is the return type of a function which returns nothing, and also the return type of an expression that doesn't return anything.  For example, the expression `(goto x)` does not produce a value, so its type is `none`.

##### `object`
This is the parent type of all types. This is an abstract class. In a variable, this is always `object`, and can hold any `object`. In memory, this is either `object32` or `object64`. The `object32` can hold everything except for `binteger` and 64-bit integers. This type is neither boxed nor unboxed and is neither value nor reference.

##### `structure` (child of `object`)
This is the parent type of all types with fields. This is an abstract class and a reference class.  A `structure` can hold any `structure`, both in memory and in a variable.  It is unboxed.

##### `basic` (child of `structure`)
This is the "boxed" version of `structure`. The first field of a basic is `type`, which contains the `type` of the object. It is boxed and a reference. A `basic` can hold any `basic`, both in memory and in a variable.

##### `symbol` (child of `basic`)
A symbol has a name and a value. The name is a string, and the value is an `object32`.  Note that the value is an `object32` so you cannot store a 64-bit integer in a symbol.  It is considered "bad" to store unboxed objects in symbols, though you can get away with it sometimes.

All `symbol`s are stored in the global symbol table, which is a hash table. As a result, you cannot have multiple symbols with the same name. A name is enough to uniquely determine the symbol.  To get a symbol, use the syntax `'symbol-name`. To get the value, use `symbol-name`.

Each global variable, type, and named global function has a symbol for it which has the variable, type, or function as its value. The linker is able to perform symbol table lookups at link time and patch the code so you don't have to do a hash table lookup every time you access a global variable, function, or type.

You can also use symbols as a efficient way to represent a enum. For example, a function may return `'error` or `'complete` as a status. The compiler is able to compare symbols for equality very efficiently (just a pointer comparison, as symbols are a reference type).

##### `type` (child of `basic`)
A `type` stores information about an OpenGOAL type, including its size, parent, and name (stored as a `symbol`). It also stores the method table.  Some OpenGOAL types (children of integers, bitfield types, enums, compounds types) do not have runtime types, and instead become the parent/base type. But these types cannot have runtime type information or methods and are pretty rare.  It is a reference type, is boxed, and is dynamically sized (the method table's size is not fixed).

##### `string` (child of `basic`)
A string. The string is null terminated and also stores the buffer size. This type is a reference type, is boxed, and is also dynamically sized.

##### `function` (child of `basic`)
A function. Boxed and reference. It is a reference to a function, so it's like a C/C++ function pointer type.

##### `kheap` (child of `structure`)
A simple bump-allocated heap. Doesn't store the heap memory, just metadata. Supports allocating from either the top or the bottom. This is used as the memory allocation strategy for the global, debug, and level heaps. Unboxed, reference, not dynamic.

##### `array` (child of `basic`)
A "fancy" array. It is not yet implemented in OpenGOAL.

##### `pair` (child of `object`)
A pair. It is boxed. You should not make child types of `pair`.  The two objects stored by the pair are `object32`s.

##### `pointer` (child of `object`)
It is a 32-bit value type containing a pointer. Not boxed, value type. See section on compound types for more information.

##### `number` (child of `object`)
Abstract type for all numbers. Value type. 64-bits.

##### `float` (child of `number`)
4-byte, single precision floating point number.  Value type.

##### `integer` (child of `number`)
Abstract class for integer numbers. Child classes are `sinteger` (signed integer), `uinteger` (unsigned integer), and `binteger` (boxed-integer, always signed).  These are all 64-bit types.

Children of `sinteger` and `uinteger` are `int8`, `int16`, `int32`, `int64`, `uint8`, `uint16`, `uint32`, `uint64`.  These are the size you expect, value types, and not boxed. These only exist as memory types. In a variable, there is only `int` and `uint`.  These are both 64-bit types. All integer operations (math, logical, shifts) are 64-bit.

The `binteger` is a boxed integer. It is a 61 bit signed integer (the other three bits are lost due to the number being boxed). There may actually be a `buinteger` (or `ubinteger`) but it doesn't exist in OpenGOAL at this point.

###### Weird Built-in types that aren't supported yet.
- `vu-function`
- `link-block`
- `connectable`
- `file-stream`
- `inline-array` (class)

#### Unknown Areas

* Inline Array Class: There's a weird `inline-array-class` type that's not fully understood yet.  It uses `heap-base`.
* Heap Base: This is a field in `type`. What does it mean?  It's zero for most types (at least the early types).
* Second Size Field: There are two fields in `type` for storing the size. The first one stores the exact size, and by default the second stores the size rounded up to the nearest 16 bytes.  Why? Who uses it? Does it ever get changed?

#### TODO

- [ ] Kernel types that are built-in
- [ ] Signed/unsigned for a few built-in type fields
- [ ] Tests for field placement logic (probably a full compiler test?)
- [ ] Bitfield types
- [ ] Type redefinition tests (these are a pain and probably useless, might just wait for full compiler tests?)
- [ ] Stuff for decompiler
  - [ ] What field is here?
  - [ ] Export all deftypes

## Method System

OpenGOAL has a virtual method system. This means that child types can override parent methods.  The first argument to a method is always the object the method is being called on, except for `new`.

All types have methods. Objects have access to all of their parents methods, and may override parent methods.  All types have these 9 methods:

- `new` - like a constructor, returns a new object.  It's not used in all cases, and on all types, and needs more documentation on when specifically it is used.
- `delete` - basically unused, but like a destructor.  Often calls `kfree`, which does nothing.
- `print` - prints a short, one line representation of the object to the `PrintBuffer`
- `inspect` - prints a multi-line description of the object to the `PrintBuffer`. Usually auto-generated by the compiler and prints out the name and value of each field.
- `length` - Returns a length if the type has something like a length (number of characters in string, etc). Otherwise returns 0. Usually returns the number of filled slots, instead of the total number of allocated slots, when there is possibly a difference.
- `asize-of` - Gets the size in memory of the entire object.  Usually this just looks this up from the appropriate `type`, unless it's dynamically sized.
- `copy` - Create a copy of this object on the given heap. Not used very much?
- `relocate` - Some GOAL objects will be moved in memory by the kernel as part of the compacting actor heap system. After being moved, the `relocate` method will be called with the offset of the move, and the object should fix up any internal pointers which may point to the old location. It's also called on v2 objects loaded by the linker when they are first loaded into memory.
- `memusage` - Not understood yet, but probably returns how much memory in bytes the object uses. Not supported by all objects.

Usually a method which overrides a parent method must have the same argument and return types.  The only exception is `new` methods, which can have different argument/return types from the parent.  (Dee the later section on `_type_` for another exception)

The compiler's implementation for calling a method is:
- Is the type a basic?
  - If so, look up the type using runtime type information
  - Get the method from the vtable
- Is the type not a basic?
  - Get the method from the vtable of the compile-time type
  - Note that this process isn't very efficient - instead of directly linking to the slot in the vtable (one deref) it first looks up the `type` by symbol, then the slot (two derefs). I have no idea why it's done this way.

In general, I suspect that the method system was modified after GOAL was first created. There is some evidence that types were once stored in the symbol table, but were removed because the symbol table became full.  This could explain some of the weirdness around method calls/definition rules, and the disaster `method-set!` function.

All type definitions should also define all the methods, in the order they appear in the vtable.  I suspect GOAL had this as well because the method ordering otherwise seems random, and in some cases impossible to get right unless (at least) the number of methods was specified in the type declaration.

#### Special `_type_` Type

The first argument of a method always contains the object that the method is being called on.  It also must have the type `_type_`, which will be substituted by the type system (at compile time) using the following rules:

- At method definition: replace with the type that the method is being defined for.
- At method call: replace with the compile-time type of the object the method is being called on.

The type system is flexible with allowing you to use `_type_` in the method declaration in `deftype`, but not using `_type_` in the actual `defmethod`.

A method can have other arguments or a return value that's of type `_type_`. This special "type" will be replaced __at compile time__ with the type which is defining or calling the method.  No part of this exists at runtime.  It may seem weird, but there are two uses for this.

The first is to allow children to specialize methods and have their own child type as an argument type. For example, say you have a method `is-same-shape`, which compares two objects and sees if they are the same shape. Suppose you first defined this for type `square` with
```
(defmethod square is-same-shape ((obj1 square) (obj2 square))
  (= (-> obj1 side-length) (-> obj2 side-length))
 )
```

Then, if you created a child class of `square` called `rectangle` (this is a terrible way to use inheritance, but it's just an example), and overrode the `is-same-shape` method, you would have to have arguments that are `square`s, which blocks you from accessing `rectangle`-specific fields.  The solution is to define the original method with type `_type_` for the first two arguments.  Then, the method defined for `rectangle` also will have arguments of type `_type_`, which will expand to `rectangle`.


The second use is for a return value.  For example, the `print` and `inspect` methods both return the object that is passed to them, which will always be the same type as the argument passed in.  If `print` was define as `(function object object)`, then `(print my-square)` would lose the information that the return object is a `square`.  If `print` is a `(function _type_ _type_)`, the type system will know that `(print my-square)` will return a `square`.

#### Details on the Order of Overrides

The order in which you `defmethod` and `deftype` matters.

When you `deftype`, you copy all methods from the parent. When you `defmethod`, you always set a method in that type. You may also override methods in a child if: the child hasn't modified that method already, and if you are in a certain mode. This is a somewhat slow process that involves iterating over the entire symbol table and every type in the runtime, so I believe it was disabled when loading level code, and you just had to make sure to `deftype` and `defmethod` in order.

Assume you have the type hierarchy where `a` is the parent of `b`, which is the parent of `c`.

If you first define the three types using `deftype`, then override a method from `a` on `c`, then override that same method on `b`, then `c` won't use the override from `b`.

If you first define the three types using `deftype`, then override a method on `b`, it will _sometimes_ do the override on `c`. This depends on the value of the global variable `*enable-method-set*`, and some other confusing options. It may also print a warning but still do the override in certain cases.

#### Built in Methods

All types have these 9 methods. They have reasonable defaults if you don't provide anything.

##### `new`

The new method is a very special method used to construct a new object, like a constructor. Note that some usages of the `new` keyword __do not__ end up calling the new method. See the `new` section for more details. Unlike C++, fields of a type and elements in an array are not constructed either.

The first argument is an "allocation", indicating where the object should be constructed. It can be
- The symbol `'global` or `'debug`, indicating the global or debug heaps
- The symbols `'process-level-heap` or `'loading-level`, indicating whatever heaps are stored in those symbols.
- `'process`, indicating the allocation should occur on the current process heap.
- `'scratch`, for allocating on the scratchpad. This is unused.
- Otherwise it's treated as a 16-byte aligned address and used for in place construction (it zeros the memory first)

The second argument is the "type to make".  It might seem stupid at first, but it allows child classes to use the same `new` method as the parent class.

The remaining arguments can be used for whatever you want.

When writing your own `new` methods, you should ignore the `allocation` argument and use the `object-new` macro to actually do the allocation.  This takes care of all the details for getting the memory (and setting up runtime type information if its a basic).  See the section on `object-new` for more details.

##### `delete`

This method isn't really used very much. Unlike a C++ destructor it's never called automatically. In some cases, it's repurposed as a "clean up" type function but it doesn't actually free any memory.  It takes no arguments.  The default implementations call `kfree` on what the allocation, but there are two issues:
1. The implementation is sometimes wrong, likely confusing doing pointer math (steps by array stride) with address math (steps by one byte).
2. The `kfree` function does nothing.

The `kheap` system doesn't really support freeing objects unless you free in the opposite order you allocate, so it makes sense that `delete` doesn't really work.

##### `print`

This method should print out a short description of the object (with no newlines) and return the object.  The printing should be done with `(format #t ...)` (see the section on `format`) for more information.  If you call `print` by itself, it'll make this description show up in the REPL. (Note that there is some magic involved to add a newline here... there's actually a function named `print` that calls the `print` method and adds a newline)

The default short description looks like this: `#<test-type @ #x173e54>` for printing an object of type `test-type`. Of course, you can override it with a better version.  Built-in types like string, type, boxed integer, pair, have reasonable overrides.

This method is also used to print out the object with `format`'s `~A` format option.

##### `inspect`

This method should print out a detailed, multi-line description. By default, `structure`s and `basic`s will have an auto-generated method that prints out the name and value of all fields.  For example:

```lisp
gc > (inspect *kernel-context*)
[00164b44] kernel-context
  prevent-from-run: 65
  require-for-run: 0
  allow-to-run: 0
  next-pid: 2
  fast-stack-top: 1879064576
  current-process: #f
  relocating-process: #f
  relocating-min: 0
  relocating-max: 0
  relocating-offset: 0
  low-memory-message: #t
```

In some cases this method is overridden to provide nicer formatting.

##### `length`

This method should return a "length".  The default method for this just returns 0, but for things like strings or buffers, it could be used to return the number of characters or elements in use.  It's usually used to refer to how many are used, rather than the capacity.

##### `asize-of`

This method should return the size of the object. Including the 4 bytes of type info for a `basic`.

By default this grabs the value from the object's `type`, which is only correct for non-dynamic types. For types like `string` or other dynamic types, this method should be overridden. If you intend to store dynamically sized objects of a given type on a process heap, you __must__ implement this method accurately.

##### `copy`

Creates a copy of the object. I don't think this used very much.  Just does a `memcpy` to duplicate by default.

##### `relocate`

The exact details are still unknown, but is used to update internal data structures after an object is moved in memory. This must be support for objects allocated in process heaps of processes allocated on the actor heap or debug actor heap.

It's also called on objects loaded from a GOAL data object file.

##### `mem-usage`

Not much is known yet, but used for computing memory usage statistics.


