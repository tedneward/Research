title=Agents (AI)
tags=ai
summary=Collection of notes and links on AI "agents".
~~~~~~

"Agents are a system that uses an LLM to dynamically decide the control flow of an application to achieve a user goal."

An agent generally consists of these core components:

* The Model (Brain): The reasoning engine, in our case a Gemini model. It reasons through ambiguity, plans steps, and decides when it needs outside help.
* Tools (Hands and Eyes): Functions the agent can execute to interact with the outside world/environment (e.g., searching the web, reading a file, calling an API).
* Context/Memory (Workspace): The information the agent has access to at any moment. Managing this effectively, known as Context Engineering.
* The Loop (Life): A while loop that allows the model to: Observe → Think → Act → Observe again, until the task is complete.

"The Loop" of nearly every agent is an iterative process:

* Define Tool Definitions: You describe your available tools (e.g., get_weather) to the model using a structured JSON format.
* Call the LLM: You send the user's prompt and the tool definitions to the model.
* Model Decision: The model analyzes the request. If a tool is needed, it returns a structured tool use containing the tool name and arguments.
* Execute Tool (Client Responsibility): The client/application code intercepts this tool use, executes the actual code or API call, and captures the result.
* Respond and Iterate: You send the result (the tool response) back to model. The model uses this new information to decide the next step, either calling another tool or generating the final response.

## Reading

### Articles, Blogs, Essays

- [Practical Guide on how to build an Agent from scratch with Gemini 3](https://www.philschmid.de/building-agents): The core of an Agent is surprisingly simple: It is a Large Language Model (LLM) running in a loop, equipped with tools it can choose to use. If you can write a loop in Python, you can build an agent. This guide will walk you through the process, from a simple API call to a functioning CLI Agent.

