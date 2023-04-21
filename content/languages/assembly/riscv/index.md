title=RISC-V Assembly
tags=language, assembly, native, hardware
summary=Assembly language for the RISC-V architecture.
~~~~~~

[Foundation](https://riscv.org/) | [Source](https://github.com/riscv) | [Mailing Lists](https://riscv.org/mailing-lists/) | [Proceedings](https://riscv.org/category/workshops/proceedings/) | [Wikipedia](https://en.wikipedia.org/wiki/RISC-V)

[RISC-V Intro](https://github.com/rsnikhil/RISC-V_Intro)

## Specifications

https://riscv.org/specifications/ | https://riscv.org/technical/specifications/

- RISC-V Instruction Set Manual - https://github.com/riscv/riscv-isa-manual
- RISC-V Instruction Set Listing - https://github.com/michaeljclark/riscv-meta/blob/master/doc/pdf/riscv-instructions.pdf
- RISC-V Instruction Types - https://github.com/michaeljclark/riscv-meta/blob/master/doc/pdf/riscv-types.pdf
- RISC-V Instructions
	- riscv-instr-encoding spreadsheet: a compact overview of the available instructions, their grouping, the encoding, etc.
	- https://www.akkadia.org/drepper/risc-v-instructions.html
- RISC-V Toolchain Conventions - https://github.com/lowRISC/riscv-toolchain-conventions
- The RISC-V Compressed Instruction Set Manual - https://riscv.org/specifications/compressed-isa/
- The RISC-V Instruction Set Manual, Volume I: User-Level ISA - https://riscv.org/specifications/
- The RISC-V Instruction Set Manual Volume II: Privileged Architecture - https://riscv.org/specifications/privileged-isa/
- A RISC-V ELF psABI Document - RISC-V calling convention - https://github.com/riscv/riscv-elf-psabi-doc 
- Calling Convention - http://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf
- Documentation for RISC-V Spike - https://github.com/poweihuang17/Documentation_Spike 
- Notes on RISC-V assembly - https://www.imperialviolet.org/2016/12/31/riscv.html
- Reference Card - https://www.cl.cam.ac.uk/teaching/1617/ECAD+Arch/files/docs/RISCVGreenCardv8-20151013.pdf
- RISC-V Assembly Programmer's Manual - https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md
- riscv-calling-conv-model: work towards a "golden model" of the RISC-V calling convention(s) - https://github.com/lowRISC/riscv-calling-conv-model
- The Embedded RISC-V Project
	- A complementary RISC-V specification intended for bare metal embedded applications 
	- https://emb-riscv.github.io/
	- https://github.com/emb-riscv
	- https://github.com/emb-riscv/specs-markdown

---

## Formalization, Specification, Verification

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

## Talks

### 2019

- The Hype Around the RISC-V Hypervisor
	- KVM Forum 2019; Alistair Francis, Anup Patel
	- https://www.youtube.com/watch?v=2MUka4lKGFU

### 2018

- LLVM backend development by example (RISC-V)
	- 2018 LLVM Developers’ Meeting; Alex Bradbury
	- https://www.youtube.com/watch?v=AFaIP-dF-RA
	- RISC-V LLVM Coding Lab at the LLVM Developers' Meeting 2018
		- https://www.lowrisc.org/llvm/devmtg18/

### 2017

- End-to-end formal ISA verification of RISC-V processors with riscv-formal
	- 34C3 (2017), Clifford Wolf 
	- https://www.youtube.com/watch?v=VU97ffHF_IQ
	- https://media.ccc.de/v/34c3-8768-end-to-end_formal_isa_verification_of_risc-v_processors_with_riscv-formal

---

## Tutorials

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
