title=HVM
tags=vm, functional, native
summary=A pure functional compile target that is lazy, non-garbage-collected and massively parallel. It is also beta-optimal, meaning that, in several cases, it can be exponentially faster than most functional runtimes, including Haskell's GHC.
~~~~~~

[Source](https://github.com/Kindelia/HVM)

Pretty hyperbolic:

> That is possible due to a new model of computation, the Interaction Net, which combines the Turing Machine with the Lambda Calculus. Previous implementations of this model have been inefficient in practice, however, a recent breakthrough has drastically improved its efficiency, giving birth to the HVM. Despite being a prototype, it already beats mature compilers in many cases, and is set to scale towards uncharted levels of performance.

Example: `main.hvm`; looks like untyped Haskell:

```
// Creates a tree with `2^n` elements
(Gen 0) = (Leaf 1)
(Gen n) = (Node (Gen(- n 1)) (Gen(- n 1)))

// Adds all elements of a tree
(Sum (Leaf x))   = x
(Sum (Node a b)) = (+ (Sum a) (Sum b))

// Performs 2^n additions in parallel
(Main n) = (Sum (Gen n))
```

The program above creates a perfect binary tree with 2^n elements and adds them up. Since it is recursive, HVM will parallelize it automatically.

Run and compile:

```
hvm r main 10                      # runs it with n=10
hvm c main                         # compiles HVM to C
clang -O2 main.c -o main -lpthread # compiles C to BIN
./main 30                          # runs it with n=30
```

The program above runs in about 6.4 seconds in a modern 8-core processor, while the identical Haskell code takes about 19.2 seconds in the same machine with GHC. This is HVM: write a functional program, get a parallel C runtime.

Benefits are solely to parallelizable (recursive) work; 