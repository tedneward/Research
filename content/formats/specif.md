title=SpecIF
tags=format, specification
summary=A language for describing system models with attention to both syntax and semantics.
~~~~~~

[Website](https://specif.de/)

In the field of Systems Engineering (SE) a multitude of methods is being used with benefit every day; for example requirements mana­gement, modelling of system structure and behavior with UML/SysML or simulation with Modelica and other languages. There is infor­mation from various sources and in different formats, all providing valuable input for system design and development.

In practice, it is difficult or even impossible with acceptable effort to join the information and to put it in relation. Information from diffe­rent sources (“silos”) is often inconsistent, because it is main­tained by different organizations with their own background and purpose. Popular modelling standards such as UML/SysML are notations, but leave semantic interpretation to tool-makers or users. For data (model) exchange there are several standards with respect to syntax, but very few which address the semantics as well.

The Specification Integration Facility (SpecIF) shall support the change from document-centric to artefact-centric colla­boration, which is a generally accepted goal in the domains of systems engineering and product lifecycle management (PLM). SpecIF defines a language for describing system models with attention to both syntax and semantics. By creating a common context for graphical and textual content, an understanding (beyond mere communi­cation) is achieved on a logical level. Existing technical formats and protocols such as ReqIF or RDF are adopted to take advantage of existing IT infra­structure.

SpecIF contributes to the following objectives:

* Lifecycle-Management from the Beginning: Structures and content from the early phases of system conception are seam­lessly made available for development.
* Embracing disciplines: SpecIF creates a common context for models from disciplines such as Mechanics, Electronics, Software, Safety and others.
* Embracing methods: Texts as well as structural and behavioral models of popular methods, among others BPMN, SysML and FMC can be integrated. This means that individual elements (“resources”) exist once and may appear on several model diagrams.
* Technology-neutral: SpecIF data can be transformed to various technical formats, such as relational datenbase, ReqIF, OSLC, XMI, graph-database or web linked-data (RDF).
* Vendor-neutral and independent: SpecIF is not limited to certain tools or vendors; in contrast, SpecIF lets you exchange model data between different tools and organizations.
* Schema-compliant: SpecIF data can be checked formally using a JSON- or XML-schema; the former has been made available at SpecIF Schema and Constraint Checker.
* Standard-compliant: SpecIF draws on existing standards, most importantly from W3C, OMG and OASIS.
* Open and cooperative: All results are published with Creative Commons 4.0 CC BY-SA license allowing commercial use. The results can be further developed, but the origin must be stated and they must be published under similar terms; please consult the referenced license text. We encou­rage everyone interested to join our GfSE working group and to directly contribute to the results.

**Fundamental Resource Types**
A logical integration of model information prepared using different notations is made possible by abstraction of model elements to very few fundamental element types. Based on scientific research and practical experience, five model element types are proposed [9]:

* An Actor represents an active entity, be it an activity, a process step, a function, a system component or a role.
* A State stands for a passive entity, be it a value, a document, an information storage or even a physical shape.
* An Event constitutes a time reference, a change in condition/value or more generally a synchronisation primitive.
* A Requirement is a singular documented physical and functional need that a particular design, product or process must be able to perform.
* A Feature is an intentional distinguishing characteristic of a system, often a unique selling proposition.

The Fundamental Modelling Concepts (FMC) conceived by Prof. Dr. Siegfried Wendt, founding director of the Hasso-Plattner-Institute Potsdam, and his research team show, that all models of known methods can be constructed using three model element types Actor, State and Event [1,2]. Requirement and Feature have been added for textual information complementing the models.
