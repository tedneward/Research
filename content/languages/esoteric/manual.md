title=Manual
tags=language, esolang
summary=An esoteric compiled programming language where data is represented as binary, and you have to manually move bytes, with some help.
~~~~~~

[Source](https://github.com/cmspeedrunner/Manual)

Manual is an esoteric compiled programming language where data is represented as binary, and you have to manually move bytes, with some help. <br>
Manual targets windows for now, more specifically win64, but this is going to be expanded soon. <br>

## Syntax
Lets start by looking at a simple hello world program in x64 asm: <br>
```asm
bits 64
default rel
segment .data
   msg db "Hello, World!", 10, 0

segment .text
   global main
   extern printf
   extern ExitProcess

main:
   push rbp
   mov rbp, rsp
   sub rsp, 32
   lea rcx, [msg]
   call printf

   xor rax, rax
   call ExitProcess
```
In Manual, it would look like this:
```
_ :: <**>
-- :: -@-
{.} :: .$.
:#: 1101101 1110011 1100111 :: $! :: 0100010 1001000 1100101 1101100 1101100 1101111 , :: 1010111 1101111 1110010 1101100 1100100 0100001 0100010 , :: 0110001 0110000 , :: 0110000

{.} :: .%.
:#: @< :: 1101101 1100001 1101001 1101110
:#: >@ :: 1110000 1110010 1101001 1101110 1110100 1100110
:#: >@ :: 1000101 1111000 1101001 1110100 1010000 1110010 1101111 1100011 1100101 1110011 1110011

1101101 1100001 1101001 1101110 0111010
:#: > :: [:]
:#: ~ :: [:] , :: [*]
:#: - :: [*] , :: <*">
:#: < :: (#) , :: 1011011 1101101 1110011 1100111 1011101
:#: #< :: 1110000 1110010 1101001 1101110 1110100 1100110

:#: ?| :: (+) , :: (+)
:#: #< :: 1000101 1111000 1101001 1110100 1010000 1110010 1101111 1100011 1100101 1110011 1110011
```
*Whats going on here?* <br>
Well, let start with some basic structuring <br>
`::` is a whitespace, yes, you need to add spaces in manually. (get it) <br>
`:#:` is a tab, just for syntactic sugar, these are not needed but recommended. <br>
`,` are just commas, directly, writing out the binary for a comma every time is somewhat bothersome. <br>
Looking at the first two lines of the Manual code, and comparing them to the assembly, you can see what certain symbol combinations do: <br>

ASM: `bits 64` <br>
MNL: `_ :: <**>` <br>
`_` translates to `bits`, and as we know `::` is just a whitespace, and `<**>` is 64. Others include: <br>
`<*$>`: 32 <br>
`<*">`: 16 <br>
`<*>`: 8 <br>
There is a pattern here, as if you dont press shift and instead press the corresponding numbers, multiply them together and it gives you the value, ** is 88, which multiplied together is 64, *$ is 84 which, multiplied together is 32. <br>

ASM: `default rel` <br>
MNL: `-- :: -@-` <br>
Simple 1:1 mapping here, not much going on, but the next line is this: <br>
`{.} :: .$.` which translates to this asm code: `segment .data` <br>
`{.}` denotes `segment` and obviously as we know there is a whitespace, and then `.$.`, which is `.data`. Others include: <br>
`.%.` which is `.text` <br>
`.#.` which is `.bss` <br>
After this, the first real confusing line appears: <br>
`:#: 1101101 1110011 1100111 :: $! :: 0100010 1001000 1100101 1101100 1101100 1101111 , :: 1010111 1101111 1110010 1101100 1100100 0100001 0100010 , :: 0110001 0110000 , :: 0110000` <br>
This line, maps to the asm: <br>
`   msg db "Hello, World!", 10, 0`
we can ignore `:#:` at the start which is just an indent, after this, there is 3 groups of 7 bits. Manual uses 7-bit ascii to map characters, in this case, the 3 bytes = `msg`. <br>
Then, we have `:: $! ::`, which simply maps to ` db `, the syntax is `$` which denotes a data value, and then the symbol under the number of bytes it can contain, for example <br>
`$!` ! is under 1, as `db` can hold 1 byte.
`$"` " is under 2, this equals to `dw` which can hold 2 bytes.
`$$` $ is under 4, which if you see the pattern here is for `dd` which can hold 4 bytes
`$*` * is under 8 which is for `dq`, holding 8 bytes.
`$!)` ! = 1, ) = 0, this is 10, and translates to `dt`, holding ten bytes. <br>
After that there is a long string of bytes: <br>
`0100010 1001000 1100101 1101100 1101100 1101111 , :: 1010111 1101111 1110010 1101100 1100100 0100001 0100010, :: 0110001 0110000 , :: 0110000` <br>
This is simply `"Hello, World!", 10, 0` in 7-bit ascii, you could use the binary for the whitespace and comma, but its quicker to write like that. <br>

