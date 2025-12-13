title=Zep
tags=backend, ai, cloud
summary=A context engineering platform that systematically assembles personalized context—user preferences, traits, and business data—for reliable agent applications.
~~~~~~

[Website](https://help.getzep.com/overview) [Source](https://github.com/getzep)

Zep combines agent memory, Graph RAG, and context assembly capabilities to deliver comprehensive personalized context that reduces hallucinations and improves accuracy.

* Knowledge Graph: Zep’s unified knowledge store for agents. Nodes represent entities, edges represent facts/relationships. The graph updates dynamically in response to new data. [Docs](https://help.getzep.com/understanding-the-graph)
* Zep’s Context Block: Optimized string containing a user summary and facts from the knowledge graph most relevant to the current thread. Also contains dates when facts became valid and invalid. Provide this to your chatbot as “memory”. [Docs](https://help.getzep.com/retrieving-memory#zeps-context-block)
* Fact Invalidation: When new data invalidates a prior fact, the time the fact became invalid is stored on that fact’s edge in the knowledge graph. [Docs](https://help.getzep.com/facts)
* JSON/text/message: Types of data that can be ingested into the knowledge graph. Can represent business data, documents, chat messages, emails, etc. [Docs](https://help.getzep.com/adding-data-to-the-graph)
* Custom Entity/Edge Types: Feature allowing use of Pydantic-like classes to customize creation/retrieval of entities and relations in the knowledge graph. [Docs](https://help.getzep.com/customizing-graph-structure#custom-entity-and-edge-types)
* Graph: Represents an arbitrary knowledge graph for storing up-to-date knowledge about an object or system. For storing up-to-date knowledge about a user, a user graph should be used. [Docs](https://help.getzep.com/graph-overview)
* User Graph: Special type of graph for storing personalized memory for a user of your application. [Docs](https://help.getzep.com/users)
* User: A user in Zep represents a user of your application, and has its own User Graph and thread history. [Docs](https://help.getzep.com/users)
* Threads: Conversation threads of a user. By default, all messages added to any thread of that user are ingested into that user’s graph. [Docs](https://help.getzep.com/threads)
* `graph.add` & `thread.add_messages`: Methods for adding data to a graph and user graph respectively. [Docs](https://help.getzep.com/adding-data-to-the-graph) [Docs](https://help.getzep.com/memory#adding-memory)
* `graph.search` & `thread.get_user_context`: Low level and high level methods respectively for retrieving from the knowledge graph. [Docs](https://help.getzep.com/searching-the-graph) [Docs](https://help.getzep.com/memory#retrieving-memory)
* User Summary Instructions: Customize how Zep generates entity summaries for users in their knowledge graph. Up to 5 custom instructions per user to guide summary generation. [Docs](https://help.getzep.com/users#user-summary-instructions)
* Agentic Tool: Use Zep’s memory retrieval methods as agentic tools, enabling your agent to query for relevant information from the user’s knowledge graph. [Docs](https://help.getzep.com/quickstart#use-zep-as-an-agentic-tool)

