title=qmd
tags=tool, ai, llm, agent, mcp, library
summary=Mini cli search engine for your docs, knowledge bases, meeting notes, whatever.
~~~~~~

[Source](https://github.com/tobi/qmd)

An on-device search engine for everything you need to remember. Index your markdown notes, meeting transcripts, documentation, and knowledge bases. Search with keywords or natural language. Ideal for your agentic flows.

QMD combines BM25 full-text search, vector semantic search, and LLM re-ranking—all running locally via node-llama-cpp with GGUF models.

## Getting Started

```
# Install globally (Node or Bun)
npm install -g @tobilu/qmd
# or
bun install -g @tobilu/qmd

# Or run directly
npx @tobilu/qmd ...
bunx @tobilu/qmd ...

# Create collections for your notes, docs, and meeting transcripts
qmd collection add ~/notes --name notes
qmd collection add ~/Documents/meetings --name meetings
qmd collection add ~/work/docs --name docs

# Add context to help with search results, each piece of context will be returned when matching sub documents are returned. This works as a tree. This is the key feature of QMD as it allows LLMs to make much better contextual choices when selecting documents. Don't sleep on it!
qmd context add qmd://notes "Personal notes and ideas"
qmd context add qmd://meetings "Meeting transcripts and notes"
qmd context add qmd://docs "Work documentation"

# Generate embeddings for semantic search
qmd embed

# Search across everything
qmd search "project timeline"           # Fast keyword search
qmd vsearch "how to deploy"             # Semantic search
qmd query "quarterly planning process"  # Hybrid + reranking (best quality)

# Get a specific document
qmd get "meetings/2024-01-15.md"

# Get a document by docid (shown in search results)
qmd get "#abc123"

# Get multiple documents by glob pattern
qmd multi-get "journals/2025-05*.md"

# Search within a specific collection
qmd search "API" -c notes

# Export all matches for an agent
qmd search "API" --all --files --min-score 0.3
```

## Using with AI Agents
QMD's --json and --files output formats are designed for agentic workflows:

        # Get structured results for an LLM
        qmd search "authentication" --json -n 10

        # List all relevant files above a threshold
        qmd query "error handling" --all --files --min-score 0.4

        # Retrieve full document content
        qmd get "docs/api-reference.md" --full

## MCP Server
Although the tool works perfectly fine when you just tell your agent to use it on the command line, it also exposes an MCP (Model Context Protocol) server for tighter integration.

Tools exposed:

* query — Search with typed sub-queries (lex/vec/hyde), combined via RRF + reranking
* get — Retrieve a document by path or docid (with fuzzy matching suggestions)
* multi_get — Batch retrieve by glob pattern, comma-separated list, or docids
* status — Index health and collection info, including each collection's top metadata keys
* metadata — Discover metadata keys, types, and value counts to filter on
