title=FactDB
tags=storage, event
summary=Temporal fact tracking with entity resolution and audit trails for Ruby
~~~~~~

[Source](https://github.com/MadBomber/fact_db)

FactDb implements the Event Clock concept - capturing organizational knowledge through temporal facts with validity periods (valid_at/invalid_at), entity resolution, and audit trails back to source content.

Key Features

* Temporal Facts - Track facts with validity periods
* Entity Resolution - Resolve mentions to canonical entities
* Audit Trails - Every fact links back to source content
* Multiple Extractors - Extract facts manually, via LLM, or rule-based
* Semantic Search - PostgreSQL with pgvector
* Concurrent Processing - Batch process with parallel pipelines
* Output Formats - JSON, triples, Cypher, or text for LLM consumption
* Temporal Queries - Fluent API for point-in-time queries and diffs

