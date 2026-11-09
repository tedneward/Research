title=bench-bench
tags=tool, ai, llm, agent
summary=Coding agents (model + harness) on tasks cut from real merged PRs, graded by hidden upstream tests
~~~~~~

[Source](https://github.com/tedneward/bench-bench)

A small, reproducible benchmark of **coding agents** (model + harness + effort) on tasks cut from **real merged pull requests**. Each agent gets the repository at the PR's parent commit and a written brief, works alone in a sandbox under a time limit, and is graded by the PR's own tests, which it never sees.

## Tasks and tools

[](https://github.com/tedneward/bench-bench#tasks-and-tools)

**Choose a task set; compare results within that set.** The harnesses are Claude Code, Codex and Pi. No SAP system is needed. To run your own model, start with the Docker image and `bin/abap-bench` in [One-command native ABAP runs](https://github.com/tedneward/bench-bench#one-command-native-abap-runs); add `--port` for a live progress page. The native ABAP package is distributed separately; this repository contains its adapter.

-   **PR-6:** six tasks from real merged pull requests, at levels L1–L3. The agent gets the repository at the PR's parent commit and a brief, then implements the change within a time limit. The PR's own hidden tests grade the result. The briefs are in `tasks/`: `L1a-osg678`, `L1b-osg680`, `L2a-osg693`, `L2b-abapiti87`, `L3a-minz39`, `L3b-abapiti95`; see [The tasks](https://github.com/tedneward/bench-bench#the-tasks).
-   **Native ABAP:** 337 tasks from abapGit, open-abap-core, open-abap-apc, open-steamgate (osg), osg-demo, pia, zllm, zork-abap, zvdb and zmjs. The source groups are old public code (190), fresh code (109), and the maintainer's own public repositories (38). **L0 infill** restores a missing line, block or body inside a method; **L1** completes a whole method. Hidden tests grade only the target method body, spliced into the original sources. A wrong-answer gate checks that the grader rejects incorrect answers. Tiers: **ember / SMOKE-4 (4)**, **SMOKE (12)**, **MEDIUM (69 in v2.2–v2.3; 54 from v2.4)**, **FULL (337)**. Tasks are versioned (`id@n`); each run records its environment version (v2.3 = env 3). See [Native ABAP tasks](https://github.com/tedneward/bench-bench#native-abap-tasks) and the [adapter](https://github.com/tedneward/bench-bench/blob/main/bin/abap-tasks.sh).
-   **Extra ABAP sets, in separate tables:** agentic has 10 tasks from real merged changes, levels L1–L3, with 30–60 minute limits; synthetic has 15 tasks with injected bugs or removed features. Grading uses the change's tests, tests derived from the reference solution, and 200 seeded differential scenarios per task.

**The agent has a local ABAP tool.** `osg-abap` is on PATH inside the sandbox:

| Command | What the agent can check |
| --- | --- |
| `osg-abap lint` | Fast source diagnostics |
| `osg-abap check` | Syntax and activation |
| `osg-abap test` | Workspace unit tests, including tests the agent writes in `<class>.clas.testclasses.abap` |

Hidden tests remain invisible. Workspace `AGENTS.md` / `CLAUDE.md` explain the commands and, from v2.3, encourage agents to write their own tests. The bundled tool works offline; the source repository's build scripts are not needed.

**Network and credentials.** For ABAP, harness web tools are off. Egress permits only the model endpoint and `help.sap.com`, `rules.abaplint.org`, `abaplint.app`; `--no-internet` permits only the endpoint. Custom endpoint, z.ai, Alibaba, Anthropic API and Azure keys stay outside the sandbox; Claude OAuth and ChatGPT logins still enter it. See [API keys and network isolation](https://github.com/tedneward/bench-bench#api-keys-and-network-isolation).

## TL;DR

-   **66 baseline runs + 3 pilot runs**, 6 tasks, 15 model + harness combinations, 8 models, 3 harnesses (Claude Code, Codex, Pi). One run per cell, so treat one-task differences as noise.
-   **Opus in Claude Code solved 6/6.** Sol 6.1 in Codex solved 5/6 in a quarter of the time, failing only the hardest task (L3b). Luna xhigh in Codex also solved 5/6, failing the same task, for about $0.41 in total at list price versus about $2.30 for Sol.
-   **The harness matters as much as the model.** The same GLM-5.3 solved 6/6 in Claude Code (3 only at the time limit), 5/6 in Pi and 4/6 in Codex.
-   **Cheap per token is not cheap per task.** GLM-5.3 in Claude Code burned 112M input tokens on the six tasks, about $32 at list price; Opus used 39M, about $18. Sol solved 5 tasks for about $2.30, and Luna in Codex costs cents per task.
-   **Hidden tests are not the whole truth.** A blind critic (Sol) found real bugs in three patches that pass the tests (two by Opus, one by Luna xhigh); each was confirmed by running the critic's repro against the upstream solution.
-   **Round 3 (effort vs executable checks, one run each):** Sol 6.1 at high effort solved L3b, which it failed at medium. Luna high solved L2b when half of the held-out cases were in the repo as runnable examples; Luna medium gave up even with them.
-   **Round 4, the first local model:** Qwen3.8-Flash-Next, 4-bit, on a single 96 GB GPU in a home machine, solved 5 of 6 tasks in Claude Code (L3a at the time limit), as many as Sol 6.1 and Luna xhigh. Like them it failed L3b, also on a second attempt with Sol as critic. One run per task.
-   **Reproduced on a simpler, slower home setup:** the same model as a 4-bit GGUF in llama.cpp on a PC with one consumer CPU and two 16 GB gaming GPUs (about 16 tokens/s, a tenth of the speed, so limits ×10) solved L1a in 26 minutes; its L1b session was rated on track by two blind judges when it was stopped at 47 minutes.
-   **A pruned build on the same home PC solved all four L1–L2 tasks:** ISTA-DASLab's 3.5-bit GSQ-RCO-Coder build of Qwen3.8-Flash-Next (256 of 512 experts), cut further to 224 experts on our own routing statistics, fits in 32 GB of VRAM and runs at 20–35 tokens/s. With limits ×5 it solved L1a, L2a, L1b and L2b (8, 38, 88 and 99 minutes). L3b was stopped after 94 minutes to free the machine; the session is kept.
-   **Smaller builds and small models on the same home PC (October 24–25):** K192p-implant16, a 192-expert cut of DSLab's build with 16 experts per layer implanted from our session statistics, solved L1a, L2a, L1b and L3b (L2b was stopped by the operator after a reasoning loop). Four small models that fit entirely in VRAM (Ornith-1.5-35B-A3B, Flint, Nemotron 3.5 Lightning, Muse Glimmer 30B) each solved L1a in 11–13 minutes. On L2a the fix was in place after about 11 minutes in all three runs where we measured it; the rest of each session (12–38 min) went into the agent's own tests and checks.
-   **A two-critic build loop did not help** in a 3-run pilot. It did not solve more tasks, and runs took 2–10× longer.
