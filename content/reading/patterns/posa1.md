title=Pattern-Oriented Software Architecture 1 (POSA1)
tags=reading, books, patterns
summary=A collection of patterns by "the gang of five".
~~~~~~
*(by Frank Buschmann, Regine Meunier, Hans Rohnert, Peter Sommerlad, Michael Stal (Wiley, 1996, ISBN 0-471-95869-7) )*


### Structural Decomposition

* **Whole-Part** (225) helps with the aggregation of components that together form a semantic unit


### Organisation of Work

* **Master-Slave** (245) supports fault tolerance, parallel computation and computational accuracy. A master component distributes work to identical slave components and computes a final result from the results those slaves return


### Access Control

* **Proxy** (263) makes the clients of a component communicate with a representative rather than to the component itself. Introducing such a placeholder can yield enhanced efficiency, easier access, and protection from unauthorized access


### Management

* **Command Processor** (277) separates the request for a service from its execution, and provides additional services such as the storing of request objects for later undo
* **View Handler** (291) helps to manage all views that a software system provides, coordinates dependencies between views, and organizes their update
* **Counted Pointer** (353) idiom makes memory management of dynamically-allocated shared objects in C++ easier


### Communication

* **Forwarder-Receiver** (307) provides transparent inter-process communication for software systems with a peer-to-peer interaction model. It decouples the peers from the underlying communication mechanisms
* **Client-Dispatcher-Server** (323) introduces an intermediate layer between clients and servers, the dispatcher component. It provides location transparency by means of a name service, and hides the details of the establishment of the communication connection between clients and servers
* **Publisher-Subscriber** (339) helps to keep the state of cooperating components synchronized


### From Mud to Structure

* **Layers** (31) helps to structure applications that can be decomposed into groups of subtasks in which each group of subtasks is at a particular level of abstraction
* **Pipes and Filters** (53) provides a structure of systems that process a stream of data
* **Blackboard** (71) is useful for problems for which no deterministic solution strategies are known. Several specialized subsystems assemble their knowledge to build a possibly partial or approximate solution


### Distributed Systems

* **Broker** (99) can be used to structure distributed software systems with decoupled components that interact by remote service transactions


### Interactive Systems

* **Model-View-Controller** (125) divides an interactive application into three components: core functionality, representation, and control. A change-propagation mechanism ensure consistency between the three parts
* **Presentation-Abstraction-Control** (145) defines a structure for interactive software systems in the form of a hierarchy of cooperating agents. Every agent is responsible for a specific aspect of the application's functionality and consists of three components: presentation, abstraction, and control. This subdivision separates the human-computer interaction aspects of the agent from its functional core and its communication with other agents


### Adaptable Systems

* **Microkernel** (171) applies to software systems that must be able to adapt to changing system requirements. It separates a minimal functional core from extended functionality and customer-specific parts. The microkernel also serves as a socket for plugging in these extensions and coordinating their collaboration
* **Reflection** (193) provides a mechanism for changing structure and behavior of software systems dynamically. It supports the modification of fundamental aspects, such as type structures and function call mechanisms
