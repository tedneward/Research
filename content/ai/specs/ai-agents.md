title=AI Agent AGENTS.md file examples
tags=ai, agent, codegen
summary=A collection of AGENTS.md exemplars
~~~~~~

Also (apparently) can be called `AI_GUIDELINES.md`

### ChatGPT-generated

```
# AI Development Guidelines

These rules apply to any automated or AI-assisted code changes.

## General Rules
- Prefer small, incremental changes
- Do not introduce new dependencies without approval
- Do not change public APIs unless explicitly instructed

## Code Quality
- Maintain existing style and formatting
- Favor clarity over cleverness
- Add tests for new behavior

## Testing
- All changes must keep existing tests passing
- If tests fail, fix implementation, not tests (unless instructed)

## Architecture Constraints
- Domain layer must not depend on persistence or HTTP layers
- Repository interfaces live in the domain layer

## When Unsure
- Ask clarifying questions before making assumptions
```

### ChatGPT-generated Java examples

#### Minimal "guardrails only"

```
# AI Guidelines

- Do not introduce new dependencies
- Do not change public APIs unless instructed
- Preserve existing behavior and tests
- Follow existing code style
- Ask before making large or cross-cutting changes
```

#### General Java (Gradle/Maven)

Use when: plain Java services, CLI tools, or libraries.

```
# AI Development Guidelines (Java)

These rules apply to all AI-assisted changes in this repository.

## General Behavior
- Prefer small, reviewable changes
- Do not rename public classes, methods, or packages unless instructed
- Do not introduce new dependencies without explicit approval

## Language & Style
- Java 17
- Follow existing formatting and naming conventions
- Avoid Lombok unless already present
- Favor immutability where practical

## Code Structure
- One top-level public class per file
- Keep methods under ~50 lines where reasonable
- Prefer composition over inheritance

## Error Handling
- Do not swallow exceptions
- Use checked exceptions where the API already does
- Do not convert checked exceptions to RuntimeException without cause

## Testing
- Use JUnit 5
- Preserve test intent when fixing failures
- Add tests for new behavior when appropriate

## Build
- Maven/Gradle configuration should not be modified unless requested
- Keep the build reproducible and offline-friendly

## When Unsure
- Ask clarifying questions rather than making assumptions
```

#### Spring Boot Service

```
# AI Development Guidelines (Spring Boot)

These rules apply to any AI-assisted changes.

## Framework Constraints
- Spring Boot 3.x
- Java 17+
- Prefer constructor injection
- Avoid field injection

## Architecture
- Controllers handle HTTP concerns only
- Business logic lives in services
- Persistence logic lives in repositories
- Do not mix layers

## APIs
- Preserve existing endpoint contracts
- Do not change URLs, request/response schemas, or status codes unless instructed
- Validate input using Bean Validation annotations

## Transactions
- Use @Transactional only at service boundaries
- Avoid transactional logic in controllers

## Configuration
- Do not add new application properties unless explicitly requested
- Prefer configuration via existing mechanisms

## Testing
- Unit tests preferred over integration tests unless required
- Use @SpringBootTest sparingly
- Mock external systems

## Logging
- Use SLF4J
- Do not log sensitive data
```

#### Enterprise/Layered Java Architecture

Use when: strict separation, long-lived enterprise code.

```
# AI Development Guidelines (Enterprise Java)

This repository follows strict architectural rules.

## Layering Rules
- API layer depends on Application layer
- Application layer depends on Domain layer
- Domain layer must not depend on any other layer
- Infrastructure depends on Domain and Application layers

Violations are not acceptable.

## Domain Rules
- Domain objects must be persistence-agnostic
- No framework annotations in domain classes
- Domain logic must be testable without Spring

## Dependencies
- No new dependencies without approval
- Avoid transitive dependency expansion

## Backward Compatibility
- Public APIs must remain backward compatible
- Deprecate before removing
- Never silently change behavior

## Error Handling
- Domain exceptions are explicit and meaningful
- Map exceptions at boundaries only

## Testing
- Domain logic must be covered by unit tests
- Infrastructure tests may use real implementations

## Documentation
- Update relevant documentation when behavior changes
```

