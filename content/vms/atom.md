title=Atom
tags=vm
summary=A programmable, register based virtual machine for Win32 computers.
~~~~~~

[Website](https://atomvm.sourceforge.net/) | [Download](https://sourceforge.net/projects/atomvm/files/)

The VM can be programmed using a neo-assembler language called Atom Assembler. This document discusses the VM and explains each opcode in Atom Assembler.

Atom is a register based Virtual Machine (VM). Atom consists of one bank of registers numbered 1 through 64, of type Variant. The VM is programmed with Atom Assembler, a high-level, neo-assembler language.

Atom is currently in alpha stage, and as such, lacks a few features. Most notably missing is file I/O and a byte-code compiler. Both of these items are on the to-do list. However, it does have over 100 commands (opcodes), and fairly complex programs can be written in Atom Assembler and executed by the VM.

Atom is written in Delphi. It is released under the GPL and the source code can be downloaded from the Sourceforge files section.

I created Atom as a learning exercise in building a virtual machine. See my article Why Atom, for more details. At some point in time, after the VM is feature complete, I plan on creating a high-level language (named Atom of course) that will interface with the VM.

I hope that eventually, Atom will become useful. Even if it doesn't though, it will have served the purpose of being a vehicle for learning the intricacies of creating a programming language.