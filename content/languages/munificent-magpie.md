title=Magpie
tags=language, jvm, native, vm
summary=A small dynamically-typed programming language built around patterns, classes, and multimethods. It has a prototype interpreter that runs on the JVM and an in-progress bytecode VM written in C++.
~~~~~~

[Website](http://magpie-lang.org/) | [Source](https://github.com/munificent/magpie) (no updates since 2020)

A Bob Nystrom experiment.

It looks a bit like this:

```
// Generates the sequence of turns needed to draw a dragon curve.
// See: http://en.wikipedia.org/wiki/Dragon_curve
def dragon(0, _)
    ""
end

def dragon(n is Int, turn)
    dragon(n - 1, "R") + turn + dragon(n - 1, "L")
end

print(dragon(5, ""))
```
