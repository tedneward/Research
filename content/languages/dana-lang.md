title=Dana-lang
tags=language
summary=A Graph-Oriented Programming Language designed for high-performance, predictable data-flow applications; programs in Dana are defined as directed graphs where nodes represent processing units and edges represent data flow.
~~~~~~

[Source](https://github.com/a-gonzalo/Dana-lang)

**Dana** is a **Graph-Oriented Programming Language** designed for high-performance, predictable data-flow applications. Programs in Dana are defined as directed graphs where **nodes** represent processing units and **edges** represent data flow.

Dana embraces the philosophy that *data flows through your program*, making concurrency patterns explicit and eliminating hidden state mutations.

---

## 🌟 Key Features

### Graph-First Architecture
Logic is built by connecting nodes with typed edges (`->`). Data flows explicitly through ports, making program behavior predictable and easy to reason about.

### Hybrid Execution Model

- **Dynamic Nodes**: Define custom logic using Dana's `process` blocks with familiar expression syntax.
- **Native Nodes (FFI)**: Integrate high-performance Rust components seamlessly (e.g., `System.IO`, `System.Kernel`).

### Strong Static Typing
All ports and properties are strictly typed (`Int`, `Float`, `String`, `Bool`, `Byte`, `Unit/Impulse`, `Stream<T>`, custom types) ensuring graph integrity at compile time.

### Implicit Join Semantics
Nodes with multiple inputs automatically synchronize—execution waits until all required inputs arrive before processing.

### Pattern Matching
Full pattern matching support with literals, wildcards, variable bindings, tuple patterns, and guards.

### Control Flow

- `match` statements for branching based on input values
- Guard expressions on edges for conditional data routing
- Node recursion for everything else

---

## Language Overview

### Basic Structure

A Dana program consists of **graphs**, **nodes**, and **edges**:

```dana
graph Main {
    // Define nodes
    node Greeter {
        prefix: String = "Hello, "
        
        in name: String
        out message: String
        
        process: (name) => {
            emit message(prefix + name)
        }
    }
    
    // Connect nodes with edges
    Greeter.message -> System.IO.stdout
}
```

### Nodes

Nodes are the processing units of Dana. Each node has:

| Component | Description |
|-----------|-------------|
| **Properties** | Configuration values with defaults (e.g., `prefix: String = "Hello"`) |
| **Input Ports** | Typed entry points for data (`in name: String`) |
| **Output Ports** | Typed exit points for data (`out result: Int`) |
| **Process Block** | Logic that transforms inputs to outputs |

```dana
node Calculator {
    in a: Int
    in b: Int
    out sum: Int
    out product: Int
    
    process: (a, b) => {
        emit sum(a + b)
        emit product(a * b)
    }
}
```

### Edges and Guards

Edges connect output ports to input ports. Guards filter which values propagate:

```dana
// Simple edge
NodeA.output -> NodeB.input

// Guarded edge - only propagates when condition is true
Counter.value [value > 0] -> Processor.input
Counter.value [value <= 0] -> Terminal.done
```

### Pattern Matching

Match expressions for complex branching:

```dana
node Router {
    in command: Int
    out small: String
    out medium: String
    out large: String
    
    process: (command) => {
        match command {
            1 => emit small("one")
            2 => emit medium("two")
            n if n > 10 => emit large("big number")
            _ => emit small("other")
        }
    }
}
```

### Type Definitions

Custom types can be defined (implemented but not fully tested):

```dana
type Point {
    x: Float
    y: Float
}

type Result<T> {
    value: T
    error: String
}
```

### Subgraphs

Graphs can be nested for modularity:

```dana
graph Main {
    graph Subsystem {
        node Internal { ... }
    }
    
    External.output -> Subsystem.Internal.input
}
```

Also, you can instantiate nodes outside graphs, and declare edges only in graphs:

```
node MyNode {
    in foo : Int
    out bar : Int
    process : (foo) => {
        emit bar(foo * 2)
    }
}

node Constant {
    out val : Int = 5
}


graph Main {
    Constant.val -> MyNode.foo
    MyNode.bar -> System.IO.stdout
}
```
---

## Standard Library

### System.IO
Console I/O operations.

| Port | Type | Description |
|------|------|-------------|
| `stdout` | `Any` | Prints value to console |

### System.Kernel
Runtime utility nodes for coordination and synchronization.

#### System.Kernel.Collector
Accumulates values into a list and emits them on reset.

| Port | Direction | Type | Description |
|------|-----------|------|-------------|
| `in` | Input | `Any` | Values to accumulate |
| `reset` | Input | `Any` | Trigger to emit and clear |
| `send` | Output | `List` | Emits accumulated list |

#### System.Kernel.Join
Waits for both inputs before emitting.

| Port | Direction | Type | Description |
|------|-----------|------|-------------|
| `a` | Input | `Any` | First value |
| `b` | Input | `Any` | Second value |
| `send` | Output | `List` | Emits `[a, b]` when both arrive |

---

## Installation & Usage

### Prerequisites
- Rust (latest stable)
- Cargo

### Building
```bash
cargo build --release
```

### Running Programs
```bash
# Run a Dana program
./target/release/dana-lang run examples/hello.dana

# Run with verbose debug output
./target/release/dana-lang --verbose run examples/factorial_iterative.dana

# Check syntax without running
./target/release/dana-lang check examples/math.dana
```

### Development with WSL (Windows)
Use the provided PowerShell script for cross-platform development:
```powershell
.\dana.ps1 build
.\dana.ps1 test
.\dana.ps1 run examples/hello.dana
```

---

## Examples

| Example | Description |
|---------|-------------|
| `hello.dana` | Basic "Hello World" with System.IO |
| `math.dana` | Arithmetic operations and expressions |
| `strings.dana` | String concatenation and properties |
| `while.dana` | Countdown loop demonstration |
| `factorial_iterative.dana` | Iterative factorial using edge guards |
| `match_basic.dana` | Pattern matching with multiple arms |

---

## Roadmap

### v0.3 - Runtime Stabilization
- [ ] **EPOS Runtime Reimplementation**: The current scheduler has edge cases with race conditions in complex cyclic graphs. A redesigned *Ephemereal Pulse Orchestration System* will provide parallel execution at 0 cost (almost (probably)).
- [ ] **Async Edge Support**: Full implementation of `~>` asynchronous edges with proper buffering semantics.
- [ ] **Stream Processing**: Distinct behavior for `Stream<T>` types with backpressure handling.
- [ ] **Import System**: Module imports and namespacing.
- [ ] **Complete Type Definitions**: Full testing and implementation of custom `type` declarations.

### v0.4 - Syntactic Sugar & Ergonomics [PENDING TO BE DISCUSSED]
- [ ] **Lambda Expressions**: Anonymous inline node definitions.
- [ ] **Destructuring**: Pattern destructuring in process signatures.
- [ ] **Default Ports**: Implicit connections for single-port nodes.


### v0.5 - Type System Enhancement [PENDING TO BE DISCUSSED]
- [ ] **Generic Types**: Parameterized types beyond `Stream<T>`.
- [ ] **Type Inference**: Reduce explicit annotations where possible.
- [ ] **Union Types**: `Type1 | Type2` for flexible port typing.

### Future [PENDING TO BE DISCUSSED]
- [ ] **Visual Editor**: Graph-based IDE for visual programming.
- [ ] **Distributed Execution**: Cross-machine graph partitioning.
- [ ] **Persistence**: Checkpoint and resume graph state.

---

## Known Limitations (CAUTION)

- **Type Keyword**: The `type` keyword for custom type definitions is parsed and represented in the AST, but not fully tested in runtime scenarios.
- **Async Edges**: The `~>` syntax is parsed but currently executes synchronously.
- **Complex Cycles**: Very deep recursive patterns may hit depth limits.

---

## Contributing

Dana is an experimental language exploring graph-oriented paradigms. Contributions are welcome in:
- Standard library extensions
- Runtime optimizations
- Documentation and examples
- Language design discussions