After that, we enter another section, denoted by `{.} :: .%.`, we know this is section text. <br>
Underneath this, we have alot of binary: <br>
```
:#: @< :: 1101101 1100001 1101001 1101110
:#: >@ :: 1110000 1110010 1101001 1101110 1110100 1100110
:#: >@ :: 1000101 1111000 1101001 1110100 1010000 1110010 1101111 1100011 1100101 1110011 1110011
```
We can ignore the first symbol combination, as it is just indents, but after that there is a new value: `@<` and `>@` with `@<` being `global` and `>@` being `extern`. The binary after it is just once again 7-bit ascii for `main`, `printf` and `ExitProcess` <br>

After that, we are in the bulk of the program, here I have annotated it with its asm counterpart:<br>
```
1101101 1100001 1101001 1101110 0111010 (main:)
:#: > :: [:]                           (   push rpb)
:#: ~ :: [:] , :: [*]                  (   mov rbp, rsp)
:#: - :: [*] , :: <*">                 (   sub rsp, 32)
:#: < :: (#) , :: 1011011 1101101 1110011 1100111 1011101 (   lea rcx, [msg])
:#: #< :: 1110000 1110010 1101001 1101110 1110100 1100110 (   call printf)

:#: ?| :: (+) , :: (+)                  (   xor rax, rax)
:#: #< :: 1000101 1111000 1101001 1110100 1010000 1110010 1101111 1100011 1100101 1110011 1110011 (   call ExitProcess)
```
It would take a while to go through the in depth explination on every symbol so here is a mapping table:

## Miscellaneous
| Instruction | Symbol |
|------------|--------|
| segment    | {.}    |
| global     | @<     |
| extern     | >@     |
| call       | #<     |
| bits       | _      |
| 64         | <**>   |
| 32         | <*$>   |
| 16         | <*">   |
| 8          | <*>    |
| default    | --     |
| rel        | -@-    |

## Data Definition
| Instruction | Symbol |
|------------|--------|
| db         | $!     |
| dw         | $"     |
| dd         | $$     |
| dq         | $*     |
| dt         | $!)    |

## Branching
| Instruction | Symbol |
|------------|--------|
| jmp        | ^      |
| ret        | <<     |
| loop       | <>     |
| loopz      | <)>    |
| loopnz     | <')>   |
| jz         | ^)     |
| jnz        | ^')    |
| je         | !=     |
| jne        | !'=    |
| jg         | ^>     |
| jl         | ^<     |
| jge        | ^>=    |
| jle        | ^<=    |
| cmp        | ?=?    |

## Arithmetic
| Instruction | Symbol |
|------------|--------|
| add        | +      |
| sub        | -      |
| adc        | +&     |
| sbb        | -&     |
| inc        | ++     |
| dec        | --     |
| mul        | *      |
| div        | /      |

## Logic Operations
| Instruction | Symbol |
|------------|--------|
| or         |   pipe |
| xor        | ?|     |
| and        | &      |
| not        | '      |

## Registers
| Register | Symbol |
|----------|--------|
| rax      | (+)    |
| rbx      | (:)    |
| rcx      | (#)    |
| rdx      | ($)    |
| rsi      | [@]    |
| rdi      | [&]    |
| rbp      | [:]    |
| rsp      | [*]    |
| r8       | {*}    |
| r9       | {(}    |
| r10      | {!)}   |
| r11      | {!!}   |
| r12      | {!"}   |
| r13      | {!£}   |
| r14      | {!$}   |
| r15      | {!%}   |

## Segments
| Segment | Symbol |
|---------|--------|
| .data   | .$.    |
| .text   | .%.    |
| .bss    | .#.    |

## Data Movement
| Instruction | Symbol |
|------------|--------|
| push       | >      |
| pop        | >^     |
| mov        | ~      |
| lea        | <      |
| ,          | ,      |
| (space)    | ::     |
| (tab)      | :#:    |

# Compiling
Compile the `main.cpp` file and make sure you have nasm and gcc installed, after compiling run: <br>
`main.exe yourfile.mnl` this will output `yourfile.exe`, you can use `-asm` and `-obj` to keep the temp files and `-code` to display the generated asm code.