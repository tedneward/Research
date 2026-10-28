title=LibreChat
tags=ai, tool, engine, chat ui
summary=Brings together all your AI conversations in one unified, customizable interface.
~~~~~~

[Website](https://www.librechat.ai/) | [Source](https://github.com/LibreChat-AI/LibreChat)

Enhanced ChatGPT Clone: Features Agents, MCP, Skills, DeepSeek, Anthropic, AWS, OpenAI, Responses API, Azure, Groq, o1, GPT-5, Mistral, OpenRouter, Vertex AI, Gemini, Artifacts, AI model switching, message search, Code Interpreter, langchain, DALL-E-3, OpenAPI Actions, Functions, Secure Multi-User Auth, Presets, open-source for self-hosting.

# Docker deploy

```
git clone https://github.com/danny-avila/LibreChat
cd LibreChat && docker-compose up -d
```



# ✨ Features

[](https://github.com/LibreChat-AI/LibreChat#-features)

-   🖥️ **UI & Experience** inspired by ChatGPT with enhanced design and features
-   🤖 **AI Model Selection**:
    
    -   Anthropic (Claude), AWS Bedrock, OpenAI, Azure OpenAI, Google, Vertex AI, OpenAI Responses API (incl. Azure)
    -   [Custom Endpoints](https://www.librechat.ai/docs/quick_start/custom_endpoints): Use any OpenAI-compatible API with LibreChat, no proxy required
    -   Compatible with [Local & Remote AI Providers](https://www.librechat.ai/docs/configuration/librechat_yaml/ai_endpoints):
        -   Ollama, [AMD Lemonade](https://lemonade-server.ai/), groq, Cohere, Mistral AI, Apple MLX, koboldcpp, together.ai,
        -   OpenRouter, Helicone, Perplexity, ShuttleAI, Deepseek, Qwen, and more
-   🔧 **[Code Interpreter API](https://www.librechat.ai/docs/features/code_interpreter)**:
    
    -   Secure, Sandboxed Execution in Python, Node.js (JS/TS), Go, C/C++, Java, PHP, Rust, and Fortran
    -   Seamless File Handling: Upload, process, and download files directly
    -   No Privacy Concerns: Fully isolated and secure execution
    -   Open-Source & Self-Hostable: powered by [ClickHouse/code-interpreter](https://github.com/ClickHouse/code-interpreter)
-   🔦 **Agents & Tools Integration**:
    
    -   **[LibreChat Agents](https://www.librechat.ai/docs/features/agents)**:
        -   No-Code Custom Assistants: Build specialized, AI-driven helpers
        -   Agent Marketplace: Discover and deploy community-built agents
        -   Collaborative Sharing: Share agents with specific users and groups
        -   Flexible & Extensible: Use MCP Servers, tools, file search, code execution, and more
        -   [Skills](https://www.librechat.ai/docs/features/skills): Create reusable `SKILL.md` instruction bundles for manual, automatic, or always-on agent workflows
        -   [Agent Plugins](https://www.librechat.ai/docs/features/agent_plugins): Experimentally bundle deployment Skills and MCP servers into startup-loaded packages
        -   [Subagents](https://www.librechat.ai/docs/features/subagents): Delegate focused work to isolated child agent runs with their own context windows
        -   Agent Management API: Automate Agent, file, and Skill management with deployment-bound OIDC clients
        -   Attached Code Workspaces: Let Agents inspect, search, edit, and run commands in managed or personal workspaces (highly experimental)
        -   Compatible with Custom Endpoints, OpenAI, Azure, Anthropic, AWS Bedrock, Google, Vertex AI, Responses API, and more
        -   [Model Context Protocol (MCP) Support](https://modelcontextprotocol.io/clients#librechat) for Tools
-   🔍 **Web Search**:
    
    -   Search the internet and retrieve relevant information to enhance your AI context
    -   Combines search providers, content scrapers, and result rerankers for optimal results
    -   **Customizable Jina Reranking**: Configure custom Jina API URLs for reranking services
    -   **[Learn More →](https://www.librechat.ai/docs/features/web_search)**
-   🪄 **Generative UI with Code Artifacts**:
    
    -   [Code Artifacts](https://youtu.be/GfTj7O4gmd0?si=WJbdnemZpJzBrJo3) create React, HTML, and Mermaid content directly in chat
    -   Open previews fullscreen and export Mermaid diagrams as SVG or PNG
-   🎨 **Image Generation & Editing**
    
    -   Text-to-image and image-to-image with [GPT-Image-1](https://www.librechat.ai/docs/features/image_gen#1--openai-image-tools-recommended)
    -   Text-to-image with [Stable Diffusion](https://www.librechat.ai/docs/features/image_gen#3--stable-diffusion-local), [Flux](https://www.librechat.ai/docs/features/image_gen#4--flux), or any [MCP server](https://www.librechat.ai/docs/features/image_gen#5--model-context-protocol-mcp)
    -   Produce stunning visuals from prompts or refine existing images with a single instruction
-   💾 **Presets & Context Management**:
    
    -   Create, Save, & Share Custom Presets
    -   Switch between AI Endpoints and Presets mid-chat
    -   Edit, Resubmit, and Continue Messages with Conversation branching
    -   Create and share prompts with specific users and groups
    -   [Fork Messages & Conversations](https://www.librechat.ai/docs/features/fork) for Advanced Context control
    -   Compact long conversations on demand while preserving recent context
-   💬 **Multimodal & File Interactions**:
    
    -   Upload and analyze images with Claude 3, GPT-4.5, GPT-4o, o1, Llama-Vision, and Gemini 📸
    -   Chat with Files using Custom Endpoints, OpenAI, Azure, Anthropic, AWS Bedrock, & Google 🗃️
    -   Copy messages as formatted rich text for documents, email, and collaboration apps
-   🌎 **Multilingual UI**:
    
    -   English, 中文 (简体), 中文 (繁體), العربية, Deutsch, Español, Français, Italiano
    -   Polski, Português (PT), Português (BR), Русский, 日本語, Svenska, 한국어, Tiếng Việt
    -   Türkçe, Nederlands, עברית, Català, Čeština, Dansk, Eesti, فارسی
    -   Suomi, Magyar, Հայերեն, Bahasa Indonesia, ქართული, Latviešu, ไทย, ئۇيغۇرچە
-   🧠 **Reasoning UI**:
    
    -   Dynamic Reasoning UI for Chain-of-Thought/Reasoning AI models like DeepSeek-R1
-   🎨 **Customizable Interface**:
    
    -   Customizable Dropdown & Interface that adapts to both power users and newcomers
    -   Light, dark, system, and high-contrast appearance modes
-   📈 **Observability**:
    
    -   Export traces and logs with OpenTelemetry and connect Langfuse for Agent and model insights
-   🌊 **[Resumable Streams](https://www.librechat.ai/docs/features/resumable_streams)**:
    
    -   Never lose a response: AI responses automatically reconnect and resume if your connection drops
    -   Multi-Tab & Multi-Device Sync: Open the same chat in multiple tabs or pick up on another device
    -   Production-Ready: Works from single-server setups to horizontally scaled deployments with Redis
-   🗣️ **Speech & Audio**:
    
    -   Chat hands-free with Speech-to-Text and Text-to-Speech
    -   Automatically send and play Audio
    -   Supports OpenAI, Azure OpenAI, and Elevenlabs
-   📥 **Import & Export Conversations**:
    
    -   Import Conversations from LibreChat, ChatGPT, Chatbot UI
    -   Export conversations as screenshots, markdown, text, json
-   🔍 **Search & Discovery**:
    
    -   Search all messages/conversations
-   👥 **Multi-User & Secure Access**:
    
    -   Multi-User, Secure Authentication with OAuth2, LDAP, & Email Login Support
    -   Built-in Moderation, and Token spend tools
-   🎛️ **[Admin Panel](https://www.librechat.ai/docs/features/admin_panel)**:
    
    -   Browser-based UI to manage users, groups, roles, and configuration overrides
    -   Edit settings and per-role/group permissions live, without redeploying
    -   Bundled with the Docker Compose stacks for one-command setup
-   ⚙️ **Configuration & Deployment**:
    
    -   Configure Proxy, Reverse Proxy, Docker, & many Deployment options
    -   Use [S3 with CloudFront](https://www.librechat.ai/docs/configuration/cdn/cloudfront) for stable media links, edge delivery, signed cookies, and secured downloads
    -   Use completely local or deploy on the cloud
-   📖 **Open-Source & Community**:
    
    -   Completely Open-Source & Built in Public
    -   Community-driven development, support, and feedback