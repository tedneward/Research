title=AspectJ
tags=langauge, jvm, metaobject, object, static, compiled
summary=A strongly-typed aspect-oriented programming language starting from Java.
~~~~~~

First AOP system formalized as a strongly-typed language for the JVM. "... enables clean modularization of crosscutting concerns, such as error checking and handling, synchronization, context-sensitive behavior, performance optimizations, monitoring and logging, debugging support, and multi-object protocols."

[Website](https://www.eclipse.org/aspectj/) | [Git repo](https://git.eclipse.org/c/aspectj/org.aspectj.git) | [Developer's Handbook](https://www.eclipse.org/aspectj/doc/released/adk15notebook/index.html) | [Programming Guide](https://www.eclipse.org/aspectj/doc/released/progguide/index.html) | [Language](https://www.eclipse.org/aspectj/doc/released/progguide/language.html) | [Examples](https://www.eclipse.org/aspectj/doc/released/progguide/examples.html) | [Standard pointcut idioms](https://www.eclipse.org/aspectj/sample-code.html#library-pointcutIdioms) | [Pattern implementations](https://www.eclipse.org/aspectj/sample-code.html#pubs-papers-aodesignpatterns)

## Basic AOP and AspectJ Concepts

### Scattering
"Scattering" is when similar code is distributed throughout many program modules. This differs from a component being used by many other components since it involves the risk of misuse at each point and of inconsistencies across all points. Changes to the implementation may require finding and editing all affected code.

### Tangling
"Tangling" is when two or more concerns are implemented in the same body of code or component, making it more difficult to understand. Changes to one implementation may cause unintended changes to other tangled concerns.

### Crosscutting
"Crosscutting" is how to characterize a concern than spans multiple units of OO modularity - classes and objects. Crosscutting concerns resist modularization using normal OO constructs, but aspect-oriented programs can modularize crosscutting concerns.

### Join points
Join points are well-defined points in the execution of a program. Not every execution point is a join point: only those points that can be used in a disciplined and principled manner are. So, in AspectJ, the execution of a method call is a join point, but "the execution of the expression at line 37 in file Foo.java" is not. The rationale for restricting join points is similar to the rationale for restricting access to memory (pointers) or restricting control flow expressions (goto) in Java: programs are easier to understand, maintain and extend without the full power of the feature. AspectJ join points include reading or writing a field; calling or executing an exception handler, method or constructor.

### Pointcut
A pointcut picks out join points . These join points are described by the pointcut declaration. Pointcuts can be defined in classes or in aspects, and can be named or be anonymous.

### Advice
Advice is code that executes at each join point picked out by a pointcut. There are three kinds of advice: before advice, around advice and after advice. As their names suggest, before advice runs before the join point executes; around advice executes before and after the join point; and after advice executes after the join point. The power of advice comes from the advice being able to access values in the execution context of a pointcut.

### Inter-type Declarations
AspectJ enables you to declare members and supertypes of another class in an aspect, subject to Java's type-safety and access rules. These are visible to other classes only if you declare them as accessible. You can also declare compile-time errors and warnings based on pointcuts.

### Aspects
Aspects are a new class-like language element that has been added to Java by AspectJ. Aspects are how developers encapsulate concerns that cut across classes, the natural unit of modularity in Java.

Aspects are similar to classes because...
* aspects have type
* aspects can extend classes and other aspects
* aspects can be abstract or concrete
* non-abstract aspects can be instantiated
* aspects can have static and non-static state and behavior
* aspects can have fields, methods, and types as members
* the members of non-privileged aspects follow the same accessibility rules as those of classes

Aspects are different than classes because...
* aspects can additionally include as members pointcuts, advice, and inter-type declarations;
* aspects can be qualified by specifying the context in which the non-static state is available
* aspects can't be used interchangeably with classes
* aspects don't have constructors or finalizers, and they cannot be created with the new operator; they are automatically available as needed.
* privileged aspects can access private members of other types





