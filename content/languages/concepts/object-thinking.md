title=Object Thinking
tags=language, concept, reading, books, object
summary=Approaches to object-oriented design and thinking.
~~~~~~
*(by (author), (publisher info))* 


# Axioms and Principles that define software quality (p83)

* **Axiom of Separation of Concerns**
* **Axiom of Comprehension**: accommodate human cognitive limitations
* **Axiom of Translation**: correctness is unaffected by movement between equivalent contexts
* **Axiom of Transformation**: correctness is unaffected by replacement with equivalent components
* **Principle of Modular Design**
* **Principle of Portable Designs**
* **Principle of Malleable Designs**
* **Principle of Intellectual Control**
* **Principle of Conceptual Integrity**


# "Greek and Roman" * Robert Glass (p64)

* Greek: individual acts as his own agent*you are an individual, an independent contractor
* Roman: one's first duty was to the group, clan, class or faction upon which one depended for status: gravitas. This meant sacrificing oneself for the good of the organization, and giving up one's individuality and identifying closely with the group. You are not an individual*you are owned by the organization body and mind, 24 hours a day. Rewards: the organization provides you with security, money and power.


# 4 Presuppositions

1. everything is an object
2. simulation of a problem domain drives object discovery and definition
3. objects must be composable
4. distributed cooperation and communication must replace hierarchical control as an organizational paradigm


# Essential terms
## Object

* responsibility
     * maintain and supply on request one or more units of information
     * perform a computational task
     * report on or update the state of an object
     * coordinate other objects
* message
     * imperative
     * interrogatory
     * informational
* interface/protocol
  
## Collaboration & collaborator

* class hierarchy/library
     * abstract/concrete
* component
     * framework
     * inheritance

## Class

* exemplar object
* label for set of similar objects
* storage location for class-wide behaviors
* object factory


(Not sure of the relationships around...)
Inheritance? Pattern? Delegation? Polymorphism? Encapsulation?


## Objectionary (p.306-307): "object vending machine"

* total # of objects < 2000
* each object is an autonomous executable entity
* each object has unique ID and unique "address"--each object has its own URL
* objects are nothing more than collections of other objects--messages & methods become first-class objects in their own right
* objects are fully executable but use VM for primitive hardware services
* self-evaluating rules -> source code statements are first-class objects
