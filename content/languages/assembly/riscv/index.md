title=RISC-V Assembly
tags=language, assembly, native
summary=Assembly language for the RISC-V architecture.
~~~~~~
Note: see [Computer Architecture](/readings/comparch.html) -- recommended background (which makes the following significantly more approachable) includes an undergraduate-level course.

- RISC-V Foundation
	- https://riscv.org/
	- https://github.com/riscv
	- https://riscv.org/mailing-lists/
	- https://riscv.org/category/workshops/proceedings/

# Contents

- [Readings](#readings): [Books](#books)
- [Formalization, Specification, Verification](#formalization-specification-verification)
- [Open-Source Hardware Projects](#open-source-hardware-projects)
- [References](#references)
- [Software](#software): [Emulation & Simulation](#emulation--simulation)
- [Talks](#talks)
- [Tutorials](#tutorials)

---

# Readings

https://riscv.org/publications/

- A Bug-Free RISC-V Core without Simulation - https://tomverbeure.github.io/risc-v/2018/11/19/A-Bug-Free-RISC-V-Core-without-Simulation.html
- A Highly Productive Implementation of an Out-of-Order Processor Generator
	- 2018 PhD Thesis; Christopher Celio
	- https://www2.eecs.berkeley.edu/Pubs/TechRpts/2018/EECS-2018-151.html
- An Agile Approach to Building RISC-V Microprocessors - https://people.eecs.berkeley.edu/~bora/Journals/2016/IEEEMicro16.pdf
- CARRV: Workshop on Computer Architecture Research with RISC-V - https://carrv.github.io/ 
- Design of the RISC-V Instruction Set Architecture - http://www.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-1.html
- GRVI Phalanx: A Massively Parallel RISC-V FPGA Accelerator Accelerator - https://arxiv.org/abs/1606.01037
- How Genode came to RISC-V - https://genode.org/documentation/articles/riscv
- Instruction Sets Should Be Free: The Case For RISC-V - https://www.eecs.berkeley.edu/Pubs/TechRpts/2014/EECS-2014-146.html
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
- The Case for Open Instruction Sets - http://www.linleygroup.com/mpr/article.php?id=11267
- The Renewed Case for the Reduced Instruction Set Computer: Avoiding ISA Bloat with Macro-Op Fusion for RISC-V
	- https://arxiv.org/abs/1607.02318
	- https://www.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-130.html
- The VexRiscV CPU - A New Way to Design - https://tomverbeure.github.io/rtl/2018/12/06/The-VexRiscV-CPU-A-New-Way-To-Design.html
- Towards a High-Performance RISC-V Emulator
	- WSCAD 2018
	- Leandro Lupori, Vanderson Martins do Rosario, Edson Borin
	- https://www.researchgate.net/publication/328314631_Towards_a_High-Performance_RISC-V_Emulator
	- https://www.researchgate.net/profile/Vanderson_Rosario2/publication/328314631_Towards_a_High-Performance_RISC-V_Emulator/links/5bc5e1ec458515f7d9bf6342/Towards-a-High-Performance-RISC-V-Emulator.pdf

## Books

https://riscv.org/risc-v-books/

- "Computer Organization and Design: The Hardware Software Interface: RISC-V Edition" by David A. Patterson, John L. Hennessy (2017)
	- http://store.elsevier.com/product.jsp?isbn=9780128122754
- "The RISC-V Reader: An Open Architecture Atlas" by David Patterson, Andrew Waterman (2017)
	- http://www.riscvbook.com/ 

## Concurrency

- The Semantics of Multicopy Atomic ARMv8 and RISC-V
	- 2019 PhD dissertation; Christopher Pulte
	- https://doi.org/10.17863/CAM.39379

## Instruction Set Architecture

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

## Simulation

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

---

# Formalization, Specification, Verification

- Experimental_RISCV_Feature_Model
	- An experimental DSL to describe the full feature list of a RISC-V implementation, along with constraints on features and between features
	- https://github.com/rsnikhil/Experimental_RISCV_Feature_Model
- ISA Semantics for ARMv8-A, RISC-V, and CHERI-MIPS
	- POPL 2019
	- Alasdair Armstrong, Thomas Bauereiss, Brian Campbell, Alastair Reid, Kathryn E. Gray, Robert M. Norton, Prashanth Mundkur, Mark Wassell, Jon French, Christopher Pulte, Shaked Flur, Ian Stark, Neel Krishnaswami, Peter Sewell
	- https://www.cl.cam.ac.uk/~pes20/sail/
	- http://www.cl.cam.ac.uk/users/pes20/sail/sail-popl2019.pdf
	- talk; https://dl.acm.org/citation.cfm?doid=3302515.3290384&preflayout=flat#formats
- L3 Specification of the RISC-V ISA - https://github.com/SRI-CSL/l3riscv
- RISC-V Formal Verification Framework - https://github.com/cliffordwolf/riscv-formal
- RISC-V ISA Formal Spec in BSV (Bluespec SystemVerilog) - https://github.com/rsnikhil/RISCV_ISA_Formal_Spec_in_BSV
- RISC-V Litmus Tests
	- RISC-V architecture concurrency model litmus tests
	- https://github.com/litmus-tests/litmus-tests-riscv
- RISC-V Sail ISA model
	- https://github.com/rems-project/sail-riscv
	- A Tour of the RISC-V ISA Formal Specification
		- https://github.com/rsnikhil/RISCV_ISA_Spec_Tour
- riscv-avs: RISC-V Architecture Verification Suite (AVS)
	- https://github.com/ispras/riscv-avs
	- an open test suite for RISC-V microprocessors
	- Each test is a program (in assembly or C) equipped with additional information: a test purpose description, an instruction describing how to generate a program (if applicable), a test coverage report, etc.
- RISCV-DV: a SV/UVM based open-source instruction generator for RISC-V processor verification
	- https://github.com/google/riscv-dv
- riscv-fs: F# RISC-V Instruction Set formal specification
	- https://github.com/mrLSD/riscv-fs
- RISCV-ISA-Spec: Formal specification of RISC-V Instruction Set - https://github.com/rsnikhil/RISCV-ISA-Spec
- riscv-coq: RISC-V Specification in Coq - https://github.com/mit-plv/riscv-coq
- riscv-semantics: formal specification of the RISC-V ISA written in Haskell - https://github.com/mit-plv/riscv-semantics
- RiscvSpecFormal: Formal Specification of RISC-V ISA in Kami
	- https://github.com/sifive/RiscvSpecFormal
- RMEM - relaxed-memory concurrency
	- a tool for exploring the relaxed-memory concurrency for ARM, POWER, RISC-V, and x86
	- help page: http://www.cl.cam.ac.uk/~sf502/regressions/rmem/help.html
	- web interface: http://www.cl.cam.ac.uk/users/pes20/rmem/

---

# Open-Source Hardware Projects

RISC-V Cores and SoC Overview - https://github.com/riscv/riscv-cores-list

Taxonomy of Open Source Processors - http://parallel.princeton.edu/openpiton/open_source_processors.php

- Ariane RISC-V CPU (SystemVerilog)
	- Ariane is a 6-stage, single issue, in-order CPU which implements the 64-bit RISC-V instruction set.
	- https://pulp-platform.github.io/ariane/
	- https://github.com/pulp-platform/ariane
- BlackParrot (SystemVerilog)
	- Linux-capable cache-coherent, RV64GC multicore  
	- https://github.com/black-parrot
	- BlackParrot: An Agile Open Source RISC-V Multicore for Accelerator SoCs
		- FOSDEM 2020; Dan Petrisko
		- https://fosdem.org/2020/schedule/event/riscv_blackparrot/
- BOOM: The Berkeley Out-of-Order RISC-V Processor (Chisel)
	- https://ccelio.github.io/riscv-boom-doc/
	- https://github.com/ucb-bar/riscv-boom
	- https://twitter.com/boom_cpu
- Davis In-Order (DINO) CPU models (Chisel)
	- A teaching-focused RISC-V CPU design used at UC Davis
	- https://github.com/jlpteaching/dinocpu
	- The Davis In-Order (DINO) CPU: A Teaching-focused RISC-V CPU Design
		- Workshop on Computer Architecture Education (WCAE) 2019
		- Jason Lowe-Power and Christopher Nitta
		- Paper: https://arch.cs.ucdavis.edu/assets/papers/wcae19-dinocpu.pdf
		- Slides: https://arch.cs.ucdavis.edu/assets/papers/wcae19-dinocpu-presentation.pdf
- engine-V: SoftCPU/SoC engine-V (Verilog)
	- https://github.com/micro-FPGA/engine-V
- f32c - A 32-bit RISC-V / MIPS retargetable CPU core (VHDL)
	- https://github.com/f32c/f32c
- FWRISC: a Featherweight RISC-V implementation of the RV32I instruction set
	- https://github.com/mballance/fwrisc
	- FWRISC: Sizing up the RISC-V Architecture
		- https://bitsbytesgates.blogspot.com/2018/12/fwrisc-sizing-up-risc-v-architecture.html
- HammerBlade RISC-V Manycore (SystemVerilog)
	- A programmable, scalable RISC-V fabric
	- https://github.com/bespoke-silicon-group/bsg_bladerunner
	- https://github.com/bespoke-silicon-group/bsg_manycore
	- http://bjump.org/manycore/
	- HammerBlade IR: https://capra.cs.cornell.edu/hbir/
	- FOSDEM 2020; Michael Taylor
		- https://fosdem.org/2020/schedule/event/riscv_hammerblade/
- HL5: A 32-bit RISC-V Processor Designed with High-Level Synthesis (SystemC)
	- https://github.com/sld-columbia/hl5
	- Custom Integrated Circuits Conference (CICC) 2020
		- Paolo Mantovani, Robert Margelli, Davide Giri, Luca P. Carloni
		- https://sld.cs.columbia.edu/pubs/mantovani_cicc20.pdf
- Ibex: a small 32 bit RISC-V CPU core (RV32IMC/EMC) with a 2-stage pipeline (SystemVerilog)
	- https://github.com/lowRISC/ibex/
	- https://www.lowrisc.org/blog/2019/06/an-update-on-ibex-our-microcontroller-class-cpu-core/
	- How lowRISC made its Ibex RISC-V CPU core faster: Using open source tools to improve an open source core
		- FOSDEM 2020; Greg Chadwick
		- https://fosdem.org/2020/schedule/event/riscv_lowrisc/
- Icicle: 32-bit RISC-V system on chip for iCE40 and ECP5 FPGAs (SystemVerilog)
	- https://github.com/grahamedgecombe/icicle
- lowRISC - creating a fully open-sourced, Linux-capable, RISC-V-based SoC (SystemVerilog)
	- http://www.lowrisc.org/
	- https://github.com/lowRISC/lowrisc-chip/
	- https://twitter.com/lowRISC
- mriscv: A 32-bit Microcontroller featuring a RISC-V core (Verilog)
	- http://www.onchipuis.io/risc-v
	- https://github.com/onchipuis/mriscv
	- https://github.com/onchipuis/mriscvcore
	- https://twitter.com/onchipUIS
- ORCA - an implementation of RISC-V intended to target FPGAs (VHDL)
	- https://github.com/VectorBlox/orca
- PicoRV32 - A Size-Optimized RISC-V CPU (Verilog)
	- https://github.com/cliffordwolf/picorv32
- PULPino - 32-bit RISC-V microcontroller core (SystemVerilog)
	- http://www.pulp-platform.org/
	- https://github.com/pulp-platform/pulpino
	- https://twitter.com/pulp_platform
- PulseRain Reindeer: RISCV RV32I[M] Soft CPU (Verilog)
	- https://github.com/PulseRain/Reindeer
- RIDECORE (RIsc-v Dynamic Execution CORE) - Out-of-Order RISC-V processor (Verilog)
	- https://github.com/ridecore/ridecore
- RI5CY: RISC-V Core - PULP RI5CY core modified for Verilator modeling and as a GDB server (SystemVerilog)
	- https://github.com/embecosm/ri5cy
	- A dive into RI5CY core internals - https://www.embecosm.com/2019/08/13/a-dive-into-ri5cy-core-internals/
- RISC-V VHDL: System-on-Chip (VHDL)
	- VHDL implementation of the RISC-V System-on-Chip based on bare "Rocket Chip"
	- http://sergeykhbr.github.io/riscv_vhdl/
	- https://github.com/sergeykhbr/riscv_vhdl
- riscv-simple-sv: A simple RISC V core for teaching (SystemVerilog)
	- https://github.com/tilk/riscv-simple-sv
- Riscy Processors - Open-Sourced RISC-V Processors (Bluespec System Verilog)
	- https://github.com/csail-csg/riscy
- Rocket Chip Generator (Chisel)
	- https://github.com/ucb-bar/rocket-chip/
- RPU: Basic RISC-V CPU implementation in VHDL
	- https://github.com/Domipheus/RPU
	- Designing a RISC-V CPU (TPU/RPU) in VHDL Series
		- http://labs.domipheus.com/blog/tpu-series-quick-links/
- RSD: RISC-V Out-of-Order Superscalar Processor (SystemVerilog)
	- https://github.com/rsd-devel/rsd
	- An Open Source FPGA-Optimized Out-of-Order RISC-V Soft Processor
		- IEEE International Conference on Field-Programmable Technology (FPT) 2019
		- Susumu Mashimo, Akifumi Fujita, Reoma Matsuo, Seiya Akaki, Akifumi Fukuda, Toru Koizumi, Junichiro Kadomoto, Hidetsugu Irie, Masahiro Goshima, Koji Inoue, Ryota Shioya
		- http://sv.rsg.ci.i.u-tokyo.ac.jp/pdfs/Mashimo-FPT'19.pdf
- SCR1: an open-source RISC-V compatible MCU core (SystemVerilog)
	- https://github.com/syntacore/scr1 
- SERV: The SErial RISC-V CPU (Verilog)
	- https://github.com/olofk/serv
- SHAKTI Processor Project (Bluespec System Verilog; generated Verilog)
	- http://rise.cse.iitm.ac.in/shakti.html
	- SHAKTI Tutorial at the VLSI Design Conference - http://www.slideshare.net/GSMadhusudan/shaktivlsidtutorial
	- https://bitbucket.org/casl/shakti_public
- SiFive's Freedom platforms RTL source files (Chisel)
	- https://github.com/sifive/freedom
- Sodor Processor Collection - educational microarchitectures (Chisel)
	- https://github.com/ucb-bar/riscv-sodor
- SweRV RISC-V core from Western Digital (SystemVerilog)
	- https://github.com/westerndigitalcorporation/swerv_eh1
- Taiga (SystemVerilog)
	- 32-bit RISC-V processor designed for FPGAs supporting the Multiply/Divide and Atomic extensions (RV32IMA)
	- https://gitlab.com/sfu-rcl/Taiga
	- TAIGA: A new RISC-V soft-processor framework enabling high performance CPU architectural features
		- Field Programmable Logic and Applications (FPL) 2017
		- E. Matthews and L. Shannon
		- https://doi.org/10.23919/FPL.2017.8056766
		- https://carrv.github.io/2017/papers/matthews-taiga-carrv2017.pdf
- VexRiscv: FPGA-friendly 32-bit RISC-V CPU implementation (SpinalHDL)
	- https://github.com/SpinalHDL/VexRiscv
- YARVI - Yet Another RISC-V Implementation (Verilog)
	- https://github.com/tommythorn/yarvi
	- https://www.cl.cam.ac.uk/teaching/1516/ECAD+Arch/exercise-yarvi.html

---

# References

https://riscv.org/specifications/

- A RISC-V ELF psABI Document - RISC-V calling convention - https://github.com/riscv/riscv-elf-psabi-doc 
- Calling Convention - http://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf
- Documentation for RISC-V Spike - https://github.com/poweihuang17/Documentation_Spike 
- Notes on RISC-V assembly - https://www.imperialviolet.org/2016/12/31/riscv.html
- Reference Card - https://www.cl.cam.ac.uk/teaching/1617/ECAD+Arch/files/docs/RISCVGreenCardv8-20151013.pdf
- RISC-V Assembly Programmer's Manual - https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md
- riscv-calling-conv-model: work towards a "golden model" of the RISC-V calling convention(s) - https://github.com/lowRISC/riscv-calling-conv-model
- RISC-V Instruction Set Manual - https://github.com/riscv/riscv-isa-manual
- RISC-V Instruction Set Listing - https://github.com/michaeljclark/riscv-meta/blob/master/doc/pdf/riscv-instructions.pdf
- RISC-V Instruction Types - https://github.com/michaeljclark/riscv-meta/blob/master/doc/pdf/riscv-types.pdf
- RISC-V Instructions
	- riscv-instr-encoding spreadsheet: a compact overview of the available instructions, their grouping, the encoding, etc.
	- https://www.akkadia.org/drepper/risc-v-instructions.html
- RISC-V Toolchain Conventions - https://github.com/lowRISC/riscv-toolchain-conventions
- The Embedded RISC-V Project
	- A complementary RISC-V specification intended for bare metal embedded applications 
	- https://emb-riscv.github.io/
	- https://github.com/emb-riscv
	- https://github.com/emb-riscv/specs-markdown
- The RISC-V Compressed Instruction Set Manual - https://riscv.org/specifications/compressed-isa/
- The RISC-V Instruction Set Manual, Volume I: User-Level ISA - https://riscv.org/specifications/
- The RISC-V Instruction Set Manual Volume II: Privileged Architecture - https://riscv.org/specifications/privileged-isa/
- Wikipedia: RISC-V - https://en.wikipedia.org/wiki/RISC-V

---

# Software

https://riscv.org/software-tools/

- Compiler Explorer with RISC-V support - https://cx.rv8.io/
- Debian port - https://wiki.debian.org/RISC-V
- hpm_counters: A simple utility for doing RISC-V Hardware Performance Monitor (HPM) perf monitoring - https://github.com/ccelio/riscv-hpmcounters 
- RISC-V Disassembler: Single file RISC-V Disassembler with support for RV32/RV64/RV128 IMAFDC
	- https://github.com/michaeljclark/riscv-disassembler
- RISC-V Meta – a suite of tools that operate on RISC-V ISA - https://github.com/michaeljclark/riscv-meta/
- RISC-V support for LLVM projects - http://www.lowrisc.org/llvm/status/ - https://github.com/lowRISC/riscv-llvm
- RISC-V Torture Test Generator - https://github.com/ucb-bar/riscv-torture 
- Xv6 for RISC-V
	- https://github.com/mit-pdos/xv6-riscv
	- a re-implementation of Dennis Ritchie's and Ken Thompson's Unix Version 6 (v6)
	- loosely follows the structure and style of v6, but is implemented for a modern RISC-V multiprocessor using ANSI C
	- xv6-riscv-book: Text describing xv6 on RISC-V
		- https://github.com/mit-pdos/xv6-riscv-book
		- 6.S081: Operating System Engineering - https://pdos.csail.mit.edu/6.828/

## Emulation & Simulation

- BRISC-V: an open-source, RISC-V based, full multicore, design space exploration platform
	- https://ascslab.org/research/briscv/index.html
	- BRISC-V Explorer (RTL) - http://ascslab.org/research/briscv/explorer/explorer.html
	- BRISC-V Simulator (Assembly) - http://ascslab.org/research/briscv/simulator/simulator.html
	- The BRISC-V Platform: A Practical Teaching Approach for Computer Architecture
		- Workshop on Computer Architecture Education (WCAE) 2019
		- Rashmi Agarwal, Sahan Bandara, Alan Ehret, Mihailo Isakov, Miguel Mark, Michel A. Kinsy
		- Paper: https://ascslab.org/research/briscv/wcae/a1-agrawal.pdf
		- Slides: https://drive.google.com/file/d/1j969LvF8yN8OBsq58schBLjSh6Lfjbba/view
- Dromajo: Esperanto Technology's RISC-V Reference Model
	- RISC-V RV64GC emulator designed for RTL co-simulation
	- https://github.com/chipsalliance/dromajo
- libriscv: RISC-V userspace emulator library
	- https://github.com/fwsGonzo/libriscv
	- C++17 RISC-V RV32GC userspace emulator library
- MARSS-RISCV: Micro-Architectural System Simulator for RISC-V
	- https://github.com/bucaps/marss-riscv
- RARS: RISC-V Assembler and Runtime Simulator
	- https://github.com/TheThirdOne/rars
- Ripes: A graphical 5-stage RISC-V pipeline simulator & assembly editor
	- https://github.com/mortbopet/Ripes
- RISCVEmu Toy RISC-V emulator
	- https://github.com/jdryg/RISCVEmu
- riscvOVPsim: A Complete, Fully Functional, Configurable RISC-V Simulator
	- https://github.com/riscv/riscv-ovpsim
- rv32-sail - high-level emulator for RV32IM
	- https://github.com/thoughtpolice/rv32-sail
	- https://riscv.ls0f.pw/
- rv8: RISC-V simulator for x86-64 - https://rv8.io/
	- https://github.com/rv8-io/rv8
- RVirt: RISC-V hypervisor written in Rust
	- https://github.com/mit-pdos/RVirt
	- an S-mode trap-and-emulate hypervisor for RISC-V
- Spike, a RISC-V ISA Simulator
	- https://github.com/riscv/riscv-isa-sim
- TinyEMU
	- https://bellard.org/tinyemu/
	- TinyEMU is a system emulator for the RISC-V architecture. Its purpose is to be small and simple while being complete.
- venus: RISC-V instruction set simulator built for education
	- https://venus.cs61c.org/
	- https://github.com/ThaumicMekanism/venus
- WebRISC-V: a Web-Based Education-Oriented RISC-V Pipeline Simulation Environment
	- http://www.dii.unisi.it/~giorgi/WebRISC-V
	- source code: http://www.dii.unisi.it/~giorgi/WebRISC-V/download
	- Workshop on Computer Architecture Education (WCAE) 2019
	- Roberto Giorgi and Gianfranco Mariotti
	- Paper: http://www.dii.unisi.it/~giorgi/papers/Giorgi19-wcae.pdf
	- Slides: http://www.dii.unisi.it/~giorgi/giorgi19-wcae_slides.pdf

---

# Talks

## 2019

- The Hype Around the RISC-V Hypervisor
	- KVM Forum 2019; Alistair Francis, Anup Patel
	- https://www.youtube.com/watch?v=2MUka4lKGFU

## 2018

- LLVM backend development by example (RISC-V)
	- 2018 LLVM Developers’ Meeting; Alex Bradbury
	- https://www.youtube.com/watch?v=AFaIP-dF-RA
	- RISC-V LLVM Coding Lab at the LLVM Developers' Meeting 2018
		- https://www.lowrisc.org/llvm/devmtg18/

## 2017

- End-to-end formal ISA verification of RISC-V processors with riscv-formal
	- 34C3 (2017), Clifford Wolf 
	- https://www.youtube.com/watch?v=VU97ffHF_IQ
	- https://media.ccc.de/v/34c3-8768-end-to-end_formal_isa_verification_of_risc-v_processors_with_riscv-formal

---

# Tutorials

- "All Aboard" Blog Series
	- Part 0: Introduction: Part 0: Introduction - https://www.sifive.com/blog/2017/08/07/all-aboard-part-0-introduction/
	- Part 1: The -march, -mabi, and -mtune arguments to RISC-V Compilers - https://www.sifive.com/blog/2017/08/14/all-aboard-part-1-compiler-args/
	- Part 2: Relocations in ELF Toolchains - https://www.sifive.com/blog/2017/08/21/all-aboard-part-2-relocations/
	- Part 3: Linker Relaxation in the RISC-V Toolchain - https://www.sifive.com/blog/2017/08/28/all-aboard-part-3-linker-relaxation-in-riscv-toolchain/
	- Part 4: The RISC-V Code Models - https://www.sifive.com/blog/2017/09/11/all-aboard-part-4-risc-v-code-models/
	- Part 5: Per-march and per-mabi Library Paths on RISC-V Systems - https://www.sifive.com/blog/2017/09/18/all-aboard-part-5-risc-v-multilib/
	- Part 6: Booting a RISC-V Linux Kernel - https://www.sifive.com/blog/2017/10/09/all-aboard-part-6-booting-a-risc-v-linux-kernel/
	- Part 7: Entering and Exiting the Linux Kernel on RISC-V - https://www.sifive.com/blog/2017/10/23/all-aboard-part-7-entering-and-exiting-the-linux-kernel-on-risc-v/
	- Part 8: The RISC-V Linux Port is Upstream! - https://www.sifive.com/blog/2017/12/05/all-aboard-part-8-the-risc-v-linux-port-is-upstream/
	- Part 9: Paging and the MMU in the RISC-V Linux Kernel - https://www.sifive.com/blog/2017/12/11/all-aboard-part-9-paging-and-mmu-in-risc-v-linux-kernel/
	- Part 10: How to Contribute to the RISC-V Software Ecosystem - https://www.sifive.com/blog/2018/02/20/all-aboard-part-10-how-to-contribute-to-the-risc-v-software-ecosystem/
- Building upstream RISC-V GCC+binutils+newlib: the quick and dirty way - http://www.lowrisc.org/blog/2017/09/building-upstream-risc-v-gccbinutilsnewlib-the-quick-and-dirty-way/
- LMARV-1 (Learn Me A RISC-V, level 1)
	- https://github.com/RobertBaruch/lmarv
	- https://www.youtube.com/playlist?list=PLEeZWGE3PwbansoxKjjMKHQqS_2cm8i60
	- http://www.halfbakedmaker.org/blog/lmarv1-1
- RISC-V 101 Webinar - https://info.sifive.com/risc-v-webinar
- RISC-V ASM Tutorial Collection - Western Digital
	- https://www.youtube.com/playlist?list=PL6noQ0vZDAdh_aGvqKvxd0brXImHXMuLY
- RISC-V Educational Materials
	- https://riscv.org/educational-materials/
	- https://github.com/riscv/educational-materials
- RISC-V from scratch
	- 1: Introduction, toolchain setup, and hello world! - https://twilco.github.io/riscv-from-scratch/2019/03/10/riscv-from-scratch-1.html
	- 2: Hardware layouts, linker scripts, and C runtimes - https://twilco.github.io/riscv-from-scratch/2019/04/27/riscv-from-scratch-2.html
	- 3: Writing a UART driver in assembly (1 / 3) - https://twilco.github.io/riscv-from-scratch/2019/07/08/riscv-from-scratch-3.html
	- 4: Creating a function prologue for our UART driver (2 / 3) - https://twilco.github.io/riscv-from-scratch/2019/07/28/riscv-from-scratch-4.html
- RISC-V Presentation at ESC Boston 2016 - https://riscv.org/2016/04/risc-v-presentation-esc-boston/
- RISC-V QEMU
	- Part 1: Privileged ISA v1.10, HiFive1 and VirtIO - https://www.sifive.com/blog/2017/12/20/risc-v-qemu-part-1-privileged-isa-hifive1-virtio/
- RISC-V Tutorial at HPCA 2015 - https://riscv.org/2015/02/risc-v-tutorial-hpca-2015/
