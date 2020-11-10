title=Whiley
tags=language, jvm, functional, compiled
summary=An experimental programming language that combines features from the functional and imperative paradigms, and supports formal specification through function preconditions, postconditions and loop invariants.
~~~~~~

The syntax of Whiley follows the general appearance of imperative or object-oriented languages. Indentation syntax is chosen over the use of braces to delineate statement blocks, given a strong resemblance to Python. However, the imperative look of Whiley is somewhat misleading as the language core is functional and pure.

Whiley distinguishes a function (which is pure) from a method (which may have side-effects). This distinction is necessary as it allows functions to be used in specifications. A familiar set of primitive data types is available including bool, int, arrays (e.g. int[]) and records (e.g. {int x, int y}). However, unlike most programming languages the integer data type, int, is unbounded and does not correspond to a fixed-width representation such as 32-bit two's complement. Thus, an unconstrained integer in Whiley can take on any possible integer value, subject to the memory constraints of the host environment. This choice simplifies verification, as reasoning about modulo arithmetic is a known and hard problem. Compound objects (e.g. arrays or records) are not references to values on the heap as they are in languages such as Java or C# but, instead, are immutable values.

Whiley takes an unusual approach to type checking referred to as "Flow Typing." Variables can have different static types at different points in a function or method. Flow typing is similar to occurrence typing as found in Racket. To aid flow typing, Whiley supports union, intersection and negation types. Union types are comparable to sum types found in functional languages like Haskell but, in Whiley, they are not disjoint. Intersection and negation types are used in the context of flow typing to determine the type of a variable on the true and false branches of a runtime type test. For example, suppose a variable x of type T and a runtime type test x is S. On the true branch, the type of x becomes T & S whilst, on the false branch, it becomes T & !S.

Whiley uses a structural rather than nominal type system. Modula-3, Go and Ceylon are examples of other languages which support structural typing in some form.

Whiley supports reference lifetimes similar to those found in Rust. Lifetimes can be given when allocating new objects to indicate when they can be safely deallocated. References to such objects must then include lifetime identifier to prevent dangling references. Every method has an implicit lifetime referred to by this. A variable of type &this:T represents a reference to an object of type T which is deallocated with the enclosing method. Subtyping between lifetimes is determined by the outlives relation. Thus, &l1:T is a subtype of &l2:T if lifetime l1 statically outlives lifetime l2. A lifetime whose scope encloses another is said to outlive it. Lifetimes in Whiley differ from Rust in that they do not currently include a concept of ownership.

Whiley has no built-in support for concurrency and no formal memory model to determine how reading/writing to shared mutable state should be interpreted.

[Website](http://whiley.org/) | [Github](http://github.com/Whiley) | [Getting Started](http://whiley.org/download/GettingStartedWithWhiley.pdf) | [Language Spec](http://whiley.org/download/WhileyLanguageSpec.pdf)

Website shows last blog post as 2018.

Example code, from Wikipedia:

> The following example illustrates many of the interesting features in Whiley, including the use of postconditions, loop invariants, type invariants, union types and flow typing. The function is intended to return the first index of an integer item in an array of integer items. If no such index exists, then null is returned.

```
// Define the type of natural numbers
type nat is (int x) where x >= 0

public function indexOf(int[] items, int item) -> (int|null index)
// If int returned, element at this position matches item
ensures index is int ==> items[index] == item
// If int returned, element at this position is first match
ensures index is int ==> no { i in 0 .. index | items[i] == item }
// If null returned, no element in items matches item
ensures index is null ==> no { i in 0 .. |items| | items[i] == item }:
    //
    nat i = 0
    //
    while i < |items|
    // No element seen so far matches item
    where no { j in 0 .. i | items[j] == item }:
        //
        if items[i] == item:
            return i
        i = i + 1
    //
    return null
```
Explanation:
> In the above, the function's declared return type is given the union type `int|null` which indicates that either an `int` value is returned or `null` is returned. The function's postcondition is made of three `ensures` clauses, each of which describe different properties that must hold of the returned index. Flow typing is employed in these clauses through the runtime type test operator, `is`. For example, in the first `ensures` clause, the variable index is retyped from `int|null` to just `int` on the right-hand side of the implication operator (i.e. `==>`).

> The above example also illustrates the use of an inductive loop invariant. The loop invariant must be shown to hold on entry to the loop, for any given iteration of the loop and when the loop exits. In this case, the loop invariant states what is known about the elements of the items examined so far — namely, that none of them matches the given item. The loop invariant does not affect the meaning of the program and, in some sense, might be considered as unnecessary. However, the loop invariant is required to help the automated verifier using in the Whiley Compiler to prove this function meets its specification.

> The above example also defines the type nat with an appropriate type invariant. This type is used to declare variable i and indicate that it can never hold a negative value. In this case, the declaration prevents the need for an additional loop invariant of the form where i >= 0 which would otherwise be necessary.