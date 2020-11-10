title=Earl Grey
tags=language, nodejs, browser
summary=Programming language compiling to JavaScript.
~~~~~~

[Source](https://github.com/breuleux/earl-grey)

Example: Fibonacci:
```
gen fib() =
   var {a, b} = {0, 1}
   while true:
      yield a
      {a, b} = {b, a + b}

fib() each
   > 100 ->
      break
   n when n mod 2 == 0 ->
      print n
```
Example: Classes:
```
class Person:
   constructor(name, age) =
      @name = name
      @age = age
   advance-inexorably-towards-death(n > 0 = 1) =
      @age += n
   say-name() =
      print 'Hello! My name is {@name}!'

alice = Person("alice", 25)
```
Example: Pattern matching:
```
match thing:
   0 ->
      print "The thing is zero"
   < 0 ->
      print "The thing is negative"
   R"hello (.*)"? x ->
      ;; note: R"..." is a regular expression
      print 'The thing is saying hello'
   Number? x or String? x ->
      print "The thing is a number or a string"
   {x, y, z} ->
      print 'The thing is an array of three things, {x}, {y} and {z}'
   {=> name} ->
      print 'The thing has a "name" field'
   else ->
      print "I don't know what the thing is!"
```
