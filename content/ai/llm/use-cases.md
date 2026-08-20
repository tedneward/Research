title=LLM use cases
tags=ai, llm, tool
summary=A collection of ideas for how to use LLMs/LLM-related tools.
~~~~~~

## Project 1: Building a Private Document Brain

I work with a mix of research papers, contracts, and project notes that accumulate faster than I can properly index them. At some point, I had three years' worth of PDFs, a handful of Word documents, and a folder of plain-text notes all sitting on disk — theoretically useful, none of them searchable in any meaningful way. So I set up **[AnythingLLM](https://anythingllm.com/)** running locally against Llama 3.2 via Ollama. Getting it running takes one command:

```
# Pull and run AnythingLLM via Docker
# Everything stays on your machine -- no data leaves
docker run -d \
  --name anythingllm \
  -p 3001:3001 \
  -v anythingllm_storage:/app/server/storage \
  mintplexlabs/anythingllm

# Then open http://localhost:3001 in your browser
# Connect it to Ollama (already running at localhost:11434)
# and pull the model you want to use for document chat
ollama pull llama3.2:3b
```

I loaded a folder of research papers and asked it questions that required reading across multiple documents. This is the prompt I used:

> "What are the key differences in how the 2023 and 2025 papers approach retrieval augmentation? Do they agree on chunking strategy or is there disagreement?"

The model pulled the right sections from each paper, cited which document each point came from, and identified a genuine methodological disagreement I had not noticed reading them separately. Every byte of those papers stayed on my machine.

