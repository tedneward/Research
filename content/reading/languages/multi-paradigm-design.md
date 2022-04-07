title=Multi-Paradigm Design in C++
tags=reading, books, object
summary=Some ways to think about object-oriented design and design in general.
~~~~~~
*(by James O. Coplien, Addison-Wesley, 1999)*

# 1. Introduction: The Need for Multiple Paradigms

## 1.1. Domain Engineering and Multiple Paradigms

* Most designs in fact have a nontrivial component that is not object-oriented
* The first purpose of design is to meet business needs, which are usually dominated by user expectations. Success is predicated on a good understanding of the business, or domain, for which the system is being built.
* But design has other purposes as well:
   * design should lead to an implementation that is understandable and easy to build
   * design should strive to build systems that can be evolved over time and adapted to new markets and applications
* Domain engineering is a software design discipline that focuses on the abstractions of a business (a domain) with the intent of reusing designs and artifacts
   * the same design techniques that lead to good reuse also lead to extensibility and maintainability over time
* Multi-paradigm design embraces many of the goals of the object paradigm, but the goals differ in scope
   * Object paradigm achieves extensibility+reuse by separating the common, stable parts of a design from the variable, uncertain parts of a design
      * (oversimplification) One can find the stable, invariant behaviors and data in base classes, and variations factored into derived classes
   * But there may be other useful ways of separating common from variable
* Design is the structural aspect of the process of problem-solving, with activities to abstract, partition and model the system so that the designer can understand it
* How do we design in a non-pure object-oriented world?
   * First, recognize the multi-paradigmatic world
   * Second, understand that most software paradigms can be characterized in terms of the more general design concerns of commonality and variation
* Domain analysis builds a (not "the") model of the business
   * First focus of design is to understand the commonalities and variabilities for the components of this model
   * Second focus of design is on how to match those commonalities and variations to implementation technology structures (application engineering)
* In summary, domain analysis is a set of techniques for identifying software families, and application engineering is a set of techniques for implementing and managing software families

## 1.2 Design, Analysis, Domains and Families: Term Definitions

### 1.2.1 Analysis

* application analysis: the "traditional" analysis of the problem space
* solution analysis borrows the abstracting tools and formalisms of application analysis and applies them to the solution space
* analysis gathers the information to support the choice of one or more paradigms

### 1.2.2 Design

* design is an activity that gives structure to the solution to a given problem; it starts with a problem and ends with a solution. Here, "problem" means a mismatch between the current state and the desired state

### 1.2.3 Architecture

* architecture is the primary output of design; it is the articulation of the things of interest in this system and the relationships between those things
* an architecture usually corresponds to a domain (an area of interest for which a system is being built); a domain may be hierarchical, which means that architectural models may also be hierarchical

### 1.2.4 Domains

* domain is an area of specialization or interest
* application domain is the body of knowledge that is of interest to the users; we break down application domains into application subdomains (we divide and conquer); we talk about the solution domain, which is of central interest to the implementors but only of superficial interest to system users; any given design may deal with multiple solution domains at once (for example, C++ constructs, patterns, and maybe state machines and parser-generators)

### 1.2.5 Families and Commonality Analysis

* most advances in software design have been tied to new ways of forming/using abstractions; abstraction deals with the general case without reference to the details of any particular instance; when we think abstractly, we emphasize what is common while suppressing detail
   * a good software abstraction requires that we understand the problem well enough in all its breadth to know what is common across related items of interest and to know what details vary from item to item. The items of interest are collectively called a family, and families*rather than individual applications*are the scope of architecture and design. We can use the commonality/variability model regardless of whether family members are modules, classes, functions, processes, or types; it works for any paradigm
* commonality and variability are at the heart of most design techniques
* domains often (but not always) comprise families; a family is a collection of things (objects, functions, classes, etc) that we group together because they share common properties; commonality analysis is the activity we use to form and elaborate families

