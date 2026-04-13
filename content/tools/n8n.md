title=n8n
tags=tool, ai
summary=Fair-code workflow automation platform with native AI capabilities.
~~~~~~

[Website](https://n8n.io) | [Source](https://github.com/n8n-io/n8n) | [Docs](https://docs.n8n.io/) | [400+ Integrations](https://n8n.io/integrations) | [Example Workflows](https://n8n.io/workflows) | [AI & LangChain Guide](https://docs.n8n.io/advanced-ai/) | [Community Forum](https://community.n8n.io/) | [Community Tutorials](https://community.n8n.io/c/tutorials/28)

n8n is a workflow automation platform that gives technical teams the flexibility of code with the speed of no-code. With 400+ integrations, native AI capabilities, and a fair-code license, n8n lets you build powerful automations while maintaining full control over your data and deployments.

## Quick Start

Try n8n instantly with [npx](https://docs.n8n.io/hosting/installation/npm/) (requires [Node.js](https://nodejs.org/en/)):

```
npx n8n
```

Or deploy with [Docker](https://docs.n8n.io/hosting/installation/docker/):

```
docker volume create n8n_data
docker run -it --rm --name n8n -p 5678:5678 -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n
```

Access the editor at [http://localhost:5678](http://localhost:5678/)
