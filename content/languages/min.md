title=Min
tags=language, jvm, message-passing
summary=A Prototype-based language with syntax inspired by Io and Ruby, topped with Python's indentation (but only when you want to).
~~~~~~

[Source](https://github.com/macournoyer/min)

```
  Min = Io clone do:
    you_can indent to("create blocks")
    you_can indent
            to("split a message chain in several lines")
    
    initialize = method:
      @it = "rly looks like Ruby"
      @but = "with lots of Io flavor"
      
    if(indentation == confusing?("sometimes"),
      use () like in(Io)
    )
```

Philosophies:

* Everything is an object.
* Everything is a message, no special magic statements (if, def, while, +, &&).
* As little parenthesis as possible.
* Most of the core is open.
* As close to English as possible.

https://github.com/h3rald/min
A small but practical concatenative programming language and shell.
