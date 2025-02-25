title=Thoughts and reading about continuations
tags=reading, language
summary=Articles, links, websites, etc
~~~~~~

## Reading

["Continuations--what are they?"](https://lambdaland.org/posts/2022-11-17_continutations/)

[The Essence of Compiling Continuations (PDF)](https://www.cs.rice.edu/~javaplt/311/Readings/essence-retro.pdf) ([Another PDF](https://users.soe.ucsc.edu/~cormac/papers/pldi93.pdf))

["By example: Continuation-passing style in JavaScript"](https://matt.might.net/articles/by-example-continuation-passing-style/): "If a language supports continuations, the programmer can add control constructs like exceptions, backtracking, threads and generators. Sadly, many explanations of continuations (mine included) feel vague and unsatisfying. Such power deserves a solid pedagogical foundation. Continuation-passing style is that foundation. Continuation-passing style gives continuations meaning in terms of code. Even better, a programmer can discover continuation-passing style by themselves if subjected to one constraint: *No procedure is allowed to return to its caller--ever.* One hint makes programming in this style possible: *Procedures can take a callback to invoke upon their return value.* When a procedure is ready to "return" to its caller, it invokes the "current continuation" callback (provided by its caller) on the return value. A continuation is a first-class return point.

