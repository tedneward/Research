title=Moonscript
tags=language
summary=A dynamic scripting language that compiles to Lua.
~~~~~~

[Website](https://moonscript.org/) | [Source](https://github.com/leafo/moonscript)

Example:
```
class Thing
  name: "unknown"

class Person extends Thing
  say_name: => print "Hello, I am #{@name}!"

with Person!
  .name = "MoonScript"
  \say_name!
```
and
```
export my_func
x = 2323

collection =
  height: 32434
  hats: {"tophat", "bball", "bowler"}

my_func = (a) -> x + a

print my_func 100
```

It also adds table comprehensions, implicit return on functions, classes, inheritance, scope management statements import & export, and a convenient object creation statement called with.

https://github.com/leafo/moonscript
MoonScript is a dynamic scripting language that compiles into Lua. It gives you the power of one of the fastest scripting languages combined with a rich set of features.
