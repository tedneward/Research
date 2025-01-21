title=Occam-pi
tags=language, concurrency, native
summary=A concurrent programming language using the process-oriented programming model, which aims to make it straightforward to write correct, expressive concurrent programs.
~~~~~~

[Website](http://occam-pi.org/)

## Implementations

[KRoC](http://projects.cs.kent.ac.uk/projects/kroc/trac/) (the Kent Retargetable occam Compiler) is an open-source collection of tools and libraries for occam-π development. Currently, KRoC can run occam-π programs using two different approaches:

* Using IA32 native-code compilation and CCSP, an extremely efficient scheduler that dynamically schedules lightweight processes across multiple processor cores.
* Using the Transterpreter, a highly-portable, lightweight virtual machine for occam-π programs that works on both conventional machines and small microcontrollers.

Work in progress includes developing a new occam-π compiler, and generating more efficient code for multiple platforms using LLVM.
