title=Callisto
tags=language
summary=A minimalist language on "versioned objects".
~~~~~~

[Source](https://github.com/wyago/Callisto)

This is a micro prototype on how a versioned objects would look in a programming system. It's a horrific implementation (and system) meant only to explore ideas, so it ignores reality in many ways, including performance and memory usage.

The syntax of the language is similar to that of the Io language (at iolanguage.org), hence the name Callisto. The object model is pretty weird though. Instead of having an object with slots, objects are simply stored as a simple union type of Base, the root of the object tree, or a Delta with the name of the slot being changed, the value it's being changed to, and the parent of the delta. (There's also an error value with a string describing the error, but that's not part of the object system itself, it's just a tool for expression evaluation errors.)

An object looks like a simple line of deltas leading back to base:

```
Base ← x is 10 ← y is 10 ← x is 20
```

You can note that this is kind of similar to a git commit chain (or any vaguely similar system; you're probably pretty familiar with git as a specific example though). This example could, for example, be a point with a coordinate. It's interesting to note that it's modification history is encoded in it's delta chain. This is obviously horrible, as it means any mutation will leak memory. There could certainly be a variant of garbage collection that resolves an objects current state and eliminates old changes that are no longer relevant.

