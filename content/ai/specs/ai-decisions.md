title=AI Agent DECISIONS.md file examples
tags=ai, agent, coding, specification, architecture
summary=A collection of DECISIONS.md exemplars
~~~~~~

```
# Architectural Decisions

## SQLite Instead of Postgres
Chosen for simplicity and local deployability.

## Repository Pattern
Used to keep domain logic testable.

## No Async in Domain Layer
Async is limited to API and IO boundaries.
```
