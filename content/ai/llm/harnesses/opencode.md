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

deepseek-r1:latest on Ollama is only an 8B parameter distilled model, making it fast and capable for quick logic puzzles but far too small to take advantage of a 128GB unified memory setup. Because the :latest tag defaults to a ~5.2 GB quantized build, upgrading to a larger DeepSeek model or tag will yield a massive jump in coding quality. [1] (https://ollama.com/library/deepseek-r1/tags), [2] (https://lumadock.com/tutorials/ollama-deepseek-r1)

How Good is deepseek-r1:latest for Coding?

• A small distilled model. When you pull deepseek-r1:latest via Ollama, you get the 8B distilled variant rather than the full 671B flagship architecture. [1] (https://lumadock.com/tutorials/ollama-deepseek-r1), [2] (https://ollama.com/library/deepseek-r1:latest)
• Strong logic, slower output. Because it is trained with reinforcement learning to think step-by-step inside <think> tags, it catches algorithmic edge cases better than standard 8B models. However, it spends extra time generating reasoning tokens before writing a single line of code. [1] (https://emergent.sh/learn/deepseek-r1-vs-v3), [2] (https://ollama.com/search?q=deepseek)
• Limited repository context. At 8B parameters, it works well for single-function scripts, regex, and quick debugging, but struggles with multi-file architecture or following complex system prompts compared to larger models. [1] (https://vercel.com/i/deepseek-r1-vs-v3)

Better DeepSeek Models for 128GB Memory

With 128GB of unified memory, you have enough headroom to run much stronger local DeepSeek models without swapping to disk:
• DeepSeek-R1 70B (deepseek-r1:70b). This is the largest local distilled version of R1, built on Llama-3.3-70B. It requires roughly 45–50 GB of memory, leaving plenty of room for a large context window while delivering vastly superior code reasoning and debugging.
• DeepSeek-R1 32B (deepseek-r1:32b). Based on Qwen-2.5-32B, this variant uses around 20 GB of memory. Many developers prefer it over the 70B version for daily coding because it retains nearly the same logical accuracy while generating tokens much faster.
• DeepSeek-Coder-V2 16B (deepseek-coder-v2:16b). Unlike R1, this is a Mixture-of-Experts (MoE) model built specifically for code completion and software engineering. It uses ~9 GB of memory, supports a 160K context window, and outputs clean code immediately without verbose chain-of-thought delays.
• DeepSeek-Coder 33B (deepseek-coder:33b). A dense, code-specialized model taking about 19 GB of memory. While older than the V2 and R1 series, it remains reliable for direct, non-reasoning code generation and fill-in-the-middle IDE autocomplete. [1] (https://ollama.com/library/deepseek-coder), [2] (https://ollama.com/library/deepseek-coder-v2), [3] (https://emergent.sh/learn/deepseek-r1-vs-v3), [4] (https://www.bentoml.com/blog/the-complete-guide-to-deepseek-models-from-v3-to-r1-and-beyond), [5] (https://lumadock.com/tutorials/ollama-deepseek-r1), [6] (https://www.youtube.com/watch?v=BDwM93nhdD4), [7] (https://ollama.com/library/deepseek-r1:latest)

Why Flagship V3 and V4 Models Don't Fit Locally

• Full flagship models exceed 128GB. The full un-distilled DeepSeek-R1 and DeepSeek-V3 models are 671B-parameter MoE architectures requiring over 400 GB of memory even when quantized. Newer releases like DeepSeek-V4.1-Flash weigh over 500 GB and are only accessible via Ollama's :cloud tags or API endpoints. [1] (https://www.bentoml.com/blog/the-complete-guide-to-deepseek-models-from-v3-to-r1-and-beyond), [2] (https://lumadock.com/tutorials/ollama-deepseek-r1), [3] (https://ollama.com/library/deepseek-v3), [4] (https://computingforgeeks.com/ollama-models-cheat-sheet/)
• Best workflow strategy. For local development on 128GB, run deepseek-r1:32b or deepseek-r1:70b when you need deep architectural planning or tough bug-hunting, and switch to a non-reasoning model (like deepseek-coder-v2:16b or qwen3-coder) for fast daily coding. [1] (https://ollama.com/library/deepseek-coder-v2), [2] (https://lumadock.com/tutorials/ollama-deepseek-r1), [3] (https://emergent.sh/learn/deepseek-r1-vs-v3)

The best local setup for running OpenSpec inside OpenCode on a 128GB machine is qwen3-coder:30b (or qwen3.6:27b) for fast tool-calling execution, paired with gpt-oss:120b or qwen3.5:122b-a10b for heavy architectural planning.

Because OpenSpec splits development into distinct phases—planning (/opsx:propose) and execution (/opsx:apply and /opsx:verify)—and OpenCode relies heavily on structured file-editing and bash tool calls, your local model needs rock-solid tool-calling reliability and a context window of at least 32K–64K tokens. [1] (https://openspec.dev/), [2] (https://blog.ayjc.net/posts/opencode-ollama/), [3] (https://docs.ollama.com/integrations/opencode), [4] (https://medium.com/@balazskocsis/opencode-with-ollama-model-hosting-a3610f80549f)

Top Ollama Models for OpenSpec + OpenCode

• qwen3-coder:30b (Best Overall Daily Driver). This 30B Mixture-of-Experts model (3.3B active parameters, ~19 GB at Q4_K_M) supports a 256K context window and delivers fast token generation. It handles OpenCode's file-creation, diff-patching, and terminal tool calls reliably without stalling during /opsx:apply loops. [1] (https://www.morphllm.com/best-ollama-models)
• qwen3.6:27b or qwen3.8:27b (Best Dense Agentic Models). Both are dense ~17–18 GB models with 256K context windows tuned specifically for long-horizon agentic coding. Dense 27B models are often slightly better at strictly following complex multi-step Markdown schemas (like OpenSpec's proposal.md, design.md, and tasks.md rules) than smaller MoE models. [1] (https://github.com/Fission-AI/openspec), [2] (https://www.morphllm.com/best-ollama-models), [3] (https://dev.to/rosgluk/best-llms-for-opencode-tested-locally-499l)
• gpt-oss:120b (Best for Spec & Architecture Planning). With 128GB of unified memory, you have enough RAM to run OpenAI's 120B open-weights model (~65–75 GB quantized). Users on Reddit highlight gpt-oss:120b as a top-tier local model for raw coding and reasoning, making it ideal for drafting thorough specs and catching edge cases before writing code. [1] (https://www.reddit.com/r/LocalLLaMA/comments/1mncd7i/best_local_models_to_run_opencode/)
• devstral:24b (Best Benchmarked Open-Weight Alternative). Scoring 46.8% on SWE-Bench Verified at roughly 14 GB, Mistral's coding specialist is another dependable option if you want strong agentic tool execution with minimal memory footprint. [1] (https://www.morphllm.com/best-ollama-models)

Recommended Two-Model OpenSpec Workflow

OpenCode lets you assign different models to different agents or commands inside your opencode.json configuration. On a 128GB machine, you can combine a heavy planner with a fast executor: [1] (https://blog.ayjc.net/posts/opencode-ollama/), [2] (https://opencode.ai/docs/models/)
• Planning & Proposals (/opsx:explore, /opsx:propose). Use gpt-oss:120b or deepseek-r1:70b. Generating specs, C4 diagrams, and task breakdowns doesn't require rapid back-and-forth tool loops, so the extra reasoning depth pays off in cleaner architecture. [1] (https://intent-driven.dev/blog/2026/05/10/spec-driven-development-openspec-opencode/), [2] (https://openspec.dev/)
• Implementation & Verification (/opsx:apply, /opsx:verify). Switch to qwen3-coder:30b or qwen3.6:27b. During implementation, OpenCode makes dozens of sequential tool calls to read files, edit code, and run test suites, where fast token speeds and strict JSON tool formatting matter most. [1] (https://yuv.ai/learn/opencode-cli), [2] (https://openspec.dev/), [3] (https://blog.ayjc.net/posts/opencode-ollama/), [4] (https://www.morphllm.com/best-ollama-models)

Critical Ollama Settings for OpenCode

• Increase the default context window. Ollama defaults to a 4,096-token context window, which will break OpenCode's system prompts and OpenSpec's artifact tracking. Set OLLAMA_CONTEXT_LENGTH=32768 (or 65536 given your 128GB RAM) in your environment variables, or configure "num_ctx": 32768 in your OpenCode provider settings.
• Avoid un-tuned reasoning models for /opsx:apply. Models like deepseek-r1 spend hundreds of tokens thinking before invoking a tool, which slows down multi-file edits and occasionally breaks OpenCode's tool-call parser. Stick to models explicitly trained for native tool calling. [1] (https://docs.ollama.com/integrations/opencode), [2] (https://blog.ayjc.net/posts/opencode-ollama/), [3] (https://ollama.com/search?c=tools), [4] (https://yuv.ai/learn/opencode-cli)
Would you like me to generate a copy-pasteable opencode.json configuration file that wires up both a planning model and an execution model with a 64K context window?

Save the following configuration to ~/.config/opencode/opencode.json (for global use across all projects) or ./opencode.json in your repository root. [1] (https://opencode.ai/docs/config/), [2] (https://medium.com/@balazskocsis/opencode-with-ollama-model-hosting-a3610f80549f), [3] (https://opencode.ai/docs/fr/config/)
This file configures Ollama as your local provider, sets qwen3-coder:30b as your fast default execution model, routes OpenCode's built-in plan agent to gpt-oss:120b, and allocates a 64K context window (65536) across your models. [1] (https://docs.ollama.com/integrations/opencode), [2] (https://opencode.ai/docs/fr/config/)

Copy-Pasteable opencode.json

json
{
  "$schema": "https://opencode.ai/config.json",
  "model": "ollama/qwen3-coder:30b",
  "small_model": "ollama/qwen3-coder:30b",
  "provider": {
    "ollama": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Ollama (Local 128GB)",
      "options": {
        "baseURL": "http://localhost:11434/v1",
        "timeout": 600000
      },
      "models": {
        "qwen3-coder:30b": {
          "name": "Qwen3 Coder 30B (Execution)",
          "options": {
            "num_ctx": 65536
          }
        },
        "gpt-oss:120b": {
          "name": "GPT-OSS 120B (Planning)",
          "options": {
            "num_ctx": 65536
          }
        }
      }
    }
  },
  "agent": {
    "build": {
      "model": "ollama/qwen3-coder:30b"
    },
    "plan": {
      "model": "ollama/gpt-oss:120b",
      "tools": {
        "write": false,
        "edit": false
      }
    }
  }
}
Use code with caution.

Setup Checklist & Usage Tips

• Pull both models first. Make sure both tags are downloaded locally in your terminal before launching OpenCode by running ollama pull qwen3-coder:30b and ollama pull gpt-oss:120b. [1] (https://github.com/anomalyco/opencode/issues/1669)
• Set Ollama's server context variable. To guarantee Ollama never falls back to its 4,096-token default on first load, set OLLAMA_CONTEXT_LENGTH=65536 in your shell profile (~/.zshrc or ~/.bashrc) and restart Ollama.
• Extended timeout for 120B cold starts. The "timeout": 600000 setting (10 minutes) prevents OpenCode from dropping the connection while Ollama swaps gpt-oss:120b into unified memory for the first time. [1] (https://opencode.ai/docs/fr/config/)
• How it pairs with OpenSpec. Press Tab inside OpenCode to switch to the Plan agent when running /opsx:explore or /opsx:propose (which locks out file edits and uses gpt-oss:120b), then switch back to the Build agent for /opsx:apply and /opsx:verify. [1] (https://www.youtube.com/watch?v=npjJyQnLM6U&t=290), [2] (https://opencode.ai/docs/fr/config/)
• Verify your syntax. Run opencode debug config in your terminal after saving the file to confirm OpenCode parses your schema and models cleanly. [1] (https://www.reddit.com/r/opencode/comments/1uv5cha/quick_tip_let_opencode_configure_itself_with/)
Would you like me to also create custom OpenSpec slash commands inside this opencode.json (so typing /opsx-propose or /opsx-apply automatically switches agents and models without pressing Tab)?

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


