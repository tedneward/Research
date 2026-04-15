title=MemPalace
tags=ai, agent
summary=The best-benchmarked open-source AI memory system.
~~~~~~

[Website](http://mempalaceofficial.com/) | [Source](https://github.com/MemPalace/mempalace)

## What it is

MemPalace stores your conversation history as verbatim text and retrieves it with semantic search. It does not summarize, extract, or paraphrase. The index is structured — people and projects become _wings_, topics become _rooms_, and original content lives in _drawers_ — so searches can be scoped rather than run against a flat corpus.

The retrieval layer is pluggable. The current default is ChromaDB; the interface is defined in [`mempalace/backends/base.py`](https://github.com/MemPalace/mempalace/blob/develop/mempalace/backends/base.py) and alternative backends can be dropped in without touching the rest of the system.

Nothing leaves your machine unless you opt in.

Architecture, concepts, and mining flows: [mempalaceofficial.com/concepts/the-palace](https://mempalaceofficial.com/concepts/the-palace.html).
