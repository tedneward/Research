title=ai-orchestrator
tags=tool, ai, team, agent, coding
summary=Portable multi-agent AI developer setup for Claude Code + Ollama.
~~~~~~

[Source](https://github.com/Mybono/ai-orchestrator)

TypeScript + Bash orchestration that runs AI agents — Ollama for code generation, Claude for planning and triage — in parallel, in dependency order.

## How it works

`/implement` triggers a multi-step pipeline. Claude handles triage and planning; the TypeScript orchestrator runs Ollama agents in dependency order; Claude applies the generated output.

```
Step 0   Triage      Claude reads graph.json (BFS depth=2), writes triage_ts.md
Step 1   Plan        Parallel Claude planners write task_context_<domain>.md
Step 1.5 Orchestrate npm start runs Ollama agents in dependency order,
                     writes ollama_output_<domain>.md
Step 2   Code        Parallel Claude coders apply ollama_output_<domain>.md,
                     write coder_output_<domain>.md
Step 2.5 Pre-review  Standards compliance check
Step 3   Build       npx tsc --noEmit
Step 4   Review      Fast review per file; deep review for flagged files
Step 5   Fix loop    Max 3 rounds, circuit breaker on repeat errors
Step 6   Finalize    git diff + track savings
```

Agents communicate through files in `.claude/context/`. Each step reads file paths from the previous step, not the full content.

