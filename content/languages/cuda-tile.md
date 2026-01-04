title=CUDA-Tile
tags=language, mlir
summary=An MLIR-based intermediate representation and compiler infrastructure for CUDA kernel optimization, focusing on tile-based computation patterns and optimizations targeting NVIDIA tensor core units.
~~~~~~

[Source](https://github.com/NVIDIA/cuda-tile)

CUDA Tile IR is an MLIR-based intermediate representation and compiler infrastructure for CUDA kernel optimization, focusing on tile-based computation patterns and optimizations targeting NVIDIA tensor core units. The project provides a comprehensive ecosystem for expressing and optimizing tiled computations for NVIDIA GPUs, simplifying the development of high-performance CUDA kernels through abstractions for common tiling patterns, memory hierarchy management, and GPU-specific optimizations.

This open-source release is aligned with the **CUDA Toolkit 13.1** release. For more information about CUDA Tile, visit [https://developer.nvidia.com/cuda/tile](https://developer.nvidia.com/cuda/tile).

## Core Components

[](https://github.com/NVIDIA/cuda-tile#core-components)

CUDA Tile is composed of:

-   **CUDA Tile Dialect**: A domain-specific MLIR dialect that provides first-class operations and types for tile-based computations
-   **Python Bindings**: Complete Python API for programmatic IR construction, manipulation, and transformation
-   **Bytecode:**: Efficient binary representation with support for serialization and de-serialization between the CUDA Tile dialect and binary format.
-   **Conformance Test Suite**: Comprehensive tests ensuring compliance with the CUDA Tile specification and validation of dialect semantics

## CUDA Tile Specification

CUDA Tile development is driven by the CUDA Tile IR specification, which defines the formal semantics, operations, and type system for tile-based computations on NVIDIA GPUs. For detailed information about the CUDA Tile IR specification, including dialect operations, type system, and transformation passes, please refer to the [CUDA Tile Specification](https://docs.nvidia.com/cuda/tile-ir/13.1/index.html).
