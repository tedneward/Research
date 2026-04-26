title=Agent Harness
tags=ai, agent, harness
summary=A category of tool around LLMs.
~~~~~~

### Google Search AI definition

An AI agent is the model that reasons and decides ("what/why"), while the harness is the surrounding software infrastructure ("how/where") that enables it to act. The agent (LLM) runs in a loop, taking actions and observing results, whereas the harness provides the tools, memory, and persistence needed for that loop to function, essentially acting as the agent's operating system. 

**Key Differences & Examples:** 

-   **Definition:** An Agent is the AI model + Prompting. A Harness is everything else (filesystems, bash, memory).
-   **Role:** The agent handles logic and decision-making; the harness manages tool execution, state saving, and reliability.
-   **Usage Examples:**
    -   **Agent (The "Brain"):** A GPT-4 model told to "fix this bug."
    -   **Harness (The "Wrapper"):** A framework like OpenClaw, LangChain (in ReAct mode), or a Bash script that provides the agent with terminal access, file reading, and saving its own progress, allowing the agent to actually run `git commit` and `test.sh`.
-   **Synonyms/Related Terms:**
    -   **Agent:** LLM agent, Agent loop, Model+Prompt.
    -   **Harness:** Runtime environment, Scaffold, Agent infrastructure, Wrapper, Toolkit. 

**Analogy:** If the agent is the engine, the harness is the entire car (steering, fuel system, dashboard) that makes the engine useful. A harness makes the agent autonomous by giving it a "computer" (bash) rather than just a limited set of tools. 

## Reading

### Articles, Essays, Blogs

- [The Anatomy of an Agent Harness](https://www.langchain.com/blog/the-anatomy-of-an-agent-harness)
- [Fowler Bliki: Harness Engineering](https://martinfowler.com/articles/harness-engineering.html): "The term harness has emerged as a shorthand to mean everything in an AI agent except the model itself - [Agent = Model + Harness](https://blog.langchain.com/the-anatomy-of-an-agent-harness/). That is a very wide definition, and therefore worth narrowing down for common categories of agents. I want to take the liberty here of defining its meaning in the bounded context of using a coding agent. In coding agents, part of the harness is already built in (e.g. via the system prompt, or the chosen code retrieval mechanism, or even a [sophisticated orchestration system](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)). But coding agents also provide us, their users, with many features to build an outer harness specifically for our use case and system."
- [What is an agent harness?](https://parallel.ai/articles/what-is-an-agent-harness)
- [Agent Frameworks vs Agent Harnesses](https://www.linkedin.com/pulse/agent-frameworks-vs-harnesses-tony-kipkemboi-mxmte/):

    - Agent framework: Agent frameworks sit in the middle of the agent development line with raw API-calling code on the far left. They give you structure and abstractions, but you still make a lot of decisions. You pick the memory system, you configure the tools, you define the orchestration logic. The framework has opinions about how things should connect, but it's modular. You can swap components. A framework gives you abstractions for building agents. You define roles, tasks, tools. You specify how agents coordinate, whether they work sequentially or hierarchically. The framework handles the plumbing. Calling the LLM, routing tool outputs, managing the execution loop. But you're still making architectural decisions. The framework is opinionated about what the building blocks look like. It has a memory abstraction, a tool interface, a task structure. But those pieces are swappable. If you don't like the default memory implementation, you can plug in your own. If you want to use a different LLM provider, you configure it. The framework gives you a standard interface, but you're still composing the system. That modularity is the point. Frameworks are built for people who want to build agents, not just use them. You're expected to understand how the pieces fit together, because you're the one deciding which pieces to use.
    - Agent harness: Agent harnesses sit on the far right. They're maximally opinionated. Everything is baked in. You add your API keys, maybe point it at a few tools, and it runs. Memory, context management, the agent loop, safety checks. All of that is decided for you. A harness doesn't give you building blocks. It gives you a complete system. The best recent example is OpenClaw, which went viral a few weeks ago. It's a harness. You download it, add your API keys, and suddenly you have an agent you can chat with on WhatsApp, Telegram, and other platforms. Memory is handled. Context management is handled. The agent loop is handled. Tool calling, permissions, state persistence. All of it is built in. You're not configuring a memory system. You're not deciding how tools get registered or how the agent recovers from errors. Those decisions were made by whoever built the harness. Your job is to point it at a task and let it run. That's the tradeoff. You get something that works immediately, but you don't get to change how it works under the hood. The harness has an opinion about everything, and you're accepting that opinion when you use it.
    - The spectrum matters because it maps to different problems. If you're prototyping, experimenting, or building something custom, you want a framework. You need the flexibility to swap components, test different approaches, and control the details. The framework gives you structure without locking you in. If you need something that works now, reliably, for a specific use case, you want a harness. You're trading control for speed. The harness has already solved the hard problems. Context management, durable execution, error recovery. You're just using the solution.
