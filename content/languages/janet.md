title=Janet
tags=language, native
summary=A functional and imperative programming language and bytecode interpreter. It is a lisp-like language, but lists are replaced by other data structures (arrays, tables (hash table), struct (immutable hash table), tuples). The language also supports bridging to native code written in C, meta-programming with macros, and bytecode assembly.
~~~~~~

[Website](https://janet-lang.org/) | [Source](https://github.com/janet-lang/janet) | [Janet for Mortals](https://janet.guide/)

Hello world:
```
(print "Hello, world!")
```

Object-oriented programming:
```
# Create a new object called Car with two methods, :say and :honk.
(def Car
 @{:type "Car"
   :color "gray"
   :say (fn [self msg] (print "Car says: " msg))
   :honk (fn [self] (print "beep beep! I am " (self :color) "!"))})

# Red Car inherits from Car
(def RedCar
 (table/setproto @{:color "red"} Car))

(:honk Car) # prints "beep beep! I am gray!"
(:honk RedCar) # prints "beep beep! I am red!"

# Pass more arguments
(:say Car "hello!") # prints "Car says: hello!"
```
