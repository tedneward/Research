title=Article: 
tags=reading, article, ai
summary=Define a tool once as an MCP server and any MCP-compatible client, any model, any framework, can discover and call it with zero custom integration code per model.
~~~~~~

[Source](https://www.kdnuggets.com/building-local-ai-systems-qwen3-6-mcps)

## Requirements:

```
# Python 3.11+ required
python --version

python -m venv qwen-mcp-env
source qwen-mcp-env/bin/activate    # macOS / Linux
qwen-mcp-env\Scripts\activate       # Windows

# Core packages
pip install \
  "openai>=1.30.0" \
  "qwen-agent>=0.0.10" \
  "mcp>=1.0.0" \
  "httpx>=0.27.0"

# Serving framework -- choose one
pip install "vllm>=0.19.0"       # NVIDIA GPU
pip install "sglang>=0.5.10"     # NVIDIA GPU (faster prefill for long context)
pip install "ktransformers"      # CPU/hybrid

# Node.js 18+ is required for pre-built MCP servers installed via npx
node --version
```

## Serving Qwen3.6 locally:

#### // SGLang (Recommended for Long-Context Agent Workloads)

```
# Install SGLang with full dependencies
pip install "sglang[all]>=0.5.10"

# Serve Qwen3.6-35B-A3B with reasoning and tool-call parsers enabled.
# --reasoning-parser qwen3 correctly handles the ... blocks.
# --tool-call-parser qwen3_coder routes tool call outputs to the right format.
# --enable-prefix-caching is critical for agent workloads -- enables KV cache reuse
#   across turns, which is what makes preserve_thinking efficient in practice.

python -m sglang.launch_server \
    --model-path Qwen/Qwen3.6-35B-A3B \
    --host 0.0.0.0 \
    --port 30000 \
    --reasoning-parser qwen3 \
    --tool-call-parser qwen3_coder \
    --enable-prefix-caching \
    --tp 2    # tensor parallel across 2 GPUs; remove if using single GPU
```

#### // vLLM

```
pip install "vllm>=0.19.0"

# vLLM equivalent with the same critical flags
vllm serve Qwen/Qwen3.6-35B-A3B \
    --host 0.0.0.0 \
    --port 8000 \
    --reasoning-parser qwen3 \
    --tool-call-parser qwen3_coder \
    --enable-prefix-caching-v2 \
    --tensor-parallel-size 2
```

#### // Smaller Model via Ollama

```
ollama pull qwen2.5:7b
ollama serve
# Ollama's API is OpenAI-compatible at http://localhost:11434/v1
```

Once the server is running, verify it before going any further:

```
# Health check -- should return {"status": "ok"} or similar
curl http://localhost:30000/health

# Test the chat completions endpoint with a simple query
curl http://localhost:30000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "Qwen/Qwen3.6-35B-A3B",
    "messages": [{"role": "user", "content": "Reply with: ready"}],
    "max_tokens": 10
  }'
```

## MCP

There are two ways to use MCP with Qwen3.6:

-   **Via Qwen-Agent**: the official `qwen_agent` library handles tool discovery, call parsing, result injection, and multi-turn conversation management automatically. Less code, less control. Right for most use cases.
-   **Via the MCP Python SDK directly**: you handle the agentic loop yourself using `mcp.ClientSession`. More code, full visibility into every message, complete control over error handling and retry logic. Right for production systems where you need to monitor every step.

This article covers both, starting with Qwen-Agent.

### Building the Local GitHub Developer Assistant

   
The agent does four things in sequence: reads open issues from a GitHub repository, finds the relevant code, drafts a fix, and opens a pull request. All locally, all through MCP.

#### // Part 1: Environment and MCP Server Setup

```
# Set your GitHub personal access token
# Required by the GitHub MCP server for API calls
export GITHUB_TOKEN=ghp_your_token_here

# Pre-built MCP servers install via npx -- no separate install step
# npx handles this on first use when the agent starts the servers
# Verify npx is available:
npx --version
```

Create a project directory:

```
mkdir qwen-github-agent
cd qwen-github-agent
```

#### // Part 2: Qwen-Agent Implementation

The fastest path to a working agent. Qwen-Agent handles the full loop automatically.

```
# github_agent_qwenagent.py
# Prerequisites: pip install qwen-agent openai
#   npm / npx must be installed for the MCP servers
#   GITHUB_TOKEN env var must be set
#   Local serving endpoint must be running (see previous section)
#
# How to run:
#   python github_agent_qwenagent.py

from qwen_agent.agents import Assistant

# ── Server configuration ──────────────────────────────────────────────────────

# Point at your local serving endpoint.
# Change the base_url to match whichever server you started:
#   SGLang:  http://localhost:30000/v1
#   vLLM:    http://localhost:8000/v1
#   Ollama:  http://localhost:11434/v1
LLM_CONFIG = {
    "model":     "Qwen/Qwen3.6-35B-A3B",
    "model_server": "http://localhost:30000/v1",
    "api_key":   "EMPTY",           # Local servers do not require a real key

    # Thinking mode sampling params (from the official model card best practices)
    "generate_cfg": {
        "temperature":       0.6,
        "top_p":             0.95,
        "top_k":             20,
        "min_p":             0.0,
        "thought_in_history": True,   # This is the preserve_thinking flag in Qwen-Agent
    },
}

# ── MCP server configuration ──────────────────────────────────────────────────
# Each server key names the server; the value is the stdio launch command.
# Qwen-Agent starts each server as a subprocess and manages the MCP sessions.

MCP_SERVERS = {
    "mcpServers": {
        "filesystem": {
            "command": "npx",
            "args": [
                "-y",
                "@modelcontextprotocol/server-filesystem",
                # Grant the agent access to the current working directory
                # In production, restrict to the specific repository path
                "."
            ]
        },
        "github": {
            "command": "npx",
            "args": ["-y", "@modelcontextprotocol/server-github"],
            "env": {
                # The GitHub MCP server reads this env var for API authentication
                "GITHUB_TOKEN": "${GITHUB_TOKEN}"
            }
        },
    }
}

# ── System prompt ─────────────────────────────────────────────────────────────
SYSTEM_PROMPT = """You are a senior software engineer with full access to a GitHub repository
via MCP tools.

When given a repository and task:
1. List open issues to understand what needs fixing
2. Use filesystem tools to read relevant source files and tests
3. Identify the root cause based on the code and the issue description
4. Write a targeted fix -- minimal changes, no refactoring unrelated to the bug
5. Create a pull request with a clear title and description referencing the issue

Always explain your reasoning at each step. Think through edge cases before writing code.
If you are uncertain about a file's purpose, read it before modifying it."""

# ── Agent setup ───────────────────────────────────────────────────────────────

agent = Assistant(
    llm=LLM_CONFIG,
    name="GitHub Developer Assistant",
    description="Reads issues, fixes bugs, opens pull requests -- locally via MCP.",
    system_message=SYSTEM_PROMPT,
    mcp_servers=MCP_SERVERS,
)

# ── Run the agent ─────────────────────────────────────────────────────────────

def run_agent(task: str):
    """
    Run the agent on a task description and stream the output.
    The agent will make tool calls automatically; Qwen-Agent handles
    the full loop including tool execution and result injection.
    """
    messages = [{"role": "user", "content": task}]

    print(f"Task: {task}\n{'─' * 70}")

    # Qwen-Agent's run() is a generator that yields intermediate steps
    # Each yielded message shows a tool call, a tool result, or the final answer
    for response in agent.run(messages=messages):
        # response is a list of messages representing the conversation so far
        # The last message contains the most recent output
        last = response[-1]
        role    = last.get("role", "")
        content = last.get("content", "")

        if role == "assistant" and content:
            # Strip and display the thinking block separately for readability
            import re
            thinking = re.search(r"(.*?)", content, re.DOTALL)
            if thinking:
                print(f"[thinking] {thinking.group(1).strip()[:200]}...")
            clean = re.sub(r".*?", "", content, flags=re.DOTALL).strip()
            if clean:
                print(f"[agent] {clean}")

        elif role == "tool":
            tool_name = last.get("name", "unknown_tool")
            print(f"[tool:{tool_name}] result received")


if __name__ == "__main__":
    run_agent(
        "In the repository myorg/my-api-project, find the open issue about "
        "the login endpoint returning 200 for invalid tokens. Read the relevant "
        "code and tests, fix the bug, and open a pull request."
    )
```

**How to run:**

```
python github_agent_qwenagent.py
```

#### // Part 3: Raw MCP SDK Implementation

For teams who need full control over every protocol message, custom error handling, per-tool retry logic, and audit logging of every tool call and result:

```
# github_agent_raw.py
# Prerequisites: pip install mcp openai httpx
#   GITHUB_TOKEN env var must be set, local server must be running
#
# How to run:
#   python github_agent_raw.py

import asyncio
import json
import os
import re
from openai import AsyncOpenAI
from mcp import ClientSession, StdioServerParameters
from mcp.client.stdio import stdio_client

# ── Local serving client ───────────────────────────────────────────────────────
client = AsyncOpenAI(
    base_url="http://localhost:30000/v1",
    api_key="EMPTY",
)

MODEL = "Qwen/Qwen3.6-35B-A3B"

# ── Response processing ───────────────────────────────────────────────────────

def strip_thinking(text: str) -> str:
    """Remove ... blocks. Used when we only need the action."""
    return re.sub(r".*?", "", text, flags=re.DOTALL).strip()

def extract_thinking(text: str) -> str:
    """Extract the content of the thinking block for logging."""
    m = re.search(r"(.*?)", text, re.DOTALL)
    return m.group(1).strip() if m else ""

def process_response(response, preserve_thinking: bool = True) -> dict:
    """
    Process a chat completion response from Qwen3.6.

    Handles two output formats:
    1. Tool call via the API's function_call / tool_calls field (when --tool-call-parser is active)
    2. Tool call embedded in the message content as JSON

    Args:
        response:          The OpenAI-compatible completion response
        preserve_thinking: If True, keep thinking content in output for
                           the next turn's KV cache benefit

    Returns:
        dict with thinking, tool_calls, final_answer, has_tool_calls, is_terminal
    """
    choice  = response.choices[0]
    message = choice.message

    # Path 1: Tool calls in the structured field (preferred -- requires tool-call-parser flag)
    if message.tool_calls:
        tool_calls = [
            {
                "name":      tc.function.name,
                "arguments": json.loads(tc.function.arguments),
                "call_id":   tc.id,
            }
            for tc in message.tool_calls
        ]
        thinking = extract_thinking(message.content or "")
        return {
            "thinking":       thinking if preserve_thinking else "",
            "tool_calls":     tool_calls,
            "final_answer":   "",
            "has_tool_calls": True,
            "is_terminal":    False,
        }

    # Path 2: Tool calls embedded in content text (fallback)
    content = message.content or ""
    tag_matches = re.findall(r"(.*?)", content, re.DOTALL)
    tool_calls = []
    for m in tag_matches:
        try:
            tool_calls.append(json.loads(m.strip()))
        except json.JSONDecodeError:
            pass

    thinking     = extract_thinking(content)
    final_answer = re.sub(r".*?", "", content, flags=re.DOTALL)
    final_answer = re.sub(r".*?", "", final_answer, flags=re.DOTALL).strip()

    return {
        "thinking":       thinking if preserve_thinking else "",
        "tool_calls":     tool_calls,
        "final_answer":   final_answer,
        "has_tool_calls": len(tool_calls) > 0,
        "is_terminal":    len(tool_calls) == 0 and bool(final_answer),
    }

# ── Core agent loop ───────────────────────────────────────────────────────────

async def run_github_agent(task: str, repo: str, max_turns: int = 20):
    """
    Run the GitHub developer assistant agent.

    Connects to filesystem and GitHub MCP servers, discovers their tools,
    and runs the Qwen3.6 agent loop until the task is complete or max_turns reached.
    """
    # Start both MCP servers and establish sessions
    fs_params = StdioServerParameters(
        command="npx",
        args=["-y", "@modelcontextprotocol/server-filesystem", "."],
    )
    gh_params = StdioServerParameters(
        command="npx",
        args=["-y", "@modelcontextprotocol/server-github"],
        env={**os.environ, "GITHUB_TOKEN": os.environ.get("GITHUB_TOKEN", "")},
    )

    async with stdio_client(fs_params) as (fs_read, fs_write), \
               ClientSession(fs_read, fs_write) as fs_session, \
               stdio_client(gh_params) as (gh_read, gh_write), \
               ClientSession(gh_read, gh_write) as gh_session:

        # Initialize both sessions
        await fs_session.initialize()
        await gh_session.initialize()

        # Discover all available tools from both servers
        fs_tools_result = await fs_session.list_tools()
        gh_tools_result = await gh_session.list_tools()

        # Build the OpenAI-format tool list for the model
        all_tools = []
        tool_to_session = {}   # Maps tool name to the MCP session that owns it

        for tool in fs_tools_result.tools:
            all_tools.append({
                "type": "function",
                "function": {
                    "name":        tool.name,
                    "description": tool.description,
                    "parameters":  tool.inputSchema,
                }
            })
            tool_to_session[tool.name] = fs_session

        for tool in gh_tools_result.tools:
            all_tools.append({
                "type": "function",
                "function": {
                    "name":        tool.name,
                    "description": tool.description,
                    "parameters":  tool.inputSchema,
                }
            })
            tool_to_session[tool.name] = gh_session

        print(f"Tools available: {len(all_tools)} ({len(fs_tools_result.tools)} filesystem, "
              f"{len(gh_tools_result.tools)} GitHub)")

        # Build conversation history
        system_prompt = f"""You are a senior software engineer with access to the repository {repo}.
Use the available tools to investigate issues, read code, write fixes, and create pull requests.
Think step by step. Read before you modify. Minimal changes only."""

        messages = [
            {"role": "system",  "content": system_prompt},
            {"role": "user",    "content": task},
        ]

        # ── Agent loop ─────────────────────────────────────────────────────────
        for turn in range(max_turns):
            print(f"\n[Turn {turn + 1}]")

            # Call the model
            response = await client.chat.completions.create(
                model=MODEL,
                messages=messages,
                tools=all_tools if all_tools else None,
                tool_choice="auto",
                # Thinking mode sampling params from the official best practices
                temperature=0.6,
                top_p=0.95,
                top_k=20,
                min_p=0.0,
                max_tokens=4096,
                extra_body={
                    # preserve_thinking keeps reasoning context across turns
                    # for KV cache efficiency on long agent sessions
                    "preserve_thinking": True,
                }
            )

            result = process_response(response, preserve_thinking=True)

            if result["thinking"]:
                print(f"[thinking] {result['thinking'][:200]}...")

            # Terminal state -- agent has produced a final answer
            if result["is_terminal"]:
                print(f"\n[DONE]\n{result['final_answer']}")
                return result["final_answer"]

            # Tool call state -- execute each tool and inject results
            if result["has_tool_calls"]:
                # Append the assistant's message with tool calls to history
                messages.append({
                    "role":       "assistant",
                    "content":    response.choices[0].message.content or "",
                    "tool_calls": response.choices[0].message.tool_calls or [],
                })

                for call in result["tool_calls"]:
                    tool_name = call["name"]
                    tool_args = call.get("arguments", {})
                    call_id   = call.get("call_id", "")

                    print(f"[tool] {tool_name}({json.dumps(tool_args)[:80]}...)")

                    session = tool_to_session.get(tool_name)
                    if not session:
                        result_content = f"Error: tool '{tool_name}' not found"
                    else:
                        try:
                            tool_result = await session.call_tool(tool_name, tool_args)
                            result_content = str(tool_result.content)
                            # Truncate very long results to protect context budget
                            if len(result_content) > 12000:
                                result_content = result_content[:12000] + "\n...[truncated]"
                        except Exception as e:
                            result_content = f"Error: {e}"

                    print(f"[result] {result_content[:150]}...")

                    messages.append({
                        "role":        "tool",
                        "content":     result_content,
                        "tool_call_id": call_id,
                        "name":        tool_name,
                    })

        print(f"[WARNING] max_turns ({max_turns}) reached without terminal state")


# ── Entry point ───────────────────────────────────────────────────────────────

if __name__ == "__main__":
    asyncio.run(run_github_agent(
        task=(
            "Find the open issue about the login endpoint returning 200 for invalid tokens. "
            "Read src/auth.py and tests/test_auth.py to understand the bug. "
            "Fix the verify_token function and open a pull request with your changes."
        ),
        repo="myorg/my-api-project",
    ))
```

**How to run:**

```
python github_agent_raw.py
```

The raw SDK path gives you what Qwen-Agent abstracts: you can see every tool call, every result, and every message injected into the conversation history. The `tool_to_session` routing dict is the key mechanism; it maps each tool name to the MCP session that owns it, so the agent can call any tool from any connected server without knowing which server provides it.

### Writing a Custom MCP Server

Pre-built MCP servers handle the filesystem and GitHub. When you need something that does not exist — querying an internal database, wrapping a CI/CD API, running code analysis tools — you write an MCP server. Here is a complete `code_quality` server that exposes `ruff` and `pytest` as MCP tools.

```
# code_quality_server.py
# A custom MCP server exposing code quality tools to Qwen3.6.
#
# Prerequisites:
#   pip install mcp ruff pytest
#
# How to run standalone (for testing):
#   python code_quality_server.py
#
# To add to the Qwen-Agent config:
#   "code_quality": {
#       "command": "python",
#       "args": ["/absolute/path/to/code_quality_server.py"]
#   }

import asyncio
import json
import subprocess
import sys
from mcp.server.fastmcp import FastMCP

# FastMCP is a high-level MCP server framework -- reduces boilerplate significantly
mcp = FastMCP("code_quality")


@mcp.tool()
def run_linter(file_path: str, fix: bool = False) -> str:
    """
    Run ruff linter on a Python file and return structured lint results.
    Use this before modifying a file to understand its current quality state,
    and after making changes to verify the fix did not introduce new issues.

    Args:
        file_path: Absolute or relative path to the Python file to lint.
        fix:       If true, automatically fix safe issues in place.

    Returns:
        JSON string with issues list, issue count, and files modified.
    """
    cmd = ["python", "-m", "ruff", "check", file_path, "--output-format=json"]
    if fix:
        cmd.append("--fix")

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
        # ruff returns exit code 1 when issues are found -- not an error
        output = result.stdout or result.stderr

        # Parse ruff's JSON output
        try:
            issues = json.loads(output) if output.strip() else []
        except json.JSONDecodeError:
            issues = []

        formatted = [
            {
                "line":    issue.get("location", {}).get("row", 0),
                "col":     issue.get("location", {}).get("column", 0),
                "code":    issue.get("code", ""),
                "message": issue.get("message", ""),
                "fix_available": issue.get("fix") is not None,
            }
            for issue in issues
            if isinstance(issue, dict)
        ]

        return json.dumps({
            "file":         file_path,
            "issues":       formatted,
            "total_issues": len(formatted),
            "fixed":        "auto-fix applied" if fix else "no auto-fix",
        }, indent=2)

    except subprocess.TimeoutExpired:
        return json.dumps({"error": "Linter timed out after 30s", "file": file_path})
    except FileNotFoundError:
        return json.dumps({"error": "ruff not found -- install with: pip install ruff"})


@mcp.tool()
def run_tests(target: str, verbose: bool = False) -> str:
    """
    Run pytest on a module or directory and return structured pass/fail results.
    Use this after writing a fix to verify the fix makes failing tests pass
    without breaking other tests.

    Args:
        target:  Path to the test file or directory to run (e.g. tests/, tests/test_auth.py)
        verbose: If true, include full pytest output in the result.

    Returns:
        JSON string with pass count, fail count, failure details, and duration.
    """
    cmd = ["python", "-m", "pytest", target, "--json-report", "--json-report-file=-", "-q"]
    if verbose:
        cmd.append("-v")

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
        output = result.stdout

        # Parse pytest-json-report output if available
        try:
            report = json.loads(output)
            summary  = report.get("summary", {})
            failures = [
                {
                    "test":    t["nodeid"],
                    "message": t.get("call", {}).get("longrepr", "")[:500],
                }
                for t in report.get("tests", [])
                if t.get("outcome") == "failed"
            ]
            return json.dumps({
                "target":   target,
                "passed":   summary.get("passed", 0),
                "failed":   summary.get("failed", 0),
                "errors":   summary.get("error", 0),
                "total":    summary.get("total", 0),
                "duration": summary.get("duration", 0),
                "failures": failures,
                "stdout":   result.stdout[:2000] if verbose else "",
            }, indent=2)

        except json.JSONDecodeError:
            # Fallback: return raw output if JSON report not available
            return json.dumps({
                "target":  target,
                "stdout":  result.stdout[:3000],
                "stderr":  result.stderr[:1000],
                "exit_code": result.returncode,
            })

    except subprocess.TimeoutExpired:
        return json.dumps({"error": f"Tests timed out after 120s for target: {target}"})
    except FileNotFoundError:
        return json.dumps({"error": "pytest not found -- install with: pip install pytest"})


if __name__ == "__main__":
    mcp.run(transport="stdio")
```

Add it to either agent implementation's server config:

```
# In Qwen-Agent MCP_SERVERS dict:
"code_quality": {
    "command": "python",
    "args": ["/absolute/path/to/code_quality_server.py"]
}

# In the raw SDK, add a third StdioServerParameters:
cq_params = StdioServerParameters(
    command="python",
    args=["/absolute/path/to/code_quality_server.py"],
)
```

Test the server standalone before connecting the agent:

```
# Test the server in MCP inspector mode
npx @modelcontextprotocol/inspector python code_quality_server.py
# Opens a browser UI where you can call run_linter and run_tests directly
```

### Tuning Thinking Mode and Preserving Reasoning
The thinking mode decision affects latency significantly enough that it is worth treating as an explicit architecture choice, not an afterthought.

In thinking mode, Qwen3.6 generates a chain-of-thought reasoning trace inside `...` tags before producing its action. For a 5-step agent task, that trace adds 1,000 to 5,000 tokens per turn depending on task complexity. Those tokens take time to generate and consume context budget.

When that cost is worth paying:

-   Planning steps where the agent decides what to do next.
-   Debugging sessions where the problem is genuinely ambiguous.
-   Multi-file refactoring where the agent needs to reason about side effects across files.

The reasoning trace catches mistakes before they become tool calls with wrong arguments. When it is not worth paying: mechanical tool-call loops where each step is unambiguous — **list directory → read file → write file → commit**. The model does not need to think hard about these steps. Non-thinking mode is faster and produces the same quality output.

Switch modes per-request, not globally:

```
# Thinking mode (planning, debugging, complex multi-file tasks)
THINKING_PARAMS = {
    "temperature": 0.6,
    "top_p":       0.95,
    "top_k":       20,
    "min_p":       0.0,
}

# Non-thinking mode (mechanical loops, fast status checks)
# Pass enable_thinking=False in the chat template, or use system prompt:
# Add "/no_think" to the system prompt to suppress thinking mode.
NON_THINKING_PARAMS = {
    "temperature": 0.7,
    "top_p":       0.8,
    "top_k":       20,
    "min_p":       0.0,
}
```

The `preserve_thinking` flag — the Qwen3.6-specific capability that retains reasoning context across turns — directly impacts inference efficiency when prefix caching is active. Here is why it matters practically: in a 10-turn agent session, each turn shares a prefix of the conversation history. When `preserve_thinking=True`, the full reasoning trace from prior turns stays in the history. The KV cache on the server side recognizes the shared prefix across turns and avoids recomputing it. The effective tokens-per-second rate for long sessions is meaningfully higher than without it, particularly when serving infrastructure like SGLang with `--enable-prefix-caching` is running.

The practical rule: use `preserve_thinking=True` for agent sessions that will run for more than 5 turns. Use `preserve_thinking=False` (or non-thinking mode) for single-turn queries and short pipelines where the overhead is a waste.
