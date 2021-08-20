title=Lisa (Lisp-based Intelligent Software Agents)
tags=language, lisp, native, logic
summary=A production-rule system implemented in the Common Lisp Object System (CLOS), and is heavily influenced by CLIPS and the Java Expert System Shell (JESS).
~~~~~~

[Website & Source](http://lisa.sourceforge.net/) *(Looks like last updated 2007)*

At its core is a reasoning engine based on an object-oriented implementation of the Rete algorithm, a very efficient mechanism for solving the difficult many-to-many matching problem ("Rete: A Fast Algorithm for the Many Pattern/Many Object Pattern Match Problem", Charles L. Forgy, Artificial Intelligence 19(1982), 17-37.) Intrinsic to Lisa is the ability to reason over CLOS objects without imposing special class hierarchy requirements; thus it should be possible to easily augment existing CLOS applications with reasoning capabilities. As Lisa is an extension to Common Lisp, the full power of the Lisp environment is always available. Lisa-enabled applications should run on any ANSI-compliant Common Lisp platform.

