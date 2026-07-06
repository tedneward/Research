title=Headroom
tags=tool, library, ai, llm, mcp server
summary=Compress tool outputs, logs, files, and RAG chunks before they reach the LLM; 60-95% fewer tokens, same answers.
~~~~~~

[Website](https://headroomlabs-ai.github.io/headroom/) | [Source](https://github.com/headroomlabs-ai/headroom)

Headroom compresses everything your AI agent reads — tool outputs, logs, RAG chunks, files, and conversation history — before it reaches the LLM. Same answers, fraction of the tokens.

## What it does

-   **Library** — `compress(messages)` in Python or TypeScript, inline in any app
-   **Proxy** — `headroom proxy --port 8787`, zero code changes, any language
-   **Agent wrap** — `headroom wrap claude|codex|copilot|cursor|aider|opencode|cline|continue|goose|openhands|openclaw|vibe` in one command; undo with `headroom unwrap <tool>`
-   **MCP server** — `headroom_compress`, `headroom_retrieve`, `headroom_stats` for any MCP client
-   **Cross-agent memory** — shared store across Claude, Codex, Gemini, auto-dedup
-   **`headroom learn`** — mines failed sessions, writes corrections to `CLAUDE.local.md` (default, gitignored) or `CLAUDE.md` / `AGENTS.md` / `GEMINI.md`
-   **Output token reduction** — trims what the model _writes back_ (not just what you send): drops ceremony/restated code and skips deep "thinking" on routine steps. See [Output token reduction](https://github.com/headroomlabs-ai/headroom#output-token-reduction-cut-what-the-model-writes-back).
-   **Reversible (CCR)** — originals are cached for retrieval on demand

## How it works (30 seconds)

```
 Your agent / app
   (Claude Code, Cursor, Codex, LangChain, Agno, Strands, your own code…)
        │   prompts · tool outputs · logs · RAG results · files
        ▼
    ┌────────────────────────────────────────────────────┐
    │  Headroom   (runs locally — your data stays here)  │
    │  ────────────────────────────────────────────────  │
    │  CacheAligner  →  ContentRouter  →  CCR            │
    │                    ├─ SmartCrusher   (JSON)        │
    │                    ├─ CodeCompressor (AST)         │
    │                    └─ Kompress-base  (text, HF)    │
    │                                                    │
    │  Cross-agent memory  ·  headroom learn  ·  MCP     │
    └────────────────────────────────────────────────────┘
        │   compressed prompt  +  retrieval tool
        ▼
 LLM provider  (Anthropic · OpenAI · Bedrock · …)
```

-   **ContentRouter** — detects content type, selects the right compressor
-   **SmartCrusher / CodeCompressor / Kompress-base** — compress JSON, AST, or prose
-   **CacheAligner** — stabilizes prefixes so provider KV caches actually hit
-   **CCR** — stores originals locally; LLM calls `headroom_retrieve` if it needs them

