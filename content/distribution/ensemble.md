title=Ensemble
tags=distribution, library
summary=The next generation of the Horus group communication toolkit.
~~~~~~

[Website](https://www.cs.cornell.edu/Info/Projects/Ensemble/) | [Source](http://www.cs.cornell.edu/Info/Projects/Ensemble/cvs.html) | [Source](https://github.com/Tipoca/ensemble)

Last updated 2002?

### Building applications with Ensemble
For an application builder, Ensemble provides a library of protocols that can be used for quickly building complex distributed applications. An application registers 10 or so event handlers with Ensemble, and then the Ensemble protocols handle the details of reliably sending and receiving messages, transferring state, implementing security, detecting failures, and managing reconfigurations in the system.

### Language support
The current distribution provides support for applications developed in ML, C, C++, and Java.

* ML: Ensemble is implemented in the Objective Caml programming language (a dialect of ML). The use of ML supports a variety of optimizations that enable Ensemble to achieve communication latencies an order of magnitude faster than Horus (some of these optimizations are still under research)
* Native C interface. Since version 1.31, the system includes a native C interface whereby an application can send io-vectors directly to the network. Received message are copied directly into user buffers. This facilitates a C interface that has the same performance as the ML interface
* C++: Maestro Group Tools provide an object-oriented interface to Ensemble.
* Native Java interface. Since version 1.38, the system includes native Java interface. This allows Java applications to tap the power of Ensemble without having to step out of the Java virtual machine. Preliminary performance assessments show good latency and throughput.

