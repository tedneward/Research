title=Mangle
tags=language, logic, storage
summary=A programming language for deductive database programming; it is an extension of Datalog, with various extensions like aggregation, function calls and optional type-checking.
~~~~~~

[Source](https://github.com/google/mangle)

Deductive database programming is useful for bringing data from multiple data sources together since it enables us to represent and query that data in a uniform way. It can also be used to model domain knowledge, similar to machine-readable ontology but without being restricted to binary predicates.

Datalog is an expressive declarative language similar to relational calculus (think SQL and relational views). Unlike relational calculus, it also supports recursive rules and program structuring in a straightforward way.

Mangle contains Datalog as a fragment and adds extensions that make its use more practical. Some of the good properties like guaranteed termination are lost when such extensions are used.

The goal of Mangle as an open source project is to convey the concepts in a way that is accessible to developers and lends itself to easy experimentation. This repository contains an implementation of Mangle as a go library that can be easily embedded into applications.

