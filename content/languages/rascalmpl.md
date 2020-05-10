title=RascalMPL
tags=language, object, metaobject, tool
summary=An experimental domain specific language for metaprogramming, such as static code analysis, program transformation, program generation and implementation of domain specific languages.
~~~~~~

Rascal is a programming language; such that meta programs can be created by, understood by, and debugged by programmers.

Rascal primitives include immutable data, context-free grammars and algebraic data-types, relations, relational calculus operators, advanced patterns matching, generic type-safe traversal, comprehensions, concrete syntax for objects, lexically scoped backtracking, and string templates for code generation. It has libraries for integrating language front-ends, for reusing analysis algorithms, for getting typed meta-data out of version management systems, for interactive visualization, etc.

[Website](https://www.rascal-mpl.org/) | [UseTheSource](http://usethesource.io/) Project

From the website:

> One of the goals of Rascal is to allow the definition of Domain-Specific Languages. ... A grammar in Rascal:

```
module Syntax

extend lang::std::Layout;
extend lang::std::Id;

start syntax Machine = machine: State+ states;
syntax State = @Foldable state: "state" Id name Trans* out;
syntax Trans = trans: Id event ":" Id to;
```

> A fact extractor and checker in Rascal, using concrete syntax:

```
module Analyze

import Syntax;

set[Id] unreachable(Machine m) {
  r = { <q1,q2> | (State)`state <Id q1> <Trans* ts>` <- m.states, 
				  (Trans)`<Id _>: <Id q2>` <- ts }+;
  qs = [ q.name | /State q := m ];
  return { q | q <- qs, q notin r[qs[0]] };
}
```

> A code generator:

```
module Compile

import Syntax;

str compile(Machine m) =
  "while (true) {
  '  event = input.next();
  '  switch (current) { 
  '    <for (q <- m.states) {>
  '    case \"<q.name>\":
  '      <for (t <- q.out) {>
  '      if (event.equals(\"<t.event>\"))
  '        current = \"<t.to>\";
  '      <}>
  '      break;
  '    <}>
  '  }
  '}"
```

