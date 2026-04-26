title=agent.cpp
tags=ai, native, agent, library
summary=Building blocks for agents in C++.
~~~~~~

[Source](https://github.com/mozilla-ai/agent.cpp)

Building blocks for local agents in C++.

Note: This library is designed for running small language models locally using llama.cpp. If you want to call external LLM APIs, this is not the right fit.

## Examples
* Context Engineering - Use callbacks to manipulate the context between iterations of the agent loop.
* Memory - Use tools that allow an agent to store and retrieve relevant information across conversations.
* Multi-Agent - Build a multi-agent system with weight sharing where a main agent delegates to specialized sub-agents.
* Shell - Allow an agent to write shell scripts to perform multiple actions at once. Demonstrates human-in-the-loop interactions via callbacks.
* Tracing - Use callbacks to collect a record of the steps of the agent loop with OpenTelemetry.

You need to download a GGUF model in order to run the examples, the default model configuration is set for granite-4.0-micro:

    wget https://huggingface.co/ibm-granite/granite-4.0-micro-GGUF/resolve/main/granite-4.0-micro-Q8_0.gguf

Important: The examples use default ModelConfig values optimized for granite-4.0-micro. If you use a different model, you should adapt these values (context size, temperature, sampling parameters, etc.) to your specific use case.

