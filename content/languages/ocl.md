title=Object Constraint Language (OCL)
tags=language, format, object
summary=A formal language used to describe expressions on UML models that typically specify invariant conditions that must hold for the system being modeled or queries over objects described in a model.
~~~~~~

[Specification (2.4)](https://www.omg.org/spec/OCL/2.4/PDF) (PDF)

## Implementations

* JVM: [Eclipse OCL-MDT](https://projects.eclipse.org/projects/modeling.mdt.ocl)

## Reading

* [The ultimate OCL tutorial](https://modeling-languages.com/ocl-tutorial/)
* [An extensible OCL virtual machine and code generator](https://dl.acm.org/doi/10.1145/2428516.2428519)
* [Java Bytecode Verification with OCL: Why, How and When?](https://www.jot.fm/issues/issue_2020_03/article13.pdf)
* [A-OCL: A Pure-Java Constraint and Transformation Language for MDE](https://www.scitepress.org/Papers/2020/89428/89428.pdf): OCL is a standard MDE language to express constraints. OCL has been criticized for being too complicated, over-engineered, and difficult to learn. But beneath OCL’s complicated exterior is an elegant language based on relational algebra. We call this language Aocl, which has a straightforward implementation in Java. Aocl can be used to write OCL-like constraints and model transformations in Java. A simple MDE tool generates an Aocl Java 8.0 package from an input class diagram for Aocl to be used.
* [Compilation of OCL into Java for the Eclipse OCL Implementation](https://www.ifis.uni-luebeck.de/~moeller/publist-sts-pw-and-m/source/papers/2007/jibr07.pdf) (Thesis, Ayatullah Jibran Shidqie): The separation of Platform Independent Model (PIM) and Platform Specific Model (PSM) defined by Model Driven Architecture (MDA) results in flexibility representation in process design. UML which becomes the standard in modeling representing the PIM can fits into several implementation platforms of the systems. Afterwards PSM can be derived from PIM by either automatically performed by compiler or manually created. OCL constraints come into play to ensure, among other things, the well-formedness of the models that conform to the languages in which PIMs and PSMs are expressed. EMF (Eclipse Modeling Framework) provides facility to generate code from structured data model. Beyond that, MDT (Modeling Development Tools) which provide new technologies within modeling project in eclipse platform, extends EMF feature by providing OCL implementation. It does not compile the OCL into Java code, instead it only interprets the OCL at runtime. Due to the fact that currently there are no tools of OCL compilation involves in EMF, the OCL compiler will be a significant improvement for the EMF community. This thesis offers an implementation of compilation OCL into Java within EMF. Compiler technology approach is used in designing this OCL compiler.



