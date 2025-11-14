title=Vector-Logic
tags=library, python, rules engine, logic
summary=A fast, transparent, and extensible Python library for running inference on a generic system of logical rules.
~~~~~~

[Source](https://github.com/dmitry-lesnik/vector-logic)

This library is for developers who need a simple and powerful way to manage business logic without the overhead of more complex systems like BDDs or SAT solvers. It provides an intuitive, algebraic approach to propositional logic, making it easy to define rules, add evidence, and infer outcomes.

## Why Use vector-logic?

- **Expressive Rule Syntax:** Define complex rules with a natural, human-readable syntax (e.g. `(sky_is_grey && humidity_is_high) => it_will_rain`).

- **Scalable & Powerful Inference:** Instead of building an exponential truth table, `vector-logic` uses a compact `StateVector` (a **sparse representation** of Disjunctive Normal Form) that scales efficiently. It can compile, combine, and query complex rule sets with high performance. (See _A Scalable Approach to Logic_ below).

- **State Analysis:** Query the state of any variable to determine if it is always true, always false, or can vary based on the known rules.

- **Lightweight & Transparent:** A small, focused codebase with minimal dependencies, making it easy to understand, extend, and integrate into any project.

## A Scalable Approach to Logic

A common concern with logic engines is scalability. A system with N variables has 2^N possible states, making a full truth table impossible to work with.

`vector-logic` solves this by never building a full truth table. Instead, it uses a compact representation inspired by formal logic systems.

1. **Compact Representation**: At its core, the library uses a `StateVector` - a collection of `TObject`
   instances.
    - A `TObject` represents a conjunction of literals (e.g., `x1 AND !x3`). This is a "ternary" object because variables can be 1 (True), 0 (False), or - (Don't Care).
    - A `StateVector` is a disjunction of these TObjects (e.g., `(x1 AND !x3) OR (x2 AND x4)`). This is a highly compact and scalable Disjunctive Normal Form (DNF) representation that is far smaller than an explicit truth table.
    - This `StateVector` acts as a **sparse representation** of the truth table, and it uses the T-objects formalism for all algebraic operations.
2. **Core Use Cases:** `vector-logic` library is meant for two primary types of inference:
    - **Full Knowledge Base Compilation:** `engine.compile()` multiplies all rules to create a single `StateVector` known as the **"valid set."** This is the complete set of all possible states that satisfy your rules, also stored in a compact DNF. The library provides easy iterators (like `engine.valid_set_iter_dicts()`) to explore these valid states.
    - Specific Variable Querying: For a compiled knowledge base, you can ask, "Given my rules, is variable `x` always True, always False, or undetermined?" (`engine.get_variable_value("x")`).
    - **On-the-Fly Prediction:** Both use cases can be combined with temporary **"evidence"** (e.g., `engine.predict({"x1": True})`) to see how new observations affect the system.
3. **Theoretical Foundation:** The underlying mechanics are based on a formal system called **State Algebra**. This algebra defines operations (like multiplication) on `TObject` instances, allowing the engine to efficiently combine rules and perform logical inference.

## Installation

This project is managed with Poetry. It can be installed from PyPI:

```bash
   pip install vector-logic
   ```

## Quick Start

There is a minimal example of defining rules and making a prediction.

```python
from vectorlogic import Engine

# 1. Define the variables for your system
variables = ["sky_is_grey", "humidity_is_high", "it_will_rain", "take_umbrella"]

# 2. Create an Engine instance
engine = Engine(variables=variables)

# 3. Add your logical rules
engine.add_rule("sky_is_grey && humidity_is_high => it_will_rain")
engine.add_rule("it_will_rain => take_umbrella")

# 4. Make a prediction based on new evidence
evidence = {"sky_is_grey": True, "humidity_is_high": True}
result = engine.predict(evidence)

# 5. Check the result
if result:
    take_umbrella = result.get_value("take_umbrella")
    print(f"Should I take an umbrella (1 = True, 0 = False, -1 = Don't know)? Prediction: {take_umbrella}")
# Should I take an umbrella? Prediction: 1
```

## Detailed Example

This example demonstrates more advanced features, including compiling the engine for faster repeated predictions.

```python
from vectorlogic import Engine

# 1. Define variables and create the engine
variables = ["x1", "x2", "x3", "x4"]
engine = Engine(variables=variables, name="My Logic Engine")

# 2. Add rules to the engine
engine.add_rule("x1 = (x2 && x3)")
engine.add_rule("(!x3 || x4) => x1")

# 3. Make predictions without compilation
print("\n--- Prediction (on the fly) ---")
evidence = {"x2": True, "x4": False}
print(f"Predicting with evidence: {evidence}")
result = engine.predict(evidence)
if result:
    x1_value = result.get_value("x1")
    print(f"Inferred value of 'x1': {x1_value} (1 = True, 0 = False, -1 = Unknown)")
else:
    print("Evidence contradicts the knowledge base.")

# 4. Compile the rules into a single 'valid set'
# (See the performance section below for when to use this)
engine.compile()

# 5. Inspect the compiled state
print("\n--- Compiled Valid Set ---")
engine.valid_set.print(indent=4)

# 6. Iterate through the valid set
for t in engine.valid_set_iter_dicts():
    print(t)

# 7. Query the compiled knowledge base directly
print("\n--- Querying compiled valid set ---")
x1_value = engine.get_variable_value("x1")
print(f"Consolidated value of 'x1' in the valid set: {x1_value}  (1 = True, 0 = False, -1 = Unknown)")
x3_value = engine.get_variable_value("x3")
print(f"Consolidated value of 'x3' in the valid set: {x3_value}")

# 8. Run a fast prediction using the compiled engine
print("\n--- Prediction (using the compiled valid set) ---")
print(f"Predicting with evidence: {evidence}")
result = engine.predict(evidence)
if result:
    x1_value = result.get_value("x1")
    print(f"Inferred value of 'x1': {x1_value}")
else:
    print("Evidence contradicts the knowledge base.")
```

## Performance: To Compile or Not to Compile?

The `vector-logic` engine offers two approaches for inference, and the best choice depends on your use case.

1. **Pre-compiling for Repeated Use** (`engine.compile()`)

    - **What it does:** Multiplies all added rules together to create a single, optimised `StateVector`
      called the "valid set".
    - **When to use it:** When you need to run multiple predictions against the same set of rules.
    - **Trade-off:** The initial compilation can be slow if the valid set is very large, but subsequent `predict()`
      calls will be extremely fast because they only need to multiply with this single, pre-computed valid set.

2. **On-the-Fly Prediction**
    - **What it does:** Multiplies all rules from scratch every time you call `.predict()`, including the evidence for
      that specific prediction.
    - **When to use it:** When you need to run one or a few predictions.
    - **Trade-off:** This can be faster for a single query because a restrictive piece of evidence can cause the
      intermediate `StateVectors` to become very small, avoiding the creation of a potentially huge valid set.

**Debugging Performance:** The Engine constructor accepts a `verbose=1` or `verbose=2` flag to print detailed
compilation progress. After compiling, you can access `engine.intermediate_sizes_stats` to get a statistical summary of
the compilation process, which is useful for debugging complex rule sets.

> **A Note on Performance:** The efficiency of this algorithm relies on heuristic optimisations for the order of rule
> multiplication. This implementation includes a basic but effective heuristic that performs well for systems with up to
> ~100 variables and a similar number of rules. For more challenging tasks, performance can be improved by implementing
> more advanced optimisation heuristics.

## Installation from source

This project uses Poetry for dependency management.

1. Install Poetry:
   Follow the instructions on the [official Poetry website](https://python-poetry.org/docs/#installation).

2. Clone the repository:

    ```bash
    git clone https://github.com/dmitry-lesnik/vector-logic.git
    cd vector-logic
    ```

3. Install dependencies:
    ```bash
    poetry install
    ```

## Running Tests

To run the test suite, use pytest through Poetry:

```bash
   poetry install --with dev
   poetry run pytest
   ```

## Further Reading & Theoretical Foundations

The `vector-logic` library is a practical implementation of an algebraic approach to propositional logic called **State
Algebra**. If you're interested in the concepts behind the engine, these resources provide a great starting point:

* **Building a Rules Engine from First Principles**: A high-level, practical
  explanation of the main building blocks of State Algebra. This TDS article is the best place to start for
  understanding the core ideas: https://towardsdatascience.com/building-a-rules-engine-from-first-principles/

* **State Algebra for Propositional Logic**: For those who want a more formal and rigorous treatment, this paper on
  arXiv offers a deep, theoretical dive into the mathematics of State Algebra: https://arxiv.org/abs/2509.10326
