title=Janet
tags=language, lisp, native, windows, linux, macos
summary=A functional and imperative Lisp and bytecode interpreter, where lists are replaced by other data structures (arrays, tables (hash table), struct (immutable hash table), tuples).
~~~~~~

The language also supports bridging to native code written in C, meta-programming with macros, and bytecode assembly.

[Website](https://janet-lang.org/) | [Source](https://github.com/janet-lang/janet) | [Janet for Mortals](https://janet.guide/)

It's like a "modern Lisp", featuring great and easy C interop and a variety of data types like arrays, structs, tables, etc. 

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

```
(defn sum3
  "Solve the 3SUM problem in O(n^2) time."
  [s]
  (def tab @{})
  (def solutions @{})
  (def len (length s))
  (for k 0 len
    (put tab (s k) k))
  (for i 0 len
    (for j 0 len
      (def k (get tab (- 0 (s i) (s j))))
      (when (and k (not= k i) (not= k j) (not= i j))
        (put solutions {i true j true k true} true))))
  (map keys (keys solutions)))

(let [arr @[2 4 1 3 8 7 -3 -1 12 -5 -8]]
  (printf "3sum of %j: " arr)
  (printf "%j" (sum3 arr)))
```

