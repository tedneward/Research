title=Static analysis - verification
tags=reading, native
summary=A collection of readings on static analysis for verificatio of safety of programs.
~~~~~~
- Formal Verification to Ensuring the Memory Safety of C++ Programs
	- 2020 M.Sc. Thesis; Felipe R. Monteiro
	- https://feliperodri.github.io/papers/msc-manuscript.pdf
	- https://feliperodri.github.io/talks/msc-presentation.pdf
	- Apply model checking techniques to ensuring memory safety of C++ programs:
		- (i) Provide a logical formalization of essential features that the C++ programming language offers, such as templates, sequential and associative containers, inheritance, polymorphism, and exception handling.
		- (ii) Provide a set of abstractions to the Standard C++ Libraries that reflects their semantics, in order to enable the verification of functional properties related to the use of these libraries.
		- (iii) Extend an existing verifier to handle the verification of C++ programs based on (i) and (ii) and evaluate its efficiency and effectiveness in comparison to similar state-of-the-art approaches.
- Model Checking a C++ Software Framework, a Case Study
	- European Software Engineering Conference / Foundations of Software Engineering (ESEC/FSE) 2019
	- John Lång, I.S.W.B. Prasetya
	- https://arxiv.org/abs/1907.00172

## Verification: Software

- CMBC: C Bounded Model Checker
	- CBMC is a Bounded Model Checker for C and C++ programs. 
	- http://www.cprover.org/cbmc/
	- https://github.com/diffblue/cbmc  
- DIVINE
	- DIVINE is a modern, explicit-state model checker. Based on the LLVM toolchain, it can verify programs written in multiple real-world programming languages, including C and C++.
	- https://divine.fi.muni.cz/
- ESBMC
	- ESBMC is an open source, permissively licensed, context-bounded model checker based on satisfiability modulo theories for the verification of single- and multi-threaded C/C++ programs.
	- http://www.esbmc.org/
- Symbiotic
	- Tool for verifying computer programs based on instrumentation, program slicing and symbolic executor KLEE.
	- http://staticafi.github.io/symbiotic/
