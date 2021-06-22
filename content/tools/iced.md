title=iced
tags=tool, native, clr, nodejs, rust
summary=A high performance x86 (16/32/64-bit) instruction decoder, disassembler and assembler.
~~~~~~

It can be used for static analysis of x86/x64 binaries, to rewrite code (eg. remove garbage instructions), to relocate code or as a disassembler.

✔️Supports all Intel and AMD instructions
✔️Supports .NET, Rust, JavaScript (WebAssembly)
✔️The formatter supports masm, nasm, gas (AT&T), Intel (XED) and there are many options to customize the output
✔️The decoder is 4x+ faster than other similar libraries and doesn't allocate any memory
✔️Small decoded instructions, only 32 bytes
✔️High level Assembler (.NET) providing a simple and lean syntax (e.g asm.mov(eax, edx)))
✔️The encoder can be used to re-encode decoded instructions at any address
✔️API to get instruction info, eg. read/written registers, memory and rflags bits; CPUID feature flag, flow control info, etc
✔️All instructions are tested (decode, encode, format, instruction info)

[Source](https://github.com/0xd4d/iced)
