title=AI Native
tags=ai, llm, reading
summary=Notes and links on the concept of being "AI-Native" and "AI-Native Development".
~~~~~~

## Course

[CS146S: The Modern Software Developer](https://themodernsoftware.dev/) (Stanford University): This course examines the emerging practices and technologies behind AI-native software development, including MCP, agent skills, spec-driven development, loop engineering, and the software factory. Students will learn how to provide agents with the right context and capabilities, translate product requirements into executable specifications, and design iterative workflows in which humans and agents plan, build, evaluate, and improve software together. Through hands-on assignments, projects, and talks from practitioners building the next generation of developer tools, students will explore both the capabilities and limitations of current coding agents. By the end of the course, students will be able to design effective agent-driven workflows, compose tools and skills into reliable development systems, and apply software-factory principles to building and evolving software at greater speed and scale.

Course Syllabus

### Week 1: The Internals of Coding Agents

Topics

-   •What an LLM actually is, and what the agent loop looks like under the hood
-   •The core tool set (read, write, edit, bash) and how tasks flow through it
-   •How production coding agents structure their system prompts and tool definitions

Reading

-   •[Building a Coding Agent](https://youtube.com/watch?v=s7ZzkdvCMDY)
-   •[Lessons from Building Claude Code](https://x.com/trq212/status/2027463795355095314?s=20)
-   •[Dive into Claude Code](https://arxiv.org/pdf/2604.14228)

**Tue 9/22:** Course intro + build Claude Code in 200 lines - [Slides](https://docs.google.com/presentation/d/1uztIhjHAG6O_9QOD1N_3wdhwhABml1fANXEN2dGwdbg/edit?usp=drive_link) - [Completed code](https://drive.google.com/file/d/1DxKa_autBOu9s8DvItodgUAwH_pBg7aR/view?usp=drive_link)

**Thu 9/24:** How state-of-the-art coding agents are designed: deep dive into the system prompts that define the agent - [Slides](https://docs.google.com/presentation/d/1RZu-p18Qybbgm8WVP2RH04ESc4Bn377B-T9j5-TBFdQ/edit?usp=drive_link) - [Prompts](https://drive.google.com/drive/folders/1c6_atVW0RrqEBWsNIscG2KNwCiuPxWQG?usp=drive_link) - [Transcript](https://themodernsoftware.dev/materials/9-24-26-transcript.txt)

### Week 2: Advanced Context Engineering

Topics

-   •Advanced prompting techniques and when each applies
-   •RePPIT (Research, Propose, Plan, Implement, Test) and spec-driven development
-   •MCP fundamentals: servers, clients, tools, and transport
-   •Designing tools for agent ergonomics

Reading

-   •[The Context Tax: When to Compact](https://langwatch.ai/blog/context-tax-when-to-compact)
-   •[OpenSpec](https://openspec.dev/)
-   •[Superpowers](https://github.com/obra/superpowers)
-   •[Enterprise MCP (Cloudflare)](https://blog.cloudflare.com/enterprise-mcp)

**Tue 9/29:** Advanced prompting + agentic dev frameworks (RePPIT, spec-driven development) - [Slides](https://docs.google.com/presentation/d/17brqoQQZHF3K82WgYaV6urAV3Q7iIwyGUBYRvSuY8QY/edit?usp=sharing) - [Transcript](https://themodernsoftware.dev/materials/9-29-26-transcript.txt)

**Thu 10/1:** Full introduction to MCP and tool-calling (theory, setup, and advanced tool design) - [Slides](https://docs.google.com/presentation/d/1q2cB1a7P4XsR0UJqE0RmtZFeggNOLdPaSnOpbBVewHA/edit?usp=sharing) - [Skills](https://drive.google.com/drive/folders/1aEHCXzZKkokuA4AYjD_2i6OrcM5iQosW?usp=drive_link) - [Transcript](https://themodernsoftware.dev/materials/10-1-26-transcript.txt)

### Week 3: Agent Skills and CLI

Topics

-   •What skills are and how SKILL.md + scripts encode a workflow
-   •Web skills and extending agent capability beyond the repo
-   •Working effectively from the CLI

Reading

-   •[pstack](https://github.com/cursor/plugins/tree/main/pstack)
-   •[Matt Pocock's Skills](https://github.com/mattpocock/skills)
-   •[browse.sh](https://browse.sh/)

**Tue 10/6:** All about agent skills (including web skills) - [Slides](https://docs.google.com/presentation/d/15bPu5c-i8D8McTh6l7SpUPk2n9M_Y-CdDQLfyzL8RD8/edit?usp=sharing)

**Thu 10/8:** [Guest: Lee Robinson (Model Behavior @ SpaceX)](https://leerob.com/) - [Slides](https://drive.google.com/file/d/1b8WiBk_lcB3ue-jZMLijSUMLj6SDiF6Z/view?usp=drive_link)

### Week 4: Customizing Your Agent and Repository

Topics

-   •CLAUDE.md and AGENTS.md: what to put where
-   •Hooks for lint gates, test runs, and guardrails
-   •Subagent patterns (planner / implementer / reviewer)

Reading

-   •[I Still Prefer MCP Over Skills](https://david.coffee/i-still-prefer-mcp-over-skills)
-   •[AGENTS.md (Factory Docs)](https://docs.factory.com/harness/agents-md)
-   •[Steering Claude Code: Skills, Hooks, Rules, Subagents, and More](https://claude.com/resources/articles/steering-claude-code-skills-hooks-rules-subagents-and-more)
-   •[Writing a Good CLAUDE.md](https://hlyr.dev/blog/writing-a-good-claude-md)

**Tue 10/13:** Customizing your agentic setup (CLAUDE.md, AGENTS.md, hooks) - [Slides](https://docs.google.com/presentation/d/152VaUifBKH4T6hxd6fCKKM9kJTSAuBmkF8zSYwuTYAo/edit?usp=sharing)

**Thu 10/15:** [Guest: Boris Cherny (Creator of Claude Code @ Anthropic)](https://borischerny.com/)

### Week 5: Agent-Ready Codebases

Topics

-   •What makes a repo agent-ready: structure, docs, tests, and checks
-   •Scoring and auditing readiness
-   •Common gaps that block agents in real repos

Reading

-   •[Making Codebases Agent Ready](https://www.youtube.com/watch?v=ShuJ_CN6zr4)
-   •[Making Ergonomic Repositories](https://x.com/trybasis/status/2056881705269580023)

**Tue 10/20:** Agent readiness in your repos (structure, docs, and checks that make repos agent-friendly) - [Slides](https://docs.google.com/presentation/d/1yCxocmUrGIN7IrC42WB6NW08PtYYFLe1ombDj3Ay6_8/edit?usp=drive_link)

**Thu 10/22:** [Guest: Eno Reyes (CTO @ Factory)](https://www.linkedin.com/in/enoreyes)

### Week 6: Agentic Code Review

Topics

-   •What AI review catches well, and what it misses
-   •Review architectures and custom rules
-   •Fitting AI review into a team's PR workflow

Reading

-   •[Layered Code Review and Risk-Based Human Oversight](https://x.com/addyosmani/status/2114604912520921136)
-   •[Coordinating Specialist Review Agents at Scale](https://blog.cloudflare.com/ai-code-review)
-   •[Beyond the Diff: Context, Testing, and Model Selection](https://greptile.com/blog/how-to-build-a-code-review-agent)

**Tue 10/27:** Agentic code review: best practices and architectures - [Slides](https://docs.google.com/presentation/d/1u8WYtFj0O9yc4H4JX9D4URYKhDzvrAGKLzn38DXSrak/edit?usp=drive_link)

**Thu 10/29:** [Guest: Silas Alberti (Chief Research Officer @ Cognition)](https://sil.as/)

### Week 7: Security

Topics

-   •SAST / SCA, dependency and secret-leak vulnerabilities
-   •Prompt injection and agent-specific attack surfaces
-   •Agent-assisted triage and remediation

**Tue 11/3:** Security in AI codebases

**Thu 11/5:** [Guest: Isaac Evans (CEO @ Semgrep)](https://www.linkedin.com/in/isaacevans)

### Week 8: Background Agents

Topics

-   •Async, cloud-delegated agents
-   •Managing fleets of parallel agents
-   •Issue-to-PR pipelines and triggers (Slack, Linear, GitHub)

**Tue 11/10:** Background agents: launching tasks asynchronously

**Thu 11/12:** [Guest: Rajesh Bhatia (Senior Director @ Cloudflare)](https://www.linkedin.com/in/rajeshbh)

### Week 9: Building an AI-Native Team

Topics

-   •MCP portals and centralized, permissioned tool access
-   •LLM gateways, model routing, and cost optimization
-   •Org-wide adoption patterns

**Tue 11/17:** [Guest: Elad Gil (Investor @ Gil Capital)](https://eladgil.com/)

**Thu 11/19:** [Guest: Amjad Masad (CEO @ Replit)](https://amasad.me/)

### Week 10: The Software Factory + The Future

Topics

-   •Self-running, self-improving software systems
-   •Running and securing agents post-deployment
-   •Where AI software engineering goes next

**Tue 12/1:** Coding agents in big teams (MCP portals, LLM gateways, org patterns, cost optimization, and model routing)

**Thu 12/3:** The Software Factory: self-running, self-improving software systems