The model that worked best for this: [Llama 3.2 3B](https://ollama.com/library/llama3.2) for speed on lighter hardware, and [Mistral 7B](https://ollama.com/library/mistral) if you have 8 GB of VRAM and want stronger synthesis across longer documents. For straight document Q&A on a machine with 16 GB of RAM, the difference is noticeable. Mistral reads more carefully.

**Why this matters**: This is the use case that makes local RAG genuinely better than cloud — not just equivalent. The document does not move. The AI does. Everything that makes cloud AI great — the reasoning, the synthesis, and the ability to answer questions across multiple sources — is present. Everything that makes it uncomfortable for sensitive material — the data transfer, the server-side logging, and the third-party dependency — is gone.

## Project 2: Running a Code Reviewer That Never Judges You

Set up **[Qwen2.5-Coder 7B](https://huggingface.co/Qwen/Qwen2.5-Coder-7B-Instruct)** locally via Ollama. This model was specifically trained on code; it consistently outperforms general-purpose models of the same size on coding benchmarks. At 7B parameters, it runs comfortably on 8 GB of VRAM. I gave it real functions from a live project and asked for three things: security vulnerabilities, edge cases I had not handled, and anywhere I was being unnecessarily clever.

```
# Pull the model
ollama pull qwen2.5-coder:7b

# Run an interactive session
ollama run qwen2.5-coder:7b
```

The system prompt I used for every review session:

```
You are a senior software engineer doing a code review.
Your job is to find problems, not to be encouraging.
Review for:
1. Security vulnerabilities (injection, auth issues, data exposure)
2. Edge cases that are not handled
3. Anywhere the code is more complex than it needs to be
4. Any assumptions that will break under real conditions

Be direct. Do not summarize what the code does.
Start immediately with what you found.
```

## Project 3: Running a Completely Offline AI Assistant
This one sounds simple, but it changed how I think about what AI tools are actually for. I had a 10-hour flight with patchy Wi-Fi and a real backlog of thinking work I had been deferring. I wanted an AI assistant for the whole flight — not intermittently when the connection held, but consistently, without paying for in-flight internet, without worrying about what I was sending through the airline's network.

Before boarding, I pulled a model:

```
# Download before you fly -- this is a 4.1 GB file at Q4 quantization
ollama pull mistral:7b

# Verify it is cached locally
ollama list
# Should show mistral:7b with size and last modified date
```

That is the entire setup. Once downloaded, Ollama runs the model entirely from local files. Put the laptop in airplane mode. Open a terminal. Type `ollama run mistral:7b`. The model loads in about 8 seconds on an M2 MacBook Pro and starts responding immediately. No ping required. The model does not know or care that you are at 35,000 feet.

What I used it for during that flight:

1.  Drafting emails to edit later. I described the situation and the outcome I wanted. The model wrote a draft. I edited it. Faster than writing from scratch, workable without sending anything to a server.
2.  Working through a technical architecture question. I described a system design problem I had been sitting with. Having something to push back on my ideas — even something that does not fully understand my codebase — is useful. The model asked clarifying questions. I answered them. By the end, I had a clearer position than when I started.
3.  Outlining this article. Genuinely. I described the five use cases I wanted to cover, asked it to help me structure them, and worked through the order and emphasis during the descent.

## Project 4: Creating a Personal Thinking Partner That Knows Your Context

   
Every time you open a new chat with Claude, ChatGPT, or any cloud AI, you start from zero. The model knows nothing about you, your work, your ongoing projects, what you have already tried, or how you prefer to think through problems. The first five minutes of any substantive session are spent re-establishing the context you had to establish in the last session too. It gets old.

Local models solve this with a feature called a Modelfile — a short configuration file that bakes a persistent system prompt directly into a named model. You create it once, and every session with that model starts with full context. No re-explaining. No preamble.

Here is the **Modelfile** I built:

```
# Save this as Modelfile (no extension) in any directory
# Then run: ollama create myassistant -f Modelfile

FROM llama3.2:3b

# This SYSTEM block is injected at the start of every conversation
SYSTEM """
You are my personal thinking partner. Here is the context you always have:

ABOUT ME:
I am a technical writer and developer working primarily on AI tooling and
developer education. I think best by writing and talking through problems
out loud before committing to a direction.

CURRENT PROJECTS:
- A series of technical articles on agentic AI and LLM tooling
- A Python library for structured prompt management
- Researching retrieval-augmented generation for personal knowledge bases

HOW I WORK BEST:
- Push back on my assumptions. I prefer disagreement to agreement.
- Ask one clarifying question if my prompt is ambiguous before answering.
- When I am explaining a decision, challenge whether my reasoning is sound.
- Do not summarize what I said back to me. Start with your actual response.

WHAT YOU SHOULD KNOW:
- I have been working in software for 8 years. Do not over-explain fundamentals.
- When I ask for help writing, I want structure and directness, not fluff.
- I am allergic to bullet points that could have been prose.
"""

# Set reasonable generation parameters
PARAMETER temperature 0.7
PARAMETER top_p 0.9
PARAMETER num_ctx 4096
```

Creating and running it:

```
# Create the model from your Modelfile
ollama create myassistant -f Modelfile

# Verify it was created
ollama list

# Run it -- every session starts with your full context
ollama run myassistant
```

The difference in practice is immediate. Compare these two responses to the same question — "_Should I restructure this article to lead with the code examples?_" — from a context-free model versus the personalized one:

**Context-free model:**

> "That depends on your audience. If your readers are more technical, leading with code examples can be effective because it immediately shows them what they'll learn. On the other hand, if you want to build context first..."

**Personalized model:**

> "What's the current structure? Leading with code only works if the code is self-explanatory enough that a reader can follow without background. Given that you said you're writing for developers who are learning the tooling, not seasoned practitioners, I'd push back on leading with code. Give me the first section, and I'll tell you if it stands on its own."

The second response starts from your actual situation. It does not waste time on the "it depends" frame. It does not know you want to avoid bullet points because it was trained on your preferences; it knows because you told it once, and it always remembers.

Update the **Modelfile** whenever your projects change. Run `ollama create myassistant -f Modelfile` again, and it overwrites the previous version.

## Project 5: Building a Local AI Agent That Actually Uses Tools
First, make sure Ollama is serving the model:

```
ollama serve             # starts the Ollama API server
ollama pull llama3.2:3b  # pulls the instruct model if not already cached
```

The [Ollama API is OpenAI-compatible](https://ollama.com/blog/openai-compatibility), which means you can swap it into any framework that targets the OpenAI API by changing one line. Here is the full local agent:

```
# local_agent.py
# Install: pip install openai duckduckgo-search
# Requires: Ollama running locally at http://localhost:11434

from openai import OpenAI
import json
from duckduckgo_search import DDGS

# Point the OpenAI client at your local Ollama instance
# This is the one-line swap that makes any OpenAI-compatible tool work locally
client = OpenAI(
    base_url="http://localhost:11434/v1",
    api_key="ollama"  # Ollama does not require a real key -- this can be any string
)

MODEL = "llama3.2:3b"  # Change this to any model you have pulled via Ollama

# Define the tools the agent can call
tools = [
    {
        "type": "function",
        "function": {
            "name": "web_search",
            "description": (
                "Search the web for current information on a topic. "
                "Use when you need facts or data that may have changed recently. "
                "Do NOT use for information already in the conversation."
            ),
            "parameters": {
                "type": "object",
                "properties": {
                    "query": {
                        "type": "string",
                        "description": "Specific search query, 3-8 words."
                    }
                },
                "required": ["query"]
            }
        }
    },
    {
        "type": "function",
        "function": {
            "name": "write_file",
            "description": "Save text content to a local file. Use when the task is complete.",
            "parameters": {
                "type": "object",
                "properties": {
                    "filename": {
                        "type": "string",
                        "description": "The output filename, e.g. 'summary.md'"
                    },
                    "content": {
                        "type": "string",
                        "description": "The full text content to write."
                    }
                },
                "required": ["filename", "content"]
            }
        }
    }
]

def web_search(query: str) -> str:
    """Run a real web search using DuckDuckGo -- no API key required."""
    with DDGS() as ddgs:
        results = list(ddgs.text(query, max_results=4))
    if not results:
        return "No results found."
    # Format results cleanly for the model to read
    return "\n\n".join(
        f"Title: {r['title']}\nURL: {r['href']}\nSnippet: {r['body']}"
        for r in results
    )

def write_file(filename: str, content: str) -> str:
    """Write content to a file in the current directory."""
    with open(filename, "w") as f:
        f.write(content)
    return f"File '{filename}' written successfully ({len(content)} characters)."

def run_tool(name: str, arguments: dict) -> str:
    """Route tool calls to the correct function."""
    if name == "web_search":
        return web_search(arguments["query"])
    elif name == "write_file":
        return write_file(arguments["filename"], arguments["content"])
    return f"Unknown tool: {name}"

def run_agent(goal: str, max_turns: int = 10) -> None:
    """
    The agent loop:
    1. Send the goal and current conversation to the local model
    2. If the model calls a tool, execute it and add the result to the conversation
    3. If the model is done, print the final message and exit
    4. Repeat until done or max_turns reached
    """
    system = """You are a research agent. When given a goal:
1. Use web_search to find accurate, current information -- search multiple times for different aspects
2. When you have enough information, use write_file to save a structured summary
3. The file should include: key findings, why they matter, and sources

Think carefully before each action. When the file is written, your task is complete."""

    messages = [{"role": "user", "content": goal}]

    for turn in range(max_turns):
        print(f"\n--- Turn {turn + 1} ---")

        # Send conversation to the local model
        response = client.chat.completions.create(
            model=MODEL,
            messages=[{"role": "system", "content": system}] + messages,
            tools=tools,
            tool_choice="auto"
        )

        choice = response.choices[0]
        message = choice.message

        # Model is done -- print and exit
        if choice.finish_reason == "stop":
            print(f"\nAgent finished: {message.content}")
            return

        # Model called one or more tools -- execute each one
        if choice.finish_reason == "tool_calls" and message.tool_calls:
            # Add the model's message (with tool calls) to conversation history
            messages.append({
                "role": "assistant",
                "content": message.content,
                "tool_calls": [
                    {
                        "id": tc.id,
                        "type": "function",
                        "function": {
                            "name": tc.function.name,
                            "arguments": tc.function.arguments
                        }
                    }
                    for tc in message.tool_calls
                ]
            })

            # Execute each tool call and add results to conversation
            for tool_call in message.tool_calls:
                name = tool_call.function.name
                args = json.loads(tool_call.function.arguments)

                print(f"Tool: {name}({args})")
                result = run_tool(name, args)
                print(f"Result preview: {result[:120]}...")

                # Tool results must reference the tool_call_id they are responding to
                messages.append({
                    "role": "tool",
                    "tool_call_id": tool_call.id,
                    "content": result
                })

    print("Max turns reached.")

if __name__ == "__main__":
    goal = (
        "Find the three most actively discussed open-source RAG frameworks "
        "in 2026 and write a summary to rag-summary.md explaining what each "
        "one does and who it is best for."
    )
    print(f"Goal: {goal}\n")
    run_agent(goal)
```

**What this code does**: The `OpenAI` client is pointed at `localhost:11434` instead of OpenAI's servers. That one change is the entire difference between a cloud agent and a local one. DuckDuckGo search requires no API key. The agent runs the full ReAct loop — reason, act, observe, reason again — until it writes the output file. Every step runs on your machine.

## Reading

### Articles, Blogs, Essays

* [5 Cool Things I Did with Local Language Models](https://www.kdnuggets.com/5-cool-things-i-did-with-local-language-models)