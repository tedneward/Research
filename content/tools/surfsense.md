title=SurfSense
tags=ai, tool, research
summary=Connect any LLM to your internal knowledge sources and chat with it in real time alongside your team.
~~~~~~

[Website](https://www.surfsense.com/) | [Source](https://github.com/MODSetter/SurfSense) | [Docs](https://www.surfsense.com/docs)

Connect any LLM to your internal knowledge sources and chat with it in real time alongside your team. OSS alternative to NotebookLM, Perplexity, and Glean.

SurfSense is a highly customizable AI research agent, connected to external sources such as Search Engines (SearxNG, Tavily, LinkUp), Google Drive, Slack, Microsoft Teams, Linear, Jira, ClickUp, Confluence, BookStack, Gmail, Notion, YouTube, GitHub, Discord, Airtable, Google Calendar, Luma, Circleback, Elasticsearch, Obsidian and more to come.

## Podcast Sample

https://github.com/user-attachments/assets/a0a16566-6967-4374-ac51-9b3e07fbecd7


## How to Use SurfSense

### Self Hosted

Run SurfSense on your own infrastructure for full data control and privacy.

**Prerequisites:** [Docker Desktop](https://www.docker.com/products/docker-desktop/) must be installed and running.

#### For Linux/MacOS users:

```bash
curl -fsSL https://raw.githubusercontent.com/MODSetter/SurfSense/main/docker/scripts/install.sh | bash
```

#### For Windows users:

```bash
irm https://raw.githubusercontent.com/MODSetter/SurfSense/main/docker/scripts/install.ps1 | iex
```

The install script sets up [Watchtower](https://github.com/nicholas-fedor/watchtower) automatically for daily auto-updates. To skip it, add the `--no-watchtower` flag.

For Docker Compose, manual installation, and other deployment options, see the [docs](https://www.surfsense.com/docs/).

### How to Realtime Collaborate (Beta)

1. Go to Manage Members page and create an invite.

   <p align="center"><img src="https://github.com/user-attachments/assets/40ed7683-5aa6-48a0-a3df-00575528c392" alt="Invite Members" /></p>

2. Teammate joins and that SearchSpace becomes shared.

   <p align="center"><img src="https://github.com/user-attachments/assets/ea4e1057-4d2b-4fd2-9ca0-cd19286a285e" alt="Invite Join Flow" /></p>

3. Make chat shared.

   <p align="center"><img src="https://github.com/user-attachments/assets/17b93904-0888-4c3a-ac12-51a24a8ea26a" alt="Make Chat Shared" /></p>

4. Your team can now chat in realtime.

   <p align="center"><img src="https://github.com/user-attachments/assets/83803ac2-fbce-4d93-aae3-85eb85a3053a" alt="Realtime Chat" /></p>

5. Add comment to tag teammates.

   <p align="center"><img src="https://github.com/user-attachments/assets/3b04477d-8f42-4baa-be95-867c1eaeba87" alt="Realtime Comments" /></p>

## Key Features

| Feature | Description |
|---------|-------------|
| OSS Alternative | Drop in replacement for NotebookLM, Perplexity, and Glean with real time team collaboration |
| 50+ File Formats | Upload documents, images, videos via LlamaCloud, Unstructured, or Docling (local) |
| Hybrid Search | Semantic + Full Text Search with Hierarchical Indices and Reciprocal Rank Fusion |
| Cited Answers | Chat with your knowledge base and get Perplexity style cited responses |
| Deep Agent Architecture | Powered by [LangChain Deep Agents](https://docs.langchain.com/oss/python/deepagents/overview) planning, subagents, and file system access |
| Universal LLM Support | 100+ LLMs, 6000+ embedding models, all major rerankers via OpenAI spec & LiteLLM |
| Privacy First | Full local LLM support (vLLM, Ollama) your data stays yours |
| Team Collaboration | RBAC with Owner / Admin / Editor / Viewer roles, real time chat & comment threads |
| Podcast Generation | 3 min podcast in under 20 seconds; multiple TTS providers (OpenAI, Azure, Kokoro) |
| Browser Extension | Cross browser extension to save any webpage, including auth protected pages |
| 25+ Connectors | Search Engines, Google Drive, Slack, Teams, Jira, Notion, GitHub, Discord & [more](#external-sources) |
| Self Hostable | Open source, Docker one liner or full Docker Compose for production |

<details>
<summary><b>Full list of External Sources</b></summary>
<a id="external-sources"></a>

Search Engines (Tavily, LinkUp) · SearxNG · Google Drive · Slack · Microsoft Teams · Linear · Jira · ClickUp · Confluence · BookStack · Notion · Gmail · YouTube Videos · GitHub · Discord · Airtable · Google Calendar · Luma · Circleback · Elasticsearch · Obsidian, and more to come.

</details>
