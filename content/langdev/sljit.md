title=sljit
tags=langdev, jit compiler, native
summary=Platform independent low-level JIT compiler.
~~~~~~

[Website](https://zherczeg.github.io/sljit/) | [Source](https://github.com/zherczeg/sljit)

The sljit compiler is a stack-less platform independent JIT compiler, or perhaps a platform independent assembler is even a better name. The key design principle of sljit is that it does not try to be smarter than the developer. This principle is achieved by providing control over the generated machine code like assembly languages. Unlike other assembly languages however, sljit LIR (low-level intermediate representation) is CPU independent, which greatly improves portability.

The engine strikes a good balance between performance and maintainability. The LIR code can be compiled to many CPU architectures, and the performance of the generated code is very close to code written in assembly languages. Although sljit does not support higher level features such as automatic register allocation, it can be a code generator backend for other JIT compiler libraries. Developing these intermediate libraries takes far less time, because they only needs to support a single backend.

Defining a LIR which provides wide range of optimization opportunities and still can be efficiently translated to machine code on all CPUs is the biggest challenge of this project. Those instruction forms and features which are supported on many (but not necessarily on all) architectures are carefully selected and a LIR is created from them. These features are also emulated by the remaining architectures with low overhead. For example, sljit supports various memory addressing modes and setting status register bits.

This approach is very effective for byte-code interpreters since their machine independent byte code (middle level representation) typically contains instructions which either can be easly translated to machine code, or does not worth to translate them at all.

Interpreter byte-code instruction examples
- **pop** - pop from stack: Very easy to implement in sljit level, since it just decrease the stack pointer by 1.
- **add** - add: Fast case for integer addition, and slow case for anything else.
- **resolve** - resolve an identifier: Not suitable to do it in JIT level, just call a native C++ helper.

