title=Domain Specific Languages
tags=language, dsl
summary=A collection of reading and links on the implementation of DSLs.
~~~~~~

- [CREATING LLM AGENTS FOR DOMAIN-SPECIFIC LANGUAGE GENERATION AND PROCESSING](https://stal.blogspot.com/2025/10/creating-llm-agents-for-domain-specific.html?m=1)

- Writing your First Domain Specific Language [Part 1](https://www.codeproject.com/Articles/26975/Writing-Your-First-Domain-Specific-Language-Part-1) | [Part 2](https://www.codeproject.com/Articles/29058/Writing-your-first-Domain-Specific-Language-Part-2) | [Visual Studio Language Service](https://www.codeproject.com/Articles/33250/Writing-Your-First-Visual-Studio-Language-Service)

- [DSLs - A powerful Scala feature](http://www.scala-lang.org/node/1403)

- [Bootstrapping a simple compiler from nothing](http://homepage.ntlworld.com/edmund.grimley-evans/bcompiler.html)

- [Creaging a C# External DSL to Map a Dungeon](http://www.primaryobjects.com/2011/02/27/creating-a-c-net-external-domain-specific-language-to-map-a-dungeon/)
- [DSL Engineering: Designing, Implementing and Using Domain-Specific Languages](http://dslbook.org) - Markus Voelter
- [A PhD seminar on domain-specific programming languages](https://github.com/jeanqasaur/dsl-syllabus-fall-2016): Elided and locally echoed here for my convenience
	* Unit 1: Why domain-specific languages?
        * **To make things pretty.** We look at how DSLs improve functional reactive programming.
           * [ELM: Concurrent FRP for Functional GUI](http://people.seas.harvard.edu/~chong/pubs/pldi13-elm.pdf)
           * [Flapjax: A Programming Language for Ajax Applications](http://www.cs.brown.edu/~sk/Publications/Papers/Published/mgbcgbk-flapjax/)
        * **To make things fast.** We look at DSLs for high-performance computing in graphics.
           * [Halide: A Language and Compiler for Optimizing Parallelism, Locality, and Recomputation in Image Processing Pipelines](http://people.csail.mit.edu/jrk/halide-pldi13.pdf)
        * **To make things correct.** We look at the specification and verification of software-defined networks.
           * [NetKAT: semantic foundations for networks](http://dl.acm.org/citation.cfm?id=2535862)
           * [Frenetic: A High-Level Language for OpenFlow Networks](http://frenetic-lang.org/publications/frenetic-presto10.pdf)
           * [Machine-Verified Network Controllers](http://frenetic-lang.org/publications/verified-pldi13.pdf)
        * **Some combination of the above.** We look at languages for scientific programming.
           * [Terra: A Multi-Stage Language for High-Performance Computing](http://terralang.org/pldi071-devito.pdf)
           * [Julia talk: "Solving the Two-Language Problem"](https://www.youtube.com/watch?v=B9moDuSYzGo)
           * [Cython: C-Extensions for Python](http://cython.org/)
        * **Analyzing programs for interesting properties.** We look at how Resource-Aware ML can give us bounds we never previously dreamed of.
           * [Resource Aware ML](http://www.cs.cmu.edu/~janh/papers/hah12cav.pdf)
           * [End-to-End Verification of Stack-Space Bounds for C Programs](http://www.cs.cmu.edu/~janh/papers/veristack2014.pdf)
   
    * Unit 2: How to build domain-specific languages?
        * **Embedding languages into other languages.** Making languages gets easier and easier as we can just hijack the machinary from another language. We look at how to make EDSLs in Ruby, Scala, and Haskell.
           * [Building Embedded Systems with Embedded DSLs](https://www.cs.indiana.edu/~lepike/pubs/embedded-experience.pdf)
           * [Contracts for Domain-Specific Languages in Ruby](http://www.cs.umd.edu/~jfoster/papers/dls12.pdf)
           * [Safely Composable Type-Specific Languages](https://github.com/wyvernlang/docs/raw/master/ecoop14/ecoop14.pdf)			
        * **Implementing standalone DSLs.** A closer look at LLVM and other techniques.
           * [LLVM chapter of open source book](http://www.aosabook.org/en/llvm.html)
           * [LLVM Tutorial](http://llvm.org/docs/tutorial/index.html)				
        * **Staging.** We look at meta-programming techniques that can help with implementing DSLs.
           * [A Gentle Introduction to Multi-stage Programming](https://www.cs.rice.edu/~taha/publications/journal/dspg04a.pdf)
           * [Lightweight Modular Staging: A Pragmatic Approach to Runtime Code Generation and Compiled DSLs](http://cacm.acm.org/magazines/2012/6/149801-lightweight-modular-staging/abstract)
           * [Functional Pearl: A SQL to C Compiler in 500 Lines of Code](https://www.cs.purdue.edu/homes/rompf/papers/rompf-icfp15.pdf)
        * **Adding types to existing languages.** You don't even need to make a language to make a language! We look at typed scheme, gradual types, and languages that add more types to a language that already has types.
           * [Gradual Typing for Functional Languages](http://scheme2006.cs.uchicago.edu/13-siek.pdf)
           * [What is Gradual Typing](http://homes.soic.indiana.edu/jsiek/what-is-gradual-typing/)
           * [Hack and HHVM Manual](https://docs.hhvm.com/hack/types/annotations)

    * Unit 3: Language-based approaches to systems programming
        * **What's hard about systems programming?** An overview of what people do with systems programming, the kinds of mistakes they make, and techniques people have developed to prevent bugs in low-level code.
           * [An Overview of the Saturn Project](http://www.cs.utexas.edu/~isil/paste07.pdf)		
        * **Typing low-level languages.** We look at typed assembly and Cyclone, early efforts to make low-level coding safe.
           * [From System F to Typed Assembly Language.](https://www.cs.cornell.edu/talc/papers/tal-popl.pdf)
           * [Scalable Certification for Typed Assembly Language](https://www.cs.cornell.edu/talc/papers/tal_scale.pdf)			
        * **Proving OS correctness, before and after memory safety.** We compare the SeL4 and Verve OS verification projects.
           * [seL4: formal verification of an OS kernel](http://web1.cs.columbia.edu/~junfeng/09fa-e6998/papers/sel4.pdf)
           * [Safe to the Last Instruction: Automated Verification of a Type-Safe Operating System](http://www.cs.cmu.edu/~jyang2/papers/pldi117-yang.pdf)
           * [An Overview of the Singularity Project](https://www.microsoft.com/en-us/research/wp-content/uploads/2005/10/tr-2005-135.pdf)
        * **The new systems languages.** We look at Rust, an effort to clean up systems programming.
           * [Evaluation of performance and productivity metrics of potential programming languages in the HPC environment](https://octarineparrot.com/assets/mrfloya-thesis-ba.pdf)
           * [Ownership is Theft: Experiences Building an Embedded OS in Rust](http://amitlevy.com/papers/tock-plos2015.pdf)
           * [Ownership Types for Safe Programming](http://dl.acm.org/citation.cfm?id=582440)
           * [Practical Affine Types](http://users.eecs.northwestern.edu/~jesse/pubs/alms/tovpucella-alms.pdf)
           * [Typestate: A Programming Language Concept for Enhancing Software Reliability](http://www.cs.cmu.edu/~aldrich/papers/classic/tse12-typestate.pdf)

    * Unit 4: Language-based information flow
        * **Languaged-based information flow.** We introuduce the notion of information flow security. We look at the decentralized label-based approach with Jif and SIF and compare with systems-based approaches.
           * [Language-Based Information Flow Security](http://www.utd.edu/~hamlen/Papers/sm-jsac03.pdf)
           * [A Decentralized Model for Information Flow Control](http://www.cs.cornell.edu/andru/papers/iflow-sosp97/iflow-sosp97.pdf.gz)
           * [SIF: Enforcing Confidentiality and Integrity in Web Applications](http://www.cs.cornell.edu/andru/papers/sif.pdf)			
        * **A system-based approach in a high-level language.** We take a close look at the LIO monad and Hails operating system and discuss 1) how it uses Haskell for guarantees and 2) how it combines language- and system-based approaches.
           * [Hails: Protecting Data Privacy in Untrusted Web Applications](https://www.usenix.org/system/files/conference/osdi12/osdi12-final-35.pdf)
           * [Building Secure Systems with LIO](http://dl.acm.org/citation.cfm?id=2633371)
        * **Type-based security.** We look at Fine and F* and how dependent types and proof-carrying code can give us security guarantees.
           * [Enforcing Stateful Authorization and Information Flow Policies in Fine](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/techreport-3.pdf)
           * [Type-preserving compilation for end-to-end verification of security enforcement](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/pldi150-chen.pdf)
           * [Secure Distributed Programming with Value-Dependent Types](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/fstar-tr.pdf)			
        * **Changing the language semantics for information flow.** We look at my work on policy-agnostic programming with Jeeves and Jacqueline.
           * [Precise, Dynamic Information Flow for Database-Backed Applications](http://www.cs.cmu.edu/~jyang2/papers/p631-yang.pdf)	    * [Type-Driven Repair for Information Flow Security](http://arxiv.org/pdf/1607.03445v1)
           * [A Language for Automatically Enforcing Privacy Policies](http://www.cs.cmu.edu/~jyang2/papers/popl088-yang.pdf)

    * Unit 5: Languages for modelling biology
        * **Executable biology and executable knowledge.** An introduction to language-based approaches for modelling biological systems.
           * [Executable Cell Biology](http://www.nature.com/nbt/journal/v25/n11/pdf/nbt1356.pdf)						
        * **Verification and synthesis with boolean networks.** We can apply program-level techniques to biological models once we represent them the same way!
           * [Synthesis of Biological Models from Mutation Experiments](http://koksal.org/papers/KoksalETAL13SynthesisBiologicalModels.pdf)
           * [Algorithmic Program Synthesis: Introduction](http://link.springer.com/article/10.1007%2Fs10009-013-0287-9)		
        * **Rule-based modeling.** We look at the design of Kappa and the simulation of Kappa programs.
           * [Rule-Based Modeling of Cellular Signalling](http://fontana.med.harvard.edu/www/Documents/WF/Papers/signaling.causality.pdf)
           * [Scalable simulation of cellular signalling networks](http://fontana.med.harvard.edu/www/Documents/WF/Papers/scalable.modeling.pdf)
           * [Rule-Based Languages](http://link.springer.com/article/10.1023/A:1018907806177)
        * **Static analysis of rule-based models.** Once we have rule-based models, we can analyze them using program analysis. We look at abstract interpretation analyses over Kappa.
           * [Abstract Interpretation of Cellular Signalling Networks](http://fontana.med.harvard.edu/www/Documents/WF/Papers/abstract_interpretation.pdf)
           * [Abstract Interpretation: Achievements and Perspectives](http://www.di.ens.fr/~cousot/publications.www/Cousot-SSGRR-00.pdf)
           * [Abstract interpretation: a unified lattice model for static analysis of programs by construction or approximation of fixpoints](http://dl.acm.org/citation.cfm?id=512973)
   
    * We looked at a couple more topics upon student request.
        * **Voting.** We look at the domain of electronic voting and how languages work might help.
           * [Civitas: Towards a Secure Voting System](https://www.cs.cornell.edu/andru/papers/civitas-oakland08.pdf)								
        * **The physical world.**	We look at a compiler for 3D machine knitting, and the language questions associated with that.
           * [A Compiler for 3D Machine Knitting](https://s3-us-west-1.amazonaws.com/disneyresearch/wp-content/uploads/20160705213118/A-Compiler-for-3D-Machine-Knitting-Paper.pdf)
           * [Input language for Stitch Maps](https://stitch-maps.com/)
           * [POPL OBT talk abstract](http://conf.researchr.org/getImage/OBT-2016/orig/OBT_2016_paper_7.pdf)
           * [Languages for 3D Industrial Knitting at Strange Loop](http://lea.zone/blog/knitting-at-strange-loop/)

