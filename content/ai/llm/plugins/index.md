title=Agent Plugins
tags=ai, llm, agent
summary=A portable package format for reusable components that extend AI agents.
~~~~~~

[Website](https://agent-plugins.org/) | [Specification (GitHub)](https://github.com/agentplugins/agent-plugins-spec)

Agent Plugins is an open, vendor-neutral standard for packaging reusable components into portable plugins. Its version 1.0.0 specification defines a shared format for [Agent Skills](https://agentskills.io/specification) and [MCP servers](https://modelcontextprotocol.io/specification) that compatible clients can discover and load consistently.

## [Why Agent Plugins?](https://agent-plugins.org/#why-agent-plugins)

AI agent clients have developed their own plugin formats, even when plugins contain the same underlying components. Authors must rearrange or duplicate those components for each client, so a plugin packaged for one client may need adaptation before another can use it.

Agent Plugins defines a small interoperability floor for the parts that can be portable across clients. Shared components can use one predictable structure, while distribution, installation, permissions, user experience, and client-specific capabilities remain under each client's control.

## [The portable package](https://agent-plugins.org/#the-portable-package)

An Agent Plugin is a directory with a required manifest and optional components in fixed locations:

```
my-plugin/
├── plugin.json
├── skills/
│   └── summarize/
│       ├── SKILL.md
│       ├── scripts/
│       └── references/
├── mcp.json
└── com.example.client/
    └── hooks/
```

-   `plugin.json` identifies the plugin and the Agent Plugins version it targets.
-   `skills/` contains Agent Skills in the format defined by the Agent Skills specification.
-   `mcp.json` describes stdio, Streamable HTTP, or legacy HTTP+SSE MCP servers.
-   Reverse-domain extension namespaces let individual clients add behavior without changing the portable core.

## [Open development](https://agent-plugins.org/#open-development)

Agent Plugins is openly licensed and developed in public. Its initial Technical Steering Committee includes Core Maintainers from Amazon, Cursor, Microsoft, OpenAI, and Vercel.

Proposals and technical decisions are public, and participation is open to the broader ecosystem. Ideas for new features and material changes begin in [GitHub Discussions](https://github.com/agentplugins/agent-plugins-spec/discussions), where proposals can establish a concrete portability need and implementer support.

Explore the specification, schemas, governance, and contribution process in the [Agent Plugins specification repository](https://github.com/agentplugins/agent-plugins-spec).