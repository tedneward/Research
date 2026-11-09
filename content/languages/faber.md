title=Faber Romanus
tags=language, ai, agent, syntactic, gpu, native
summary=Statically typed compute language designed for coding agents to write and people to read.
~~~~~~

[Website](https://faberlang.dev) | [Source](https://github.com/faberlang/faber) | [Releases](https://github.com/faberlang/releases) | [agentlanguages.dev entry](https://agentlanguages.dev/languages/faber/)

> A statically typed language for coding agents and human authors, with a mechanical grammar, explicit static and generic types, and math-oriented operators. The same program reads in eight human languages and compiles to Rust, TypeScript, Go, Swift and more.

**Author:** Ian Zepp
**Implementation language:** Rust
**Compilation targets:** Rust, TypeScript, Go, Swift, Python, C, LLVM IR, WebAssembly; kernels on CPU, CUDA and Metal device routes
**Licence:** Apache-2.0 OR MIT (front end, MIR runner, standard library, grammar); several code generators ship only in the released binary
**First seen:** July 2026
**Maturity:** working compiler; experimental through 1.x, with breaking changes in minor releases

**Agent tooling:**
- llms.txt / llms-full.txt
- Agent Skills catalogue under `/.well-known/agent-skills/`
- Markdown agent guide under `/agents/`
- `faber explain` for glyphs, keywords and diagnostic codes

## Key idea

Agents write the source; people read it. Declarations are type-first, each operator is one glyph with one meaning, tensor shapes are part of the type, and failure is a typed second channel. The analysed program is the source of truth: a `.fab` file is a rendering of it into one reader locale (English by default; Latin is the canonical interchange; Chinese, Thai, Arabic, Hindi, Vietnamese also ship), so a person can read and write the same program in their own language.

## Example

```
fn divide(int a, int b) → int ⇥ string {
    if b ≡ 0 then throw "division by zero"
    return a / b
}

main {
    let list<string> labels ← ["one", "two", "three"]
    let list<int> values ← [1, 2, 3]
    for from labels and values let label and value {
        print "§ = §"(label, value)
    }
    print divide(7, 0) ⊥ -1
}
```

## Timeline

- **Jul 2026** — `faber` CLI imported from the closed Radix compiler; v1.0.0 tagged.
- **Oct 2026** — Front end, runner, standard library and grammar published as `faberlang/faber` (Apache-2.0 OR MIT). v1.18 makes Cranelift the default engine for `faber run`.
- **Nov 2026** — v1.19: one `.fab` file can hold its program, tests and expected input/output as labelled sections; `and` loop heads walk lists in lockstep; `f64` allowed in kernels on CPU and CUDA.
