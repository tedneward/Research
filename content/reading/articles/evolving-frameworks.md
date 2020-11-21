title=Evolving Frameworks
tags=reading, articles, object, patterns
summary=A paattern language for evolving object-oriented frameworks.
~~~~~~
*(by Don Roberts, Ralph Johnson; available at http://www.dmi.usherb.ca/~sgiroux/COURS/2008/ift785/fichiers/articles/Roberts_EvolvingFrameworks.pdf)*

Pattern language for evolving O-O frameworks 

```
Framework language graph
(x-axis = Time)
| [. Three Examples.] [. Black-Box Frameworks .]
|   [............. White-Box Frameworks .......]
|     [........... Component Library ..........]
|       [......... Hot Spots ..................]
|       [......... Pluggable Objects ..........]
|         [....... Fine-Grained Objects .......]
|           [..... Visual Builder .............]
|           [..... Language Tools .............]
```


# Three Examples
* **Context:** You have decided to develop a framework for a particular domain
* **Problem:** How do you start?
* **Forces:**
    * We develop abstractions by generalizing from concrete examples; a framework is a reusable design, so you develop it by looking at the things it is supposed to model
    * Designing apps is hard; can't have too many examples
    * Having a f/w helps, even if only marginally useful; once you have v1, it's easier
    * projects must deliver value quickly or risk being canceled
* **Solution:** Develop 3 apps that you believe the f/w should help build that pay for themselves


# White-box Frameworks
* **Context:** You have started to build your second app
* **Problem:** Some f/w rely on inheritance, others polymorphic composition*which should you use?
* **Forces:**
    * Inheritance creates strong coupling, but allows modification/enhancement
    * Making a new class involves programming
    * Inheritance is static and cannot be changed @ runtime
    * Polymorphic composition requires knowing what is going to change
    * Polymorphic composition is powerful, just different to understand by examining code
    * Polymorphic composition can change at runtime
* **Solution:** Use inheritance. Build a white-box framework, by generalizing from the classes in the individual apps. Use Template Method and Factory Method to increase reuse in base classes. Don't worry if apps don't share concrete classes.
* **Rationale:** Inheritance is most efficient way to allow users to change code; don't worry about semantics of inheritance, just reuse code*once you have a working framework, you can start using it, which will show what is likely to change; later, immutable code can be converted into a Black-box Framework, but at this point, you're ignorant


# Component Library
* **Context:** You're developing the second and subsequent examples based on the White-box Framework.
* **Problem:** Similar objects must be implemented for each problem the framework solves. How do you avoid writing similar objects for each instantiation of the framework?
* **Forces:**
    * Barebones frameworks are hard to use; things that work out-of-the-box are easier; a framework w/ a good library of concrete components is easier than one with a small library
    * Up front, it is hard to tell which components users will need; some are problem-specific, some are generalized
* **Solution:** Start with a simple library of the obvious objects, and add additional objects as required
* **Rationale:** Added objects, reused or not, will provide insight


# Hot Spots
* **Context:** You are adding components to your Component Library
* **Problem:** How do you eliminate similar code being written over and over again?
* **Forces:**
    * if changeable code is scattered across an app, it is difficult to track and change
    * if changeable code is located in a common location, program flow can be obfuscated
* **Solution:** Separate code that changes from code that doesn't, ideally in objects; with the code encapsulated, variation is achieved by composing the objects
* **Rationale:** by gathering code that varies into a single location, it will simplify the reuse process and show users where designers expect the framework to change
* **Implementation:** possible GOF patterns to use:
    * algorithms *> Strategy, Visitor
    * actions *> Command
    * implementation *> Bridge
    * response to change *> Observer
    * interaction between objects *> Mediator
    * objects being created *> Factory Method, Abstract Factory, Prototype
    * structure being created *> Builder
    * traversal algorithm *> Iterator
    * object interfaces *> Adapter
    * object behavior *> Decorator, State


# Pluggable Objects
* **Context:** you are adding components to your Component Library
* **Problem:** most of the subclasses you write differ in trivial ways (1 method)*how to avoid having to create trivial subclasses each time you want to use the framework?
* **Forces:**
    * new classes, no matter how trivial, complicate the system
    * complex sets of parameters make parameterized classes harder to understand and use
* **Solution:** design adaptable subclasses that can be parameterized with messages to send, indexes to access, blocks to evaluate, or whatever distinguishes one trivial subclass from another


# Fine-Grained Objects
* **Context:** you are refactoring your Component Library to make it more reusable
* **Problem:** How far should you go in dividing objects into smaller objects?
* **Forces:**
    * The more objects in the system, the more difficult to understand
    * Apps can be created by simply choosing objects providing functionality
* **Solution:** continue breaking objects into finer granularities until it doesn't make sense


# Black-Box Frameworks
* **Context:** You are developing Pluggable Objects by encapsulating Hot Spots and making Fine-Grained Objects
* **Problem:** Some frameworks rely heavily on inheritance, others on polymorphic composition; which to use?
* **Forces:**
    * inheritance creates strong coupling, allowing modification
    * making a new class involves programming
    * inheritance is static and cannot be changed at runtime
    * polymorphic composition requires knowing what will change
    * polymorphic composition is powerful but hard to understand by following static program text
    * polymorphic composition can be changed at runtime
* **Solution:** use inheritance to organize your Component Library, and polymorphic composition to combine the components into applications; inheritance provides a taxonomy of parts to ease browsing, and polymorphic composition will allow for maximum flexibility in application development; when in doubt, favor composition
* **Rationale:** Black Box Framework is one where you can reuse components by plugging them together without worrying about how they accomplish their individual tasks


# Visual Builder
* **Context:** you now have a Black-Box Framework, and can make an app by connecting objects of existing classes. A single app is two parts: one, the script that connects the objects and "turns them on", and two, the behavior of the individual objects; programmer still must provide the first part
* **Problem:** The connection/construction script is usual similar across apps; how to simplify?
* **Forces:**
    * The compositions that represent apps of the framework are convoluted and difficult to generate/understand
    * Building tools is expensive
    * Domain experts are rarely programmers
* **Solution:** Create a graphical program that allows you to specify the objects that will be in the app and connect them and generate the code for the app from that specification


# Language Tools
* **Context:** you have just created a Builder
* **Problem:** how do you easily inspect/debug Builder-generated complex composite objects?
* **Forces:**
    * existing tools are inadequate for dealing with the relationships in the framework
    * building a good ... is an expensive overhead task
* **Solution:** create specialized inspecting and debugging tools

