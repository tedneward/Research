title=Virtual Machines
type=categorypage
category=vm
summary=A collection of links and pages around software virtual machines.
tags=vm
~~~~~~

Virtual Machines differ from platforms in that a virtual machine may form the core of a platform. Virtual machines typically provide an environment for executing code (either a bytecode set unique to the VM or, in rare cases, compiled machine code) and often provide a set of services to that executing code, such as code-loading, execution access control and security, garbage collection, metadata access, and so on.

## VM Implementation
[Crafting Interpreters](http://www.craftinginterpreters.com/)

### Bytecode

See http://www.complang.tuwien.ac.at/forth/threaded-code.html for an introduction to threading techniques, including a performance comparison at http://www.complang.tuwien.ac.at/forth/threading/

### Stack-based vs Register-based

This is often abstract variations of the register-vs-stack debate that CPUs engage in; generally a VM will either be entirely stack-based (using a virtual stack that may or may not correspond to the real stack), or entirely register-based (though often a stack is still present in a register VM, for other purposes).

### Garbage collection

Much of this is going to be found in the [reading on memory management](/reading/software/memory-management). VMs typically offer some form of automatic memory management, since they can slightly intervene around raw pointer references and add either additional bookkeeping or indirection or "pointer fixups" to allow for objects to move around in memory w/o programmer awareness/knowledge.

### Tutorials
[Creating a VM/Compiler](https://www.youtube.com/watch?v=DUNkdl0Jhgs)

[Virtual machine in C ("felix.engineer")](https://felix.engineer/blogs/virtual-machine-in-c): six-register and stack

[Terrence Parr: Simple Virtual Machine](https://github.com/parrt/simple-virtual-machine): Video and slides

[Basic cpu: a register-based virtual machine in c](https://www.youtube.com/watch?v=cfPDeso3XwI) | [How to build a virtual machine from scratch](https://www.youtube.com/watch?v=BNXP0w4Ppto) | [Create your own stack machine](https://www.youtube.com/watch?v=Dw9URS-s9M8) | [Build your own virtual machine - Lexer](https://www.youtube.com/watch?v=UnGYvjDDPJI) | [Build your own virtual machine - assembler](https://www.youtube.com/watch?v=A5Ioln_8Wbc) | [Build your own virtual machine - Finish the assembler](https://www.youtube.com/watch?v=9Pa0iDObijA) | [Build your own virtual machine - Finish up](https://www.youtube.com/watch?v=pPFP9yA1MF8) --all by [Philip Bohun](https://www.youtube.com/channel/UChEygfZo7SZ64E0mp038Jvg) who has some additional videos

## Sites
[Awesome Open Source: Top 137 Virtual Machine Open Source Projects](https://awesomeopensource.com/projects/virtual-machine)

[GitHub search for "virtual machine"](https://github.com/search?p=34&q=virtual+machine&ref=opensearch&type=Repositories):

* [ARM-VM](https://github.com/jemtucker/arm-vm): "A really basic arm CPU emulator, started as an exploration into C++ when I first started programming."
* [VLM](https://github.com/hanshuebner/vlm): "Symbolics Virtual Lisp Machine (C version)"
* [AVM](https://github.com/Armax/AVM): "A virtual machine with a small 16 bit instruction set"
* [socket.io-computer](https://github.com/kevin-roark/socket.io-computer): "A collaborative virtual machine where players take turns in controlling it. It works by running qemu on the server-side and streaming the image binary data to the browser."
* [node-jvm](https://github.com/YaroslavGaponov/node-jvm): "Java virtual machine in pure node.js"
* [Sol](https://rsms.me/sol-a-sunny-little-virtual-machine): "A sunny little virtual machine" (register-based VM)
* [simple.vm](https://github.com/skx/simple.vm): "Simple virtual machine which interprets bytecode"
* [Wikipedia comparison of virtual machines](https://en.wikipedia.org/wiki/Comparison_of_application_virtualization_software): covers [ART](../art), [CLR](../clr), [Dis](/languages/limbo), [(OpenJDK) JVM](../jvm/openjdk), [JikesRVM](../jvm/jikes), [LLVM](/tools/llvm) (which I don't really think of as a VM), [Mono](../clr/mono), [Parrot](../parrot), [Dalvik](../dalvik), [Squeak](../squeakvm), [BEAM](../beamvm), and [MoarVM](../moarvm). Seems very slanted towards strongly-typed VMs--no Ruby, Python, ECMAScript, Lua, or any other dynamic language VMs. Covers machine model (register vs stack), memory management (auto vs manual), code security, interpreter, JIT, AOT, shared libraries, common language object model, and whether it supports dynamic type checking and RTTI. 

    Breaks out "application virtual machines" into a different chart, and that's where many of the dynamically-typed VMs show up.

### Reading

