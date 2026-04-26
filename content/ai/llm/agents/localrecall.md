title=LocalRecall
tags=ai, tool, agent, platform, knowledge base
summary=100% Local Memory layer and Knowledge base for agents with WebUI.
~~~~~~

[Source](https://github.com/mudler/LocalRecall)

A lightweight, no-frills RESTful API designed for managing knowledge bases and files stored in vector databases—**no GPU, internet, or cloud services required**! LocalRecall provides a simple and generic abstraction layer to handle knowledge retrieval, ideal for AI agents and chatbots to manage both long-term and short-term memory seamlessly.

Currently, LocalRecall is batteries included and supports multiple vector database engines:

-   **Chromem**: Local file-based vector store (default)
-   **PostgreSQL**: Production-ready PostgreSQL with TimescaleDB, pgvector, and pgvectorscale for hybrid search (BM25 + vector similarity)

It can easily integrate with LocalAI, LocalAGI, and other agent frameworks, offering an intuitive web UI for convenient file management, including support for raw text inputs.

## 🌟 Features

-   ⚡ **RESTful API**: Simple and intuitive REST interface for knowledge management.
-   📡 **Fully Local**: Operates offline without external cloud dependencies.
-   📚 **RAG Knowledgebase**: Retrieve-Augmented Generation (RAG) compatible with multiple vector databases.
-   🗃️ **Memory Management**: Ideal for AI-driven applications requiring memory abstraction.
-   📂 **File Support**:
    -   ✅ Markdown
    -   ✅ Plain Text
    -   ✅ PDF
    -   ⏳ More formats coming soon!

