title=AgentLanguages
tags=place, language, langdev, ai, agent, dsl
summary=A live catalogue of an emerging field.
~~~~~~

[Website](https://agentlanguages.dev/)

## Taxonomy
Three camps disagree on how to frame the problem. The Syntactic camp says the problem is representational — strip ambiguity at the token level. The Verification camp says it's semantic — make contracts mechanically checkable. The Orchestration camp says it isn't a language problem at all — constrain how agents coordinate. The catalogue below treats them as evidence that this disagreement is real.

## Syntactic
*If the problem is that models trip on syntax, the fix is to strip ambiguity from the syntax itself.*

The syntactic camp treats the problem as one of representation. Models choke on tokens that mean different things in different positions, on operators that need disambiguation, on whitespace that might or might not be load-bearing. Their answer: build a syntax where every token has one job.

The strongest entries replace text with structure (X07's JSON ASTs), eliminate operators in favour of keywords (NERD), or surface intermediate representations as the user-facing form (Magpie's SSA). The weakest are exercises in extreme density — one-character opcodes — that read more as conceptual art than as production languages.

What unites them is a belief that the LLM's job is easier if the surface is simpler. What divides them from the verification camp is the absence of any mechanism for the compiler to catch what the model gets wrong.

## Verification
*The model doesn't need to be right. It needs to be checkable.*

The verification camp accepts that LLMs will keep making semantic errors and asks a different question: can the compiler catch them? Their answer is mandatory contracts, refinement types, effect systems, and SMT-backed proofs — the machinery of formal methods, repurposed as a guardrail for generative code.

This is the camp with the most established theoretical foundation (the work goes back to ML, Coq, Dafny, and Lean) and also the most mature implementations. MoonBit ships a full toolchain with ICSE-published research; Vera ships measured benchmark wins against Python on zero training data; AILANG claims to be written autonomously by its own coordinator.

The provocative entry is Prove — same diagnosis, opposite conclusion. It uses verification to make the language resistant to AI generation. The licence explicitly prohibits training use. Same camp, opposite politics.

## Orchestration.
*It isn't a language problem. It's an agent-coordination problem.*

The orchestration camp re-frames the question. The trouble with LLM-authored code, they argue, isn't any specific defect in the code — it's that agents need to be sequenced, sandboxed, audited, and approved by humans at the right points. The language is just the substrate; the runtime is where the action is.

Some entries here are academic (Pel from CMU, Quasar from Penn); some are infrastructure (Marsha treats the LLM as the compiler itself); one is a serious engineering effort aimed squarely at regulated industries (Boruna's hash-chained evidence bundles and deterministic replay).

This camp overlaps the most with the others — Boruna includes a type checker and capability system; Quasar adds conformal prediction. The line between “language for agents” and “framework for agents” is genuinely blurry here, which is itself informative.

* [AILANG](/languages/ailang): Verification
* [Aver](/languages/aver): Verification
* [Axis](/languages/axis): Syntactic, Verification
* [BHC/hx](/languages/bhc-hx): Verification
* [B-IR](/languages/b-ir): Syntactic
* [Boruna](/languages/boruna): Orchestration, Verification
* [Codong](/languages/codong): Syntactic
* [Intent](/languages/intent): Verification
* [Koru](/languages/koru): *N/A*
* [Laze](/languages/laze): Syntactic
* [LLMLang](/languages/llmlang): Syntactic, Verification
* [Lume](/languages/lume): Syntactic
* [Lumen](/languages/lumen): Orchestration
* [Magpie](/languages/magpie2): Syntactic
* [Marsha](/languages/marsha): Orchestration
* [Mog](/languages/mog): Syntactic, Verification
* [MoonBit](/languages/moonbit): Verification
* [Nanolang](/languages/nanolang): Verification, Syntactic
* [NERD](/languages/nerd) (No Effort Required, Done): Syntactic
* [Pact](/languages/pact): Verification
* [Pel](/languages/pel): Orchestration
* [Plasm](/languages/plasm): Orchestration, Syntactic
* [Plumbing](/languages/plumbing): *N/A*
* [Prove](/languages/prove): Verification
* [Quasar](/languages/quasar): Orchestration, Verification
* [Sever](/languages/sever): Syntactic
* [Spec](/languages/spec): Orchestration?
* [Tacit](/languages/tacit): Syntactic, Verification
* [Valea](/languages/valea): *N/A*
* [Vera](/languages/vera): Verification, Orchestration
* [Vow](/languages/vow): Verification
* [X07](/languages/x07): Syntactic
* [Zero](/languages/zero): Verification, Syntactic
