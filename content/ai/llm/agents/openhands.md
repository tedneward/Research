title=OpenHands
tags=ai, llm, coding, agent
summary=A community focused on AI-driven development.
~~~~~~

[Website](https://www.openhands.dev/) | [Source](https://github.com/OpenHands/OpenHands)

There are a few ways to work with OpenHands:

### OpenHands Software Agent SDK

The SDK is a composable Python library that contains all of our agentic tech. It's the engine that powers everything else below.

Define agents in code, then run them locally, or scale to 1000s of agents in the cloud.

[Check out the docs](https://docs.openhands.dev/sdk) or [view the source](https://github.com/OpenHands/software-agent-sdk/)

### OpenHands CLI (Deprecated)

The CLI is the easiest way to start using OpenHands. The experience will be familiar to anyone who has worked with e.g. Claude Code or Codex. You can power it with Claude, GPT, or any other LLM.

[Check out the docs](https://docs.openhands.dev/openhands/usage/run-openhands/cli-mode) or [view the source](https://github.com/OpenHands/OpenHands-CLI)

### OpenHands Local GUI (Deprecated)

Use the Local GUI for running agents on your laptop. It comes with a REST API and a single-page React application. The experience will be familiar to anyone who has used Devin or Jules.

[Check out the docs](https://docs.openhands.dev/openhands/usage/run-openhands/local-setup) or view the source in this repo.

### OpenHands Cloud

This is a deployment of OpenHands GUI, running on hosted infrastructure.

You can try it for free using the Minimax model by [signing in with your GitHub or GitLab account](https://app.all-hands.dev/).

OpenHands Cloud comes with source-available features and integrations:

-   Integrations with Slack, Jira, and Linear
-   Multi-user support
-   RBAC and permissions
-   Collaboration features (e.g., conversation sharing)

### OpenHands Enterprise

Large enterprises can work with us to self-host OpenHands Cloud in their own VPC, via Kubernetes. OpenHands Enterprise can also work with the CLI and SDK above.

OpenHands Enterprise is source-available--you can see all the source code here in the enterprise/ directory, but you'll need to purchase a license if you want to run it for more than one month.

Enterprise contracts also come with extended support and access to our research team.

Learn more at [openhands.dev/enterprise](https://openhands.dev/enterprise)

## Getting Started

Docker:
```
mkdir -p ~/projects ~/.openhands

docker run -it --rm \
  -p 8000:8000 \
  -v ~/.openhands:/home/openhands/.openhands \
  -v ~/projects:/projects \
  ghcr.io/openhands/agent-canvas:latest
```

Configuration is passed via -e flags on docker run:

Variable | Purpose
-------- | -------
PORT | Ingress port inside the container (default 8000). Map it with -p <host>:<PORT>.
LOCAL_BACKEND_API_KEY | API key for the server. Auto-generated and persisted if not set.
OH_SECRET_KEY | Secret used to protect stored settings and secrets

After the UI opens:

* Confirm the default local backend is healthy.
* Open Settings > LLM and configure a provider, model, and API key.
* Open Customize if you want to add skills or MCP servers.
* Return to the home screen and enter a prompt to start your first conversation.
* If you want the conversation tied to a local folder, choose Open Workspace first.

