title=Opencode
tags=ai, agent, coding, tool, specification driven development
summary=An open source agent that helps you write code in your terminal, IDE, or desktop.
~~~~~~

[Website](https://opencode.ai/) | [Source](https://github.com/sst/opencode)

## Configuration

1. Choose your provider. To configure your provider, create a config file:

        ## Global config
        ~/.config/opencode/opencode.json

   or:

        ## Project-specific
        ./opencode.json

2. Set your API Key

        export ANTHROPIC_API_KEY="your-key-here"
        ## or
        export OPENAI_API_KEY="your-key-here"

3. Launch opencode: `$ opencode`

4. Create an AGENTS.md file:

        ## Project: My SaaS App

        ## Tech Stack
        - Next.js 14 with App Router
        - TypeScript
        - Tailwind CSS
        - PostgreSQL with Prisma

        ## Conventions
        - Use functional components
        - Prefer server components when possible
        - Follow REST API naming conventions
        - Write tests for all new features

        ## Structure
        - /app - Next.js app router pages
        - /components - Reusable UI components
        - /lib - Utility functions and helpers
        - /prisma - Database schema and migrations

## Practical Uses

### Example 1: Understanding a Codebase

"Explain the authentication flow in this project": OpenCode will analyze your files and provide a detailed explanation of how authentication works.

### Example 2: Adding a Feature
"Add a dark mode toggle to the settings page": OpenCode will:

* Find the settings page
* Identify the theme system
* Implement the toggle
* Update necessary styles

### Example 3: Debugging
"The login form is not submitting. Here's the error: [paste error]": OpenCode will trace the issue and suggest fixes.

### Example 4: Refactoring
"Refactor the UserService class to use dependency injection": OpenCode will modernize your code while maintaining functionality.

## GitHub Integration

OpenCode can work directly in your GitHub workflow:

1.  Mention `/opencode` or `/oc` in an issue or PR comment
2.  OpenCode runs in your GitHub Actions runner
3.  It creates a new branch and submits a PR with changes

Example comment:

```
/opencode Fix the bug described in this issue
```

* * *

## Free Models Available

OpenCode offers several free models:

-   **Grok Code Fast 1** - Free for limited time (feedback collection)
-   **GLM 4.7** - Free for limited time
-   **Big Pickle** - Stealth model, free for limited time

These are great for trying OpenCode without any cost!

* * *

## Tips for Beginners

### 1\. Be Specific

❌ "Make it better" ✅ "Refactor the handleSubmit function to use async/await and add error handling"

### 2\. Provide Context

❌ "Fix the bug" ✅ "The login form throws 'undefined is not a function' when clicking submit. The error occurs in auth.ts line 45"

### 3\. Use Plan Mode First

For complex features, ask OpenCode to create a plan before implementation.

### 4\. Leverage Image Support

Drag and drop screenshots or mockups into the terminal—OpenCode can understand images!

### 5\. Create Project-Specific Configs

Different projects may need different settings. Use local `opencode.json` files.

* * *

## OpenCode vs Other Tools

| Feature | OpenCode | Claude Code | Cursor |
| --- | --- | --- | --- |
| Open Source | ✅   | ❌   | ❌   |
| Free Tier | ✅   | Limited | Limited |
| Terminal-first | ✅   | ✅   | ❌   |
| Provider Agnostic | ✅   | ❌ (Claude only) | ❌   |
| Local Models | ✅   | ❌   | ✅   |
| IDE Integration | ✅   | ✅   | Native |

## Summary

OpenCode is a powerful, open-source AI coding assistant that brings intelligent help directly to your terminal. With its provider-agnostic design, free models, and deep IDE integration, it's an excellent choice for developers looking to boost their productivity.

**Key Takeaways:**

-   Install with a single command
-   Configure your preferred AI provider
-   Use Plan mode for analysis, Build mode for changes
-   Create AGENTS.md for better context
-   Leverage GitHub integration for automated workflows

## Resources

### Articles, Blogs, Essays

- [OPENCODE: THE OPEN-SOURCE AI CODING AGENT THAT LIVES IN YOUR TERMINAL](https://stal.blogspot.com/2026/04/opencode-open-source-ai-coding-agent.html)
- [OpenCode Tutorial 2026](https://www.nxcode.io/resources/news/opencode-tutorial-2026)
- [OpenCode vs Claude Code vs Cursor: Complete Comparison 2026](https://www.nxcode.io/resources/news/opencode-vs-claude-code-vs-cursor-2026) - Head-to-head comparison of the top AI coding tools
- [AI Coding Tools Comparison](https://www.nxcode.io/tools/ai-coding-tools-comparison) - Interactive tool to compare features across AI coding assistants
- [AI Model Comparison](https://www.nxcode.io/tools/ai-model-comparison) - Compare Claude, GPT-4, Gemini, and other AI models
- [Cursor Review 2026: Honest Pros & Cons](https://www.nxcode.io/resources/news/cursor-review-2026) - In-depth review of Cursor IDE
- [AI Token Calculator](https://www.nxcode.io/tools/ai-token-calculator) - Calculate token usage and costs for 150+ AI models
- [Best AI App Builders 2026](https://www.nxcode.io/resources/news/best-ai-app-builders-2026) - Complete guide to no-code AI app builders

## CLI Interface

```
USAGE
  opencode <subcommand> [flags] [<directory>]

ARGUMENTS
  directory string    Directory to start OpenCode in (optional)

FLAGS
  --standalone            Run with a private server instead of the background service
  --server string         Connect to a server URL instead of the background service
  --auto                  Auto-approve permissions that are not explicitly denied
  --continue, -c          Continue the last session
  --session, -s string    Session ID to continue, or to create if it does not exist
  --prompt string         Prompt to use

GLOBAL FLAGS
  --help, -h                                                          Show help information
  --version, -v                                                       Show version information
  --wizard                                                            Start wizard mode for a command
  --completions <bash|zsh|fish|sh>                                    Print shell completion script (choices: bash, zsh, fish, sh)
  --log-level <all|trace|debug|info|warn|warning|error|fatal|none>    Sets the minimum log level (choices: all, trace, debug, info, warn, warning, error, fatal, none)
  --print-logs                                                        Print logs to stderr (server logs require --standalone)

SUBCOMMANDS
  upgrade, update    Upgrade OpenCode to the latest or a specific version
  uninstall          Uninstall OpenCode, keeping session data, configuration, and state
  acp                Start an Agent Client Protocol server
  api                Make a request to the running server
  debug              Debugging and troubleshooting tools
  auth               manage integrations and credentials
  mcp                Manage MCP (Model Context Protocol) servers
  plugin             Manage plugins
  models             List all available models
  stats              Show shareable usage statistics
  mini               Start the minimal interactive interface
  run                Run OpenCode with a message
  session            Manage sessions
  service            Manage the background server
  reload             Reload configuration
  pair               Print one-time links to connect a browser or app
  serve              Start the v2 API and web server
```

`opencode --wizard`: Walks through a console-based wizard to create a shell command for execution.

`opencode run --model ollama/qwen3.8:27b "Create a singly-linked list class in Python." .`: Run a prompt through the given model in the current directory


