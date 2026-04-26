title=Agent Client Protocol (ACP)
tags=ai, distribution, protocol, agent
summary=Standardizes communication between code editors/IDEs and coding agents and is suitable for both local and remote scenarios.
~~~~~~

[Website](https://agentclientprotocol.com/get-started/introduction) | [Source](https://github.com/agentclientprotocol/agent-client-protocol)

ACP is suitable for both local and remote scenarios:

-   **Local agents** run as sub-processes of the code editor, communicating via JSON-RPC over stdio.
-   **Remote agents** can be hosted in the cloud or on separate infrastructure, communicating over HTTP or WebSocket

Full support for remote agents is a work in progress. We are actively collaborating with agentic platforms to ensure the protocol addresses the specific requirements of cloud-hosted and remote deployment scenarios.

The protocol re-uses the JSON representations used in MCP where possible, but includes custom types for useful agentic coding UX elements, like displaying diffs. The default format for user-readable text is Markdown, which allows enough flexibility to represent rich formatting without requiring that the code editor is capable of rendering HTML.

