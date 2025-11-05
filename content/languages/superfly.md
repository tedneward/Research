title=Superfly
tags=language, native
summary=A compiler for a functional low-level language, targeting tiny computers.
~~~~~~

[Source](https://codeberg.org/Bunny351/superfly)

"SUPERFLY" is a compiler for a non-pure functional low-level programming language targeting tiny computers. The language derives from John Backus' "FP" and is heavily influenced by the "K" array language.

The compiler performs some minor optimizations but relies mostly on the user to ensure the generated code is compact and efficient. Even though the programming model uses dynamically allocated sequences, a simple translation model and the ability to keep short arrays in registers allows to produce relatively good code assuming the programmer keeps the code simple and has a sufficient understanding on how the compiler operates. Currently, SUPERFLY can produce for for 8086/DOS (PC) platforms, the Commodore 64, the Atari VCS game console, the neo6502 single-board computer, the PDP-1 and the [Uxn](/vms/uxn) virtual machine.

Values are statically but weakly typed with operators that allow full control of how values are to interpreted. Dynamic memory allocation uses manually managed "regions", which is simple and flexible with minimal runtime overhead.

