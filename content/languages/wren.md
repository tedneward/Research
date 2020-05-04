title=Wren
tags=language, native
summary=Think Smalltalk in a Lua-sized package with a dash of Erlang and wrapped up in a modern syntax.
~~~~~~

[Website](http://wren.io/) | [Github](https://github.com/wren-lang/wren)

From the home page:
```
System.print("Hello, world!")

class Wren { 
  flyTo(city) { 
    System.print("Flying to %(city)") 
  } 
}

var adjectives = Fiber.new { 
  ["small", "clean", "fast"].each {|word| Fiber.yield(word) } 
}

while (!adjectives.isDone) System.print(adjectives.call())
```

VM implementation is small (under 4,000 semicolons), fast, class-based, concurrent, scripting language (offers C/C++ bindings for easy embedding).