#### Java Library/SDK

```
# AI Development Guidelines (Java Library)

This project is a public Java library.

## API Stability
- Public APIs are stable and must not change without instruction
- Do not rename public types or methods
- Do not change method signatures or semantics

## Compatibility
- Maintain source and binary compatibility
- Avoid reflection-based solutions

## Dependencies
- Minimize dependencies
- Do not add dependencies unless explicitly requested

## Style
- No framework dependencies
- Favor standard Java APIs
- Avoid experimental language features

## Documentation
- Public classes and methods must have Javadoc
- Update Javadoc when behavior changes

## Testing
- Tests must assert behavior, not implementation
- Prefer deterministic tests

## Packaging
- Do not modify groupId, artifactId, or version
```

#### Java+DDD

```
# AI Development Guidelines (Java DDD)

This project follows Domain-Driven Design principles.

## Domain Model
- Aggregates enforce invariants
- Entities have identity
- Value Objects are immutable

## Rules
- No setters on aggregates
- State changes occur via intent-revealing methods
- Business rules must live in the domain model

## Dependencies
- Domain layer must not depend on frameworks
- Infrastructure implements domain interfaces

## Repositories
- Defined as interfaces in the domain
- Implemented in infrastructure

## Testing
- Domain logic tested without frameworks
- Infrastructure tested separately

## Naming
- Use domain language consistently
- Do not introduce anemic models
```

### ChatGPT-generated Python Examples

#### Minimal Guardrails (Low ceremony)

Use when: you want just enough control.

```
# AI Guidelines

- Preserve existing behavior and tests
- Do not add dependencies
- Follow existing style
- Ask before making large or cross-cutting changes
```

#### General Python Application (CLI, scripts, services)

Use when: small–medium Python codebases without heavy frameworks.

```
# AI Development Guidelines (Python)

These rules apply to all AI-assisted changes in this repository.

## General Behavior
- Prefer small, reviewable changes
- Preserve existing behavior unless explicitly instructed otherwise
- Do not introduce new dependencies without approval

## Python Version
- Python 3.11+

## Code Style
- Follow existing formatting and naming conventions
- Prefer explicit code over cleverness
- Use type hints for public functions

## Structure
- Keep functions focused and testable
- Avoid deeply nested logic
- Prefer pure functions where practical

## Error Handling
- Do not silently catch exceptions
- Raise meaningful, specific exceptions
- Avoid broad `except Exception` blocks

## Testing
- Use pytest
- Preserve test intent when fixing failures
- Add tests for new behavior when appropriate

## When Unsure
- Ask clarifying questions instead of making assumptions
```

#### Web API (FastAPI / Flask)

Use when: HTTP APIs, JSON services.

```
# AI Development Guidelines (Python Web API)

These rules apply to AI-assisted changes.

## Frameworks
- FastAPI (preferred) or Flask
- Pydantic for validation

## Architecture
- API layer handles HTTP concerns only
- Business logic lives outside route handlers
- Persistence logic is isolated from API code

## APIs
- Preserve existing routes and schemas
- Do not change request/response formats unless instructed
- Validate all external input

## Error Handling
- Map domain errors to HTTP responses at the boundary
- Avoid leaking internal exceptions to clients

## Dependencies
- Do not add new dependencies without approval

## Testing
- Prefer unit tests over integration tests
- Mock external services

## Performance
- Avoid blocking I/O in async endpoints
```

#### Library / Package (Published or Internal)

Use when: reusable Python libraries.

```
# AI Development Guidelines (Python Library)

This project is a reusable Python library.

## API Stability
- Public APIs must not change unless instructed
- Do not rename or remove public functions or classes
- Preserve backward compatibility

## Style
- Use type hints throughout public APIs
- Follow PEP 8
- Prefer standard library over third-party solutions

## Dependencies
- Minimize dependencies
- Do not add dependencies without explicit approval

## Documentation
- Public APIs require docstrings
- Update documentation when behavior changes

## Testing
- Tests should assert behavior, not implementation
- Prefer deterministic tests

## Packaging
- Do not modify versioning, metadata, or build configuration
```

