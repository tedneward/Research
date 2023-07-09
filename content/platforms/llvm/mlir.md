title=MLIR
tags=platform, library, vm, native
summary=A hybrid IR which can support multiple different requirements in a unified infrastructure.
~~~~~~

[Website](https://mlir.llvm.org/) | [Users](https://mlir.llvm.org/users/) -- that is to say, projects and languages that use MLIR

MLIR is intended to be a hybrid IR which can support multiple different requirements in a unified infrastructure. For example, this includes:

* The ability to represent dataflow graphs (such as in TensorFlow), including dynamic shapes, the user-extensible op ecosystem, TensorFlow variables, etc.
* Optimizations and transformations typically done on such graphs (e.g. in Grappler).
* Ability to host high-performance-computing-style loop optimizations across kernels (fusion, loop interchange, tiling, etc.), and to transform memory layouts of data.
* Code generation “lowering” transformations such as DMA insertion, explicit cache management, memory tiling, and vectorization for 1D and 2D register architectures.
* Ability to represent target-specific operations, e.g. accelerator-specific high-level operations.
* Quantization and other graph transformations done on a Deep-Learning graph.
* Polyhedral primitives.
* Hardware Synthesis Tools / HLS.

MLIR is a common IR that also supports hardware specific operations. Thus, any investment into the infrastructure surrounding MLIR (e.g. the compiler passes that work on it) should yield good returns; many targets can use that infrastructure and will benefit from it.

MLIR is a powerful representation, but it also has non-goals. We do not try to support low level machine code generation algorithms (like register allocation and instruction scheduling). They are a better fit for lower level optimizers (such as LLVM). Also, we do not intend MLIR to be a source language that end-users would themselves write kernels in (analogous to CUDA C++). On the other hand, MLIR provides the backbone for representing any such DSL and integrating it in the ecosystem.

