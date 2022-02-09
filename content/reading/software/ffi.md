title=Foreign Function Interfaces (FFI)
tags=language, reading, windows, macos, linux, android, ios
summary=A collection of links and research on how various languages/vms handle interoperability with their host environment.
~~~~~~

The concept of an FFI is fairly straightforward: How does a language/platform "bind" (in other words, be able to call) to underlying APIs of the host environment? Examples include Java code, running on top of the JVM, being able to "call out to" native C code, such as operating system APIs or native libraries; game engines being able to call out to libraries that aren't a part of the game engine itself; and so on.

Most of the time this requires several pieces of knowledge:

* How to dynamically load a library at runtime on the host environment (operating system)
* How to understand the "signature" and calling convention of the host/OS library or API
* How to "marshal" parameters and return values from one environment to the other, which requires knowing information about both the caller and the target's choice of binary representation of values

### Dynamically loading libraries

Lots of this material is covered in [linking and loading](../linking-loading) reading.

### Call signatures

How do we name the exported entry point?

#### C

C generally mapped the name of a function directly to the exported ABI name, usually with a prefixed `_`. (Not sure of the reason for that prefix, to be honest.)

### Calling conventions

An implementation-level (low-level) scheme for how subroutines receive parameters from their caller and how they return a result. Differences in various implementations include where parameters, return values, return addresses and scope links are placed (registers, stack or memory etc.), and how the tasks of preparing for a function call and restoring the environment afterwards are divided between the caller and the callee.

Calling conventions may differ in:

* Where parameters, return values and return addresses are placed (in registers, on the call stack, a mix of both, or in other memory structures)
* For parameters passed in memory, the order in which actual arguments for formal parameters are passed (or the parts of a large or complex argument)
* How a (possibly long or complex) return value is delivered from the callee back to the caller (on the stack, in a register, or within the heap)
* How the task of setting up for and cleaning up after a function call is divided between the caller and the callee
* Whether and how metadata describing the arguments is passed
* Where the previous value of the frame pointer is stored, which is used to restore the frame pointer when the routine ends (in the stack frame, or in some register)
* Where any static scope links for the routine's non-local data access are placed (typically at one or more positions in the stack frame, but sometimes in a general register, or, for some architectures, in special-purpose registers)
* How local variables are allocated can sometimes also be part of the calling convention (when the caller allocates for the callee)

In some cases, differences also include the following:

* Conventions on which registers may be directly used by the callee, without being preserved
* Which registers are considered to be volatile and, if volatile, need not be restored by the callee

#### x86

Due to the small number of architectural registers, and historical focus on simplicity and small code-size, many x86 calling conventions pass arguments on the stack. The return value (or a pointer to it) is returned in a register. Some conventions use registers for the first few parameters which may improve performance, especially for short and simple leaf-routines very frequently invoked (i.e. routines that do not call other routines).

Example caller:
```
push EAX            ; pass some register result
push dword [EBP+20] ; pass some memory variable (FASM/TASM syntax)
push 3              ; pass some constant
call calc           ; the returned result is now in EAX
```

Example callee (`calc`): 
```
calc:
push EBP            ; save old frame pointer
mov EBP,ESP         ; get new frame pointer
sub ESP,localsize   ; reserve stack space for locals

; perform calculations, leave result in EAX

mov ESP,EBP         ; free space for locals
pop EBP             ; restore old frame pointer
ret paramsize       ; free parameter space and return.
```
Some conventions leave the parameter space allocated, using plain `ret` instead of `ret imm16`. In that case, the caller could `add esp,12` in this example, or otherwise deal with the change to ESP.

#### ARM (A32)

The standard 32-bit ARM calling convention allocates the 15 general-purpose registers as:

