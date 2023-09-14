title=Souffle
tags=language, logic, jvm
summary=A logic programming language inspired by Datalog.
~~~~~~

[Website](https://souffle-lang.github.io/index.html) | [Github](https://github.com/souffle-lang/souffle)

We now consider a simple Datalog program, and explore some of the features of Soufflé. This only introduces some of the most basic functionality available, and advanced users are encouraged to look elsewhere.

Say we have a Datalog file example.dl, whose contents are as shown.

    .decl edge(x:number, y:number)
    .input edge

    .decl path(x:number, y:number)
    .output path

    path(x, y) :- edge(x, y).
    path(x, y) :- path(x, z), edge(z, y).

We see that edge is a .input relation, and so will be read from disk. Also, path is a .output relation, and so will be written to disk.

The last two lines say that 1) “there is a path from x to y if there is an edge from x to y”, and 2) “there is a path from x to y if there is a path from x to some z, and there is an edge from that z to y”.

So if the input edge relation is pairs of vertices in a graph, by these two rules the output path relation will give us all pairs of vertices x and y for which a path exists in that graph from x to y.