title=OpenHack
tags=ai, llm, assistant, security
summary=Lightweight, file-based workspace for source-guided whitebox security review.
~~~~~~

[Source](https://github.com/hadriansecurity/openhack)

`openhack` is a set of agents and tools that mimics how the Hadrian research team performs automated vulnerability research. The methodology has been adjusted so it can run inside a common model harness — Claude Code, Codex, Cursor, or a custom runner — while keeping durable state in plain files: cloned source, recon items, scenario prompts, scenario results, finding candidates, triage decisions, findings, and logs. The harness provides model execution, terminal access, repository access, and human-in-the-loop approval; this tool provides the durable workflow and review artifacts.

**The core idea:** checkpointed, scenario-first review. Recon discovers surfaces, a router agent turns them into scoped scenarios, expert agents prove or reject each scenario, and an independent triage agent decides which verified candidates become final findings. The human approves every phase transition.

## Quick Start

The easiest way to get started is to open this repository in a coding harness such as Codex, Claude Code, or Cursor and ask it:

```
Initiate a whitebox pentest on https://github.com/example/app.git
```

The harness should follow `AGENTS.md`: initialize a run, summarize each checkpoint, and ask before moving to the next phase.

**Manual CLI flow:** install the CLI from the repository root:

        python3 -m pip install -e .

This project is currently distributed as a workspace-first repository. The root-level `agents/`, `config/`, `templates/`, and writable `runs/` directories are runtime data, so the supported install model is a cloned checkout with an editable install. If you invoke `openhack` from outside the checkout, set `OPENHACK_ROOT` to the repository root.

**2. Walk through a run.** Execute one command at a time. Each command prints a checkpoint summary and the next command to run — review the output and approve before continuing.

        # Create a run from a fresh git checkout
        openhack init-run demo https://github.com/example/app.git --run-id demo-001

        # Choose expert scope, then run reconnaissance
        openhack run-recon demo demo-001 --all-agents

        # Or scope the run to selected experts
        openhack run-recon demo demo-001 \
        --expert injection \
        --expert broken-access-control

        # Optional: enrich recon with bundled Semgrep rules
        openhack run-recon demo demo-001 --all-agents --semgrep

        # Generate the scenario backlog from routing units in one approved routing phase
        openhack create-scenarios demo demo-001

        # After the router answers the prompt, record the selected backlog
        openhack record-scenario-backlog demo demo-001 router-result.json

        # Render a scenario prompt for an expert agent
        openhack render-scenario-prompt demo demo-001 S001

        # Record an expert's verified result (materializes finding-candidates/)
        openhack record-scenario-result demo demo-001 S001 result.json

        # Render and record independent triage before final findings are created
        openhack render-finding-triage-prompt demo demo-001 S001-F001
        openhack record-finding-triage demo demo-001 S001-F001 triage-result.json

        # Resume or hand off: prints current counts + next checkpoint
        openhack summarize-run demo demo-001

> **Resuming a run?** Run `openhack summarize-run <target> <run-id>` to see counts and the next checkpoint command without executing anything.

Set `OPENHACK_ROOT` to this workspace path if you invoke the CLI from outside the repo root. See [`docs/QUICKSTART.md`](https://github.com/hadriansecurity/OpenHack/blob/main/docs/QUICKSTART.md) for more detail.
