title=Agent Skills
tags=ai, agent, skills
summary=Thoughts and notes on the topic.
~~~~~~

[Website](https://agentskills.io/home) | [Source](https://github.com/agentskills/agentskills) | [Specification](https://agentskills.io/specification)

Think of **Agent Skills** as "how-to guides" for AI assistants. Instead of the AI needing to know everything upfront, skills let it learn new abilities on the fly, like giving someone a recipe card instead of making them memorize an entire cookbook.

Skills are simple text files (called `SKILL.md`) that teach an AI how to do specific tasks. When you ask the AI to do something, it finds the right skill, reads the instructions, and gets to work.

Agent Skills are folders of instructions, scripts, and resources that agents can discover and use to do things more accurately and efficiently.
​
#### Why Agent Skills?
Agents are increasingly capable, but often don’t have the context they need to do real work reliably. Skills solve this by giving agents access to procedural knowledge and company-, team-, and user-specific context they can load on demand. Agents with access to a set of skills can extend their capabilities based on the task they’re working on.

For skill authors: Build capabilities once and deploy them across multiple agent products.

For compatible agents: Support for skills lets end users give agents new capabilities out of the box.

For teams and enterprises: Capture organizational knowledge in portable, version-controlled packages.
​
#### What can Agent Skills enable?

* Domain expertise: Package specialized knowledge into reusable instructions, from legal review processes to data analysis pipelines.
* New capabilities: Give agents new capabilities (e.g. creating presentations, building MCP servers, analyzing datasets).
* Repeatable workflows: Turn multi-step tasks into consistent and auditable workflows.
* Interoperability: Reuse the same skill across different skills-compatible agent products.

## Collections

* [Claude Skills](https://claudemarketplaces.com/skills)
* [Anthropic Skills](https://github.com/anthropics/skills)

## Reading

### Articles, Blogs, Essays

* [How to build a Claude skill from scratch](https://writewithai.substack.com/p/how-to-build-a-claude-skill-from)
* [How I Do Content Engineering with Claude Code](https://ahrefs.com/blog/how-i-do-content-engineering-with-claude-code/)

### Support for agent skills

The following platforms have documented support for Agent Skills:

| Agent | Documentation |
|-------|---------------|
| Claude Code | [code.claude.com/docs/en/skills](https://code.claude.com/docs/en/skills) |
| Claude.ai | [support.claude.com](https://support.claude.com/en/articles/12512180-using-skills-in-claude) |
| Codex (OpenAI) | [developers.openai.com](https://developers.openai.com/codex/skills) |
| GitHub Copilot | [docs.github.com](https://docs.github.com/copilot/concepts/agents/about-agent-skills) |
| VS Code | [code.visualstudio.com](https://code.visualstudio.com/docs/copilot/customization/agent-skills) |

### How It Works

Skills load in three stages:

1. **Browse** - The AI sees a list of available skills (just names and short descriptions)
2. **Load** - When a skill is needed, the AI reads the full instructions
3. **Use** - The AI follows the instructions and accesses any helper files

### Why This Matters

- **Faster and lighter** - The AI only loads what it needs, when it needs it
- **Works everywhere** - Create a skill once, use it with any compatible AI tool
- **Easy to share** - Skills are just files you can copy, download, or share on GitHub

Skills are **instructions**, not code. The AI reads them like a human would read a guide, then follows the steps.

## Using Skills

### Using Skills in Claude.ai
1. Click the skill icon in your chat interface.
2. Add skills from the marketplace or upload custom skills.
3. Claude automatically activates relevant skills based on your task.

### Using Skills in Claude Code
Place the skill in your configuration directory:

```bash
mkdir -p ~/.claude/skills/
cp -r skill-name ~/.claude/skills/
```

Verify skill metadata:
```bash
head ~/.claude/skills/skill-name/SKILL.md
```

The skill loads automatically and activates when relevant.

### Using Skills in Codex

**Create a skill:**

Use the built-in `$skill-creator` skill in Codex. Describe what you want your skill to do, and Codex will bootstrap it for you.

If you install `$create-plan` (experimental) with `$skill-installer create-plan`, Codex will create a plan before writing files.

You can also create a skill manually by creating a folder with a `SKILL.md` file:

```markdown
---
name: skill-name
description: Description that helps Codex select the skill
metadata:
  short-description: Optional user-facing description
---

Skill instructions for the Codex agent to follow when using this skill.
```

**Install new skills:**

Download skills from GitHub using the `$skill-installer` skill:

```bash
$skill-installer linear
```

You can also prompt the installer to download skills from other repositories. After installing a skill, restart Codex to pick up new skills.

### Using Skills in VS Code

Skills are stored in directories with a `SKILL.md` file. VS Code supports skills in two locations:

- `.github/skills/` - Recommended location for all new skills
- `.claude/skills/` - Legacy location, also supported

**Create a skill:**

1. Create a `.github/skills` directory in your workspace
2. Create a subdirectory for your skill (e.g., `.github/skills/webapp-testing`)
3. Create a `SKILL.md` file with the following structure:

```markdown
---
name: skill-name
description: Description of what the skill does and when to use it
---

Your detailed instructions, guidelines, and examples go here...
```

### Using Skills in Copilot CLI

**Adding skills to your repository:**

1. Create a `.github/skills` directory (skills in `.claude/skills` are also supported)
2. Create a subdirectory for your skill (e.g., `.github/skills/webapp-testing`)
3. Create a `SKILL.md` file with your skill's instructions

**SKILL.md structure:**

- `name` (required): A unique lowercase identifier using hyphens for spaces
- `description` (required): What the skill does and when Copilot should use it
- `license` (optional): License that applies to this skill
- Markdown body with instructions, examples, and guidelines

**Example SKILL.md:**

```markdown
---
name: github-actions-failure-debugging
description: Guide for debugging failing GitHub Actions workflows.
---

To debug failing GitHub Actions workflows:

1. Use `list_workflow_runs` to look up recent workflow runs
2. Use `summarize_job_log_failures` to get an AI summary of failed jobs
3. Use `get_job_logs` for full detailed failure logs if needed
4. Try to reproduce the failure in your environment
5. Fix the failing build
```

When performing tasks, Copilot decides when to use skills based on your prompt and the skill's description. The `SKILL.md` file is injected into the agent's context.

### Using MCP Servers (Claude Desktop)

Edit your configuration file:
- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`

Example Configuration:
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/Users/username/Desktop"
      ]
    }
  }
}
```

### Skills Paths for AI Coding Assistants

| Tool | Project Path | Global Path | Official Docs |
| --- | --- | --- | --- |
| Antigravity | `.agent/skills/` | `~/.gemini/antigravity/skills/` | [Antigravity Skills](https://antigravity.google/docs/skills) |
| Claude Code | `.claude/skills/` | `~/.claude/skills/` | [Claude Code Skills](https://docs.anthropic.com/en/docs/claude-code/skills) |
| Codex | `.agents/skills/` | `~/.agents/skills/` | [Codex Skills](https://developers.openai.com/codex/skills) |
| Cursor | `.cursor/skills/` | `~/.cursor/skills/` | [Cursor Skills](https://cursor.com/docs/context/skills) |
| Gemini CLI | `.gemini/skills/` | `~/.gemini/skills/` | [Gemini CLI Skills](https://geminicli.com/docs/cli/skills/) |
| GitHub Copilot | `.github/skills/` | `~/.copilot/skills/` | [Copilot Skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) |
| OpenCode | `.opencode/skills/` | `~/.config/opencode/skills/` | [OpenCode Skills](https://opencode.ai/docs/skills) |
| Windsurf | `.windsurf/skills/` | `~/.codeium/windsurf/skills/` | [Windsurf Cascade Skills](https://docs.windsurf.com/windsurf/cascade/skills) |


# Collections

- [Andrej-Karpathy Skills](https://github.com/forrestchang/andrej-karpathy-skills)
- [Awesome-LLM-Skills](https://github.com/Prat011/awesome-llm-skills)
- [OfficialSkills (Website)](https://officialskills.sh/): Official skills from the dev teams of software vendors, plus handpicked & community-adopted skills. Powered from [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills), seems like?
- [skillcreatorai/Ai-Agent-Skills](https://github.com/skillcreatorai/Ai-Agent-Skills) - SkillCreator.ai collection with CLI installer
- [karanb192/awesome-claude-skills](https://github.com/karanb192/awesome-claude-skills) - 50+ verified skills for Claude Code and Claude.ai
- [shajith003/awesome-claude-skills](https://github.com/shajith003/awesome-claude-skills) - Skills for specialized capabilities
- [GuDaStudio/skills](https://github.com/GuDaStudio/skills) - Multi-agent collaboration skills
- [DougTrajano/pydantic-ai-skills](https://github.com/DougTrajano/pydantic-ai-skills) - Pydantic AI integration
- [OmidZamani/dspy-skills](https://github.com/OmidZamani/dspy-skills) - Skills for DSPy framework
- [ponderous-dustiness314/awesome-claude-skills](https://github.com/ponderous-dustiness314/awesome-claude-skills) - Document editing, data analysis, project management
- [hikanner/agent-skills](https://github.com/hikanner/agent-skills) - Curated Claude Agent Skills collection
- [gradion-ai/freeact-skills](https://github.com/gradion-ai/freeact-skills) - Freeact agent library skills
- [gotalab/skillport](https://github.com/gotalab/skillport) - Skills distribution via CLI or MCP
- [mhattingpete/claude-skills-marketplace](https://github.com/mhattingpete/claude-skills-marketplace) - Git, code review, and testing skills

---

# Reading

## Tutorials and Guides

### Claude and Anthropic
- [Using skills in Claude](https://support.claude.com/en/articles/12512180-using-skills-in-claude) - Official quick start guide
- [Claude Code Skills Documentation](https://code.claude.com/docs/en/skills) - Official reference

### GitHub Copilot
- [About Agent Skills](https://docs.github.com/copilot/concepts/agents/about-agent-skills) - GitHub documentation
- [VS Code Agent Skills](https://code.visualstudio.com/docs/copilot/customization/agent-skills) - VS Code integration

### Model Context Protocol (MCP)
- [MCP Official Documentation](https://modelcontextprotocol.io/) - The open standard
- [Build your first MCP Server](https://modelcontextprotocol.io/docs/first-server) - Python/TypeScript guide
- [MCP Server Examples](https://github.com/modelcontextprotocol/servers) - Official server implementations

### Microsoft

- [Agent Skills in .NET](https://devblogs.microsoft.com/agent-framework/agent-skills-in-net-three-ways-to-author-one-provider-to-run-them/)

## Community Resources

### LangChain Tools
- [Google Search](https://python.langchain.com/docs/integrations/tools/google_search/) - Wrapper around SerpApi
- [Wikipedia](https://python.langchain.com/docs/integrations/tools/wikipedia/) - Fetch summaries from Wikipedia
- [Python REPL](https://python.langchain.com/docs/integrations/tools/python/) - Execute Python code
- [Custom Tools Guide](https://python.langchain.com/docs/how_to/custom_tools/) - How to use the `@tool` decorator

## FAQ

### What are Agent Skills?

Agent Skills are instruction files that teach AI assistants how to do specific tasks. Think of them as "how-to guides" that the AI reads and follows. They only load when needed, so the AI stays fast and focused.

### How are Agent Skills different from fine-tuning?

Fine-tuning permanently changes how an AI thinks (expensive and hard to update). Agent Skills are just instruction files, you can update, swap, or share them anytime without touching the AI itself.

### What's the difference between Agent Skills and MCP?

They do different things and work great together:
- **Agent Skills** = teach the AI *how* to do something (workflows, best practices)
- **MCP** = help the AI *access* things (APIs, databases, external tools)

### Which AI tools support Agent Skills?

Currently supported: **Claude** (Claude.ai and Claude Code), **GitHub Copilot**, **VS Code**, and others. The list is growing as more tools adopt the standard.

### Do Agent Skills run code?

No. Skills are just text instructions, the AI reads and follows them like a recipe. If you need to run actual code, you'd use something like MCP servers alongside skills.

## References

The principles in these skills are derived from research and production experience at leading AI labs and framework developers.

- [Anthropic: Using skills in Claude](https://support.claude.com/en/articles/12512180-using-skills-in-claude)
- [Anthropic: Creating custom skills](https://support.claude.com/en/articles/12512198-creating-custom-skills)
- [Claude Code Skills Documentation](https://code.claude.com/docs/en/skills)
- [GitHub Copilot: About Agent Skills](https://docs.github.com/copilot/concepts/agents/about-agent-skills)
- [Model Context Protocol Documentation](https://modelcontextprotocol.io/)
