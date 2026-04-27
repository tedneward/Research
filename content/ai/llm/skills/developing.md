title=Developing Agent Skills
tags=ai, model, agent, skills
summary=A collection of notes and links on how to build effective SKILL.md files.
~~~~~~

Skills are instruction bundles that tell the agent how to perform specific tasks. They are not executable code by default.

### Skill Structure

```
skill-name/
├── SKILL.md          # Required: Instructions and metadata
├── scripts/          # Optional: Helper scripts
├── templates/        # Optional: Document templates
└── resources/        # Optional: Reference files
```

### Basic SKILL.md Template

```markdown
---
name: my-skill-name
description: A clear description of what this skill does.
---

# My Skill Name

Detailed description of the skill's purpose.

## When to Use This Skill

- Use case 1
- Use case 2

## Instructions

[Detailed instructions for the agent on how to execute this skill]

## Examples

[Real-world examples]
```

### MCP Server Example (Python)

For skills that need to connect to external data sources, you can create an MCP server:

```bash
pip install fastmcp
```

server.py:
```python
from fastmcp import FastMCP

mcp = FastMCP("My Server")

@mcp.tool()
def hello_world(name: str = "World") -> str:
    """A simple tool that says hello."""
    return f"Hello, {name}!"

if __name__ == "__main__":
    mcp.run()
```

As the ecosystem grows, consistent quality helps agents discover and use skills reliably. The following references and criteria keep the bar high.

### The Problems

From Andrej's post:

> "The models make wrong assumptions on your behalf and just run along with them without checking. They don't manage their confusion, don't seek clarifications, don't surface inconsistencies, don't present tradeoffs, don't push back when they should."

> "They really like to overcomplicate code and APIs, bloat abstractions, don't clean up dead code... implement a bloated construction over 1000 lines when 100 would do."

> "They still sometimes change/remove comments and code they don't sufficiently understand as side effects, even if orthogonal to the task."

### Quality Criteria

| Area | Guideline |
| --- | --- |
| **Description** | Write in third person. State _what_ the skill does and _when_ to use it. Use specific keywords agents can match on (e.g., "PostgreSQL migration" not "database stuff"). |
| **Progressive disclosure** | Keep top-level metadata under ~100 tokens. Skill body should stay below 500 lines. Load resources (large docs, schemas) on demand, not inline. |
| **No absolute paths** | Never hard-code machine-specific paths like `/Users/alice/`. Use relative paths or well-known variables (`$HOME`, `$PROJECT_ROOT`). |
| **Scoped tools** | Request only the tools the skill actually needs. Avoid blanket `"tools": ["*"]`. Declare tool dependencies explicitly. |

Four principles in one file that directly address these issues:

| Principle | Addresses |
| --- | --- |
| **Think Before Coding** | Wrong assumptions, hidden confusion, missing tradeoffs |
| **Simplicity First** | Overcomplication, bloated abstractions |
| **Surgical Changes** | Orthogonal edits, touching code you shouldn't |
| **Goal-Driven Execution** | Leverage through tests-first, verifiable success criteria |

# Reading

## Tutorials and Guides

### Claude and Anthropic
- [How to create custom skills](https://support.claude.com/en/articles/12512198-creating-custom-skills) - Step-by-step authoring

### How do I create my first Agent Skill?

1. Create a `SKILL.md` file with a name and description at the top
2. Write clear, step-by-step instructions in the file
3. Put it in your `.github/skills/` or `.claude/skills/` folder
4. Test it out!

Full guide: [How to create custom skills](https://support.claude.com/en/articles/12512198-creating-custom-skills)
