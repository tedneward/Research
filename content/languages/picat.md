title=Picat
tags=language, logic
summary=A simple, and yet powerful, logic-based multi-paradigm programming language aimed for general-purpose applications. (Pattern-matching, Intuitive, Constraints, Actors, Tabling)
~~~~~~

[Website](http://www.picat-lang.org/) | [Download](http://picat-lang.org/download.html) | [C Sources](http://picat-lang.org/download/picat368_src.tar.gz) | [User's Guide](http://picat-lang.org/download/picat_guide.pdf) | [Book](http://picat-lang.org/picatbook2015/constraint_solving_and_planning_with_picat.pdf) | [Tutorial](http://picat-lang.org/download/picat_tutorial.pdf)

Picat is a simple, and yet powerful, logic-based multi-paradigm programming language aimed for general-purpose applications. Picat is a rule-based language, in which predicates, functions, and actors are defined with pattern-matching rules. Picat incorporates many declarative language features for better productivity of software development, including explicit non-determinism, explicit unification, functions, list comprehensions, constraints, and tabling. Picat also provides imperative language constructs, such as assignments and loops, for programming everyday things. The Picat implementation, which is based on a well-designed virtual machine and incorporates a memory manager that garbage-collects and expands the stacks and data areas when needed, is efficient and scalable. Picat can be used for not only symbolic computations, which is a traditional application domain of declarative languages, but also for scripting and modeling tasks.

Example 1: The following predicate, input_data(Tri), reads rows of integers from the text file triangle.txt into an array. This is the first part of a Picat solution for the Euler Project, problem #67.

```
import util.

input_data(Tri) => 
    Lines = read_file_lines("triangle.txt"),
    Tri = new_array(Lines.length),
    I = 1,
    foreach(Line in Lines)
        Tri[I] = Line.split().map(to_integer).to_array(),
	I := I+1
    end.
```

The function read_file_lines/1, which is imported by default from the io module, reads all of the lines from a file as a list of strings. For each Line in Lines, the foreach loop splits Line into tokens (using the function split/1, which is imported from the util module), maps the tokens to integers (map(to_integer)), and converts the list to an array (to_array). As illustrated in this example, Picat, as a scripting language, is as powerful as Python and Ruby.

Example 2: The following function, perms(L), returns a list of all of the permutations of L.

```
perms([]) = [[]].
perms(Lst) = [[E|P] : E in Lst, P in perms(Lst.delete(E))].
Picat provides functional programming features, such as pattern-matching, recursion, and list comprehension, for composing functions.
```

Example 3: Given a triangle stored in an array, the following tabled predicate finds the maximum total sum from top to bottom. This is the second part of the Picat solution for the Euler Project, problem #67.

```
table (+,+,max,nt) 
path(Row,Col,Sum,Tri), Row == Tri.length => Sum = Tri[Row,Col].
path(Row,Col,Sum,Tri) ?=> 
    path(Row+1,Col,Sum1,Tri),
    Sum = Sum1+Tri[Row,Col].
path(Row,Col,Sum,Tri) => 
    path(Row+1,Col+1,Sum1,Tri),
    Sum = Sum1+Tri[Row,Col].    
```

The first line is a table mode declaration that instructs the system about how to table the calls and answers: + means that the argument is tabled, max means that the argument should be maximized, and nt means that the argument is not tabled. This predicate searches for a path with the maximum total sum. If the current row is at the bottom of the triangle, then the leaf value is returned. Otherwise, it makes a non-deterministic choice between two branches, one going straight down and the other going down to the adjacent number. This program is not only compact, but also runs fast. For the 100-row triangle that is provided by the Euler project, this program finds the answer in only 0.01 second.

The planner module is based on tabling. For a planning problem, users only need to specify the conditions on the final states and the set of actions, and call the planner on an initial state to find a plan or a best plan.

Example 4: The following gives part of a program for the Farmer's problem.

```
import planner.

go =>
    S0 = [s,s,s,s],
    best_plan(S0,Plan),
    writeln(Plan).

final([n,n,n,n]) => true.

action([F,F,G,C],S1,Action,ActionCost) ?=>
    Action = farmer_wolf,
    ActionCost = 1,        
    opposite(F,F1),
    S1 = [F1,F1,G,C],
    not unsafe(S1).

...
```

Tabling, when enhanced with term-sharing, early termination, and resource-bounded search techniques, has been shown to be a better alternative to planning than ASP and SAT-based PDDL planners.

Picat currently provides four modules, named cp, sat, mip and smt, for solving constraint satisfaction and optimization problems. These modules follow the same interface. This makes it possible to seamlessly switch from one solver to another. The language features, such as arrays, maps, loops and list comprehensions, make Picat a powerful modeling language for constraint problems.

Example 5: The following example models the N-queens problem by using three all_different constraints.

```
import cp.

queens(N, Q) =>
    Q = new_list(N),
    Q :: 1..N,
    all_different(Q),
    all_different([$Q[I]-I : I in 1..N]),
    all_different([$Q[I]+I : I in 1..N]),
    solve([ff],Q).
```

As demonstrated by the above examples, Picat offers many advantages over other languages. Compared with functional and scripting languages, the support of explicit unification, explicit non-determinism, tabling, and constraints makes Picat more suitable for symbolic computations. Compared with Prolog, Picat is arguably more expressive and scalable: it is not rare to find problems for which Picat requires an order of magnitude fewer lines of code to describe than Prolog and Picat can be significantly faster than Prolog because pattern-matching facilitates indexing of rules.

