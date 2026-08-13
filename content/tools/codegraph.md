title=Codegraph
tags=tool, knowledge base, graph
summary=A local-first code-intelligence tool that turns any codebase into a queryable knowledge graph for AI coding agents.
~~~~~~

[Website](https://colbymchenry.github.io/codegraph/) | [Source](https://github.com/colbymchenry/codegraph)

## Getting Started
`npx @colbymchenry/codegraph`

### 1. Install the CLI
No Node.js required — one command grabs the right build for your OS:

```
# macOS / Linuxcurl -fsSL https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.sh | sh
# Windows (PowerShell)irm https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.ps1 | iex
```

Already have Node? `npm i -g @colbymchenry/codegraph` works on any version. CodeGraph bundles its own runtime — nothing to compile, no native build, works the same everywhere. The installer puts `codegraph` on your `PATH` but doesn’t change your current shell — open a new terminal before the next step.

### 2. Wire up your agent(s)
```
codegraph install
```

Auto-detects and configures Claude Code, Cursor, Codex CLI, opencode, Hermes Agent, Gemini CLI, Antigravity IDE, and Kiro — wiring the CodeGraph MCP server into each. This step connects your agents only; it does **not** index any code. (Shortcut: `npx @colbymchenry/codegraph` downloads and runs the installer in one go.)

### 3. Initialize each project
```
cd your-projectcodegraph init
```

`codegraph init` creates the local `.codegraph/` directory and builds the full graph in the same step — one command, done. Your agent will use CodeGraph tools automatically when a `.codegraph/` directory exists.

Once CodeGraph is installed, building and exploring a graph takes a few commands.

### Index a project
```
cd your-projectcodegraph init
```

`codegraph init` creates the `.codegraph/` directory and builds the full graph in the same step — one command, done. From there a native file watcher keeps the index in sync on every change, so you rarely need to rebuild by hand. When you do want to:

```
codegraph index          # full re-indexcodegraph sync           # incremental update of changed files
```

### Check it worked
```
codegraph status
```

This reports the node/edge/file counts, the active SQLite backend, and the journal mode — a quick health check that the index is ready.

### Run a query
Reach for `codegraph explore` first — a natural-language question or a bag of symbol names returns the relevant source plus the call paths between those symbols in a single shot (the same output the `codegraph_explore` tool gives your agent):

```
codegraph explore "how does login work"
```

For narrower, scriptable lookups there are focused commands:

```
codegraph query UserService          # find symbols by namecodegraph callers handleRequest      # what calls a functioncodegraph callees handleRequest      # what a function callscodegraph impact AuthMiddleware      # what a change would affect
```

These four each accept `--json` for machine-readable output. See the full [CLI reference](https://colbymchenry.github.io/codegraph/reference/cli/).

### Hand it to your agent
With a `.codegraph/` directory present and an agent configured, your agent uses the [MCP tools](https://colbymchenry.github.io/codegraph/reference/mcp-server/) automatically — no extra step.

