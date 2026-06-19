title=LLMLang
tags=language, ai, syntactic, verification, llvm
summary=AI-first language that provides prefix-arity AST with single--character ASCII operators and De Bruijn variable indices, linear ownership enforced at compile time, and compiler-injected OpenTelemetry spans triggered by a metadata marker.
~~~~~~

[Source](https://github.com/paulprogrammer/llmlang)

> LLVM IR via Rust, OpenCL JIT for GPU map operations.

**Camp:** Syntactic
**Also spans:** Verification
**Author:** Paul Williams (paulprogrammer)
**Implementation language:** Rust
**Compilation target:** LLVM IR (then native via clang); OpenCL JIT for GPU map kernels at runtime
**Licence:** GPL-3.0 with Runtime Exception
**First seen:** May 2026
**Maturity:** working compiler

**Agent tooling:**
- MCP server (llm-mcp binary, stdio transport)
- MCP tools: analyze_codebase, search_symbols, get_definition, get_diagnostics, find_callers, structural_search, patch_symbol
- MCP resources: llm://spec (LLM_SPEC.md), llm://agent-workflow (MCP_GUIDE.md)
- GEMINI.md (Gemini CLI orientation)
- Stable diagnostic codes (E000-E018, W001) catalogued in DIAGNOSTICS.md
- .llmi signature files for cross-module imports

## Key idea

LLMLang takes the token-efficiency move to its density extreme. Source is a prefix-arity AST in single-character ASCII operators (`+`, `-`, `>`, `$`, `~`, `?`, `.`, `#`); variables are De Bruijn indices (`^0`, `^1`) rather than names; affine ownership is enforced at compile time (move `>`, borrow `$`, mut-borrow `~`). The compiler ships OpenTelemetry auto-instrumentation as a metadata marker (`M "otel" "span_name" : func`) that injects span entry/exit and timing around the function body, plus an OpenCL JIT that translates pure `map` bodies to GPU kernels at runtime and falls back to CPU vectorisation if OpenCL is absent.

## Thesis

LLMLang takes the syntactic camp's premise &mdash; that the symbols an LLM emits cost tokens, so the language surface should minimise them &mdash; to its density extreme. The `LLM_SPEC.md` header is `[TOKEN_OPTIMIZED: HIGH_DENSITY]` and the design guide names the audience directly: "Target Audience: Large Language Models (LLMs). Non-Goal: Human readability." Source is a prefix-arity AST written in single-character ASCII operators: `+ 10 20` is addition, `> ^0` consumes the most-recent binding, `$ ^1` borrows the next-most-recent, `? cond t f` is a branch, `# Point x y` declares a struct-of-arrays shape, `: name args body` defines a function, `. e1 e2` sequences. There are no parentheses, no semicolons, no infix precedence to disambiguate. Variables are referenced by their De Bruijn index in the binding stack &mdash; `^0`, `^1`, `^2` &mdash; rather than by names; the parser also accepts named identifiers but resolves them to indices before the AST stores anything.

<p class="pullquote">"Target Audience: Large Language Models (LLMs). Non-Goal: Human readability."</p>

The distinctive move sits in two places at once. The first is the density lever: where NERD bets on English keywords because BPE tokenisers fragment punctuation, LLMLang bets the opposite &mdash; that single ASCII characters cost one token each in the right tokeniser and the win is biggest when there is no punctuation to fragment. The second is enforcement: affine ownership (`>` move, `$` borrow, `~` mut-borrow) is verified at compile time in `src/compiler/analysis/verify.rs`, with a `VariableState` stack that issues `E004` for use-after-move, `E005` for double-move, `E009` for branch-state mismatch, and `E016` for moving a borrowed variable. The same syntactic-camp surface ships a Rust-style borrow checker rather than relying on convention, which is why the entry spans into verification &mdash; the safety story is enforced, not advisory.

## What it looks like

<div class="code-sample">
  <div class="code">
<pre><span class="cm">// Factorial. ^0 refers to the most-recent binding (the parameter n).</span>
<span class="kw">:</span> fact n <span class="op">?</span> <span class="sl">^0</span> <span class="op">*</span> <span class="op">$</span> <span class="sl">^0</span> <span class="kw">@</span> fact <span class="op">-</span> <span class="op">></span> <span class="sl">^0</span> <span class="num">1</span> <span class="op">></span> <span class="sl">^0</span>

<span class="cm">// Auto-instrumented function. The M marker triggers compiler-injected</span>
<span class="cm">// span entry/exit and timing around handle_request.</span>
<span class="kw">M</span> <span class="str">"otel"</span> <span class="str">"handle_request"</span> <span class="kw">:</span> handle_request req
    <span class="op">+</span> <span class="op">$</span> req <span class="num">1</span></pre>
  </div>
  <p class="caption">Every form is prefix-arity; <code>^0</code> is De Bruijn for "most-recent binding"; <code>&gt;</code> consumes, <code>$</code> borrows. The <code>M</code> metadata marker is read by the compiler in <code>src/main.rs</code> and routes the following definition through a code path that wraps the body in <code>llm_otel_enter_span</code> / <code>llm_get_time_ns</code> / <code>llm_otel_emit_span</code> / <code>llm_otel_exit_span</code> calls.</p>
</div>

## Distinctive moves

- **Prefix-arity AST in single-character ASCII.** `+ - * / > $ ~ ? . # : ^ ( ) & | =` cover binary math, ownership, branching, sequencing, shape declarations, definitions, De Bruijn lookup, and read/write handles. Short keywords (`sl`, `sc`, `ss`, `sf`, `sr`, `sp`, `jp`, `ju`, `map`, `flt`, `oe`) handle the rest. Compound expressions parse without parentheses because arity is fixed per operator.
- **De Bruijn variable references.** `^0` is the most-recent binding, `^1` the next-most-recent. The parser accepts named identifiers and resolves them to indices on the way in, but the AST stores only `Expr::DeBruijn(usize)`. Sample programs in `examples/` use the bare-index form directly (`: fact n ? ^0 * $ ^0 @ fact - > ^0 1 > ^0`).
- **Compile-time affine type checking.** `src/compiler/analysis/verify.rs` walks every function body with a `VariableState` stack tracking `Available`, `Borrowed`, and `Moved` per binding. `E004` fires on use-after-move, `E005` on double-move, `E009` when an `if`'s two branches leave the stack in different states, `E016` on moving a borrowed value. Unconsumed bindings emit `W001` and are auto-dropped at scope exit.
- **Compiler-injected OpenTelemetry spans.** Tagging a function with `M "otel" "span_name" : func` is recognised in `src/main.rs` and routed to a `gen_function` overload that wraps the body in calls to `llm_otel_enter_span`, `llm_get_time_ns`, `llm_otel_emit_span`, and `llm_otel_exit_span`. Nested tagged functions propagate trace context via thread-local storage in the C runtime; `OTEL_EXPORTER_OTLP_ENDPOINT` toggles between stdout JSON lines and HTTP POST. No other catalogue entry ships compiler-injected OpenTelemetry.
- **OpenCL JIT for `map` over SoA columns.** When a `map` is applied to a struct-of-arrays column with a pure function, `translate_to_opencl` in `src/compiler/codegen/expr.rs` synthesises an OpenCL `__kernel void map_kernel(...)` from the function body, and `src/runtime/driver_src/opencl_driver.c` `dlopen`s `libOpenCL.so` at runtime to compile and dispatch. Absent OpenCL, the runtime falls back to LLVM's loop and SLP vectorisers, with implicit parallelism hoisting pure subtrees above a complexity threshold into `parallel_task_N` functions dispatched through a work-stealing thread pool (`llm_fork`).
- **`.llmi` signature files for cross-module imports.** Compiling a module with `-o` generates a high-density header file listing exported symbols and shape definitions; the `I` operator reads it for downstream type and arity resolution. The `Money` primitive (`%+`, `%-`, `%*`, `%/` over 4-decimal fixed-point integers, `%str` formatting) and the Kubernetes Service Bindings integration in `src/runtime/db.c` (which reads `SERVICE_BINDING_ROOT` to assemble database connection strings from projected files) are part of the same "production backend primitives in the language" framing.

## Maturity

`v0.4.0` at the time of cataloguing, sixteen tagged releases (`v0.1.0` to `v0.4.0`) cut between 18 and 24 May 2026 against a repository created 18 May 2026 &mdash; one feature wave per day for roughly a week, then consolidation commits through 27 May. Roughly 13,300 lines of Rust and C across 46 source files (`src/compiler/{lexer,parser,ast,analysis,codegen}` and a C runtime covering HTTP client and server with `picohttpparser`, TLS via `mbedtls`, `cJSON`, SQLite/Redis/MongoDB drivers, OpenCL dispatcher, MPSC emission queue, and a libtai-baseline temporal module); 31 self-hosted test programs under `tests/lang/` and 47 Rust unit tests in `tests/compiler_tests.rs`. GPLv3 with the `llmlang` Runtime Exception &mdash; a GCC-style carve-out that keeps the compiler copyleft but lets generated binaries link the runtime libraries into proprietary code without the licence propagating. Single author Paul Williams (`paulprogrammer`, Denver, Colorado, GitHub bio "Barefoot Coders"); 0 stars and 0 forks at time of cataloguing.

The README opens with the disclosure: "This entire repository has been largely vibecoded with humans acting as the product owners, and the LLM acting as the developer." That places LLMLang in the same factual family as AILANG's "written autonomously by AI agents" framing and Codong's "designed for AI to write, humans to review" position &mdash; what is shipped is real engineering with real automated tests, and the catalogue notes the authorship model as context rather than judgement. `MAYBE.md` separates roadmap from shipped: first-class AST manipulation beyond the existing `patch_symbol`, formal intent-and-contract metadata nodes, and TDD/BDD scenario nodes are not yet in the compiler, with OpenTelemetry already crossed off the list. The bet is the syntactic camp's bet intensified &mdash; that a surface compressed to single-character prefix operators with indexed variables, plus an MCP server that exposes the same AST the compiler sees, will produce more correct output per token than a conventional language plus a smarter model.

## Agent tooling

The `llm-mcp` binary is the primary agent surface and ships as a second cargo target alongside the compiler. It exposes seven tools over stdio: `analyze_codebase` walks a directory and parses every `.llm` file into the same AST the compiler uses; `search_symbols` looks up functions and shapes by name; `get_definition` returns the realised AST and file location of a symbol; `get_diagnostics` runs the parser front-end against a file and returns `E00x`/`W00x` codes; `find_callers` traverses the call graph; `structural_search` computes a SHA-256 hash of the operator-and-control-flow shape of a function body (literals and names omitted) and returns other functions sharing the same fingerprint &mdash; an LLM can ask "what else does the same thing?" without relying on name similarity. `patch_symbol` accepts a JSON AST for a new function body, parses the source file, swaps the matching `Define` node's body, and rewrites the file through the compiler's own pretty-printer (`PrettyExpr` in `src/compiler/ast/display.rs`), so edits stay syntactically valid by construction. Two MCP resources back the tools: `llm://spec` embeds `LLM_SPEC.md` directly (the token-density grammar reference), and `llm://agent-workflow` embeds `MCP_GUIDE.md` (the analyse &rarr; locate &rarr; extract &rarr; patch workflow). Stable diagnostic codes (`E000`&ndash;`E018`, `W001`) are catalogued in `DIAGNOSTICS.md` so the same identifiers appear in compiler output, MCP responses, and the spec text the model receives from `llm://spec`.

## Design DNA

- **[NERD](https://agentlanguages.dev/languages/nerd.md)** *(Syntactic)* — Closest editorial sibling on the token-efficiency axis, opposite lever. NERD swaps operators for English keywords (<code>plus</code>, <code>minus</code>, <code>eq</code>) on the bet that BPE tokenisers fragment punctuation; LLMLang collapses operators to single ASCII characters (<code>+</code>, <code>></code>, <code>$</code>, <code>~</code>) on the opposite bet that the right tokeniser maps each symbol to one token. Same camp, same diagnosis, opposite side of the symbol-vs-word spectrum.
- **[Magpie](https://agentlanguages.dev/languages/magpie.md)** *(Syntactic)* — Same camp, more extreme densification. Magpie surfaces SSA with <code>%</code>-prefixed typed values and accepts ~2.3&times; more tokens per operation for unambiguity; LLMLang strips the surface further to prefix-arity with single-character operators and indexed variables, betting on density over explicitness. Both ship structured diagnostics with stable codes.
- **[Vera](https://agentlanguages.dev/languages/vera.md)** *(Verification)* — Cross-camp foil on De Bruijn indices. Vera uses typed slot references <code>@T.n</code> as a verification-camp move &mdash; the empirical case is that LLMs make naming errors faster than they make logic errors. LLMLang uses <code>^0</code>, <code>^1</code> as a syntactic-camp move &mdash; the case is that names cost tokens. Same mechanism, different camp.
- **[Lumen](https://agentlanguages.dev/languages/lumen.md)** *(Orchestration)* — Also ships MCP integration but at different positioning. Lumen's <code>lumen-provider-mcp</code> is one provider crate among several (alongside HTTP, Gemini, custom-model providers) inside a human-facing orchestration language; LLMLang's <code>llm-mcp</code> binary is the primary agent surface and exposes structural-fingerprint search and a <code>patch_symbol</code> tool that rewrites source via the compiler's own pretty-printer.
