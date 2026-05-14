title=Flue
tags=ai, llm, framework, agent, harness
summary=A TypeScript framework for building the next generation of agents, designed around a built-in agent harness.
~~~~~~

[Website](https://flueframework.com/) | [Source](https://github.com/withastro/flue)

## Examples

### Quickstart/HelloWorld
The simplest agent — no container, no tools, just a prompt and a typed result.

Unless you opt-in to initializing a full container sandbox, Flue will default to a virtual sandbox for every agent, powered by just-bash. A virtual sandbox is going to be dramatically faster, cheaper, and more scalable than running a full container for every agent, which makes it perfect for building high-traffic/high-scale agents.

```
// .flue/agents/hello-world.ts
import type { FlueContext } from '@flue/runtime';
import * as v from 'valibot';

// Every agent needs a trigger. This agent is invoked as an API endpoint, via HTTP.
export const triggers = { webhook: true };

// The agent handler. Where the orchestration of the agent lives.
export default async function ({ init, payload }: FlueContext) {
  // `harness` -- Your initialized harness including sandbox, tools, skills, etc.
  const harness = await init({ model: 'anthropic/claude-sonnet-4-6' });
  const session = await harness.session();

  // prompt() sends a message in the session, triggering action.
  const { data } = await session.prompt(`Translate this to ${payload.language}: "${payload.text}"`, {
    // Pass `result` to get typed, schema-validated data back from your agent.
    result: v.object({
      translation: v.string(),
      confidence: v.picklist(['low', 'medium', 'high']),
    }),
  });

  return data;
}
```

### Support Agent
A support agent can also run in a virtual sandbox, but we now add a file-system using an R2 bucket. The knowledge base is stored in R2 and mounted directly into the harness filesystem — the agent searches it with its built-in tools (grep, glob, read). Skills are also defined in the bucket that help the agent perform its task.

Because this agent is deployed to Cloudflare, message history and session state are automatically persisted for you. So you (or your customer) can revisit this support session days, weeks, or years later and pick up exactly where you left off.

```
// .flue/agents/support.ts
import { getVirtualSandbox } from '@flue/runtime/cloudflare';
import type { FlueContext } from '@flue/runtime';
import * as v from 'valibot';

export const triggers = { webhook: true };

export default async function ({ init, payload, env }: FlueContext) {
  // Mount the R2 knowledge base bucket as the harness filesystem.
  // The agent can grep, glob, and read articles with bash, but
  // without needing to spin up an entire container sandbox.
  const sandbox = await getVirtualSandbox(env.KNOWLEDGE_BASE);
  const harness = await init({ sandbox, model: 'openrouter/moonshotai/kimi-k2.6' });
  const session = await harness.session();

  return await session.prompt(
    `You are a support agent. Search the knowledge base for articles
    relevant to this request, then write a helpful response.

    Customer: ${payload.message}`,
    {
      // Provide roles (aka subagents) to guide your agent. Defined in .flue/roles/
      role: 'triager',
    },
  );
}
```

### Coding Agent (Remote Sandbox)
The examples above all run on a lightweight virtual sandbox — no container needed. But for a full coding agent, you want a real Linux environment with git, Node.js, a browser, and a cloned repo ready to go.

Daytona's declarative image builder lets you define the environment in code. The image is cached after the first build, so subsequent sessions start instantly.

Install the Daytona connector with flue add daytona | <your-agent> (e.g. claude, opencode, codex, cursor-agent). It writes a small connectors/daytona.ts adapter into your project that you import directly.

```
// .flue/agents/code.ts
import { Type, type FlueContext, type ToolDef } from '@flue/runtime';
import { Daytona } from '@daytona/sdk';
import { daytona } from '../connectors/daytona';

export const triggers = { webhook: true };

export default async function ({ init, payload, env }: FlueContext) {
  // Each agent gets a real container via Daytona. The container has
  // a full Linux environment with persistent filesystem and shell.
  //
  // For simplicity, we always create a new sandbox here. You could also
  // first check for an existing sandbox for the agent instance id, and reuse that
  // instead to best pick up where you last left off in the conversation.
  const client = new Daytona({ apiKey: env.DAYTONA_API_KEY });
  const sandbox = await client.create();
  const setupHarness = await init({
    sandbox: daytona(sandbox),
    model: 'openai/gpt-5.5',
  });
  const setup = await setupHarness.session();

  // For simplicity, we clone the target repo into the sandbox here.
  // You could also bake these into the container image snapshot for a
  // faster / near-instant startup.
  await setup.shell(`git clone ${payload.repo} /workspace/project`);
  await setup.shell('npm install', { cwd: '/workspace/project' });

  // Start a second harness in the cloned repo. It shares the same sandbox, but
  // discovers AGENTS.md and skills from /workspace/project.
  const projectHarness = await init({
    name: 'project',
    sandbox: daytona(sandbox),
    cwd: '/workspace/project',
    model: 'openai/gpt-5.5',
  });
  const session = await projectHarness.session();

  // Coding agents don't hide the agent DX from the user, so no need to
  // wrap the user's prompt in anything. Just send it to the agent directly
  // and then stream back the progress and final results.
  return await session.prompt(payload.prompt);
}
```

### Remote MCP Tools
MCP is available as a runtime tool adapter. Connect to a remote MCP server in trusted code, pass its tools to init(), and keep secrets in env instead of filesystem context or prompts.

```
// .flue/agents/assistant.ts
import { connectMcpServer, type FlueContext } from '@flue/runtime';

export const triggers = { webhook: true };

export default async function ({ init, payload, env }: FlueContext) {
  const github = await connectMcpServer('github', {
    url: 'https://mcp.github.com/mcp',
    headers: {
      Authorization: `Bearer ${env.GITHUB_TOKEN}`,
    },
  });

  try {
    const harness = await init({
      model: 'anthropic/claude-sonnet-4-6',
      tools: github.tools,
    });
    const session = await harness.session();
    return await session.prompt(payload.prompt);
  } finally {
    await github.close();
  }
}
```

connectMcpServer() defaults to modern streamable HTTP. For legacy SSE servers, pass transport: 'sse'. Flue does not auto-detect transports, spawn local stdio MCP servers, or handle OAuth callbacks in this first version.

