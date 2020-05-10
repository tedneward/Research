title=Gleam
tags=language, beam, functional, static
summary=A statically typed functional programming language for building scalable concurrent systems.
~~~~~~

Gleam is a statically typed functional programming language for building scalable concurrent systems.

It compiles to Erlang and has straightforward interop with other BEAM languages such as Erlang, Elixir and LFE.

It looks like this:

```
pub type Tree(value) {
  Leaf(value)
  Node(Tree(value), Tree(value))
}

pub fn any(tree: Tree(a), check: fn(a) -> Bool) -> Bool {
  case tree {
    Leaf(i) -> check(i)
    Node(left, right) -> any(left, check) || any(right, check)
  }
}

pub fn has_even_leaf(tree: Tree(Int)) -> Bool {
  any(tree, fn(i) {
    i % 2 == 0
  })
}
```

[Website](https://gleam.run/) | [Github](https://github.com/gleam-lang/gleam)
