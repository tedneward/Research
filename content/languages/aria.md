title=Aria
tags=language, functional
summary=Expressive, noiseless, interpreted, toy programming language.
~~~~~~

[Source](https://github.com/fadion/aria)

```
var name = "aria language"
let expressive? = func (x: String) -> String
  if x != ""
    return "expressive " + x
  end
  "sorry, what?"
end

let pipe = name |> expressive?() |> String.capitalize()
println(pipe) // "Expressive Aria Language"
```

Aria is an expressive, interpreted, toy language built as an exercise on designing and interpreting a programming language. It has a noiseless syntax, free of useless semi colons, braces or parantheses, and treats everything as an expression. Technically, it's built with a hand written lexer and parser, a recursive decent one (Pratt), and a tree-walk interpreter. I have never set any goals for it to be either fast, nor bulletproof, so don't expect neither of them.

It features mutable and immutable values, if and switch conditionals, functions, type hinting, for loops, modules, the pipe operator, imports and many more. More importantly, it's getting expanded frequently with new features, more functions for the standard library and bug fixes. All of that while retaining it's expressiveness, clean syntax and easy of use.

