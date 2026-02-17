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

# MCP Apps

- [MCP Apps - Bringing UI Capabilities To MCP Clients](https://blog.modelcontextprotocol.io/posts/2026-01-26-mcp-apps/)

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
- [Stop Converting REST APIs to MCP](https://www.jlowin.dev/blog/stop-converting-rest-apis-to-mcp): "I’ve come to realize that it can paper over a fundamental problem: an API built for a human will poison your AI agent. In practice, LLMs achieve significantly better performance with well-designed, tailored MCP servers than with auto-converted ones. The reason goes right to the core of how agents and humans interact with software, and how we design technical products for each consumer. A good REST API is generous. It is a model of discoverability and atomicity. It offers hundreds of single-serving endpoints, flexible parameters, and endless options because programmatic iteration is cheap. Human developers are brilliant at doing discovery once and subseqeuently ignoring what’s irrelevant, and their code can chain together atomic calls — get_user(), then get_orders(user_id), then get_order_details(order_id) — with quick network hops to achieve complex outcomes. For them, more choice is good. We use properties like idempotency, pagination, and caching to make our APIs more efficient in the face of relatively deterministic access patterns. But when you hand this interface to an agent, you’re not empowering it; you’re drowning it. "

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

### Another MCP server example

Setup
```
npm init -y
npm install @modelcontextprotocol/sdk
```

Code
```
import { createServer } from '@modelcontextprotocol/sdk/server/index.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { CallToolRequestSchema, ListToolsRequestSchema } from '@modelcontextprotocol/sdk/types.js';

// Create the MCP server
const server = createServer({
  name: 'ollama-mcp-server',
  version: '1.0.0',
});

// 1. Define the tool (What it does)
server.setRequestHandler(ListToolsRequestSchema, async () => {
  return {
    tools: [
      {
        name: "add_numbers",
        description: "Adds two numbers together and returns the result",
        inputSchema: {
          type: "object",
          properties: {
            a: { type: "number", description: "The first number" },
            b: { type: "number", description: "The second number" }
          },
          required: ["a", "b"]
        }
      }
    ]
  };
});

// 2. Handle the tool call (How it works)
server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args } = request.params;

  if (name === "add_numbers") {
    const result = args.a + args.b;
    return {
      content: [
        {
          type: "text",
          text: `The sum of ${args.a} and ${args.b} is ${result}.`
        }
      ]
    };
  }

  throw new Error(`Unknown tool: ${name}`);
});

// 3. Start the server
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
}

main().catch((err) => {
  console.error("Server error:", err);
  process.exit(1);
});
```

**Configuring it for use with Ollama**: Find your config file. Mac/Linux: `~/.ollama/config.json`; Windows: `%APPDATA%\Ollama\config.json`. Add the tool to the config: Open the config file (create it if it doesn't exist) and add a `tools` section. The value of `handler` must be the *absolute path* to your `server.js` file.

    ```json
    {
      "tools": [
        {
          "name": "add_numbers",
          "description": "Adds two numbers together",
          "handler": "/full/path/to/your/project/server.js"
        }
      ]
    }
    ```

Once you have saved the configuration file, you must restart Ollama for the changes to take effect.

Start a conversation with a model (e.g., `ollama run llama3`) and ask it to use your tool.

```text
>>> Can you add 50 and 25 for me?
```

If successful, the model should invoke your MCP tool, and you should see output indicating the tool ran and the result (75).

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

