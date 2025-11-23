title=vixl
tags=library, arm, code generation, assembly
summary=AArch32 and AArch64 Runtime Code Generation Library.
~~~~~~

[Source](https://github.com/Linaro/vixl)

VIXL contains three components.

* Programmatic assemblers to generate A64, A32 or T32 code at runtime. The assemblers abstract some of the constraints of each ISA; for example, most instructions support any immediate.
* Disassemblers that can print any instruction emitted by the assemblers.
* A simulator that can simulate any instruction emitted by the A64 assembler. The simulator allows generated code to be run on another architecture without the need for a full ISA model.

VIXL was developed for JavaScript engines so a number of features from A64 were deemed unnecessary:

* Limited rounding mode support for floating point.
* Limited support for synchronisation instructions.
* Limited support for system instructions.
* A few miscellaneous integer and floating point instructions are missing.

The VIXL simulator supports only those instructions that the VIXL assembler can generate.

