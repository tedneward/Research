title=Wright (or WRIGHT)
tags=architecture, language, modeling
summary=A practical formal basis for the description of both architectural configurations and of architectural styles.
~~~~~~

[Website](https://www.cs.cmu.edu/afs/cs/project/able/www/wright/) 

Software architecture is receiving increasing attention as a level of software design. However, the current practice of software architecture description is largely informal and ad hoc. This has the consequence of weakening the effectiveness of architecture as a vehicle for communication about and analysis of a software system. 

Wright addresses this issue by providing a formal basis for architectural description. As an architecture description language, Wright can be used to provide a precise, abstract, meaning to an architectural specification and to analyze both the architecture of individual software systems and of families of systems.

Wright also serves as a vehicle for exploration of the nature of the architectural abstractions themselves. In particular, work on Wright has focussed on the concept of explicit connector types, on the use of automated checking of architectural properties, and on the formalization of architectural styles.

To further aid developers in the realization and exploitation of architectural abstractions, Wright defines a set of standard consistency and completeness checks that can be used to increase the designer's confidence in the design of a system. These checks are defined precisely in terms of Wright's underlying model in CSP, and can be checked using standard model checking technology.

[Thesis](http://reports-archive.adm.cs.cmu.edu/anon/1997/CMU-CS-97-144.pdf): "As software systems become more complex, the overall system structure---or software architecture---becomes a central design problem. A system's architecture provides a model of the system that suppresses implementation detail, allowing the architect to concentrate on the analyses and decisions that are most crucial to structuring the system to satisfy its requirements.

"Unfortunately, current representations of software architecture are informal and ad hoc. While architectural concepts are often embodied in infrastructure to support specific architectural styles and in the initial conceptualization of a system configuration, the lack of an explicit, independently-characterized architecture or architectural style significantly limits the benefits of software architectural design in current practice.

"In this dissertation, I show that an Architecture Description Language based on a formal, abstract model of system behavior can provide a practical means of describing and analyzing software architectures and architectural styles. This dissertation demonstrates this claim through Wright, an architectural description language based on the formal description of the abstract behavior of architectural components and connectors. Wright provides a practical formal basis for the description of both architectural configurations and of architectural styles. It is distinguished by the use of explicit, independent connector types as interaction patterns, the ability to describe the abstract behavior of components using a CSP-like notation, the characterization of styles using predicates over system instances, and a collection of static checks to determine the consistency and completeness of an architectural specification. We introduce techniques to support the analysis of large-scale systems, and demonstrate Wright's expressiveness and practicality through three case studies."

## Reading

[Bibliography](https://www.cs.cmu.edu/afs/cs/project/able/www/wright/wright_bib.html)

### Papers

* A Formal Basis For Architectural Connection, Robert Allen and David Garlan, A revised version of the paper that appeared in ACM Transactions on Software Engineering and Methodology, July 1997.
* Formalizing Architectural Connection, Robert Allen and David Garlan, 16th International Conference on Software Engineering, May 1994.
* Beyond Definition/Use: Architectural Interconnection, Robert Allen and David Garlan, Proc. ACM Interface Definition Language Workshop, January 1994.
* Formal Connectors, Robert Allen and David Garlan, March 1994, Technical Report, CMU-CS-94-115.