### 1.2.6 Dimensions of Abstraction

* software design space is multidimensional, with multiple dimensions or "axes" of design: a procedural axis, a data structure axis, an axis of compliant behaviors, and so on. Each design technique picks its own favorite axes of commonality and variability and uses those to formulate abstractions
* important commonality dimensions include structure, behavior, and algorithm. Specific combinations of commonalities and variabilities correspond to commonality categories

### 1.2.7 Precise Abstraction

* "Abstract" and "general" do not imply "vague" or "ambiguous"; on the contrary, a good abstraction should be described with precision; we throw away the details that are not common to all cases, but we certainly retain those that characterize the abstraction

### 1.2.8 Implementation and Engineering

## 1.3 Beyond Objects

## 1.4 Commonality and Variability Analysis
* commonality and variability analyses form the fundamental underpinnings of design, since they are the essence of how the human mind forms abstractions

## 1.5 Software Families

* one way we abstract is by grouping similar entities or concepts*if we group steps of an algorithm by their relationship to each other, we call the abstractions procedures; if we group related responsibilities of an encapsulated collection of related data, we call the abstractions classes
* we can group by many criteria that we don't find in any popular paradigm*in the interest of abstraction, we take commonality where we can find it. These commonalities fall along many dimensions: structure, algorithm, semantics, name, inputs/outputs, binding time, default values, etc*almost anything that causes us to group things together
* [Parnas1976] characterizes families as groups of items that are strongly related by their commonalities, where commonalities are more important than the variations between family members; [Weiss1999] elaborates: a family is simply a collection of system parts (or even concepts such as processes, which aren't contiguous parts) or abstractions that we treat together because they are more alike than they are different. Because family members have so much in common, we can usually treat them all the same. We explicitly characterize their differences, called variabilities, to distinguish individual family members
* commonality and variability shape families; families of programs are made up of families of parts
* commonality defines the shared context that is invariant across abstractions of the application; once we discover commonality, it becomes uninteresting, we put it behind us, and we discuss it no further. Variabilities capture the more interesting properties that distinguish abstractions in a domain

## 1.6 Multi-Paradigm Design

### 1.6.1 The Language: C++
### 1.6.2 Dealing with Complex Families

* it is important to recognize that software families are not simply descriptions of disjoint sets or subsets of application entities; as in biology, families overlap
* there are many interesting partitionings of any complex system, and many complex systems can be best understood using multiple, simultaneous, independent views

## 1.7 Multi-Paradigm Development and Programming Language

### 1.7.1 Application-Oriented Languages in FAST

### 1.7.2 Domain Analysis and the C++ Programming Language

### 1.7.3 Polymorphism

* commonality establishes a framework in which polymorphism can make sense, and variability characterizes the polymorphism itself

## 1.8 Commonality Analysis: Other Perspectives

### 1.8.1 Policy and Mechanism

* separation of policy and mechanism underlies many long-standing software engineering principles, and we can think of multi-paradigm design in these terms; to a first order approximation, the market doesn't care about the mechanisms used to implement its policies as long as the policies are carried out; most of the time, mechanism answers the question "How is functionality implemented?" while policy asks, "What is being implemented?"
* mechanisms of a business domain often remain stable over time, while the policies shift with market needs, regulations, and other external influences
* in many good systems, commonality captures mechanism and variability captures policy

### 1.8.2 Variability over Time versus Variability over Space

* we can adopt two different perspectives during analysis: focusing on changes over time or focusing on variations within a family (variations in "space", as different configurations that coexist in time for different customers or markets)

### 1.8.3 Late Binding




# 2. Commonality Analysis



# 3. Variability Analysis



# 4. Application Domain Analysis



# 5. Object-Oriented Analysis



# 6. Solution Domain Analysis



# 7. Simple Mixing of Paradigms



# 8. Weaving Paradigms Together



# 9. Augmenting the Solution Domain with Patterns

