title=Cline
tags=ai, agent, coding
summary=Autonomous coding agent right in your IDE, capable of creating/editing files, executing commands, using the browser, and more with your permission every step of the way.
~~~~~~

[Website](https://cline.bot/) | [Source](https://github.com/cline/cline)

Meet Cline, an AI assistant that can use your **CLI** a**N**d **E**ditor.

Thanks to [Claude Sonnet's agentic coding capabilities](https://www.anthropic.com/claude/sonnet), Cline can handle complex software development tasks step-by-step. With tools that let him create & edit files, explore large projects, use the browser, and execute terminal commands (after you grant permission), he can assist you in ways that go beyond code completion or tech support. Cline can even use the Model Context Protocol (MCP) to create new tools and extend his own capabilities. While autonomous AI scripts traditionally run in sandboxed environments, this extension provides a human-in-the-loop GUI to approve every file change and terminal command, providing a safe and accessible way to explore the potential of agentic AI.

1.  Enter your task and add images to convert mockups into functional apps or fix bugs with screenshots.
2.  Cline starts by analyzing your file structure & source code ASTs, running regex searches, and reading relevant files to get up to speed in existing projects. By carefully managing what information is added to context, Cline can provide valuable assistance even for large, complex projects without overwhelming the context window.
3.  Once Cline has the information he needs, he can:
    -   Create and edit files + monitor linter/compiler errors along the way, letting him proactively fix issues like missing imports and syntax errors on his own.
    -   Execute commands directly in your terminal and monitor their output as he works, letting him e.g., react to dev server issues after editing a file.
    -   For web development tasks, Cline can launch the site in a headless browser, click, type, scroll, and capture screenshots + console logs, allowing him to fix runtime errors and visual bugs.
4.  When a task is completed, Cline will present the result to you with a terminal command like `open -a "Google Chrome" index.html`, which you run with a click of a button.

[Kanban](https://cline.bot/kanban): Cline Kanban brings your agents out of the terminal and into the board. Create, manage, and chain agent tasks within a single view. Claude Code and Codex compatible.

## Resources

### Articles, Blogs, Essays

- [20 one-shot prompts that turn Kanban into an autonomous coding machine](https://cline.bot/blog/20-one-shot-prompts-that-turn-kanban-into-an-autonomous-coding-machine):
    
    1. **Express API from scratch**

        ```
        Build a production-ready Express API for this project. Break it into tasks: 
        1) Set up Express with TypeScript, tsconfig, and a dev script with nodemon 
        2) Add a health check endpoint at GET /health returning { status: "ok", 
        timestamp } 3) Add structured JSON logging with pino 4) Add global error 
        handling middleware with proper error response format 5) Add CORS and helmet 
        security middleware. Link them sequentially – each builds on the last. Start 
        task 1.
        ```

    2. **React + Vite frontend**

        ```
        Scaffold a React frontend with Vite for this project. Tasks: 1) Initialize 
        Vite with React and TypeScript template, add path aliases in tsconfig and 
        vite.config 2) Set up React Router with a layout component, home page, and 
        404 page 3) Add a reusable component library – Button, Card, Input, Modal – 
        in src/components/ui with basic styling 4) Add a dark/light theme provider 
        using CSS variables and React context. Link 1 → 2 → 3, and 1 → 4 so theming 
        and components run in parallel after routing is set up. Start task 1.
        ```

    3. **CLI tool**

        ```
        Build a Node.js CLI tool in this repo. Tasks: 1) Set up the project with 
        TypeScript, a bin entry in package.json, and commander.js for argument 
        parsing 2) Add a "init" command that scaffolds a config file interactively 
        using prompts 3) Add a "run" command that reads the config and executes the 
        main logic with a progress spinner using ora 4) Add colorized output with 
        chalk and a --verbose flag for debug logging. Link 1 → 2, 1 → 3, and 1 → 4 
        so all three commands build in parallel after setup. Start task 1.
        ```

    4. **Full-stack with database** A single prompt gives you a typed Express API backed by SQLite with full CRUD, input validation, and seed data. Five linked tasks, two parallel branches.

        ```
        Set up a full-stack app with Express backend and SQLite database. Tasks: 1) 
        Initialize Express with TypeScript and install better-sqlite3 2) Create a 
        database module in src/db.ts that initializes SQLite, creates a "users" 
        table with id, name, email, created_at 3) Add CRUD API routes: GET /users, 
        GET /users/:id, POST /users, PUT /users/:id, DELETE /users/:id 4) Add input 
        validation middleware using zod schemas for the POST and PUT routes 5) Add 
        seed script that populates 10 sample users. Link 1 → 2 → 3 → 4, and 2 → 5 so 
        seeding runs in parallel with route development. Start task 1.
        ```

    5. **JavaScript to TypeScript migration**

        ```
        Migrate this JavaScript project to TypeScript. Tasks: 1) Add tsconfig.json 
        with strict mode, install typescript and ts-node, rename entry point to .ts 
        2) Rename all .js files in src/ to .ts and fix immediate type errors with 
        explicit type annotations 3) Add type definitions for all function 
        parameters and return types across the codebase 4) Replace any require() 
        calls with ES module imports and update package.json with "type": "module" 
        if needed 5) Add a build script using tsc and verify the compiled output 
        runs correctly. Link sequentially 1 → 2 → 3 → 4 → 5. Start task 1.
        ```

**6\. Dependency audit and upgrade**

```
Audit and upgrade dependencies in this project. Tasks: 1) Run npm outdated, 
identify all packages with major version bumps, and create a report as 
UPGRADE_PLAN.md listing each package, current version, target version, and 
known breaking changes 2) Upgrade all non-breaking minor and patch versions 
across the project 3) Upgrade major version packages one at a time, fixing 
breaking changes in the code after each upgrade 4) Remove any unused 
dependencies identified by depcheck. Link 1 → 2, 1 → 3, and 1 → 4 so cleanup 
and upgrades run in parallel after the audit. Start task 1.
```

**⭐ 7. Add ESLint and Prettier** – This prompt runs two completely independent tooling setups in parallel, then applies each tool's auto-fixes in separate worktrees. Zero conflicts because each agent works in isolation.

```
Add code quality tooling to this project. Tasks: 1) Install and configure 
ESLint with a flat config file using @eslint/js and typescript-eslint, with 
rules for no-unused-vars, consistent-return, and no-console as warnings 2) 
Install and configure Prettier with a .prettierrc that uses single quotes, 
no semicolons, and 2-space tabs 3) Run eslint --fix across the entire 
codebase and commit the auto-fixed changes 4) Run prettier --write across 
the entire codebase and commit the formatted changes. Link 1 → 3 and 2 → 4 
so linting and formatting run in parallel. Start tasks 1 and 2.
```

Cline Kanban Add ESLint and Prettier CI/CD

  
**8\. Extract shared utilities**

```
Refactor this codebase to extract duplicated logic. Tasks: 1) Scan the 
codebase for duplicated patterns – repeated validation logic, string 
formatting, date handling, error construction – and list them in a 
REFACTOR_PLAN.md 2) Create a src/utils/ directory with modules for each 
identified pattern: validation.ts, format.ts, dates.ts, errors.ts 3) Replace 
all duplicated code across the codebase with imports from the new utility 
modules 4) Add unit tests for each utility module using the existing test 
framework. Link 1 → 2 → 3, and 2 → 4 so tests and refactoring run in 
parallel. Start task 1.
```

### Testing and quality

Testing is one of the highest-value uses for Kanban because unit tests, integration tests, and documentation are naturally independent -- they fan out perfectly.

**⭐ 9. Comprehensive test suite** -- Four tasks, but the real magic is the linking pattern: unit tests and integration tests build simultaneously after the test framework is configured, then converge on the CI coverage gate.

```
Add a test suite to this project. Tasks: 1) Install and configure vitest 
with TypeScript support, add test and test:coverage scripts to package.json 
2) Write unit tests for all utility functions and helper modules in 
src/utils or src/lib, aiming for 100% coverage on those files 3) Write 
integration tests for all API routes using supertest, covering success cases 
and error cases 4) Add a test:ci script that runs tests with coverage and 
fails if coverage drops below 80%. Link 1 → 2 and 1 → 3 so unit and 
integration tests build in parallel, then 2 → 4 and 3 → 4 so the CI script 
comes last. Start task 1.
```

Cline Kanban Comprehensive Test Suite

**10\. API documentation**

```
Document all APIs in this project. Tasks: 1) Install swagger-jsdoc and 
swagger-ui-express, configure them to serve docs at /api-docs 2) Add JSDoc 
annotations with @swagger tags to every route handler documenting the 
method, path, parameters, request body schema, and response schema 3) Add 
example request/response payloads for each endpoint in the swagger 
annotations 4) Add a README section documenting how to access the API docs 
locally and listing all available endpoints with brief descriptions. Link 1 
→ 2 → 3, and run 4 in parallel after 1. Start task 1.
```

**11\. Error handling hardening**

```
Harden error handling across this codebase. Tasks: 1) Create a custom 
AppError class in src/errors.ts that extends Error with statusCode, 
isOperational, and context fields, plus factory functions for notFound, 
badRequest, unauthorized, and internal errors 2) Add an Express error-
handling middleware that catches AppError instances and returns structured 
JSON error responses with appropriate status codes 3) Audit every route 
handler and replace raw throw/try-catch patterns with the new AppError 
classes 4) Add a process-level uncaught exception and unhandled rejection 
handler that logs and gracefully shuts down. Link 1 → 2 → 3, and 1 → 4 in 
parallel. Start task 1.
```

**12\. Add logging and observability**

```
Add structured logging to this application. Tasks: 1) Install pino and pino-
http, create a logger module in src/logger.ts that outputs JSON logs with 
configurable log levels via LOG_LEVEL env var 2) Add request logging 
middleware using pino-http that logs method, url, status code, and response 
time for every request 3) Add contextual logging to all existing route 
handlers and service functions – log on entry, on error, and on completion 
with relevant context like user IDs or resource IDs 4) Add a correlation ID 
middleware that generates a UUID per request and attaches it to all log 
lines for that request. Link 1 → 2 and 1 → 4 in parallel, then 2 → 3 and 4 →
3 so the route logging comes last. Start task 1.
```

### Feature development

These prompts add real product features. The linking patterns here are more complex because features have more interdependencies -- but Kanban handles the orchestration.

**⭐ 13. Authentication system** -- This is the most complex single prompt in the collection. Five tasks, three parallel branches, a convergence point. One sidebar message gives you a complete auth system with registration, login, JWT middleware, and route protection.

```
Add JWT authentication to this Express app. Tasks: 1) Install jsonwebtoken 
and bcryptjs, create a src/auth/ directory with modules for password 
hashing and JWT token generation/verification with configurable secret and 
expiry via env vars 2) Add POST /auth/register endpoint that validates 
email/password, hashes the password, stores the user, and returns a JWT 3) 
Add POST /auth/login endpoint that validates credentials, compares the 
password hash, and returns a JWT 4) Add an auth middleware that extracts 
the JWT from the Authorization header, verifies it, and attaches the user 
to req.user 5) Protect all existing routes except /health and /auth/* with 
the auth middleware. Link 1 → 2, 1 → 3, 1 → 4 so register, login, and 
middleware build in parallel, then 2 → 5, 3 → 5, 4 → 5 so route protection 
comes last. Start task 1.
```

Cline Kanban Authentication System

**14\. Search and filtering**

```
Add search and filtering to the existing list endpoints in this API. Tasks: 
1) Create a query parser utility in src/utils/query.ts that extracts page, 
limit, sort, order, and arbitrary filter fields from req.query with sensible 
defaults and validation 2) Update the GET list endpoints to accept ?search= 
parameter that does a case-insensitive partial match across text fields 3) 
Add pagination support – return results with { data, total, page, limit, 
totalPages } response format 4) Add sort support with ?
sort=field&order=asc|desc. Link 1 → 2, 1 → 3, 1 → 4 so search, pagination, 
and sorting build in parallel after the query parser. Start task 1.
```

**15\. File upload endpoint**

```
Add file upload capability to this Express app. Tasks: 1) Install multer and 
configure it with disk storage in an uploads/ directory, 10MB file size 
limit, and allowed extensions for images (jpg, png, gif, webp) 2) Add POST 
/upload endpoint that accepts a single file, validates it, stores it, and 
returns { filename, originalName, size, mimetype, url } 3) Add GET 
/uploads/:filename endpoint that serves the uploaded file with proper 
content-type headers and 404 handling 4) Add a cleanup utility that deletes 
uploaded files older than 30 days, callable via a DELETE /uploads/cleanup 
endpoint. Link 1 → 2 → 3, and 1 → 4 in parallel. Start task 1.
```

**16\. WebSocket real-time updates**

```
Add WebSocket support to this Express app for real-time updates. Tasks: 1) 
Install ws, integrate a WebSocket server with the existing HTTP server, and 
create a connection manager in src/ws.ts that tracks connected clients by ID 
2) Add a broadcast utility that sends a JSON message to all connected 
clients or to specific client IDs 3) Modify the existing POST, PUT, and 
DELETE route handlers to emit WebSocket events after successful mutations – 
e.g., { event: "user:created", data: user } 4) Add a heartbeat ping/pong 
mechanism that detects and cleans up stale connections every 30 seconds. 
Link 1 → 2 → 3, and 1 → 4 in parallel. Start task 1.
```

### DevOps and infrastructure

Infrastructure tasks are often tedious and repetitive. They're also perfectly suited for parallel execution because a Dockerfile, a CI config, and a .dockerignore don't depend on each other.

**17\. Dockerize the application**

```
Dockerize this application. Tasks: 1) Create a multi-stage Dockerfile – 
builder stage that installs deps and compiles TypeScript, production stage 
that copies only compiled output and production deps, runs as non-root user 
on port 3000 2) Create a docker-compose.yml with the app service, health 
check, environment variables from .env, and a volume mount for uploads if 
applicable 3) Add a .dockerignore file excluding node_modules, .git, .env, 
dist, and test files 4) Add npm scripts: docker:build, docker:run, 
docker:stop and document them in the README. Link 1 → 3 in parallel (both 
are independent files), then 1 → 2 → 4 for the compose and docs. Start 
tasks 1 and 3.
```

**⭐ 18. GitHub Actions CI/CD** – Four tasks, three running in parallel from the start. CI workflow, release workflow, and contributing docs all build simultaneously, then converge on adding README badges. This is the kind of infrastructure setup that normally takes an afternoon. Kanban does it in minutes.

```
Add GitHub Actions CI/CD to this project. Tasks: 1) Create 
.github/workflows/ci.yml that runs on push and PR to main – checks out 
code, installs deps, runs linting, runs tests with coverage, and fails if 
coverage is below threshold 2) Create .github/workflows/release.yml that 
runs on tags matching v* – builds the project, creates a GitHub release 
with auto-generated notes 3) Add a branch protection rules recommendation 
in CONTRIBUTING.md documenting that main requires CI to pass 4) Add status 
badges for CI workflow to the top of README.md. Link 1 → 4 and 2 → 4 so 
badges come after both workflows exist. Run 1, 2, and 3 in parallel. Start 
all tasks.
```

Cline Kanban GitHub Actions CI/CD

**19\. Environment configuration**

```
Add proper environment configuration to this project. Tasks: 1) Install 
dotenv, create a src/config.ts module that loads and validates all 
environment variables with defaults, exports a typed config object – 
include PORT, NODE_ENV, LOG_LEVEL, DATABASE_URL, JWT_SECRET 2) Create 
.env.example with all required variables and placeholder values, add .env 
to .gitignore 3) Replace all process.env references scattered across the 
codebase with imports from the config module 4) Add a startup validation 
that checks all required env vars are present and logs which are missing 
with a clear error message before the app exits. Link 1 → 2 and 1 → 3 in 
parallel, then 3 → 4. Start task 1.
```

**20\. Monorepo setup**

```
Convert this project into a monorepo. Tasks: 1) Install and configure 
Turborepo with a root turbo.json, move the existing app code into 
packages/api, update all paths and imports accordingly 2) Create 
packages/shared with common TypeScript types, utility functions, and 
constants that will be shared across packages 3) Create packages/web as a 
minimal React + Vite frontend that imports types from packages/shared 4) 
Configure the root package.json with workspace scripts: dev (runs all 
packages), build (builds all), test (tests all), and lint (lints all). Link 
1 → 2, 1 → 3 in parallel (both depend on the monorepo structure), then 
2 → 4 and 3 → 4 so workspace scripts come after all packages exist. Start 
task 1.
```

