title=Model Control Protocol (MCP)
tags=ai, distribution, standard
summary=An open standard that enables developers to build secure, two-way connections between their data sources and AI-powered tools.
~~~~~~

[Website](https://modelcontextprotocol.io/) | [Source](https://github.com/modelcontextprotocol) | [Specification](https://modelcontextprotocol.io/specification/2026-07-28) | [Docs](https://github.com/modelcontextprotocol/docs)

- [Build your first MCP Server](https://modelcontextprotocol.io/docs/first-server) - Python/TypeScript guide
- [MCP Server Examples](https://github.com/modelcontextprotocol/servers) - Official server implementations

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


---

# Specification (2026-07-28)

[Model Context Protocol](https://modelcontextprotocol.io) (MCP) is an open protocol that
enables seamless integration between LLM applications and external data sources and
tools. Whether you're building an AI-powered IDE, enhancing a chat interface, or creating
custom AI workflows, MCP provides a standardized way to connect LLMs with the context
they need.

This specification defines the authoritative protocol requirements, based on the
TypeScript schema in
[schema.ts](https://github.com/modelcontextprotocol/specification/blob/main/schema/2026-07-28/schema.ts).

For implementation guides and examples, visit
[modelcontextprotocol.io](https://modelcontextprotocol.io).

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD
NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be
interpreted as described in [BCP 14](https://datatracker.ietf.org/doc/html/bcp14)
\[[RFC2119](https://datatracker.ietf.org/doc/html/rfc2119)]
\[[RFC8174](https://datatracker.ietf.org/doc/html/rfc8174)] when, and only when, they
appear in all capitals, as shown here.

### Overview

MCP provides a standardized way for applications to:

* Share contextual information with language models
* Expose tools and capabilities to AI systems
* Build composable integrations and workflows

The protocol uses [JSON-RPC](https://www.jsonrpc.org/) 2.0 messages to establish
communication between:

* **Hosts**: LLM applications that initiate connections
* **Clients**: Connectors within the host application
* **Servers**: Services that provide context and capabilities

MCP takes some inspiration from the [Language Server Protocol](https://microsoft.github.io/language-server-protocol/), which standardizes how to add support for programming languages across a whole ecosystem of development tools. In a similar way, MCP standardizes how to integrate additional context and tools into the ecosystem of AI applications.

### Key Details

#### Base Protocol

* [JSON-RPC](https://www.jsonrpc.org/) message format
* Stateless, self-contained requests
* Per-request capability negotiation

#### Features

Servers offer any of the following features to clients:

* **Resources**: Context and data, for the user or the AI model to use
* **Prompts**: Templated messages and workflows for users
* **Tools**: Functions for the AI model to execute

Clients may offer the following features to servers:

* **Elicitation**: Server-initiated requests for additional information from users

#### Additional Utilities

* Configuration
* Progress tracking
* Cancellation
* Error reporting

#### Extensions

Beyond the core protocol, MCP defines optional [extensions](https://modelcontextprotocol.io/extensions/overview.md)
that add modular, specialized, or experimental functionality. Extensions
are always opt-in and require explicit support from both client and server, negotiated
during initialization. Notable extensions include:

* **[Tasks](https://modelcontextprotocol.io/extensions/tasks/overview.md)**: Asynchronous execution of long-running
  operations, with polling, mid-flight input, and durable handles
* **[Skills over MCP](https://modelcontextprotocol.io/community/working-groups/skills-over-mcp.md)**: Rich, structured
  instructions for agent workflows, discovered and consumed through MCP
* **[MCP Apps](https://modelcontextprotocol.io/extensions/apps/overview.md)**: Interactive UI elements (charts, forms,
  video players) rendered inline within conversations

### Security and Trust & Safety

The Model Context Protocol enables powerful capabilities through arbitrary data access
and code execution paths. With this power comes important security and trust
considerations that all implementors must carefully address.

#### Key Principles

1. **User Consent and Control**
   * Users must explicitly consent to and understand all data access and operations
   * Users must retain control over what data is shared and what actions are taken
   * Implementors should provide clear UIs for reviewing and authorizing activities

2. **Data Privacy**
   * Hosts must obtain explicit user consent before exposing user data to servers
   * Hosts must not transmit resource data elsewhere without user consent
   * User data should be protected with appropriate access controls

3. **Tool Safety**
   * Tools represent arbitrary code execution and must be treated with appropriate
     caution.
     * In particular, descriptions of tool behavior such as annotations should be
       considered untrusted, unless obtained from a trusted server.
   * Hosts must obtain explicit user consent before invoking any tool
   * Users should understand what each tool does before authorizing its use

#### Implementation Guidelines

While MCP itself cannot enforce these security principles at the protocol level,
implementors **SHOULD**:

1. Build robust consent and authorization flows into their applications
2. Provide clear documentation of security implications
3. Implement appropriate access controls and data protections
4. Follow security best practices in their integrations
5. Consider privacy implications in their feature designs

# Key Changes (since 2025-11-25)

## Major changes

1. Remove protocol-level sessions and the `Mcp-Session-Id` header from the Streamable HTTP transport. List endpoints (`tools/list`, `resources/list`, `prompts/list`) no longer vary per-connection. Servers that need cross-call state use explicit, server-minted handles passed as ordinary tool arguments ([SEP-2567](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2567)).

2. Make MCP stateless: remove the `initialize`/`notifications/initialized` handshake. Every request now carries its protocol version and client capabilities in `_meta` (`io.modelcontextprotocol/protocolVersion`, `io.modelcontextprotocol/clientCapabilities`). Clients SHOULD identify themselves on each request (`io.modelcontextprotocol/clientInfo`), and servers SHOULD identify themselves in each result's `_meta` (`io.modelcontextprotocol/serverInfo`). Version mismatches return `UnsupportedProtocolVersionError` ([SEP-2575](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2575)).

3. Add `server/discover`: servers MUST implement this RPC to advertise their supported protocol versions, capabilities, and identity. Clients MAY call it before any other request for up-front version selection, or use it as a backward-compatibility probe on STDIO ([SEP-2575](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2575)).

4. Replace the HTTP GET endpoint and `resources/subscribe`/`resources/unsubscribe` with `subscriptions/listen`: a single long-lived POST-response stream for opted-in server-to-client change notifications. Clients opt in to specific types (`toolsListChanged`, `promptsListChanged`, `resourcesListChanged`, `resourceSubscriptions`); the server acknowledges and tags notifications with `io.modelcontextprotocol/subscriptionId`. Request-scoped notifications such as `notifications/progress` and `notifications/message` continue to flow on the response stream of the request they relate to, not the `subscriptions/listen` stream ([SEP-2575](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2575)).

5. Remove `ping`, `logging/setLevel`, and `notifications/roots/list_changed`. Log level is now set per-request via `io.modelcontextprotocol/logLevel` in `_meta`; servers MUST NOT emit `notifications/message` for requests that did not include this field ([SEP-2575](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2575)).

6. Move experimental tasks out of the core protocol and into an official extension (`io.modelcontextprotocol/tasks`). The redesigned extension replaces the blocking `tasks/result` method with polling via `tasks/get` and a new `tasks/update` for client-to-server input, removes `tasks/list`, and allows servers to return task handles unsolicited without per-request opt-in ([SEP-2663](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2663)).

7. Multi Round-Trip Requests (MRTR) pattern introduced which replaces the previous approach of sending server-initiated requests, such as `roots/list`, `sampling/createMessage`, or `elicitation/create`. Servers return an `InputRequiredResult` (`resultType: "input_required"`) whose `inputRequests` field carries the requests for the additional information needed to process the request. Clients respond with `inputResponses` on a retry of the original request providing the requested information. ([SEP-2322](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2322)).

8. All results now carry a required `resultType` field: `"complete"` for ordinary results and `"input_required"` for [multi round-trip request](https://modelcontextprotocol.io/specification/2026-07-28/basic/patterns/mrtr.md) interim results. Clients **MUST** treat results from earlier-protocol servers that omit the field as `"complete"` ([SEP-2322](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2322)).

9. Remove SSE stream resumability and message redelivery (the `Last-Event-ID` header and SSE event IDs) from the Streamable HTTP transport. A broken response stream loses the in-flight request; clients **MUST** re-issue it as a new request with a new request ID ([SEP-2575](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2575)).

## Minor changes

1. Add `extensions` field to `ClientCapabilities` and `ServerCapabilities` to support optional [extensions](https://modelcontextprotocol.io/docs/extensions/overview.md) beyond the core protocol.
2. Document OpenTelemetry trace context propagation conventions for `_meta` keys (`traceparent`, `tracestate`, `baggage`) ([SEP-414](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/414)).
3. Servers **SHOULD** return tools from `tools/list` in a deterministic order to enable client-side caching and improve LLM prompt cache hit rates.
4. Require standard MCP request headers (`Mcp-Method`, `Mcp-Name`) on Streamable HTTP POST requests, and add support for custom headers from tool parameters via `x-mcp-header` ([SEP-2243](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2243)).
5. Require `ttlMs` and `cacheScope` fields on results returned by `tools/list`, `prompts/list`, `resources/list`, `resources/read`, and `resources/templates/list` via a new `CacheableResult` interface. `ttlMs` is a freshness hint (in milliseconds) allowing clients to cache responses and reduce polling; `cacheScope` (`"public"` or `"private"`) controls whether shared intermediaries may cache the response. Both fields complement existing `listChanged` notifications ([SEP-2549](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2549)).
6. Change resource not found error code from `-32002` to `-32602` (Invalid Params) to align with JSON-RPC specification.
7. Authorization servers **SHOULD** include the `iss` parameter in authorization responses per
   [RFC 9207](https://datatracker.ietf.org/doc/html/rfc9207), and MCP clients **MUST** validate a
   present `iss` against the recorded issuer before redeeming the authorization code
   ([SEP-2468](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2468)).
8. Require MCP clients to specify an appropriate `application_type` during Dynamic Client
   Registration to avoid OpenID Connect redirect URI conflicts
   ([SEP-837](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/837)).
9. Clarify that client credentials are bound to the authorization server that issued them:
   clients **MUST** key persisted credentials by the issuer identifier, **MUST NOT** reuse them
   with a different authorization server, and **MUST** re-register when the authorization server
   changes ([SEP-2352](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2352)).
10. Loosen `inputSchema` and `outputSchema` to allow any JSON Schema 2020-12 keywords, and
    `structuredContent` to allow any JSON value. Add `$ref` resolution requirements and
    composition-keyword resource bounds
    ([SEP-2106](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2106)).
11. Remove the `notifications/elicitation/complete` notification and the
    `elicitationId` field of URL mode elicitation requests, both introduced in
    `2025-11-25`. Under the
    [Multi Round-Trip Requests](https://modelcontextprotocol.io/specification/2026-07-28/basic/patterns/mrtr.md) pattern, the
    client learns the outcome of an out-of-band interaction by retrying the original
    request, so a server-initiated completion signal — and the identifier used to
    correlate it — no longer fit the protocol. Servers needing to correlate an
    elicitation across retries encode their own identifier in `requestState`.
12. Define an [error code allocation policy](https://modelcontextprotocol.io/specification/2026-07-28/basic/index.md#error-codes)
    partitioning the JSON-RPC server-error range: `-32000` to `-32019` remains
    implementation-defined (existing SDK usage is grandfathered), `-32020` to `-32099` is
    reserved for the MCP specification. Renumber the error codes introduced in this draft
    accordingly — `HeaderMismatch` `-32001` → `-32020`, `MissingRequiredClientCapability`
    `-32003` → `-32021`, `UnsupportedProtocolVersion` `-32004` → `-32022` — and add
    `HeaderMismatchError` to the schema, which previously existed only in transport prose.

## Deprecated

Features listed here remain part of the specification but are scheduled for removal under the [feature lifecycle and deprecation policy](https://modelcontextprotocol.io/community/feature-lifecycle.md). New implementations should not adopt them. The [deprecated features registry](https://modelcontextprotocol.io/specification/2026-07-28/deprecated.md) tracks every feature currently in the Deprecated state.

1. Deprecate the Roots, Sampling, and Logging features
   ([SEP-2577](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2577)).
   These features remain fully functional during the deprecation window but new
   implementations should not add support for them. Suggested migrations: pass
   directories or files via tool parameters, resource URIs, or server
   configuration instead of Roots; integrate directly with LLM provider APIs
   instead of Sampling; log to `stderr` (stdio) or use OpenTelemetry instead of
   Logging.

2. Reclassify the HTTP+SSE transport (deprecated since protocol version
   `2025-03-26`) as Deprecated under the feature lifecycle policy
   ([SEP-2596](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2596)).
   Migrate to [Streamable HTTP](https://modelcontextprotocol.io/specification/2026-07-28/basic/transports/streamable-http.md).

3. Reclassify the `includeContext` values `"thisServer"` and `"allServers"`
   (soft-deprecated since protocol version `2025-11-25`) as Deprecated
   ([SEP-2596](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2596)).
   Omit the field or use `"none"`; these values will be removed no later than
   the Sampling feature itself.

4. Deprecate the OAuth 2.0 Dynamic Client Registration Protocol
   ([RFC7591](https://datatracker.ietf.org/doc/html/rfc7591)) as a client registration
   mechanism in favor of
   [Client ID Metadata Documents](https://modelcontextprotocol.io/specification/2026-07-28/basic/authorization/client-registration.md#client-id-metadata-documents)
   ([PR #2858](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2858)).
   It remains available for backwards compatibility with authorization servers that do
   not support Client ID Metadata Documents.

## Other schema changes

1. `schema.json` now correctly reflects that the Typescript definition of minimum/maximum/default are `number`'s and not just `integers`. This was caused by running the generator using `--defaultNumberType integer` ([PR#2710](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2710)).

## Governance and process updates

1. Adopt a specification
   [feature lifecycle and deprecation policy](https://modelcontextprotocol.io/community/feature-lifecycle.md)
   defining the Active, Deprecated, and Removed feature states, a minimum
   twelve-month deprecation window, and a
   [registry of deprecated features](https://modelcontextprotocol.io/specification/2026-07-28/deprecated.md)
   ([SEP-2596](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2596)).

## Process changes

1. Formalize PR-based SEP workflow with markdown files in `seps/` directory, PR-derived numbering, sponsor responsibilities, and status management via PR labels ([SEP-1850](https://github.com/modelcontextprotocol/specification/pull/1850)).

---

# Using MCP Servers (Claude Desktop)

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

---

# MCP Apps

- [MCP Apps - Bringing UI Capabilities To MCP Clients](https://blog.modelcontextprotocol.io/posts/2026-01-26-mcp-apps/)

## Reading

### "Learn More" from the Specification

Explore the detailed specification for each protocol component:

- [Architecture](https://modelcontextprotocol.io/specification/2026-07-28/architecture.md)
- [Base Protocol](https://modelcontextprotocol.io/specification/2026-07-28/basic.md)
- [Server Features](https://modelcontextprotocol.io/specification/2026-07-28/server.md)
- [Client Features](https://modelcontextprotocol.io/specification/2026-07-28/client)
- [Contributing](https://modelcontextprotocol.io/community/contributing.md)


### Articles, Blogs, Essays

- [MCP for Beginners](https://github.com/microsoft/mcp-for-beginners)
- [The Model Context Protocol (MCP): A Complete Guide Series](https://ai.plainenglish.io/the-model-context-protocol-mcp-a-complete-guide-series-db4fc70a5e5a) (Requires Medium account)
- [MCP using Ollama](https://medium.com/data-science-in-your-pocket/model-context-protocol-mcp-using-ollama-e719b2d9fd7a)
- [Anthropic intro](https://www.anthropic.com/news/model-context-protocol)
- [Quickstart: Server](https://modelcontextprotocol.io/quickstart/server): "we’ll build a simple MCP weather server and connect it to a host, Claude for Desktop. We’ll start with a basic setup, and then progress to more complex use cases. We’ll build a server that exposes two tools: `get-alerts` and `get-forecast`. Then we’ll connect the server to an MCP host (in this case, Claude for Desktop):"
- [An LLM does not need to understand MCP](https://hackteam.io/blog/your-llm-does-not-care-about-mcp/)
- [Stop Converting REST APIs to MCP](https://www.jlowin.dev/blog/stop-converting-rest-apis-to-mcp): "I’ve come to realize that it can paper over a fundamental problem: an API built for a human will poison your AI agent. In practice, LLMs achieve significantly better performance with well-designed, tailored MCP servers than with auto-converted ones. The reason goes right to the core of how agents and humans interact with software, and how we design technical products for each consumer. A good REST API is generous. It is a model of discoverability and atomicity. It offers hundreds of single-serving endpoints, flexible parameters, and endless options because programmatic iteration is cheap. Human developers are brilliant at doing discovery once and subseqeuently ignoring what’s irrelevant, and their code can chain together atomic calls — get_user(), then get_orders(user_id), then get_order_details(order_id) — with quick network hops to achieve complex outcomes. For them, more choice is good. We use properties like idempotency, pagination, and caching to make our APIs more efficient in the face of relatively deterministic access patterns. But when you hand this interface to an agent, you’re not empowering it; you’re drowning it. "
- [How to Build MCP Servers for Your Internal Data](https://www.freecodecamp.org/news/how-to-build-mcp-servers-for-your-internal-data/)
- [How to build an enterprise-grade MCP registry](https://www.infoworld.com/article/4145014/how-to-build-an-enterprise-grade-mcp-registry.html)
- [How I Built an MCP Server That Made Developers Faster and Work Easier](https://medium.com/@himanshusingour7/how-i-built-an-mcp-server-that-made-developers-faster-and-work-easier-f1356ff53649)

## Tools

- [Context7 is the most underrated MCP server you're not using for your local LLM](https://www.xda-developers.com/context7-underrated-mcp-server-local-llm/)
- [mindsdb](https://github.com/mindsdb/mindsdb) - federated query engine for AI - the only MCP Server you'll ever need 
- [github-mcp-server](https://github.com/github/github-mcp-server) - GitHub's official MCP Server
- [playwright-mcp](https://github.com/microsoft/playwright-mcp) - Playwright MCP server
- [chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) - Chrome DevTools for coding agents
- [n8n-mcp](https://github.com/czlonkowski/n8n-mcp) - a MCP for Claude Desktop / Claude Code / Windsurf / Cursor to build n8n workflows for you
- [awslabs/mcp](https://github.com/awslabs/mcp) - AWS MCP Servers — helping you get the most out of AWS, wherever you use MCP
- [mcp-atlassian](https://github.com/sooperset/mcp-atlassian) - MCP server for Atlassian tools (Confluence, Jira)
- [dbhub](https://github.com/bytebase/dbhub) - zero-dependency, token-efficient database MCP server for Postgres, MySQL, SQL Server, MariaDB, SQLite
- [SQL MCP Server as an App Service](https://devblogs.microsoft.com/azure-sql/sql-mcp-server-app-service/)

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

