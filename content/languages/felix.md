title=Felix
tags=language
summary=An advanced, statically typed, high performance scripting language with native C++ embedding.
~~~~~~

[Website](https://felix-lang.github.io/felix/) | [Source](https://github.com/felix-lang/felix)

```
// hello.flx
println$ "Hello World";
```

can be run directly:

```
flx hello.flx
```

Felix is a C++ code generator specifically designed so that all your favourite C and C++ libraries can be embedded with little or no glue logic:

```
// required header 
header vector_h = '#include <vector>';

// C++11 for smart pointers
header memory_h = '#include <memory>' 
  requires package "cplusplus_11"
;
 
// types
type vector[T] = "::std::shared_ptr<::std::vector<?1>>" 
  requires vector_h, memory_h
;

type viterator[T] = "::std::vector<?1>::iterator"
  requires vector_h
;

// constructor
ctor[T] vector[T] : unit = "::std::make_shared<::std::vector<?1>>()";

// operations
proc push_back[T] : vector[T] * T =  "$1->push_back($2);";
proc push_back[T] (v: vector[T]) (elt:T) => push_back(v,elt);

fun stl_begin[T] : vector[T] -> viterator[T] = "$1->begin()";
fun deref[T] : viterator[T] -> T = "*$1";

// example use
var v = vector[int]();
v.push_back 42;
println$ *v.stl_begin;
```


https://github.com/felix-lang/felix
An advanced, statically typed, high performance scripting language with native C++ embedding.
