title=Moonbit
tags=language, ai, verification, web assembly, browser
summary=Functional-ish language designed for use in web-based AI IDE, compiling to browser-centric targets (JS, WASM, native).
~~~~~~

[Website](https://www.moonbitlang.com/) | [Source](https://github.com/moonbitlang) | [Docs](https://docs.moonbitlang.com/en/latest/) | [Core library](https://github.com/moonbitlang/core) - open-sourced standard library, compiler source code is not available yet.

MoonBit is an end-to-end programming language toolchain for cloud and edge computing using WebAssembly. The language is like Rust with GC support. The fast compiler is optimized to produce very compact WASM binaries. 

## Getting Started
As of 6 Oct 2025, installation is via VSCode extension ("Moonbit Language") or manual (via `curl`): `curl -fsSL https://cli.moonbitlang.com/install/unix.sh | bash` (macOS/Linux) or `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser; irm https://cli.moonbitlang.com/install/powershell.ps1 | iex` (POSH)

## Examples

```
///|
fn main {
  // explicit type annotation
  let a1 : Int = 10
  println((10 : Int))

  // Variable with type inference (Int inferred from value 20)
  let b = 20
  println("a + b = \{a1 + b}")

  // Mutable variable - can be modified
  let mut c = 10
  println("c before: \{c}")
  c = c + 1
  println("c after: \{c}")

  // Immutable variable - cannot be modified
  let d = 20
  println("d = \{d}")
  // d = d + 1  // Uncommenting this line will cause a compilation error
}
```

## Language Tour

* Type annotations (and inferred if not present)
* `let` bindings immutable; `mut` bindings mutable
* Basic types: `Int`, `Double`, `Bool`, `Char` (Unicode), `String` (immutable), `Unit`
* Escape sequences, `\u{...}` for Unicode
* String interpolation via `\{variable}`
* Functions
    * use `fn` keyword
    * parens to designate parameters; `->` for return type (`Unit` assumed if not present)
    * parameters 
        * must be type-annotated
        * names suffixed with `~` are labeled, and callers must use param name
        * names suffixed with `?` have default value, and callers must use param name
        * labeled/optional arguments can be passed in any order
    * return value designated via `return` or final expression
* Block
    * namespace/binding scope
    * an expression
    * containing sequence of statements and an optional expression
    * yields final expression or `Unit` (`()`) result
* Array
    * homogenous
    * literal syntax: `[1, 2, 3]`
    * `Array::make` function; `Array::make(4,1)` == `[1, 1, 1, 1]`
    * `..arrayname` is "array spread"; expands the array's contents in-place
    * `array[start:end]` obtains a view of the array from index `start` to index `end` (exclusive); reference
    * elements inside the array are implicitly mutable
* Tuple
    * accessed via indexed field names: `tuple.0`, `tuple.1`, etc
    * destructured via `let (a, b) = tuple`
* Map
    * key-value pairs; mutable collection
    * `{"key1": value1, "key2" : value2}`
    * `Map::of` function; `Map::of([("key1", 1), ("key2", 2), ("key3", 3)])` == `{"key1":1, "key2":2, "key3":3}`
    * accessed via `map[key]`

---

> AI-friendly general-purpose language. ICSE 2024 paper on real-time semantics-aware token sampling. Three years of training data.

**Camp:** Verification
**Author:** Hongbo Zhang / IDEA Shenzhen
**Implementation language:** OCaml
**Compilation target:** WASM GC, JavaScript, native (C codegen), LLVM
**Licence:** Unknown
**First seen:** January 2023
**Maturity:** working compiler

**Agent tooling:**
- `moon doc` AI symbol lookup
- MoonBit Pilot coding agent
- `declare` keyword for AI-native specification

## Key idea

AI-friendly general-purpose language with the deepest history in the space — three years of training data, full toolchain across four backends, a package registry (mooncakes.io), cloud IDE, and IDE plugins. Published an ICSE 2024 paper on a real-time semantics-aware token sampler. Backed by the International Digital Economy Academy (Shenzhen).

## Thesis

MoonBit is the catalogue's exception that proves the rule. Most entries are recent (Jan–May 2026); MoonBit has been shipping since 2023. Most are single-author or small-team experiments; MoonBit is backed by the International Digital Economy Academy in Shenzhen and led by Hongbo Zhang, who created ReScript and contributed to OCaml. Most ship a thought experiment or an early implementation; MoonBit ships four backends, a package registry, a cloud IDE, and two IDE plug-ins.

<p class="pullquote">The model doesn't need to be retrained. The sampler needs to know the type system.</p>

The distinctive technical move is in how the model interacts with the compiler. The ICSE 2024 paper describes a real-time semantics-aware token sampler: as the model generates code, a fast type-checker prunes ill-typed continuations at the token level. The model can still hallucinate, but the hallucinations never get past the sampler. This is closer to the verification camp's "make it checkable" intuition than the syntactic camp's "make it easier to generate" — applied at the layer where the generation actually happens.

## Distinctive moves

- **Real-time semantics-aware sampling.** The compiler participates in token generation, not just post-hoc checking.
- **`declare` keyword.** A first-class form for AI-native specification of intent and constraints, distinct from regular function signatures.
- **Four backends.** WASM GC, JavaScript, native (via C codegen), and LLVM. No other entry in the catalogue targets this breadth.
- **mooncakes.io.** A first-party package registry. Most catalogued languages don't have one because there's no ecosystem yet; MoonBit has the ecosystem.
- **Three years of training data.** The unmatched advantage. Every other entry is racing to generate examples; MoonBit has them.

## Maturity

The most mature project in the catalogue by a clear margin. 2,115+ stars (the second-highest after Zero). Full toolchain, multiple backends in active production use, IDE integrations across both major desktop IDEs, working debugger. Documentation depth and developer experience are at a level no other entry approaches.

The pragmatic question is whether MoonBit's general-purpose framing remains compelling against narrower agent-native languages as the field matures. MoonBit's bet is that general-purpose plus AI-aware tooling beats agent-native plus narrow ecosystem. The next two years will test it.

## Agent tooling

`moon doc` exposes AI-friendly symbol lookup; MoonBit Pilot is a coding agent that targets MoonBit specifically; the `declare` keyword gives agents a structured way to express intent. Less prominent than the SKILL.md/AGENTS.md pattern other catalogue entries use — MoonBit's bet is that an agent that knows the language outperforms an agent reading instructions about the language.

## Design DNA

- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Both verification camp; opposite breadth. MoonBit is a full-stack general-purpose language; Vera narrows to checkability and drops names entirely. MoonBit assumes the model needs help; Vera assumes the model needs supervision.
- **[Zero](https://agentlanguages.dev/languages/zero.md)** *(Verification)* — Closest in industrial backing (Vercel Labs vs IDEA Shenzhen) and product framing. Zero leans syntactic (one obvious way to express things); MoonBit leans toward typed sampling at the model level.
- **[AILANG](https://agentlanguages.dev/languages/ailang.md)** *(Verification)* — Both ship effect typing; MoonBit's is conventional, AILANG's is row-polymorphic with capability-based carving (IO/FS/Net/Clock/AI). MoonBit's edge is the training data depth that no other entry has.

## Timeline

- **2023** — MoonBit project initiated at IDEA Shenzhen under Hongbo Zhang. Pre-LLM-craze; framing changes over the following two years.
- **Jan 2024** — ICSE 2024 paper on real-time semantics-aware token sampling for MoonBit code generation.
- **2024–2025** — Toolchain hardens: four backends (WASM GC, JavaScript, native via C codegen, LLVM), package registry (mooncakes.io), cloud IDE, VS Code and IntelliJ plugins, debugger.
- **2026** — <code>declare</code> keyword and MoonBit Pilot agent ship, repositioning the language explicitly as AI-native rather than just AI-friendly.