#### DDD-Inspired Python

Use when: explicit domain modeling matters.

```
# AI Development Guidelines (Python DDD)

This project follows domain-driven design principles.

## Layers
- Domain: business rules only
- Application: orchestration
- Infrastructure: IO, frameworks, persistence
- Interfaces: APIs and adapters

## Rules
- Domain layer must not import frameworks
- Domain logic must be testable in isolation
- Infrastructure implements domain interfaces

## Domain Model
- Entities have identity
- Value objects are immutable
- Business invariants are enforced in the domain

## Testing
- Domain logic tested without mocks or frameworks
- Infrastructure tested separately

## Dependencies
- No new dependencies without approval
```

#### Async / Concurrency-Heavy Python

Use when: asyncio, async APIs, background tasks.

```
# AI Development Guidelines (Async Python)

This project makes heavy use of asyncio.

## Async Rules
- Do not block the event loop
- Use async-compatible libraries only
- Avoid mixing sync and async code

## Concurrency
- Be explicit about task lifetimes
- Avoid shared mutable state
- Document concurrency assumptions

## Error Handling
- Handle cancellation correctly
- Do not suppress CancelledError

## Testing
- Use pytest-asyncio or equivalent
- Tests must be deterministic
```



### [mistral-vibe](https://github.com/mistralai/mistral-vibe/blob/main/AGENTS.md)
```
# python312.rule
# Rule for enforcing modern Python 3.12+ best practices.
# Applies to all Python files (*.py) in the project.
#
# Guidelines covered:
# - Use match-case syntax instead of if/elif/else for pattern matching.
# - Use the walrus operator (:=) when it simplifies assignments and tests.
# - Favor a "never nester" approach by avoiding deep nesting with early returns or guard clauses.
# - Employ modern type hints using built-in generics (list, dict) and the union pipe (|) operator,
#   rather than deprecated types from the typing module (e.g., Optional, Union, Dict, List).
# - Ensure code adheres to strong static typing practices compatible with static analyzers like pyright.
# - Favor pathlib.Path methods for file system operations over older os.path functions.
# - Write code in a declarative and minimalist style that clearly expresses its intent.
# - Additional best practices including f-string formatting, comprehensions, context managers, and overall PEP 8 compliance.

description: "Modern Python 3.12+ best practices and style guidelines for coding."
files: "**/*.py"

guidelines:
  - title: "Match-Case Syntax"
    description: >
      Prefer using the match-case construct over traditional if/elif/else chains when pattern matching
      is applicable. This leads to clearer, more concise, and more maintainable code.

  - title: "Walrus Operator"
    description: >
      Utilize the walrus operator (:=) to streamline code where assignment and conditional testing can be combined.
      Use it judiciously when it improves readability and reduces redundancy.

  - title: "Never Nester"
    description: >
      Aim to keep code flat by avoiding deep nesting. Use early returns, guard clauses, and refactoring to
      minimize nested structures, making your code more readable and maintainable.

  - title: "Modern Type Hints"
    description: >
      Adopt modern type hinting by using built-in generics like list and dict, along with the pipe (|) operator
      for union types (e.g., int | None). Avoid older, deprecated constructs such as Optional, Union, Dict, and List
      from the typing module.

  - title: "Strong Static Typing"
    description: >
      Write code with explicit and robust type annotations that are fully compatible with static type checkers
      like pyright. This ensures higher code reliability and easier maintenance.

  - title: "Pydantic-First Parsing"
    description: >
      Prefer Pydantic v2's native validation over ad-hoc parsing. Use `model_validate`,
      `field_validator`, `from_attributes`, and field aliases to coerce external SDK/DTO objects.
      Avoid manual `getattr`/`hasattr` flows and custom constructors like `from_sdk` unless they are
      thin wrappers over `model_validate`. Keep normalization logic inside model validators so call sites
      remain declarative and typed.

  - title: "Pathlib for File Operations"
    description: >
      Favor the use of pathlib.Path methods for file system operations. This approach offers a more
      readable, object-oriented way to handle file paths and enhances cross-platform compatibility,
      reducing reliance on legacy os.path functions.

  - title: "Declarative and Minimalist Code"
    description: >
      Write code that is declarative—clearly expressing its intentions rather than focusing on implementation details.
      Strive to keep your code minimalist by removing unnecessary complexity and boilerplate. This approach improves
      readability, maintainability, and aligns with modern Python practices.

  - title: "Additional Best Practices"
    description: >
      Embrace other modern Python idioms such as:
      - Using f-strings for string formatting.
      - Favoring comprehensions for building lists and dictionaries.
      - Employing context managers (with statements) for resource management.
      - Following PEP 8 guidelines to maintain overall code style consistency.

  - title: "Exception Documentation"
    description: >
      Document exceptions accurately and minimally in docstrings:
      - Only document exceptions that are explicitly raised in the function implementation
      - Remove Raises entries for exceptions that are not directly raised
      - Include all possible exceptions from explicit raise statements
      - For public APIs, document exceptions from called functions if they are allowed to propagate
      - Avoid documenting built-in exceptions that are obvious (like TypeError from type hints)
      This ensures documentation stays accurate and maintainable, avoiding the common pitfall
      of listing every possible exception that could theoretically occur.

  - title: "Modern Enum Usage"
    description: >
      Leverage Python's enum module effectively following modern practices:
      - Use StrEnum for string-based enums that need string comparison
      - Use IntEnum/IntFlag for performance-critical integer-based enums
      - Use auto() for automatic value assignment to maintain clean code
      - Always use UPPERCASE for enum members to avoid name clashes
      - Add methods to enums when behavior needs to be associated with values
      - Use @property for computed attributes rather than storing values
      - For type mixing, ensure mix-in types appear before Enum in base class sequence
      - Consider Flag/IntFlag for bit field operations
      - Use _generate_next_value_ for custom value generation
      - Implement __bool__ when enum boolean evaluation should depend on value
      This promotes type-safe constants, self-documenting code, and maintainable value sets.

  - title: "No Inline Ignores"
    description: >
      Do not use inline suppressions like `# type: ignore[...]` or `# noqa[...]` in production code.
      Instead, fix types and lint warnings at the source by:
      - Refining signatures with generics (TypeVar), Protocols, or precise return types
      - Guarding with `isinstance` checks before attribute access
      - Using `typing.cast` when control flow guarantees the type
      - Extracting small helpers to create clearer, typed boundaries
      If a suppression is truly unavoidable at an external boundary, prefer a narrow, well-typed wrapper
      over in-line ignores, and document the rationale in code comments.

  - title: "Pydantic Discriminated Unions"
    description: >
      When modeling variants with a discriminated union (e.g., on a `transport` field), do not narrow a
      field type in a subclass (e.g., overriding `transport: Literal['http']` with `Literal['streamable-http']`).
      This violates Liskov substitution and triggers type checker errors due to invariance of class attributes.
      Prefer sibling classes plus a shared mixin for common fields and helpers, and compose the union with
      `Annotated[Union[...], Field(discriminator='transport')]`.
      Example pattern:
      - Create a base with shared non-discriminator fields (e.g., `_MCPBase`).
      - Create a mixin with protocol-specific fields/methods (e.g., `_MCPHttpFields`), without a `transport`.
      - Define sibling final classes per variant (e.g., `MCPHttp`, `MCPStreamableHttp`, `MCPStdio`) that set
        `transport: Literal[...]` once in each final class.
      - Use `match` on the discriminator to narrow types at call sites.

  - title: "Use uv for All Commands"
    description: >
      We use uv to manage our python environment. You should nevery try to run a bare python commands.
      Always run commands using `uv` instead of invoking `python` or `pip` directly.
      For example, use `uv add package` and `uv run script.py` rather than `pip install package` or `python script.py`.
      This practice helps avoid environment drift and leverages modern Python packaging best practices.
      Useful uv commands are:
      - uv add/remove <package> to manage dependencies
      - uv sync to install dependencies declared in pyproject.toml and uv.lock
      - uv run script.py to run a script within the uv environment
      - uv run pytest (or any other python tool) to run the tool within the uv environment
```

