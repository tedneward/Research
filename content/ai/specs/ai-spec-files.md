title=AI Coding Agent Specification files
tags=ai, agent, coding
summary=Notes, links, and thoughts on the various AI coding agent MD files.
~~~~~~

## Files

First-pass, I asked ChatGPT to share what files it knew about.

"Recommended minimal set (80/20): If you only add four files, make them these:

- README.md
- AGENTS.md
- ARCHITECTURE.md
- DECISIONS.md

That combination gives:

- Orientation
- Constraints
- Structure
- Historical context

"Which is exactly what agents lack."

### [`README.md`](/ai/specs/ai-readme)
**Why it helps**: This is the primary grounding document for the agent:

- What the system does
- What language & frameworks are used
- How to run tests
- High-level architecture

Agents *will* read this automatically if present.

### [`AGENTS.md`](/ai/specs/ai-agents)

**Why it helps**: This is the **single most important agent-specific file**. It answers:

- How should the agent behave?
- What is allowed?
- What is forbidden?

Think of it as **system prompt for your repo**.

### [`ARCHITECTURE.md`](/ai/specs/ai-architecture)

**Why it helps:** Agents struggle with implicit architecture. This file makes it explicit.

### [`DECISIONS.md`](/ai/specs/ai-decisions)

**Why it helps:** Agents often “fix” things you chose intentionally. This prevents that.

### [CONTRIBUTING.md](/ai/specs/ai-contributing)

**Why it helps:** This aligns agent output with your human workflow.

### [`TASKS.md` or `ROADMAP.md`](/ai/specs/ai-tasks)

**Why it helps:** Agents perform better when they know what matters next.

### [`STYLE.md` or `CODING_STANDARDS.md`](ai/specs/ai-standards)

**Why it helps:** Prevents stylistic churn.

### [`PROMPTS.md`](/ai/specs/ai-prompts)

**Why it helps:** This is a prompt library for repeatable agent use.

## Reading



## ChatGPT chats

### Examples
Prompt: `Show me an example workflow using a coding agent in Visual Studio Code. It does not have to be Copilot but it must not cost anything to set up and run.`

Response:

Below is a **concrete, end-to-end example workflow** for using a **coding agent in Visual Studio Code** that is **100% free to set up and run**. No Copilot, no subscriptions.

I’ll use **VS Code + Continue.dev + a local LLM via Ollama**. This is currently the most practical “agent-like” setup that costs nothing and works offline once installed.

## Stack (all free)

-   **Editor:** Visual Studio Code
-   **Agent framework:** Continue.dev (VS Code extension)
-   **LLM runtime:** Ollama (local)
-   **Model:** `qwen2.5-coder`, `deepseek-coder`, or `codellama`
    

Why this works:

-   Continue provides **agent behavior** (multi-step reasoning, file edits, refactors)
-   Ollama runs models **locally**
-   No API keys, no rate limits, no cost
    

#### Step 1: Install the tools

1. Install VS Code
2. Install Ollama: Ollama runs LLMs locally.

    -   [https://ollama.com/](https://ollama.com/)
    -   Install for Windows / macOS / Linux
    -   After install, verify: `ollama --version`

3. Download a coding model: Pick one (all are free):

    - `ollama pull qwen2.5-coder:7b`
    - `ollama pull deepseek-coder:6.7b`
    - `ollama pull codellama:7b`

4. Install Continue.dev in VS Code:

    1.  Open VS Code
    2.  Extensions → search **“Continue”**
    3.  Install **Continue – Your AI Code Assistant**
    
5. Configure Continue to use Ollama: Open the Continue config file (Command Palette → **“Continue: Open Config”**). Example minimal config:

    ```
    {
        "models": [ { "title": "Local Coder",
                      "provider": "ollama",
                      "model": "qwen2.5-coder:7b"
                    } ],
        "defaultModel": "Local Coder" 
    }
    ```

  Then restart VSCode.

#### Step 2: Example project

Let’s say you have a small project:

```
inventory-app/
├─ src/ 
│  ├─ inventory.py
│  ├─ storage.py
│  └─ api.py
└─ tests/
    └─ test_inventory.py`
```

`inventory.py` is buggy and poorly structured.

#### Step 3: Basic agent interaction

Open **Continue sidebar** (chat panel).

**Prompt:** 

> Scan this repository and explain what it does. Call out any design or correctness issues.

**What happens:**

-   Continue indexes the repo
-   The model reads multiple files
-   You get a structured explanation + critique
    
This already goes beyond autocomplete.

#### Step 4: Agent-driven refactor (multi-file)

**Prompt:**

> Refactor the inventory logic to separate domain logic from persistence.  
> Use a repository pattern and update any affected tests.

**What the agent does:**

1.  Reads `inventory.py`
2.  Reads `storage.py`
3.  Proposes a plan
4.  Generates **multi-file diffs**
5.  Shows changes inline
    
You approve or reject each change.

#### Step 5: Test-aware iteration loop

Now run tests: `pytest`

A test fails.

**Prompt:**

> Tests are failing. Here is the error output:  
> *(paste traceback)*
> Fix the issue without changing test intent.

**Agent workflow:**

-   Reads failure
-   Locates relevant code
-   Adjusts implementation
-   Updates imports / types if needed
    
#### Step 6: Feature implementation as a task

**Prompt:**

> Add support for bulk inventory updates via a new API endpoint.  
> Requirements:
> 
> -   Accept JSON array
>     
> -   Validate quantities
>     
> -   Return partial success report
>     

The agent will:

-   Modify `api.py`
-   Add helper functions
-   Potentially add tests
-   Ask clarification only if truly ambiguous
    
You can nudge it:

> “Don’t add new dependencies.”

#### Step 7: Code review mode

You can switch tone:

**Prompt:**

> Review this code as a senior engineer.  
> Focus on concurrency, error handling, and API design.

This is excellent for:

-   PR reviews
-   Architectural sanity checks    
-   Pre-merge review

