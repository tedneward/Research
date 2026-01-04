title=AI Agent ARCHITECTURE.md file examples
tags=ai, agent, coding, specification, architecture
summary=A collection of ARCHITECTURE.md exemplars
~~~~~~

### ChatGPT-generated

```
# Architecture Overview

## Layers

### Domain
- Business rules
- No framework imports
- Pure Python logic

### Persistence
- SQLite + SQLAlchemy
- Implements repository interfaces

### API
- FastAPI routes
- Input validation
- Maps domain errors to HTTP responses

## Data Flow

HTTP Request
→ API layer
→ Domain services
→ Repository
→ Database

## Non-Goals
- No background jobs
- No distributed transactions

```

