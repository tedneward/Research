title=Oz (language) and Mozart (programming system)
tags=language, functional, object, concurrency, logic, metaobject
summary=A multiparadigm programming language including logic, functional (both lazy evaluation and eager evaluation), imperative, object-oriented, constraint, distributed, and concurrent programming.
~~~~~~

[Website](http://mozart2.org/) | [Source](https://github.com/mozart/mozart2)

The Mozart Programming System combines ongoing research in programming language design and implementation, constraint logic programming, distributed computing, and human-computer interfaces. Mozart implements the Oz language and provides both expressive power and advanced functionality. 

### Data structures
Oz is based on a core language with very few datatypes that can be extended into more practical ones through syntactic sugar.

Basic data structures:

* Numbers: floating point or integer (real integer)
* Records: for grouping data : circle(x:0 y:1 radius:3 color:blue style:dots). Here the terms x,y, radius etc. are called features and the data associated with the features (in this case 0,1,3 etc.) are the values.
* Tuples: Records with integer features in ascending order: circle(1:0 2:1 3:3 4:blue 5:dots) .
* Lists: a simple linear structure

```
'|'(2 '|'(4 '|'(6 '|'(8 nil)))) % as a record.
2|(4|(6|(8|nil))) % with some syntactic sugar
2|4|6|8|nil % more syntactic sugar
[2 4 6 8] % even more syntactic sugar
```

Those data structures are values (constant), first class and dynamically type checked. Variable names in Oz start with an uppercase letter to distinguish them from literals[4] which always begin with a lowercase letter.

### Functions
Functions are first class values, allowing higher order functional programming:

```
fun {Fact N}
   if N =< 0 then 1 else N*{Fact N-1} end
end

fun {Comb N K}
   {Fact N} div ({Fact K} * {Fact N-K}) % integers can't overflow in Oz (unless no memory is left)
end

fun {SumList List}
   case List of nil then 0
   [] H|T then H+{SumList T} % pattern matching on lists
   end
end
```

Functions may be used with both free and bound variables. Free variable values are found using static lexical scoping. Supports higher-order functions and anonymous functions; procedures are functions (using the "proc" keyword) that return no value.

### Dataflow variables and declarative concurrency
When the program encounters an unbound variable it waits for a value. For example, below, the thread will wait until both X and Y are bound to a value before showing the value of Z.

```
thread 
   Z = X+Y
   {Browse Z}
end
thread X = 40 end
thread Y = 2 end
```

The value of a dataflow variable cannot be changed once it is bound:
```
X = 1
X = 2 % error
```

Dataflow variables make it easy to create concurrent stream agents:
```
fun {Ints N Max}
   if N == Max then nil
   else 
      {Delay 1000}
      N|{Ints N+1 Max}
   end
end

fun {Sum S Stream}
   case Stream
      of nil then S
      [] H|T then S|{Sum H+S T}
   end
end

local X Y in
   thread X = {Ints 0 1000} end
   thread Y = {Sum 0 X} end
   {Browse Y}
end
```

Because of the way dataflow variables work, it is possible to put threads anywhere in a program and guaranteed that it will have the same result. This makes concurrent programming very easy. Threads are very cheap: it is possible to have 100,000 threads running at once.

This example computes a stream of prime numbers using the trial division algorithm by recursively creating concurrent stream agents that filter out non-prime numbers:
```
fun {Sieve Xs}
   case Xs of nil then nil
   [] X|Xr then Ys in
      thread Ys = {Filter Xr fun {$ Y} Y mod X \= 0 end} end
      X|{Sieve Ys}
   end
end
```

### State and objects
It is again possible to extend the declarative model to support state and object-oriented programming with very simple semantics. To create a new mutable data structure called Cells:
```
local A X in
   A = {NewCell 0}
   A := 1  % changes the value of A to 1
   X = @A  % @ is used to access the value of A
end
```

With these simple semantic changes, the whole object-oriented paradigm can be supported. With a little syntactic sugar, OOP becomes well integrated in Oz.
```
class Counter
   attr val
   meth init(Value)
      val:=Value
   end
   meth browse
      {Browse @val}
   end
   meth inc(Value)
      val :=@val+Value
   end
end

local C in
   C = {New Counter init(0)}
   {C inc(6)}
   {C browse}
end
```
