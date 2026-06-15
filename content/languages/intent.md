title=Intent
tags=ai, language, verification, native, nodejs, browser, web assembly
summary=AI-first language that builds on the idea that humans audit contracts, not implementations.
~~~~~~

[Source](https://github.com/lhaig/intent)

> Mandatory preconditions, postconditions, and entity invariants. Z3 SMT verification via intentc verify. Natural-language intent blocks that resolve to specific contract references. One source file compiles to Rust, JavaScript, and WebAssembly.

**Camp:** Verification
**Author:** lhaig
**Implementation language:** Go
**Compilation target:** Native binaries (via Rust), JavaScript, WebAssembly (direct binary)
**Licence:** Apache-2.0
**First seen:** February 2026
**Maturity:** working compiler

**Agent tooling:**
- AGENTS.md
- CLAUDE.md
- INTENT.md

## Key idea

Every function carries `requires`/`ensures`; every entity carries an `invariant`; loops carry `invariant` and `decreases`. An `intent` block links natural-language goals to specific contract references via `verified_by`, and the compiler refuses to resolve a reference that has no matching contract. `intentc verify` discharges what it can to Z3; what remains runs as enforced runtime checks in Rust (panic), JavaScript (throw), or WebAssembly (trap), all from the same source file.

## Thesis

Intent's premise is that humans audit contracts, not implementations. The repository's framing makes the position explicit: &ldquo;Humans audit contracts, not implementations. When you generate Intent code, the human reads your `requires`, `ensures`, `invariant`, and `intent` blocks to verify correctness.&rdquo; The compiler enforces structural consistency between the natural-language declarations and the machine-checkable ones &mdash; every `verified_by` reference must resolve to an actual `requires`, `ensures`, or `invariant` clause, or the program fails to compile.

<p class="pullquote">The contract system is the product. The implementation is secondary.</p>

The distinctive move is the **intent block** itself: a named natural-language goal paired with a list of `verified_by` references that name specific contracts in the codebase (`BankAccount.invariant`, `BankAccount.deposit.requires`, `BankAccount.withdraw.ensures`). The compiler resolves each reference during semantic analysis and emits an error on a dangling one; published intent blocks therefore cannot drift from the contracts they cite. Z3 discharges what it can statically via `intentc verify`; the rest becomes runtime enforcement that fires identically across all three targets &mdash; a `requires` failure panics the Rust binary, throws an `Error` in JavaScript, and traps in WebAssembly.

## What it looks like.

```intent
entity BankAccount {
    field balance: Int;

    invariant self.balance >= 0;

    method deposit(amount: Int) returns Void
        requires amount > 0
        ensures self.balance == old(self.balance) + amount
    {
        self.balance = self.balance + amount;
    }
}

intent "Safe withdrawal preserves non-negative balance" {
    goal "BankAccount.withdraw never results in balance < 0";
    guarantee "if withdraw returns false then balance is unchanged";
    verified_by BankAccount.invariant;
    verified_by BankAccount.withdraw.requires;
}
```

`old(...)` captures pre-mutation state for `ensures` clauses. `forall i in 0..n: p` and `exists i in 0..n: p` quantify over integer ranges in contracts. Loops carry `invariant` and `decreases` clauses for inductive reasoning at verification time.

## Distinctive moves.

- **Mandatory contracts at three levels.** Functions carry `requires`/`ensures`; entities carry `invariant`; loops carry `invariant`/`decreases`. The grammar reserves the slots; the type checker enforces that `verified_by` references resolve.
- **Intent blocks as compiled artefacts.** A `verified_by` path (`Entity.member.clause` or `function.clause`) is resolved by the semantic checker, not by convention. Unresolved references are compile errors, which prevents prose-level drift between stated goals and machine-checkable contracts.
- **Z3 as an optional static layer, runtime checks as the floor.** `intentc verify` translates IR contracts to SMT-LIB and invokes Z3; results are reported per contract as `verified` / `unverified` / `error` / `timeout`. When Z3 is absent, the compiler degrades gracefully and the runtime asserts still run.
- **Rust as IR, not as the only backend.** An explicit IR layer (~30 node types, contracts as first-class IR nodes, `OldCapture`/`OldRef` as explicit pre-state) feeds three sibling backends: a Rust generator that hands off to `cargo`, a direct JavaScript emitter, and a direct WebAssembly binary emitter that does not require the Rust toolchain. Each enforces the same contracts at runtime.
- **Property-based test generation from contracts.** `intentc test-gen` derives property-based tests from `requires`/`ensures`, complementing &mdash; not replacing &mdash; the SMT discharge.

## Maturity.

A Go workspace at v0.2.0 (released 16 February 2026) with 45 commits and 5 stars at time of cataloguing. The roadmap (`docs/ROADMAP.md`) records milestones 1&ndash;6 as complete: usable language surface (loops, arrays, enums, pattern matching, `Result`/`Option`, try operator, multi-file imports), the Z3 verifier (`internal/verify/`), and three working backends (Rust via `internal/rustbe/`, JavaScript via `internal/jsbe/`, direct WASM via `internal/wasmbe/`). The `docs/DESIGN.md` specification runs to 1,764 lines and notes that traits, generics, async/await, and a package manager with semver constraints have all landed since the POC. The CLI surface &mdash; `intentc build / check / verify / fmt / lint / test-gen`, plus `intentc pkg init / add / remove / install` &mdash; is shippable; a four-target showcase (CLI binary, browser dashboard, Node server, browser WASM at 155 bytes) runs against unmodified compiler output. Last commit was 25 March 2026; an LSP, REPL, and release-mode contract stripping sit on the milestone-8 roadmap and are not yet built.

## Agent tooling.

Three documents target agent authors directly. `AGENTS.md` (~18 KB) is the Codex/general-agent orientation. `CLAUDE.md` is the Claude-specific working guide. `INTENT.md` (~26 KB) is the language reference written as agent instructions &mdash; it opens &ldquo;You are generating code in Intent&rdquo; and ends with ten explicit guidelines for AI code generation, including &ldquo;Write contracts first&rdquo; and &ldquo;Every function should have contracts.&rdquo; `docs/REPRODUCE.md` documents reproducing the compiler with the agent of the reader's choice. Diagnostics are textual rather than structured JSON; the LSP that would expose them programmatically is on the roadmap rather than shipped.

## Design DNA

- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Closest design relative. Both ship mandatory contracts on every function, both use Z3, both treat the agent as the primary author. Vera abolishes parameter names via typed DeBruijn slots and tracks LLM inference as a first-class <code>&lt;Inference&gt;</code> effect; Intent keeps names and concentrates its novelty in intent blocks that bind natural-language goals to verified contract references.
- **[Aver](https://agentlanguages.dev/languages/aver.md)** *(Verification)* — Same camp, different proof story. Aver exports <code>verify</code> blocks as Lean 4 theorems or Dafny lemmas through <code>aver proof</code>, lifting effectful code into proof artefacts via Oracle; Intent commits to Z3 SMT with runtime enforcement on every backend. Same diagnosis, different upper-bound check.
- **[MoonBit](https://agentlanguages.dev/languages/moonbit.md)** *(Verification)* — Closest sibling on compilation strategy. MoonBit ships four backends (WASM GC, JavaScript, native via C codegen, LLVM) on an OCaml-implemented compiler; Intent ships three (Rust, JavaScript, WASM) on a Go-implemented one. MoonBit's edge is years of training data; Intent's framing is auditability over breadth.
- **[Prove](https://agentlanguages.dev/languages/prove.md)** *(Verification)* — Same contract machinery, opposite politics. Prove ships refinement types and verb-based IO under the Prove Source License v1.0, which prohibits use as AI training data; Intent ships under Apache-2.0 and addresses its agent-instruction documents to the model directly.
