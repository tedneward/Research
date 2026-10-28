title=OpenWiki
tags=tool, ai, llm, coding
summary=A CLI that writes and maintains agent documentation for your codebase.
~~~~~~

[Source](https://github.com/langchain-ai/openwiki)

OpenWiki turns your codebase and knowledge sources into a linked Markdown wiki that you own. Your coding agent can use it to understand a repository, answer questions, and find context across related projects. You can read the same pages or explore them as an interactive graph.

OpenWiki can now create a general-purpose brain for your agents. It connects to sources like Gmail, Notion, git repos, Twitter/X, Hacker News, and web search, then turns that information into a local wiki your agents can use as memory. It can also keep that wiki updated automatically, so your agents have access to fresh context without you manually writing or maintaining it.

The goal is your agents should know the important context about your work, projects, interests, and research without forcing you to track and copy all of that context into every session.

For repository wikis, OpenWiki tracks facts back to source evidence so updates can focus on what changed. Start inside your coding agent, or use the standalone CLI for repository docs, personal knowledge, and scheduled updates.

## Getting Started
The easiest way to get started is inside the coding agent you already use. OpenWiki uses that agent's authenticated model session and repository tools, so there is no separate model provider to configure.

### 1. Install OpenWiki

You'll need [Node.js 22.22.0 or newer](https://nodejs.org/).

npm install -g openwiki

Copy code to clipboard

If you use Pi, install the package through Pi in step 2 instead; a separate global OpenWiki installation is not required.

### 2. Connect your coding agent

Choose the integration for your agent:

| Coding agent | Install |
| --- | --- |
| Codex | `openwiki integrations install codex` |
| Claude Code | `openwiki integrations install claude` |
| OpenCode | `openwiki integrations install opencode` |
| Cursor | `openwiki integrations install cursor` |
| IBM Bob / Bob Shell | `openwiki integrations install bob` |
| Kiro | `openwiki integrations install kiro` |
| Oh My Pi | `openwiki integrations install omp` |
| Antigravity | `openwiki integrations install antigravity` |
| GitHub Copilot CLI | `openwiki integrations install copilot` |
| Pi  | `pi install npm:openwiki` |

### 3. Create your wiki

Restart your coding agent, open a repository, and ask:

```
Initialize this repository's OpenWiki from the current source and tests.
```

Your agent researches the repository and writes a linked wiki in `openwiki/`. OpenWiki tracks its source evidence and saves progress as each page completes.

## Reading

### Articles

* [Introducing OpenWiki Brains, general-purpose wiki memory for agents](https://www.langchain.com/blog/introducing-openwiki-brains-general-purpose-wiki-memory-for-agents)

