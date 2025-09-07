title=XAsm
tags=language, state machine
summary=An Extensible, Component-Based Abstract State Machines Language
~~~~~~

[Website](https://xasm.sourceforge.net/XasmAnl00/XasmAnl00.html) | [Source]() | [Docs](https://xasm.sourceforge.net/XasmAnl00/XasmAnl00.pdf) (PDF)

The Abstract State Machine approach has been and is successfully used to model a large number of case studies including industry-relevant ones. The simplicity of the basic data and execution model of ASMs makes them perfectly suitable as the basis for a language that on the one hand can be used as specification language and on the other hand as a high-level programming language. In this paper, the XASM ( Extensible ASM)[*]language is presented which aims at providing support for using ASMs as a programming language for producing efficient and reusable programs. There exists a number of other ASM implementations which all implement most of the ASM constructs as defined in the Lipari-Guide [15]. While the realization of the ASM constructs can be seen as the core functionality which must be present in each ASM support system, the difference of an ASM system compared to all others can be characterized by

* its efficiency,
* the functionality of its support environment,
* its rule abstraction concept, and
* its interoperability with other languages and systems.

For example, all ASM implementations - including XASM- define some macro structures on top of the core ASM language in order to provide some kind of rule abstraction concept. These additional features are indispensable for managing large formalizations. In the ASM-Workbench [12], for instance, the a special ``Rule'' construct is introduced being used to assemble ASM specifications from smaller pieces.
Concerning these features, XASM combines the advantages of using a formally defined method with the features of a full-scale, component-based programming language and its support environment.

The paper is organized as follows: In Section 2 an overview of XASM is given. Section 3 introduces the component-based module concept of XASM, in Section 4 the external language interface of XASM is described. In Section 6 the possibility to specify the syntax of input languages using context-free grammar definitions is presented, which is followed by the description of non-standard language constructs defined in XASM in Section 5. Section 7 sketches the support environment of XASM; Section 8 contains concluding remarks and points out future work.

XASM is an implementation of sequential ASMs focusing on the generation of efficient executable programs simulating the run of the specified ASM. In general, the main design goals of XASM can be given as follows:

* full support of the ASM language as defined in the Lipari-Guide;
* efficient execution of generated executables;
* comfortable animation and debugging of ASM specifications;
* component-based library concept for managing large-scale specifications;
* external language interface for integrating ASM specifications in other systems.

XASM source files are translated into C source by the XASM-compiler. Additionally, the user can integrate C-sources and -libraries using the external language interface. As described below, XASM introduces a notion of components being stored in a special repository. During the translation process, the XASM-compiler retrieves registry information from the component in order to integrate pre-compiled XASM-components in the current build process. The result of such a build process is a binary being either an executable or a new element of the component library. In either case, the binary contains the ASM algorithms specified in the XASM source files.

Basically, XASM-programs are structured using `` $\ASM\ldots\ENDASM$'' constructs each of which containing a list of local function and universe declarations and a list of ASM rules representing a certain part of the overall specification. In general, the structure of an XASM-asm is shown in Figure 2. The meta information part contains information concerning the role of the asm as a reusable component; this part is described in more detail below.

As defined in the Lipari-Guide, types are not part of the core ASM language. However, because typing has been proven to be very useful to avoid many kinds of errors, in XASM types can be supplied to the declaration of a function and are used to detect static semantics inconsistencies of the formalization.

In order to provide the full comfort of a modern programming language, pure ASMs lack a concept of modularization which is indispensable for structuring large-scale formalizations. Macros, which are normally used in the ASM literature to structure large ASM formalizations, only provide limited functionality with respect to the advantages one expects from a module concept. However, macros are a good means for ``ASM-programming-in-the-small'', but they fail to provide a basis for writing ASM formalizations that can be re-used in other formalizations.

Therefore, XASM uses a more powerful modularization concept which is based on the notion of a component as it is used in component-based systems.

