title=Zhi# (ZhiSharp)
tags=language, clr, xml
summary=An extension of C# with compiler and runtime support for XSD data types and Web Ontology Language (OWL).
~~~~~~

[Website](https://alexpaar.github.io/research/zhisharp) | [Source](http://zhisharp.sourceforge.net/)

In Zhi#, it is possible to natively reference external type definitions and to cooperatively use these external types along with conventional C# programming language features such as method overriding. The Zhi# compiler framework is extensible with respect to external typing mechanisms (e.g., subsumption, type derivation, type inference).

The type system features of the C# host language can be extended by external compiler components. In the current implementation, the Zhi# compiler framework includes two external compiler components, which provide type checking and program transformation functionality for XML Schema Definition and the Web Ontology Language.

### Rationale
In recent years, Semantic Web technologies such as RDF(S) and the Description Logics based Web Ontology Language (OWL DL) have paved the way for standardized formal conceptualizations of all kinds of knowledge. Numerous ontologies have been developed to conceptualize a plethora of domains of discourse.

Since corporations from all sectors have braced to define company specific knowledge using Semantic Web technologies, ontology engineering has become a business model for a number of companies. As the underlying standards have matured, tools for ontology engineering have emerged both in commercial as well as in academic fields.

Knowledge acquisition systems such as Protégé make it particularly easy to construct domain ontologies and to enter data. Ontology management systems such as Jena can be used for creating, modifying, querying, and storing ontologies. Inference engines such as Pellet provide support for automatic reasoning. There is an incessantly growing set of tools, projects, and applications for ontology languages like OWL.

Still...

... processing ontological information programmatically is still laborious and error prone. From my experience, this is mainly caused by the lack of compile time support both for XML Schema Definition (XSD) type definitions, which may be the range of OWL data type properties, as well as for terminological knowledge in form of ontologies.

I developed the novel programming language Zhi#, which provides compile time and runtime support for XSD and OWL.

The Zhi# programming language is described in "Zhi# – OWL Aware Compilation" by Alexander Paar and Denny Vrandečić:
    > The usefulness of the Web Ontology Language to describe domains of discourse and to facilitate automatic reasoning services has been widely acknowledged. However, the programmability of ontological knowledge bases is severely impaired by the different conceptual bases of statically typed object-oriented programming languages such as Java and C# and ontology languages such as the Web Ontology Language (OWL). In this work, a novel programming language is presented that integrates OWL and XSD data types with C#. The Zhi# programming language is the first solution of its kind to make XSD data types and OWL class descriptions first-class citizens of a widely-used programming language. The Zhi# programming language eases the development of Semantic Web applications and facilitates the use and reuse of knowledge in form of ontologies. The presented approach was successfully validated to reduce the number of possible runtime errors compared to the use of XML and OWL APIs." [PDF](https://alexpaar.github.io/bibliography/PaarV11.pdf)

Use cases of the Zhi# programming language are delineated in "Searching and Using External Types in an Extensible Software Development Environment" by Alexander Paar: 
    > "Schema and ontology languages have proved to be useful for conceptualizing knowledge in a variety of applications. In many software projects, XML Schema Definition data types and ontological concept descriptions coexist with programming language class hierarchies. However, only programming language type definitions are fully integrated into today’s software development environments. Support for external type systems is spotty. For programmers, it is particularly tedious to search type definitions in XML schema files and OWL ontologies, to browse external type hierarchies, to investigate external type members, and to analyze and comprehend the use of external type definitions in program code. In this work, it will be argued that improved search capabilities are required to ease the use of schema and ontology languages in software projects. Difficulties of searching type definitions in software project workspaces will be indicated. An extensible compiler framework will be outlined that facilitates the use of schema and ontology languages in C# programs. An Eclipse-based integrated development environment will be described that makes XML data types and OWL concept descriptions first-class citizens of the source code editor. Finally, identical search and (just in time) program analysis features for programming language and external type definitions will be suggested." [Bibtex](https://alexpaar.github.io/bibliography/Paar10.bib)

A broader application scope of Zhi# is explained in "Implementing OCL Invariants with Constrained Data Types" by Alexander Paar: 
    > "The Object Constraint Language (OCL) facilitates textual specifications of constraints that apply to Unified Modeling Language (UML) models. In particular, OCL is used for the specification of invariants in UML class diagrams. This paper compares the implementation of OCL invariants in program code by means of aspect-oriented programming (AOP) on the one hand and by means of value space constrained data types on the other hand. By contradistinction of these two approaches it will be argued that the availability of constraint-based type derivation and value space-based subtyping in a statically typed programming language can provide for the enforcement of OCL invariants already at compile time as opposed to runtime." [PDF](https://alexpaar.github.io/bibliography/Paar11.pdf)