* r15: Program counter (as per the instruction set specification).
* r14: Link register. The BL instruction, used in a subroutine call, stores the return address in this register.
* r13: Stack pointer. The Push/Pop instructions in "Thumb" operating mode use this register only.
* r12: Intra-Procedure-call scratch register.
* r4 to r11: Local variables.
* r0 to r3: Argument values passed to a subroutine and results returned from a subroutine.

If the type of value returned is too large to fit in r0 to r3, or whose size cannot be determined statically at compile time, then the caller must allocate space for that value at run time, and pass a pointer to that space in r0.

Subroutines must preserve the contents of r4 to r11 and the stack pointer (perhaps by saving them to the stack in the function prologue, then using them as scratch space, then restoring them from the stack in the function epilogue). In particular, subroutines that call other subroutines must save the return address in the link register r14 to the stack before calling those other subroutines. However, such subroutines do not need to return that value to r14—they merely need to load that value into r15, the program counter, to return.

The ARM calling convention mandates using a full-descending stack. ([Reference](https://github.com/ARM-software/abi-aa/blob/2bcab1e3b22d55170c563c3c7940134089176746/aapcs32/aapcs32.rst))

This calling convention causes a "typical" ARM subroutine to:

* In the prologue, push r4 to r11 to the stack, and push the return address in r14 to the stack (this can be done with a single STM instruction);
* Copy any passed arguments (in r0 to r3) to the local scratch registers (r4 to r11);
* Allocate other local variables to the remaining local scratch registers (r4 to r11);
* Do calculations and call other subroutines as necessary using BL, assuming r0 to r3, r12 and r14 will not be preserved;
* Put the result in r0;
* In the epilogue, pull r4 to r11 from the stack, and pull the return address to the program counter r15. This can be done with a single LDM instruction.

#### ARM (A64)

The [AArch 64 calling convention](https://developer.arm.com/documentation/den0024/a/The-ABI-for-ARM-64-bit-Architecture/Register-use-in-the-AArch64-Procedure-Call-Standard/Parameters-in-general-purpose-registers) allocates the 31 general-purpose registers as:

* x31 (SP): Stack pointer or a zero register, depending on context.
* x30 (LR): Procedure link register, used to return from subroutines.
* x29 (FP): Frame pointer.
* x19 to x29: Callee-saved.
* x18 (PR): Platform register. Used for some operating-system-specific special purpose, or an additional caller-saved register.
* x16 (IP0) and x17 (IP1): Intra-Procedure-call scratch registers.
* x9 to x15: Local variables, caller saved.
* x8 (XR): Indirect return value address.
* x0 to x7: Argument values passed to and results returned from a subroutine.

All registers starting with x have a corresponding 32-bit register prefixed with w. Thus, a 32-bit x0 is called w0.

Similarly, [the 32 floating-point registers are allocated](https://developer.arm.com/documentation/den0024/a/The-ABI-for-ARM-64-bit-Architecture/Register-use-in-the-AArch64-Procedure-Call-Standard/Parameters-in-NEON-and-floating-point-registers) as:

* v0 to v7: Argument values passed to and results returned from a subroutine.
* v8 to v15: callee-saved, but only the bottom 64 bits need to be preserved.
* v16 to v31: Local variables, caller saved.

### Known calling conventions

References:

* ["The C Language Calling Sequence"](https://www.bell-labs.com/usr/dmr/www/clcs.html)

#### "cdecl"

#### "Pascal" style

#### Windows "stdcall"

#### macOS ABI

[Outdated: OS X ABI Function Call Guide](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/LowLevelABI/000-Introduction/introduction.html) covers 32-/64-bit PowerPC, and [IA-32](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/LowLevelABI/130-IA-32_Function_Calling_Conventions/IA32.html) / [x86-64](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/LowLevelABI/140-x86-64_Function_Calling_Conventions/x86_64.html) calling conventions


---

# Bash

- ctypes.sh: a foreign function interface for bash
	- https://github.com/taviso/ctypes.sh

---

# Stata

- Stata commands for inline C++ code in do-files
	- https://github.com/robertgrant/statacpp
