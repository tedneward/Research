title=Model Control Protocol (MCP)
tags=ai, distribution, standard
summary=An open standard that enables developers to build secure, two-way connections between their data sources and AI-powered tools.
~~~~~~

[Website](https://modelcontextprotocol.io/introduction) | [Source](https://github.com/modelcontextprotocol) | [Specification](https://spec.modelcontextprotocol.io/) | [Docs](https://github.com/modelcontextprotocol/docs)

SDKs:

- [C#](https://github.com/modelcontextprotocol/csharp-sdk)
- [Java](https://github.com/modelcontextprotocol/java-sdk)
- [Kotlin](https://github.com/modelcontextprotocol/kotlin-sdk) and [Example](https://github.com/modelcontextprotocol/kotlin-sdk/tree/main/samples/kotlin-mcp-server)
- [Python](https://github.com/modelcontextprotocol/python-sdk)
- [TypeScript](https://github.com/modelcontextprotocol/typescript-sdk)

# Concepts

MCP servers can provide three main types of capabilities:

- Resources: File-like data that can be read by clients (like API responses or file contents)
- Tools: Functions that can be called by the LLM (with user approval)
- Prompts: Pre-written templates that help users accomplish specific tasks

Connection lifecycle:

1. Initialization

    1. Client sends initialize request with protocol version and capabilities
    2. Server responds with its protocol version and capabilities
    3. Client sends initialized notification as acknowledgment
    4. Normal message exchange begins
​
2. Message exchange: After initialization, the following patterns are supported:

    - Request-Response: Client or server sends requests, the other responds
    - Notifications: Either party sends one-way messages
​
3. Termination: Either party can terminate the connection:

    - Clean shutdown via close()
    - Transport disconnection
    - Error conditions

# Reading

- [MCP for Beginners](https://github.com/microsoft/mcp-for-beginners)
- [The Model Context Protocol (MCP): A Complete Guide Series](https://ai.plainenglish.io/the-model-context-protocol-mcp-a-complete-guide-series-db4fc70a5e5a) (Requires Medium account)
- [Anthropic intro](https://www.anthropic.com/news/model-context-protocol)
- [Quickstart: Server](https://modelcontextprotocol.io/quickstart/server): "we’ll build a simple MCP weather server and connect it to a host, Claude for Desktop. We’ll start with a basic setup, and then progress to more complex use cases. We’ll build a server that exposes two tools: `get-alerts` and `get-forecast`. Then we’ll connect the server to an MCP host (in this case, Claude for Desktop):"
- [An LLM does not need to understand MCP](https://hackteam.io/blog/your-llm-does-not-care-about-mcp/)

## Example Agents

- ["Tiny Agents: an MCP-powered agent in 50 lines of code"](https://huggingface.co/blog/tiny-agents)

## Example Servers

- ["Building a Simple MCP Server"](https://www.kdnuggets.com/building-a-simple-mcp-server)
- ["MCP within the Java ecosystem"](https://www.infoq.com/news/2025/05/mcp-within-java-ecosystem/)

### MCP Server implementation example

```
import asyncio
import mcp.types as types
from mcp.server import Server
from mcp.server.stdio import stdio_server

app = Server("example-server")

@app.list_resources()
async def list_resources() -> list[types.Resource]:
    return [
        types.Resource(
            uri="example://resource",
            name="Example Resource"
        )
    ]

async def main():
    async with stdio_server() as streams:
        await app.run(
            streams[0],
            streams[1],
            app.create_initialization_options()
        )

if __name__ == "__main__":
    asyncio.run(main())
```

### Reference implementations

These official reference servers demonstrate core MCP features and SDK usage:

#### Current reference servers

* **[Filesystem](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem)** - Secure file operations with configurable access controls
* **[Fetch](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)** - Web content fetching and conversion optimized for LLM usage
* **[Memory](https://github.com/modelcontextprotocol/servers/tree/main/src/memory)** - Knowledge graph-based persistent memory system
* **[Sequential Thinking](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)** - Dynamic problem-solving through thought sequences

#### Archived servers (historical reference)

⚠️ **Note**: The following servers have been moved to the [servers-archived repository](https://github.com/modelcontextprotocol/servers-archived) and are no longer actively maintained. They are provided for historical reference only.

##### Data and file systems

* **[PostgreSQL](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/postgres)** - Read-only database access with schema inspection capabilities
* **[SQLite](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/sqlite)** - Database interaction and business intelligence features
* **[Google Drive](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/gdrive)** - File access and search capabilities for Google Drive

##### Development tools

* **[Git](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/git)** - Tools to read, search, and manipulate Git repositories
* **[GitHub](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/github)** - Repository management, file operations, and GitHub API integration
* **[GitLab](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/gitlab)** - GitLab API integration enabling project management
* **[Sentry](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/sentry)** - Retrieving and analyzing issues from Sentry.io

##### Web and browser automation

* **[Brave Search](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/brave-search)** - Web and local search using Brave's Search API
* **[Puppeteer](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/puppeteer)** - Browser automation and web scraping capabilities

##### Productivity and communication

* **[Slack](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/slack)** - Channel management and messaging capabilities
* **[Google Maps](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/google-maps)** - Location services, directions, and place details

##### AI and specialized tools

* **[EverArt](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/everart)** - AI image generation using various models
* **[AWS KB Retrieval](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/aws-kb-retrieval-server)** - Retrieval from AWS Knowledge Base using Bedrock Agent Runtime

### Getting started

#### Using reference servers

TypeScript-based servers can be used directly with `npx`:

```bash
npx -y @modelcontextprotocol/server-memory
```

Python-based servers can be used with `uvx` (recommended) or `pip`:

```bash
# Using uvx
uvx mcp-server-git

# Using pip
pip install mcp-server-git
python -m mcp_server_git
```

#### Configuring with Claude

To use an MCP server with Claude, add it to your configuration:

```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    },
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/path/to/allowed/files"
      ]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_TOKEN>"
      }
    }
  }
}
```

