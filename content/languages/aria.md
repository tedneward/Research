title=Aria
tags=language
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

