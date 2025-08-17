title=RISC-V Reading
tags=reading, hardware, assembly, language, native
summary=A collection of resources and reading around the RISC-V CPU/assembly platform.
~~~~~~

https://riscv.org/publications/

- Instruction Sets Should Be Free: The Case For RISC-V - https://www.eecs.berkeley.edu/Pubs/TechRpts/2014/EECS-2014-146.html
- The Case for Open Instruction Sets - http://www.linleygroup.com/mpr/article.php?id=11267
- The Renewed Case for the Reduced Instruction Set Computer: Avoiding ISA Bloat with Macro-Op Fusion for RISC-V
	- https://arxiv.org/abs/1607.02318
	- https://www.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-130.html
- A Bug-Free RISC-V Core without Simulation - https://tomverbeure.github.io/risc-v/2018/11/19/A-Bug-Free-RISC-V-Core-without-Simulation.html
- A Highly Productive Implementation of an Out-of-Order Processor Generator
	- 2018 PhD Thesis; Christopher Celio
	- https://www2.eecs.berkeley.edu/Pubs/TechRpts/2018/EECS-2018-151.html
- An Agile Approach to Building RISC-V Microprocessors - https://people.eecs.berkeley.edu/~bora/Journals/2016/IEEEMicro16.pdf
- CARRV: Workshop on Computer Architecture Research with RISC-V - https://carrv.github.io/ 
- Design of the RISC-V Instruction Set Architecture - http://www.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-1.html
- GRVI Phalanx: A Massively Parallel RISC-V FPGA Accelerator Accelerator - https://arxiv.org/abs/1606.01037
- How Genode came to RISC-V - https://genode.org/documentation/articles/riscv
- ISA Semantics for ARMv8-A, RISC-V, and CHERI-MIPS - https://alastairreid.github.io/papers/POPL_19/
- Proprietary versus Open Instruction Sets - http://research.cs.wisc.edu/multifacet/papers/ieeemicro16_card_isa.pdf
- RISC-V development plans - https://groups.google.com/a/groups.riscv.org/d/msg/isa-dev/sUQk6pFG0eA/AGNF44e4AAAJ
- RISC-V Geneology - https://www.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-6.html
- RISC-V International Conference Proceedings - http://rise.cse.iitm.ac.in/ric2017/index.html#Proceedings
- RISC-V Offers Simple, Modular ISA - https://riscv.org/2016/04/risc-v-offers-simple-modular-isa/
- rv8: a high performance RISC-V to x86 binary translator
	- https://anarch128.org/~mclark/rv8-carrv.pdf
	- https://carrv.github.io/papers/clark-rv8-carrv2017.pdf
- Surveying the Free and Open Source RISC-V Ecosystem – Embecosm
	- https://www.embecosm.com/2018/05/07/surveying-the-free-and-open-source-risc-v-ecosystem/
- The Adventures of OS: Making a RISC-V Operating System using Rust
	- https://osblog.stephenmarz.com/
- The Berkeley Out-of-Order Machine (BOOM): An Industry-Competitive, Synthesizable, Parameterized RISC-V Processor
	- https://www.eecs.berkeley.edu/Pubs/TechRpts/2015/EECS-2015-167.html
	- BOOM v2: an open-source out-of-order RISC-V core - https://www2.eecs.berkeley.edu/Pubs/TechRpts/2017/EECS-2017-157.html
- The VexRiscV CPU - A New Way to Design - https://tomverbeure.github.io/rtl/2018/12/06/The-VexRiscV-CPU-A-New-Way-To-Design.html
- Towards a High-Performance RISC-V Emulator
	- WSCAD 2018
	- Leandro Lupori, Vanderson Martins do Rosario, Edson Borin
	- https://www.researchgate.net/publication/328314631_Towards_a_High-Performance_RISC-V_Emulator
	- https://www.researchgate.net/profile/Vanderson_Rosario2/publication/328314631_Towards_a_High-Performance_RISC-V_Emulator/links/5bc5e1ec458515f7d9bf6342/Towards-a-High-Performance-RISC-V-Emulator.pdf

### Books

https://riscv.org/risc-v-books/

- "Computer Organization and Design: The Hardware Software Interface: RISC-V Edition" by David A. Patterson, John L. Hennessy (2017)
	- http://store.elsevier.com/product.jsp?isbn=9780128122754
- "The RISC-V Reader: An Open Architecture Atlas" by David Patterson, Andrew Waterman (2017)
	- http://www.riscvbook.com/ 

### Concurrency

- The Semantics of Multicopy Atomic ARMv8 and RISC-V
	- 2019 PhD dissertation; Christopher Pulte
	- https://doi.org/10.17863/CAM.39379

### Instruction Set Architecture

- Basic Shellcode in RISC-V Linux
	- Thomas Karpiniec
	- https://thomask.sdf.org/blog/2018/08/25/basic-shellcode-in-riscv-linux.html
- RISC-V: #AlphanumericShellcoding
	- USENIX Workshop on Offensive Technologies (WOOT) 2019; DEF CON 27 (2019)
	- Hadrien Barral, Rémi Géraud-Stewart, Georges-Axel Jaloyan, David Naccache
	- https://www.usenix.org/conference/woot19/presentation/barral
	- https://xn--fda.fr/riscv-alphanumeric-shellcoding/defcon27_riscv-alphanumeric-shellcoding.pdf
	- https://github.com/RischardV/riscv-alphanumeric-shellcoding
- RISC-V Shellcoding Cheatsheet
	- Christina Quast
	- https://pagedout.institute/download/PagedOut_002_beta2.pdf#page=57
	- http://shell-storm.org/shellcode/files/shellcode-908.php
	- https://github.com/chrysh/riscv_exploitation

### Simulation

- Flexible Timing Simulation of RISC-V Processors with Sniper
	- Computer Architecture Research with RISC-V (CARRV) 2018
	- Neethu Bal Mallya, Cecilia Gonzalez-Alvarez, Trevor E. Carlson
	- https://carrv.github.io/2018/papers/CARRV_2018_paper_7.pdf
- High-performance RISC-V emulation
	- 2019 Master's Thesis; Leandro Lupori
	- http://repositorio.unicamp.br/handle/REPOSIP/334082?locale=en
	- RISC-V Static Binary Translator (SBT)
		- https://github.com/OpenISA/riscv-sbt
- Simulation of RISC-V based Systems in gem5
	- 2018 Diploma Thesis (Dipl.-Ing.); Robert Schefel
	- https://cfaed.tu-dresden.de/files/Images/people/chair-cc/theses/1808_Scheffel.pdf
