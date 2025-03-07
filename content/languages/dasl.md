title=Distributed Application Specification Language (DASL)
tags=language, distribution, architecture, specification
summary=A language for formalizing distributed applications.
~~~~~~

[Specification](./DASL.pdf) | [Specification (on the Web)](https://dl.acm.org/doi/pdf/10.5555/1698172)

The DASL language provides specialized sub-language components for each of the 3 distinct layers of the DASL execution environment.

* DASL/BOS is the business object specification, i.e., the specification of the persistent business objects, relationships, and methods that are manipulated by the application. It is easy to learn if you already know Java. It provides a higher level abstraction than Java, using a Java-like syntax for method bodies and expressions.

* DASL/AUS is the application usage specification, i.e., a set of states and transitions that choreograph how the application uses the business objects in one or more BOS. The AUS uses a Java-like declarative syntax, and a Java-like scripting syntax for invoking business object methods during transitions. It also supports the same Java-like syntax as DASL/BOS for defining method bodies.

* DASL/OQL implements a clean subset of the OQL query language for querying and manipulating the persistent store, where OQL is a standard defined by the ODMG subgroup of the Object Management Group.

By design, OQL is compatible with a subset of the standard relational query language, SQL. Notice that the specification of queries is required only for defining application tasks that specifically require them, such as retrieving a set of objects based on their attributes. The queries required for simple applications are deployed automatically by the DASL compiler.

The subset of DASL/AUS that expresses the application business task as a series of states and transitions leverages UML state transition diagrams, which have been used for many years and are easily understood. In a DASL application, you can think of states as corresponding to application screens, and transitions as what happens when the application moves from one state (or screen) to another when the user presses a button or makes some other gesture.

