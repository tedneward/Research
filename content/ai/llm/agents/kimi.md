title=Kimi-Code
tags=ai, llm, agent
summary=The Starting Point for Next-Gen Agents
~~~~~~

[Website](https://www.kimi.com/code/docs/) | [Source](https://github.com/MoonshotAI/kimi-code)

Kimi Code CLI is an AI coding agent that runs in your terminal — it can read and edit code, run shell commands, search files, fetch web pages, and choose the next step based on the feedback it receives. It works out of the box with Moonshot AI’s Kimi models and can also be configured to use other compatible providers.

## Install

Install with the official script. No Node.js required.

-   **macOS or Linux**:

        curl -fsSL https://code.kimi.com/kimi-code/install.sh | bash

Copy code to clipboard

-   **Windows (PowerShell)**:

        irm https://code.kimi.com/kimi\-code/install.ps1 | iex

> On Windows, install [Git for Windows](https://gitforwindows.org/) before first launch because Kimi Code CLI uses the bundled Git Bash as its shell environment. If Git Bash is installed in a custom location, set `KIMI_SHELL_PATH` to the absolute path of `bash.exe`.

Then, run it with a new shell session:

        kimi --version

For npm install, upgrade, uninstall, see [Getting Started](https://moonshotai.github.io/kimi-code/en/guides/getting-started).

## Quick Start

Open a project and start the interactive UI:

        cd your-project
        kimi

On first launch, run `/login` inside Kimi Code CLI and choose either Kimi Code OAuth or a Moonshot AI Open Platform API key. After login, try your first task:

```
Take a look at this project and explain its main directories.
```

