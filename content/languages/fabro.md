title=Fabro
tags=language, ai, orchestration, native
summary=AI-first language that frames the coding-agent harness as a graph-execution problem.
~~~~~~

[Website](https://fabro.sh) | [Source](https://github.com/fabro-sh/fabro)

> Workflow harness for coding agents. .fabro files are Graphviz digraphs whose node shapes pick handlers; a CSS-like stylesheet routes each step to a model. Single Rust binary.

**Camp:** Orchestration
**Author:** Bryan Helmkamp (Qlty Software)
**Implementation language:** Rust
**Compilation target:** Native binary (Rust workspace, embedded React SPA)
**Licence:** MIT
**First seen:** March 2026
**Maturity:** working compiler

**Agent tooling:**
- AGENTS.md (CLAUDE.md as symlink)
- Agent Skills format (~/.fabro/skills/, project skills/)
- MCP server with 7 fabro_run_* tools
- install.md (agent-targeted installer prompt)
- fabro graph (renders DOT workflows to SVG)

## Key idea

Fabro frames the coding-agent harness as a graph-execution problem. A workflow is a `.fabro` file containing a Graphviz `digraph`; Graphviz shapes map directly to handler types (`Mdiamond` start, `Msquare` exit, `box` agent step, `parallelogram` shell command, `diamond` conditional, `hexagon` human gate, `component` parallel fan-out). Edge labels carry a condition grammar (`=`, `!=`, `>`, `<`, `contains`, `matches`, `&&`, `||`, `!`). A second authored notation -- a CSS-like `model_stylesheet` -- assigns model, provider, and reasoning_effort per node by selector (`*` &lt; shape &lt; `.class` &lt; `#id`). The runtime ships as a single Rust binary that checkpoints to git between stages and runs agent steps in local, Docker, SSH, or Daytona sandboxes.

## Thesis

Fabro starts from the observation that agent coding harnesses spend most of their time in two failure modes: either a human babysits each step in a REPL, or the agent returns a 50-file diff and the human has to reconstruct what happened. Fabro's diagnosis is that this is what you get when the harness has no authored artefact to point at. The fix is to make the process itself a source file. A `.fabro` workflow is a Graphviz `digraph`; the agent runs through it node by node; the file is diffable, reviewable, and version-controlled like any other code. Fabro lifts the term "dark software factory" from Dan Shapiro's January 2026 five-levels framework and commits to it as the project's framing: humans supervise specs, guardrails, and outcomes; the factory handles the steps in between.

<p class="pullquote">Define the process as a graph, let agents execute it, and intervene only where it matters.</p>

The distinctive move sits at the file level: every `.fabro` workflow is a Graphviz DOT digraph, and the Graphviz **shape** is the handler type. `Mdiamond` is the start node, `Msquare` is the exit, `box` is an agent step that runs a multi-turn LLM session with tool access, `parallelogram` is a shell command, `hexagon` is a human gate that pauses for approval, `diamond` is a conditional, and `component` is a parallel fan-out. Edges carry labels and a condition grammar (`=`, `!=`, `>`, `<`, `contains`, `matches`, `&&`, `||`, `!`) that reads against an `Outcome` and the run's shared context. A second authored notation, the `model_stylesheet`, is a CSS-like file that assigns `model`, `provider`, and `reasoning_effort` to nodes by selector with documented specificity (`*` zero, `shape` one, `.class` two, `#id` three). Where Boruna gates declared effects at the bytecode VM and chains them into evidence bundles, Fabro gates execution at the graph edge and commits the git checkpoint only after a stage succeeds.

## What it looks like

<div class="code-sample">
  <div class="code">
<pre><span class="kw">digraph</span> PlanImplement {
    <span class="kw">graph</span> [
        goal=<span class="str">"Plan, approve, implement"</span>
        model_stylesheet=<span class="str">"
            *        { model: claude-haiku-4-5; }
            .coding  { model: claude-sonnet-4-5;
                       reasoning_effort: high; }
            #review  { model: gpt-5.2; }
        "</span>
    ]
    <span class="cm">// nodes: the shape attribute selects the handler</span>
    start     [shape=<span class="ty">Mdiamond</span>, label=<span class="str">"Start"</span>]
    exit      [shape=<span class="ty">Msquare</span>,  label=<span class="str">"Exit"</span>]
    plan      [label=<span class="str">"Plan"</span>, prompt=<span class="str">"Write a plan."</span>]
    approve   [shape=<span class="ty">hexagon</span>, label=<span class="str">"Approve Plan"</span>]
    implement [label=<span class="str">"Implement"</span>, class=<span class="str">"coding"</span>]
    review    [label=<span class="str">"Review"</span>, class=<span class="str">"coding"</span>]
    <span class="cm">// edges: labels are options at gates; conditions gate flow</span>
    start -&gt; plan -&gt; approve
    approve -&gt; implement [label=<span class="str">"[A] Approve"</span>,
                          condition=<span class="str">"outcome=succeeded"</span>]
    approve -&gt; plan      [label=<span class="str">"[R] Revise"</span>]
    implement -&gt; review -&gt; exit
}</pre>
  </div>
  <p class="caption">A four-stage workflow with a human gate. <code>hexagon</code> nodes pause for input;
    outgoing-edge labels become the selectable options (<code>[A]</code> and <code>[R]</code> are
    accelerator keys). The stylesheet routes the cheap default model to most nodes and reserves
    Sonnet for the coding stages.</p>
</div>

## Distinctive moves

- **Shape-as-handler.** The Graphviz shape attribute on a node selects the handler. `box` is an agent; `parallelogram` runs a script; `hexagon` is a human gate; `component` fans out. The DOT file is not a transport; it is the source language.
- **Model stylesheet as second notation.** Routing a node to a different model, provider, or reasoning effort is a CSS rule, not a configuration change. `*` (universal) yields to `shape`, which yields to `.class`, which yields to `#id`. Explicit per-node attributes win over any rule.
- **Git checkpointing between stages.** Each stage commits its execution state, prompts, responses, and file changes to a meta branch (`fabro/meta/*`). Resume, revert, and fork from any point use git as the durable store.
- **Single Rust binary.** A 47-crate workspace compiles to one executable with an embedded React SPA. No Python, Node, or Docker is required to run the binary itself; Docker, SSH, and Daytona are optional sandbox providers for the agent steps it launches.
- **Plan-implement-verify as a graph primitive.** Conditional edges, retry policies on nodes, `goal_gate=true` attributes, and `wait_all` / `first_success` parallel-join policies turn LLM-as-judge and lint-driven fix loops into a few extra nodes rather than harness plumbing.
- **MCP both ways.** Fabro consumes MCP tool servers for agent steps and exposes itself as an MCP server with seven `fabro_run_*` tools (`create`, `search`, `get`, `interact`, `gather`, `pair`, `events`) so coding agents can drive runs from inside another harness.

## Maturity

The workspace is 47 Rust crates and roughly 392k lines of code, with 96 release tags (most nightlies) and a daily changelog that runs from late February through mid-June 2026 at the time of cataloguing. The repository reports 1,221 stars and 133 forks; the GitHub contributors list shows sixteen names, of which Bryan Helmkamp authored 3,624 of 3,840 commits and three release bot accounts contributed roughly 5 percent of the remaining traffic. The LICENSE is MIT and the copyright is held by Qlty Software Inc., Helmkamp's company; the project is hosted under its own `fabro-sh` GitHub organisation rather than `qltysh`. Three observations the editorial frame should surface honestly. First, documentation polish runs ahead of demonstrable adoption: the marketing site, full OpenAPI spec, embedded web UI, and feature breadth are unusual for a project four months from first public push. Second, an `evals/swe-bench` directory in the repo ships a self-published SWE-Bench-Lite scoreboard (GPT-5.4 at 65.7% resolve rate over 300 instances; Sonnet 4.6 at 57.7%; Haiku 4.5 baseline at 54.0%); no third-party reproduction has yet been published. Third, the graph-based-process pattern itself is not novel — LangGraph and other harnesses have been there. Fabro's specific bet is on `.fabro`-as-DOT-file plus CSS-stylesheet model routing plus single-Rust-binary delivery as a combination, rather than on the graph idea in isolation.

The bet is that "expert engineers running small teams" -- explicitly the target in the docs and tagline -- will accept a structured workflow file as the price of disengagement time, and that the dark-factory framing will pull verification and human-in-the-loop into the same surface that defines the agent steps.

## Agent tooling

The agent-facing surface is unusually broad. `AGENTS.md` (with `CLAUDE.md` symlinked to it) is 17 KB and orients agents working in the repository. Fabro implements the open [Agent Skills](https://agentskills.io/) format, discovering `SKILL.md` files from `~/.fabro/skills/`, `{git_root}/.fabro/skills/`, and `{git_root}/skills/`; skills are exposed both as a `/skill-name` slash syntax and a `use_skill` tool added to every agent step. An earlier `fabro skill install` command bundled a `fabro-create-workflow` skill for Claude Code and Codex; that command was removed in April 2026 when skills moved to user-supplied directories. The CLI's `fabro mcp init` configures Claude Code, Cursor, or Windsurf to launch Fabro as an MCP server exposing seven run-management tools (`fabro_run_create`, `_search`, `_get`, `_interact`, `_gather`, `_pair`, `_events`); a workflow can also opt agent steps into the same tool catalogue with `[run.agent] fabro_tools = true` to spawn structured child runs. `fabro graph` renders any workflow to SVG. The installer itself is agent-targeted: piping `https://fabro.sh/install.md` into Claude Code or Codex runs an objective-and-steps prompt that drives the install, the wizard, and the server restart end-to-end.

## Design DNA

- **[Boruna](https://agentlanguages.dev/languages/boruna.md)** *(Orchestration)* — Closest editorial sibling. Both ship a deterministic execution harness over a declarative workflow notation. Boruna's unit is <code>.ax</code> source in a custom syntax run by a bytecode VM with hash-chained evidence bundles; Fabro's unit is <code>.fabro</code> files in a Graphviz DOT dialect run by a Rust orchestrator with git-commit checkpoints. Same camp, different substrates.
- **[Lumen](https://agentlanguages.dev/languages/lumen.md)** *(Orchestration)* — Both treat the workflow file as the unit of authorship. Lumen ships markdown-native <code>.lm.md</code> with algebraic effects, grants, and a compile-time <code>@deterministic</code> annotation; Fabro ships <code>.fabro</code> as a Graphviz DOT subset with a CSS-like stylesheet routing nodes to models. Different surface format, same diagnosis.
- **[Marsha](https://agentlanguages.dev/languages/marsha.md)** *(Orchestration)* — Two-generation contrast on harness construction. Marsha (2023) puts the LLM at the back of a Python compiler driven by an English-and-examples <code>.mrsh</code> file; Fabro (2026) puts the LLM at individual graph nodes constrained by surrounding verification stages and human gates. Marsha is alpha and dormant; Fabro is actively developed under a company copyright.
- **[Plasm](https://agentlanguages.dev/languages/plasm.md)** *(Orchestration)* — Both split plan from live execution and ship MCP as an agent surface. Plasm dry-runs path-expression programs against typed API catalogs; Fabro dry-runs workflow graphs and only commits the git checkpoint after a stage succeeds. Plasm types the API edges; Fabro types the workflow edges.

## Timeline

- **Feb 2026** — First commit, Bryan Helmkamp (Qlty Software). Repository remains private through early development.
- **Mar 2026** — Public repository created on GitHub (<code>fabro-sh/fabro</code>) on 13 March 2026. Daily changelog begins on the docs site.
- **Mar 2026** — <code>fabro skill install</code> ships the bundled <code>fabro-create-workflow</code> SKILL.md for Claude Code and Codex. The command is removed in April when skills move to user-supplied directories.
- **Mar 2026** — Self-published SWE-Bench-Lite scoreboard committed to the repo. GPT-5.4 records 65.7% resolve rate over 300 instances at $2.40 average cost; Sonnet 4.6 records 57.7% at $0.18.
- **Apr 2026** — <code>.fabro</code> file extension finalised. Auto-merge, three new lifecycle hooks, and styled workflow graphs land in successive releases.
