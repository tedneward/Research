title=OpenSpec
tags=ai, agent, coding, specification-driven
summary=Spec-driven development (SDD) for AI coding assistants.
~~~~~~

[Website](https://openspec.dev/) | [Source](https://github.com/Fission-AI/OpenSpec)

Our philosophy:

```
→ fluid not rigid
→ iterative not waterfall
→ easy not complex
→ built for brownfield not just greenfield
→ scalable from personal projects to enterprises
```

## Quick Start

**Requires Node.js 20.19.0 or higher.**

Install OpenSpec globally:

npm install -g @fission-ai/openspec@latest

Then navigate to your project directory and initialize:

cd your-project
openspec init

Now tell your AI: `/opsx:propose <what-you-want-to-build>`

If you want the expanded workflow (`/opsx:new`, `/opsx:continue`, `/opsx:ff`, `/opsx:verify`, `/opsx:sync`, `/opsx:bulk-archive`, `/opsx:onboard`), select it with `openspec config profile` and apply with `openspec update`.

# Getting Started

## How It Works

OpenSpec helps you and your AI coding assistant agree on what to build before any code is written.

**Default quick path (core profile):**

```text
/opsx:propose ──► /opsx:apply ──► /opsx:archive
```

**Expanded path (custom workflow selection):**

```text
/opsx:new ──► /opsx:ff or /opsx:continue ──► /opsx:apply ──► /opsx:verify ──► /opsx:archive
```

The default global profile is `core`, which includes `propose`, `explore`, `apply`, and `archive`. You can enable the expanded workflow commands with `openspec config profile` and then `openspec update`.

## What OpenSpec Creates

After running `openspec init`, your project has this structure:

```
openspec/
├── specs/              # Source of truth (your system's behavior)
│   └── <domain>/
│       └── spec.md
├── changes/            # Proposed updates (one folder per change)
│   └── <change-name>/
│       ├── proposal.md
│       ├── design.md
│       ├── tasks.md
│       └── specs/      # Delta specs (what's changing)
│           └── <domain>/
│               └── spec.md
└── config.yaml         # Project configuration (optional)
```

**Two key directories:**

- **`specs/`** - The source of truth. These specs describe how your system currently behaves. Organized by domain (e.g., `specs/auth/`, `specs/payments/`).

- **`changes/`** - Proposed modifications. Each change gets its own folder with all related artifacts. When a change is complete, its specs merge into the main `specs/` directory.

## Understanding Artifacts

Each change folder contains artifacts that guide the work:

| Artifact | Purpose |
|----------|---------|
| `proposal.md` | The "why" and "what" - captures intent, scope, and approach |
| `specs/` | Delta specs showing ADDED/MODIFIED/REMOVED requirements |
| `design.md` | The "how" - technical approach and architecture decisions |
| `tasks.md` | Implementation checklist with checkboxes |

**Artifacts build on each other:**

```
proposal ──► specs ──► design ──► tasks ──► implement
   ▲           ▲          ▲                    │
   └───────────┴──────────┴────────────────────┘
            update as you learn
```

You can always go back and refine earlier artifacts as you learn more during implementation.

## How Delta Specs Work

Delta specs are the key concept in OpenSpec. They show what's changing relative to your current specs.

### The Format

Delta specs use sections to indicate the type of change:

```markdown
# Delta for Auth

## ADDED Requirements

### Requirement: Two-Factor Authentication
The system MUST require a second factor during login.

#### Scenario: OTP required
- GIVEN a user with 2FA enabled
- WHEN the user submits valid credentials
- THEN an OTP challenge is presented

## MODIFIED Requirements

### Requirement: Session Timeout
The system SHALL expire sessions after 30 minutes of inactivity.
(Previously: 60 minutes)

#### Scenario: Idle timeout
- GIVEN an authenticated session
- WHEN 30 minutes pass without activity
- THEN the session is invalidated

## REMOVED Requirements

### Requirement: Remember Me
(Deprecated in favor of 2FA)
```

### What Happens on Archive

When you archive a change:

1. **ADDED** requirements are appended to the main spec
2. **MODIFIED** requirements replace the existing version
3. **REMOVED** requirements are deleted from the main spec

The change folder moves to `openspec/changes/archive/` for audit history.

## Example: Your First Change

Let's walk through adding dark mode to an application.

### 1. Start the Change (Default)

```text
You: /opsx:propose add-dark-mode

AI:  Created openspec/changes/add-dark-mode/
     ✓ proposal.md — why we're doing this, what's changing
     ✓ specs/       — requirements and scenarios
     ✓ design.md    — technical approach
     ✓ tasks.md     — implementation checklist
     Ready for implementation!
```

If you've enabled the expanded workflow profile, you can also do this as two steps: `/opsx:new` then `/opsx:ff` (or `/opsx:continue` incrementally).

### 2. What Gets Created

**proposal.md** - Captures the intent:

```markdown
# Proposal: Add Dark Mode

## Intent
Users have requested a dark mode option to reduce eye strain
during nighttime usage.

## Scope
- Add theme toggle in settings
- Support system preference detection
- Persist preference in localStorage

## Approach
Use CSS custom properties for theming with a React context
for state management.
```

**specs/ui/spec.md** - Delta showing new requirements:

```markdown
# Delta for UI

## ADDED Requirements

### Requirement: Theme Selection
The system SHALL allow users to choose between light and dark themes.

#### Scenario: Manual toggle
- GIVEN a user on any page
- WHEN the user clicks the theme toggle
- THEN the theme switches immediately
- AND the preference persists across sessions

#### Scenario: System preference
- GIVEN a user with no saved preference
- WHEN the application loads
- THEN the system's preferred color scheme is used
```

**tasks.md** - Implementation checklist:

```markdown
# Tasks

## 1. Theme Infrastructure
- [ ] 1.1 Create ThemeContext with light/dark state
- [ ] 1.2 Add CSS custom properties for colors
- [ ] 1.3 Implement localStorage persistence

## 2. UI Components
- [ ] 2.1 Create ThemeToggle component
- [ ] 2.2 Add toggle to settings page
- [ ] 2.3 Update Header to include quick toggle

## 3. Styling
- [ ] 3.1 Define dark theme color palette
- [ ] 3.2 Update components to use CSS variables
```

### 3. Implement

```
You: /opsx:apply

AI:  Working through tasks...
     ✓ 1.1 Created ThemeContext with light/dark state
     ✓ 1.2 Added CSS custom properties to globals.css
     ✓ 1.3 Implemented localStorage persistence
     ✓ 2.1 Created ThemeToggle component
     ...
     All tasks complete!
```

During implementation, if you discover the design needs adjustment, just update the artifact and continue.

### 4. Archive

```
You: /opsx:archive

AI:  Archiving add-dark-mode...
     ✓ Merged specs into openspec/specs/ui/spec.md
     ✓ Moved to openspec/changes/archive/2025-01-24-add-dark-mode/
     Done! Ready for the next feature.
```

Your delta specs are now part of the main specs, documenting how your system works.

## Verifying and Reviewing

Use the CLI to check on your changes:

```bash
# List active changes
openspec list

# View change details
openspec show add-dark-mode

# Validate spec formatting
openspec validate add-dark-mode

# Interactive dashboard
openspec view
```

---

# OPSX Workflow

## What Is It?

It's a **fluid, iterative workflow** for OpenSpec changes. No more rigid phases — just actions you can take anytime.

## Why This Exists

The legacy OpenSpec workflow works, but it's **locked down**:

- **Instructions are hardcoded** — buried in TypeScript, you can't change them
- **All-or-nothing** — one big command creates everything, can't test individual pieces
- **Fixed structure** — same workflow for everyone, no customization
- **Black box** — when AI output is bad, you can't tweak the prompts

**OPSX opens it up.** Now anyone can:

1. **Experiment with instructions** — edit a template, see if the AI does better
2. **Test granularly** — validate each artifact's instructions independently
3. **Customize workflows** — define your own artifacts and dependencies
4. **Iterate quickly** — change a template, test immediately, no rebuild

```
Legacy workflow:                      OPSX:
┌────────────────────────┐           ┌────────────────────────┐
│  Hardcoded in package  │           │  schema.yaml           │◄── You edit this
│  (can't change)        │           │  templates/*.md        │◄── Or this
│        ↓               │           │        ↓               │
│  Wait for new release  │           │  Instant effect        │
│        ↓               │           │        ↓               │
│  Hope it's better      │           │  Test it yourself      │
└────────────────────────┘           └────────────────────────┘
```

**This is for everyone:**
- **Teams** — create workflows that match how you actually work
- **Power users** — tweak prompts to get better AI outputs for your codebase
- **OpenSpec contributors** — experiment with new approaches without releases

We're all still learning what works best. OPSX lets us learn together.

## The User Experience

**The problem with linear workflows:**
You're "in planning phase", then "in implementation phase", then "done". But real work doesn't work that way. You implement something, realize your design was wrong, need to update specs, continue implementing. Linear phases fight against how work actually happens.

**OPSX approach:**
- **Actions, not phases** — create, implement, update, archive — do any of them anytime
- **Dependencies are enablers** — they show what's possible, not what's required next

```
  proposal ──→ specs ──→ design ──→ tasks ──→ implement
```

## Setup

```bash
# Make sure you have openspec installed — skills are automatically generated
openspec init
```

This creates skills in `.claude/skills/` (or equivalent) that AI coding assistants auto-detect.

By default, OpenSpec uses the `core` workflow profile (`propose`, `explore`, `apply`, `archive`). If you want the expanded workflow commands (`new`, `continue`, `ff`, `verify`, `sync`, `bulk-archive`, `onboard`), configure them with `openspec config profile` and apply with `openspec update`.

During setup, you'll be prompted to create a **project config** (`openspec/config.yaml`). This is optional but recommended.

## Project Configuration

Project config lets you set defaults and inject project-specific context into all artifacts.

### Creating Config

Config is created during `openspec init`, or manually:

```yaml
# openspec/config.yaml
schema: spec-driven

context: |
  Tech stack: TypeScript, React, Node.js
  API conventions: RESTful, JSON responses
  Testing: Vitest for unit tests, Playwright for e2e
  Style: ESLint with Prettier, strict TypeScript

rules:
  proposal:
    - Include rollback plan
    - Identify affected teams
  specs:
    - Use Given/When/Then format for scenarios
  design:
    - Include sequence diagrams for complex flows
```

### Config Fields

| Field | Type | Description |
|-------|------|-------------|
| `schema` | string | Default schema for new changes (e.g., `spec-driven`) |
| `context` | string | Project context injected into all artifact instructions |
| `rules` | object | Per-artifact rules, keyed by artifact ID |

### How It Works

**Schema precedence** (highest to lowest):
1. CLI flag (`--schema <name>`)
2. Change metadata (`.openspec.yaml` in change directory)
3. Project config (`openspec/config.yaml`)
4. Default (`spec-driven`)

**Context injection:**
- Context is prepended to every artifact's instructions
- Wrapped in `<context>...</context>` tags
- Helps AI understand your project's conventions

**Rules injection:**
- Rules are only injected for matching artifacts
- Wrapped in `<rules>...</rules>` tags
- Appear after context, before the template

### Artifact IDs by Schema

**spec-driven** (default):
- `proposal` — Change proposal
- `specs` — Specifications
- `design` — Technical design
- `tasks` — Implementation tasks

### Config Validation

- Unknown artifact IDs in `rules` generate warnings
- Schema names are validated against available schemas
- Context has a 50KB size limit
- Invalid YAML is reported with line numbers

### Troubleshooting

**"Unknown artifact ID in rules: X"**
- Check artifact IDs match your schema (see list above)
- Run `openspec schemas --json` to see artifact IDs for each schema

**Config not being applied:**
- Ensure file is at `openspec/config.yaml` (not `.yml`)
- Check YAML syntax with a validator
- Config changes take effect immediately (no restart needed)

**Context too large:**
- Context is limited to 50KB
- Summarize or link to external docs instead

## Commands

| Command | What it does |
|---------|--------------|
| `/opsx:propose` | Create a change and generate planning artifacts in one step (default quick path) |
| `/opsx:explore` | Think through ideas, investigate problems, clarify requirements |
| `/opsx:new` | Start a new change scaffold (expanded workflow) |
| `/opsx:continue` | Create the next artifact (expanded workflow) |
| `/opsx:ff` | Fast-forward planning artifacts (expanded workflow) |
| `/opsx:apply` | Implement tasks, updating artifacts as needed |
| `/opsx:verify` | Validate implementation against artifacts (expanded workflow) |
| `/opsx:sync` | Sync delta specs to main (expanded workflow, optional) |
| `/opsx:archive` | Archive when done |
| `/opsx:bulk-archive` | Archive multiple completed changes (expanded workflow) |
| `/opsx:onboard` | Guided walkthrough of an end-to-end change (expanded workflow) |

## Usage

### Explore an idea
```
/opsx:explore
```
Think through ideas, investigate problems, compare options. No structure required - just a thinking partner. When insights crystallize, transition to `/opsx:propose` (default) or `/opsx:new`/`/opsx:ff` (expanded).

### Start a new change
```
/opsx:propose
```
Creates the change and generates planning artifacts needed before implementation.

If you've enabled expanded workflows, you can instead use:

```text
/opsx:new        # scaffold only
/opsx:continue   # create one artifact at a time
/opsx:ff         # create all planning artifacts at once
```

### Create artifacts
```
/opsx:continue
```
Shows what's ready to create based on dependencies, then creates one artifact. Use repeatedly to build up your change incrementally.

```
/opsx:ff add-dark-mode
```
Creates all planning artifacts at once. Use when you have a clear picture of what you're building.

### Implement (the fluid part)
```
/opsx:apply
```
Works through tasks, checking them off as you go. If you're juggling multiple changes, you can run `/opsx:apply <name>`; otherwise it should infer from the conversation and prompt you to choose if it can't tell.

### Finish up
```
/opsx:archive   # Move to archive when done (prompts to sync specs if needed)
```

## When to Update vs. Start Fresh

You can always edit your proposal or specs before implementation. But when does refining become "this is different work"?

### What a Proposal Captures

A proposal defines three things:
1. **Intent** — What problem are you solving?
2. **Scope** — What's in/out of bounds?
3. **Approach** — How will you solve it?

The question is: which changed, and by how much?

### Update the Existing Change When:

**Same intent, refined execution**
- You discover edge cases you didn't consider
- The approach needs tweaking but the goal is unchanged
- Implementation reveals the design was slightly off

**Scope narrows**
- You realize full scope is too big, want to ship MVP first
- "Add dark mode" → "Add dark mode toggle (system preference in v2)"

**Learning-driven corrections**
- Codebase isn't structured how you thought
- A dependency doesn't work as expected
- "Use CSS variables" → "Use Tailwind's dark: prefix instead"

### Start a New Change When:

**Intent fundamentally changed**
- The problem itself is different now
- "Add dark mode" → "Add comprehensive theme system with custom colors, fonts, spacing"

**Scope exploded**
- Change grew so much it's essentially different work
- Original proposal would be unrecognizable after updates
- "Fix login bug" → "Rewrite auth system"

**Original is completable**
- The original change can be marked "done"
- New work stands alone, not a refinement
- Complete "Add dark mode MVP" → Archive → New change "Enhance dark mode"

### The Heuristics

```
                        ┌─────────────────────────────────────┐
                        │     Is this the same work?          │
                        └──────────────┬──────────────────────┘
                                       │
                    ┌──────────────────┼──────────────────┐
                    │                  │                  │
                    ▼                  ▼                  ▼
             Same intent?      >50% overlap?      Can original
             Same problem?     Same scope?        be "done" without
                    │                  │          these changes?
                    │                  │                  │
          ┌────────┴────────┐  ┌──────┴──────┐   ┌───────┴───────┐
          │                 │  │             │   │               │
         YES               NO YES           NO  NO              YES
          │                 │  │             │   │               │
          ▼                 ▼  ▼             ▼   ▼               ▼
       UPDATE            NEW  UPDATE       NEW  UPDATE          NEW
```

| Test | Update | New Change |
|------|--------|------------|
| **Identity** | "Same thing, refined" | "Different work" |
| **Scope overlap** | >50% overlaps | <50% overlaps |
| **Completion** | Can't be "done" without changes | Can finish original, new work stands alone |
| **Story** | Update chain tells coherent story | Patches would confuse more than clarify |

### The Principle

> **Update preserves context. New change provides clarity.**
>
> Choose update when the history of your thinking is valuable.
> Choose new when starting fresh would be clearer than patching.

Think of it like git branches:
- Keep committing while working on the same feature
- Start a new branch when it's genuinely new work
- Sometimes merge a partial feature and start fresh for phase 2

## What's Different?

| | Legacy (`/openspec:proposal`) | OPSX (`/opsx:*`) |
|---|---|---|
| **Structure** | One big proposal document | Discrete artifacts with dependencies |
| **Workflow** | Linear phases: plan → implement → archive | Fluid actions — do anything anytime |
| **Iteration** | Awkward to go back | Update artifacts as you learn |
| **Customization** | Fixed structure | Schema-driven (define your own artifacts) |

**The key insight:** work isn't linear. OPSX stops pretending it is.

## Architecture Deep Dive

This section explains how OPSX works under the hood and how it compares to the legacy workflow.
Examples in this section use the expanded command set (`new`, `continue`, etc.); default `core` users can map the same flow to `propose → apply → archive`.

### Philosophy: Phases vs Actions

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         LEGACY WORKFLOW                                      │
│                    (Phase-Locked, All-or-Nothing)                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   ┌──────────────┐      ┌──────────────┐      ┌──────────────┐             │
│   │   PLANNING   │ ───► │ IMPLEMENTING │ ───► │   ARCHIVING  │             │
│   │    PHASE     │      │    PHASE     │      │    PHASE     │             │
│   └──────────────┘      └──────────────┘      └──────────────┘             │
│         │                     │                     │                       │
│         ▼                     ▼                     ▼                       │
│   /openspec:proposal   /openspec:apply      /openspec:archive              │
│                                                                             │
│   • Creates ALL artifacts at once                                          │
│   • Can't go back to update specs during implementation                    │
│   • Phase gates enforce linear progression                                  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘


┌─────────────────────────────────────────────────────────────────────────────┐
│                            OPSX WORKFLOW                                     │
│                      (Fluid Actions, Iterative)                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│              ┌────────────────────────────────────────────┐                 │
│              │           ACTIONS (not phases)             │                 │
│              │                                            │                 │
│              │   new ◄──► continue ◄──► apply ◄──► archive │                 │
│              │    │          │           │           │    │                 │
│              │    └──────────┴───────────┴───────────┘    │                 │
│              │              any order                     │                 │
│              └────────────────────────────────────────────┘                 │
│                                                                             │
│   • Create artifacts one at a time OR fast-forward                         │
│   • Update specs/design/tasks during implementation                        │
│   • Dependencies enable progress, phases don't exist                       │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Component Architecture

**Legacy workflow** uses hardcoded templates in TypeScript:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      LEGACY WORKFLOW COMPONENTS                              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   Hardcoded Templates (TypeScript strings)                                  │
│                    │                                                        │
│                    ▼                                                        │
│   Tool-specific configurators/adapters                                      │
│                    │                                                        │
│                    ▼                                                        │
│   Generated Command Files (.claude/commands/openspec/*.md)                  │
│                                                                             │
│   • Fixed structure, no artifact awareness                                  │
│   • Change requires code modification + rebuild                             │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

**OPSX** uses external schemas and a dependency graph engine:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         OPSX COMPONENTS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   Schema Definitions (YAML)                                                 │
│   ┌─────────────────────────────────────────────────────────────────────┐   │
│   │  name: spec-driven                                                  │   │
│   │  artifacts:                                                         │   │
│   │    - id: proposal                                                   │   │
│   │      generates: proposal.md                                         │   │
│   │      requires: []              ◄── Dependencies                     │   │
│   │    - id: specs                                                      │   │
│   │      generates: specs/**/*.md  ◄── Glob patterns                    │   │
│   │      requires: [proposal]      ◄── Enables after proposal           │   │
│   └─────────────────────────────────────────────────────────────────────┘   │
│                    │                                                        │
│                    ▼                                                        │
│   Artifact Graph Engine                                                     │
│   ┌─────────────────────────────────────────────────────────────────────┐   │
│   │  • Topological sort (dependency ordering)                           │   │
│   │  • State detection (filesystem existence)                           │   │
│   │  • Rich instruction generation (templates + context)                │   │
│   └─────────────────────────────────────────────────────────────────────┘   │
│                    │                                                        │
│                    ▼                                                        │
│   Skill Files (.claude/skills/openspec-*/SKILL.md)                          │
│                                                                             │
│   • Cross-editor compatible (Claude Code, Cursor, Windsurf)                 │
│   • Skills query CLI for structured data                                    │
│   • Fully customizable via schema files                                     │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Dependency Graph Model

Artifacts form a directed acyclic graph (DAG). Dependencies are **enablers**, not gates:

```
                              proposal
                             (root node)
                                  │
                    ┌─────────────┴─────────────┐
                    │                           │
                    ▼                           ▼
                 specs                       design
              (requires:                  (requires:
               proposal)                   proposal)
                    │                           │
                    └─────────────┬─────────────┘
                                  │
                                  ▼
                               tasks
                           (requires:
                           specs, design)
                                  │
                                  ▼
                          ┌──────────────┐
                          │ APPLY PHASE  │
                          │ (requires:   │
                          │  tasks)      │
                          └──────────────┘
```

**State transitions:**

```
   BLOCKED ────────────────► READY ────────────────► DONE
      │                        │                       │
   Missing                  All deps               File exists
   dependencies             are DONE               on filesystem
```

### Information Flow

**Legacy workflow** — agent receives static instructions:

```
  User: "/openspec:proposal"
           │
           ▼
  ┌─────────────────────────────────────────┐
  │  Static instructions:                   │
  │  • Create proposal.md                   │
  │  • Create tasks.md                      │
  │  • Create design.md                     │
  │  • Create specs/<capability>/spec.md    │
  │                                         │
  │  No awareness of what exists or         │
  │  dependencies between artifacts         │
  └─────────────────────────────────────────┘
           │
           ▼
  Agent creates ALL artifacts in one go
```

**OPSX** — agent queries for rich context:

```
  User: "/opsx:continue"
           │
           ▼
  ┌──────────────────────────────────────────────────────────────────────────┐
  │  Step 1: Query current state                                             │
  │  ┌────────────────────────────────────────────────────────────────────┐  │
  │  │  $ openspec status --change "add-auth" --json                      │  │
  │  │                                                                    │  │
  │  │  {                                                                 │  │
  │  │    "artifacts": [                                                  │  │
  │  │      {"id": "proposal", "status": "done"},                         │  │
  │  │      {"id": "specs", "status": "ready"},      ◄── First ready      │  │
  │  │      {"id": "design", "status": "ready"},                          │  │
  │  │      {"id": "tasks", "status": "blocked", "missingDeps": ["specs"]}│  │
  │  │    ]                                                               │  │
  │  │  }                                                                 │  │
  │  └────────────────────────────────────────────────────────────────────┘  │
  │                                                                          │
  │  Step 2: Get rich instructions for ready artifact                        │
  │  ┌────────────────────────────────────────────────────────────────────┐  │
  │  │  $ openspec instructions specs --change "add-auth" --json          │  │
  │  │                                                                    │  │
  │  │  {                                                                 │  │
  │  │    "template": "# Specificationnn## ADDED Requirements...",      │  │
  │  │    "dependencies": [{"id": "proposal", "path": "...", "done": true}│  │
  │  │    "unlocks": ["tasks"]                                            │  │
  │  │  }                                                                 │  │
  │  └────────────────────────────────────────────────────────────────────┘  │
  │                                                                          │
  │  Step 3: Read dependencies → Create ONE artifact → Show what's unlocked  │
  └──────────────────────────────────────────────────────────────────────────┘
```

### Iteration Model

**Legacy workflow** — awkward to iterate:

```
  ┌─────────┐     ┌─────────┐     ┌─────────┐
  │/proposal│ ──► │ /apply  │ ──► │/archive │
  └─────────┘     └─────────┘     └─────────┘
       │               │
       │               ├── "Wait, the design is wrong"
       │               │
       │               ├── Options:
       │               │   • Edit files manually (breaks context)
       │               │   • Abandon and start over
       │               │   • Push through and fix later
       │               │
       │               └── No official "go back" mechanism
       │
       └── Creates ALL artifacts at once
```

**OPSX** — natural iteration:

```
  /opsx:new ───► /opsx:continue ───► /opsx:apply ───► /opsx:archive
      │                │                  │
      │                │                  ├── "The design is wrong"
      │                │                  │
      │                │                  ▼
      │                │            Just edit design.md
      │                │            and continue!
      │                │                  │
      │                │                  ▼
      │                │         /opsx:apply picks up
      │                │         where you left off
      │                │
      │                └── Creates ONE artifact, shows what's unlocked
      │
      └── Scaffolds change, waits for direction
```

### Custom Schemas

Create custom workflows using the schema management commands:

```bash
# Create a new schema from scratch (interactive)
openspec schema init my-workflow

# Or fork an existing schema as a starting point
openspec schema fork spec-driven my-workflow

# Validate your schema structure
openspec schema validate my-workflow

# See where a schema resolves from (useful for debugging)
openspec schema which my-workflow
```

Schemas are stored in `openspec/schemas/` (project-local, version controlled) or `~/.local/share/openspec/schemas/` (user global).

**Schema structure:**
```
openspec/schemas/research-first/
├── schema.yaml
└── templates/
    ├── research.md
    ├── proposal.md
    └── tasks.md
```

**Example schema.yaml:**
```yaml
name: research-first
artifacts:
  - id: research        # Added before proposal
    generates: research.md
    requires: []

  - id: proposal
    generates: proposal.md
    requires: [research]  # Now depends on research

  - id: tasks
    generates: tasks.md
    requires: [proposal]
```

**Dependency Graph:**
```
   research ──► proposal ──► tasks
```

### Summary

| Aspect | Legacy | OPSX |
|--------|----------|------|
| **Templates** | Hardcoded TypeScript | External YAML + Markdown |
| **Dependencies** | None (all at once) | DAG with topological sort |
| **State** | Phase-based mental model | Filesystem existence |
| **Customization** | Edit source, rebuild | Create schema.yaml |
| **Iteration** | Phase-locked | Fluid, edit anything |
| **Editor Support** | Tool-specific configurator/adapters | Single skills directory |

## Schemas

Schemas define what artifacts exist and their dependencies. Currently available:

- **spec-driven** (default): proposal → specs → design → tasks

```bash
# List available schemas
openspec schemas

# See all schemas with their resolution sources
openspec schema which --all

# Create a new schema interactively
openspec schema init my-workflow

# Fork an existing schema for customization
openspec schema fork spec-driven my-workflow

# Validate schema structure before use
openspec schema validate my-workflow
```

## Tips

- Use `/opsx:explore` to think through an idea before committing to a change
- `/opsx:ff` when you know what you want, `/opsx:continue` when exploring
- During `/opsx:apply`, if something's wrong — fix the artifact, then continue
- Tasks track progress via checkboxes in `tasks.md`
- Check status anytime: `openspec status --change "name"`

## Reading

### Articles/Blogs/Essays

- [OpenSpec vs Spec Kit: Choosing the Right AI-Driven Development Workflow for Your Team](https://hashrocket.com/blog/posts/openspec-vs-spec-kit-choosing-the-right-ai-driven-development-workflow-for-your-team)
- [How to make AI follow your instructions more for free](https://dev.to/webdeveloperhyper/how-to-make-ai-follow-your-instructions-more-for-free-openspec-2c85)
- [OpenSpec: A Spec-Driven Workflow for AI Coding Assistants (No API Keys Needed)](https://medium.com/coding-nexus/openspec-a-spec-driven-workflow-for-ai-coding-assistants-no-api-keys-needed-d5b3323294fa)

---

# ChatGPT-generated workflow

(The document below this line is designed to be saved as `docs/BUILD_PLAYBOOK.md` and used as the primary engineering playbook for a new project. It uses a hypothetical task-management application for examples; the same process applies to other application types.)

# Application Delivery Playbook

## From Empty Repository to Production with OpenSpec and OpenCode

**Document status:** Engineering blueprint
**Intended audience:** Software engineers, technical leads, architects, and AI coding agents
**Methodology:** Specification-driven development, incremental delivery, architecture decision records, automated verification, and controlled production releases
**Example application:** A task-management web application
**Primary tools:** OpenSpec, OpenCode, Git, automated tests, CI/CD, and a production hosting platform

---

## 1. Purpose and Scope

This playbook defines the process for building a production application from an empty Git repository through its first production release.

It combines three complementary engineering practices:

- **Architecture Decision Records (ADRs):** Document important architectural choices, their rationale, alternatives, and consequences.
- **OpenSpec:** Manage product behavior, feature specifications, proposed changes, implementation tasks, and the history of completed changes.
- **OpenCode:** Assist with exploration, planning, implementation, testing, debugging, and review under explicit project instructions and permissions.

The objective is to establish a repeatable process in which every meaningful application change is planned, implemented, tested, reviewed, and documented.

The workflow is intentionally incremental. The first feature should not require a complete enterprise architecture, and the first production deployment should not wait until every planned feature has been implemented.

### 1.1 Expected outcomes

At the end of this process, the repository should contain:

- A documented product scope and set of requirements.
- A collection of ADRs explaining the important architectural decisions.
- OpenSpec specifications describing the application's expected behavior.
- Archived OpenSpec changes providing a history of how capabilities were introduced.
- An application organized into understandable modules.
- Automated unit, integration, and end-to-end tests appropriate to the application.
- Reproducible local development and build instructions.
- CI/CD workflows that validate changes and control releases.
- Security, observability, backup, recovery, and operational documentation.
- A verified production deployment with a rollback strategy.

### 1.2 The core engineering loop

```
Product idea
    |
    v
Explore requirements and options
    |
    v
Record important architectural decisions
    |
    v
OpenSpec: propose a change
    |
    v
Review proposal, specifications, design, and tasks
    |
    v
OpenCode: apply implementation tasks
    |
    v
Run tests and quality gates
    |
    v
Review and merge the change
    |
    v
OpenSpec: archive the completed change
    |
    v
Deploy when the release gates are satisfied
    |
    v
Observe production behavior
    |
    +------> Next specification-driven change
```

OpenSpec's default workflow provides proposal, specification, design, and task artifacts, while its change lifecycle supports archiving completed work. OpenCode provides the agent environment in which those artifacts can be reviewed and implemented. See the [OpenSpec Quickstart](<https://openspec.dev/docs/quickstart>), [OpenSpec specification-driven schema](<https://openspec.dev/docs/schemas/spec-driven>), and [OpenCode agents documentation](<https://docs.opencode.ai/docs/agents/>).

---

# Phase I — Bootstrap the Repository and Development Environment

## 2. Step 1: Create the Empty Repository

### Objective

Establish version control and a minimal directory structure before application implementation begins.

Do not make framework or infrastructure decisions merely because a framework's starter template happens to be available.

### Actions

1. Create the Git repository.
2. Establish the documentation structure.
3. Add an initial README.
4. Add `.gitignore`.
5. Install the development tools.
6. Commit the initial repository state.

### Example

```
mkdir task-manager
cd task-manager

git init

mkdir -p docs/architecture/adr
mkdir -p docs/product
mkdir -p docs/runbooks
mkdir -p tests

touch README.md
touch .gitignore
```

The application source directory should be created after the initial language and framework choices have been made.

An example initial structure is:

```
task-manager/
├── README.md
├── .gitignore
├── AGENTS.md
├── docs/
│   ├── BUILD_PLAYBOOK.md
│   ├── product/
│   ├── architecture/
│   │   └── adr/
│   └── runbooks/
├── tests/
└── openspec/
    ├── config.yaml
    ├── specs/
    └── changes/
        └── archive/
```

The `openspec/` directory is created by OpenSpec initialization rather than manually assembled.

The `AGENTS.md` file will contain the instructions that guide OpenCode throughout the project.

### Initial `.gitignore`

Adapt the following example to the chosen stack:

```
.env
.env.*
!.env.example

node_modules/
dist/
build/
coverage/
.venv/
__pycache__/

.DS_Store
.idea/
.vscode/
```

Do not ignore dependency lockfiles, migrations, infrastructure definitions, or other files necessary to reproduce a build.

### Initial README

```
# Task Manager

A task-management application.

## Project status

Initial development.

## Documentation

- Build playbook: docs/BUILD_PLAYBOOK.md
- Architecture decisions: docs/architecture/adr/
- Product requirements: docs/product/
- Application specifications: openspec/specs/

## Development

See the development setup instructions once the initial
technology stack and build commands have been established.
```

### Exit criteria

- Git is initialized.
- The repository has a clear documentation structure.
- No credentials or machine-specific configuration are committed.
- The initial repository state can be reproduced by another developer.

---

## 3. Step 2: Install OpenSpec and OpenCode

### Objective

Set up the two tools and verify that they can operate against the repository.

Keep the tools conceptually separate:

| Tool | Responsibility |
| --- | --- |
| OpenSpec | Product behavior, change proposals, specifications, design artifacts, task tracking, and change archival |
| OpenCode | AI-assisted reasoning, code generation, file editing, command execution, testing, and debugging |
| Git | Source history, branching, commits, and reviewable change sets |
| CI/CD | Repeatable automated verification and controlled delivery |

OpenSpec's current installation documentation specifies Node.js 20.19.0 or newer for its CLI. Follow the official installation instructions for the current supported installation methods. [OpenSpec installation](<https://openspec.dev/docs/installation>).

### Install OpenSpec

```
node --version

npm install -g @fission-ai/openspec@latest

openspec --version
```

### Install OpenCode

Follow the official OpenCode installation guide.

Verify the CLI:

```
opencode --version
```

The exact runtime, package manager, model provider, and authentication method depend on the selected environment.

### Initialize OpenSpec

Run the initialization command from the repository root:

```
openspec init
```

Select OpenCode or the corresponding supported integration when prompted, if offered by the installed version.

Inspect what was created:

```
git status --short
find openspec -maxdepth 3 -type f
```

Initialization generally creates the OpenSpec configuration, specification and change directories, and integration files for the selected AI tooling. Commit those project-level files so that the workflow is shared with the team.

Reference: [OpenSpec project setup](<https://openspec.dev/docs/setup>).

### Initialize OpenCode instructions

Launch OpenCode in the project directory:

```
opencode
```

Use its `/init` command to create or update project instructions, then review the generated file rather than accepting it blindly.

OpenCode documents `AGENTS.md` as the project-level mechanism for persistent coding instructions. [OpenCode rules](<https://docs.opencode.ai/docs/rules/>).

### Verify the setup

```
openspec --version
opencode --version
openspec list
```

Also inspect the OpenCode integration files and confirm that its configured commands or skills correspond to the installed OpenSpec workflow.

**Important:** OpenSpec slash commands are issued in the AI coding environment. Commands such as `openspec validate` and `openspec archive` are CLI commands issued in the terminal. Do not confuse the two interfaces.

---

## 4. Step 3: Establish Project Instructions for OpenCode

### Objective

Make AI-assisted implementation consistent, constrained, and reviewable across sessions.

The project instructions should explain how to work in the repository, where the authoritative requirements live, which checks must pass, and when the agent must stop for human review.

### Example `AGENTS.md`

```
# Project Engineering Instructions

## Sources of truth

- Product scope: docs/product/
- Architecture decisions: docs/architecture/adr/
- Current application behavior: openspec/specs/
- In-progress changes: openspec/changes/
- Operational procedures: docs/runbooks/

## Workflow

1. Read relevant project instructions and existing specifications.
2. Inspect the existing implementation before proposing changes.
3. Identify relevant ADRs and existing capabilities.
4. Use OpenSpec to propose behavior changes before implementation.
5. Review proposal, specifications, design, and tasks before coding.
6. Implement one coherent change at a time.
7. Add tests for new behavior and regression risks.
8. Run focused tests, the full required test suite, and quality checks.
9. Summarize changed files, test results, assumptions, and unresolved risks.
10. Archive completed OpenSpec changes only after verification and review.

## Engineering rules

- Do not invent requirements that are absent from the specification.
- Do not introduce a dependency without explaining its purpose.
- Do not weaken tests merely to make an implementation pass.
- Do not commit credentials or secrets.
- Do not run destructive production operations without explicit approval.
- Do not deploy directly to production without the release gates.
- Keep changes focused and avoid unrelated refactoring.

## Verification

- Follow the repository's documented build and test commands.
- Test failure paths and authorization boundaries.
- Preserve existing behavior unless the approved change explicitly alters it.
- Report any checks that could not be executed.
```

This is a starting point, not a substitute for actual project rules. Replace generic instructions with the selected stack's commands once those commands are established.

### Recommended OpenCode usage

Use the Plan agent for read-only exploration and analysis. Use the Build agent when an approved implementation is ready. A specialized review agent can provide an additional review pass with editing permissions disabled.

OpenCode supports primary agents, subagents, and configurable permissions. See [OpenCode agents](<https://docs.opencode.ai/docs/agents/>) and [OpenCode permissions](<https://docs.opencode.ai/docs/permissions/>).

### Example working sequence

In OpenCode:

```
Analyze the repository and its current instructions.
Do not create application code yet.

Identify the decisions that must be made before implementation.
Separate mandatory decisions from choices that can be deferred.

Recommend the smallest useful first application capability.
Explain the risks and assumptions behind your recommendation.
```

Review the response. Ask follow-up questions, inspect source references, and make the actual decisions before implementation begins.

### Exit criteria

- The agent knows where specifications and ADRs are located.
- The agent is instructed to test its changes.
- Destructive operations and production changes require appropriate approval.
- The team can repeat the same workflow in a fresh OpenCode session.

---

# Phase II — Define the Product and Architecture

## 5. Step 4: Define the Product Scope

### Objective

Identify the product's purpose, users, essential workflows, constraints, and first releasable capability.

Do not attempt to specify every future feature at once.

### Create `docs/product/PRODUCT_BRIEF.md`

```
# Product Brief

## Problem

Users need a simple way to create, track, and complete tasks.

## Primary users

- Individual users managing their own tasks.
- Administrators responsible for operational support.

## Initial product outcome

A user can create a task, view their tasks, update a task,
and mark a task as completed.

## Initial scope

- Task creation.
- Task listing.
- Task updates.
- Task completion.
- Basic input validation.
- Persistent storage.
- Operational health checks.

## Deferred scope

- Team collaboration.
- External integrations.
- Advanced reporting.
- Complex workflow automation.

## Constraints

- Application must be deployable to a production environment.
- User data must not be exposed across authorization boundaries.
- Database changes must be reproducible.
- Production configuration must not depend on developer machines.

## Success criteria

- Core task workflows pass automated tests.
- Unauthorized data access is prevented.
- A new environment can be provisioned from documented instructions.
- A release can be deployed and rolled back using a documented procedure.
```

### Identify the first useful vertical slice

A suitable first feature is task creation and retrieval.

It exercises several real system boundaries:

1. Input validation.
2. Business rules.
3. Persistence.
4. API or application interface.
5. Automated verification.
6. Deployment readiness.

This provides more architectural information than building a large collection of empty modules.

### Exit criteria

The team agrees on the problem, the initial user, the first useful workflow, and what is explicitly outside the initial release.

---

## 6. Step 5: Create an Architecture Decision Process

### Objective

Record the architectural choices that materially affect future development.

An ADR is not a feature specification and is not a substitute for a design document. It records why an important choice was made.

### Which decisions deserve an ADR?

Typical examples include:

- Programming language and framework.
- Application architecture.
- Database technology.
- Authentication and authorization approach.
- API design and versioning.
- Hosting and deployment strategy.
- Background processing.
- Observability and error reporting.
- Data retention and recovery strategy.
- External service dependencies.

Not every implementation detail deserves an ADR. Choosing a local variable name, for example, is not an architectural decision.

### ADR directory

```
docs/
└── architecture/
    └── adr/
        ├── ADR-0001-application-architecture.md
        ├── ADR-0002-runtime-and-framework.md
        ├── ADR-0003-persistence.md
        ├── ADR-0004-authentication.md
        └── ADR-0005-production-deployment.md
```

### ADR template

Create `docs/architecture/adr/ADR-TEMPLATE.md`:

```
# ADR-NNNN: Decision title

- Status: Proposed
- Date: YYYY-MM-DD
- Owners: Engineering team
- Related specifications: [OpenSpec capability or change]

## Context

What problem needs to be solved?
What constraints and requirements apply?

## Decision drivers

- Requirement 1.
- Requirement 2.
- Operational constraint.
- Security or compliance constraint.

## Options considered

### Option A

Advantages:
- ...

Disadvantages:
- ...

### Option B

Advantages:
- ...

Disadvantages:
- ...

## Decision

Describe the selected option precisely.

## Consequences

### Positive

- ...

### Negative and trade-offs

- ...

## Validation

How will the team verify that this decision is appropriate?

## Revisit conditions

What evidence would justify reconsidering this decision?
```

### ADR lifecycle

Use these statuses consistently:

- **Proposed:** Under discussion.
- **Accepted:** Approved and ready to guide implementation.
- **Superseded:** Replaced by a later decision.
- **Rejected:** Considered and not selected.

Once a decision is accepted, later implementation should follow it unless a subsequent ADR explicitly changes it.

### Example ADR: application architecture

The following is illustrative; it is not a recommendation for every application.

```
# ADR-0001: Start with a Modular Monolith

- Status: Accepted
- Date: YYYY-MM-DD

## Context

The initial application is small, and its future scale is uncertain.
There is no established requirement for independent service deployment.

## Options considered

### Modular monolith

A single deployable application with explicit module boundaries.

### Microservices

Multiple independently deployed services with network communication.

## Decision

Start with a modular monolith.

Organize code by business capability, keep infrastructure behind
clear interfaces where useful, and avoid cross-module dependencies
that violate the defined boundaries.

## Consequences

### Positive

- Simpler local development.
- Fewer deployment components.
- Easier end-to-end testing.
- Lower initial operational overhead.

### Negative

- Modules share a deployment lifecycle.
- Strong boundaries must be enforced through code review and tests.

## Revisit conditions

Reconsider the architecture if independent deployment, separate
scaling, or organizational ownership requirements justify it.
```

### How ADRs relate to OpenSpec

ADRs establish architectural constraints. OpenSpec establishes expected application behavior and the approved work needed to implement that behavior.

For example:

- ADR: Use a relational database for durable task storage.
- Feature specification: A successfully created task must be retrievable after a subsequent request.
- Design document: The task repository uses a database-backed implementation.
- Implementation tasks: Create migration, persistence adapter, and integration tests.

Do not create a separate ADR for every feature. Reference existing decisions in each change's design document and create a new ADR only when the change introduces a meaningful new architectural decision.

### Exit criteria

The foundational decisions needed for the first feature have been reviewed and accepted. Decisions that can safely be deferred remain open rather than being guessed prematurely.

---

## 7. Step 6: Select and Document the Technology Stack

### Objective

Translate architectural requirements into a reproducible development stack.

The exact stack should be chosen based on the product's constraints, team expertise, operational requirements, and hosting environment.

A typical web application might use:

- A frontend framework.
- A backend framework or server runtime.
- A relational database.
- A migration tool.
- A test framework.
- A container or equivalent deployment package.
- A managed hosting platform.

These are examples of categories, not mandatory dependencies.

### Record the choices

Create an ADR for the stack or reference the stack choices in the initial architecture ADRs.

For every important dependency, document:

- Why it is needed.
- Whether it is a runtime or development dependency.
- How its version is managed.
- How it is tested.
- How it is configured in production.
- What the migration path would be if it is replaced.

### Example: stack decision matrix

| Concern | Decision to make | Validation |
| --- | --- | --- |
| Runtime | Language and supported version | Reproducible build |
| Application framework | Routing, request handling, UI | Smoke test |
| Persistence | Database and migration mechanism | Integration test |
| Testing | Unit, integration, browser testing | CI execution |
| Packaging | Container or platform-native artifact | Clean build |
| Hosting | Application and database environment | Deployment rehearsal |
| Secrets | Secret manager or deployment platform | Configuration audit |
| Observability | Logs, metrics, errors, alerts | Operational smoke test |

### Avoid premature complexity

A first release rarely needs a message broker, distributed tracing platform, Kubernetes cluster, multi-region database, and several independently deployed services unless concrete requirements justify them.

Architectural simplicity is a deliberate decision, not an absence of architecture.

### Exit criteria

The stack is documented, its critical versions are controlled, and a developer can explain how the application will be built, tested, and deployed.

---

# Phase III — Establish OpenSpec as the Requirements System

## 8. Step 7: Understand the OpenSpec Repository Model

### Objective

Use OpenSpec to distinguish current application behavior from proposed changes and completed historical changes.

The central directories are:

- `openspec/specs/`: the current specification of application behavior.
- `openspec/changes/`: proposed and in-progress changes.
- `openspec/changes/archive/`: completed change records.
- `openspec/config.yaml`: project-level OpenSpec configuration.

The exact integration files depend on the tool selected during initialization.

Reference: [OpenSpec setup](<https://openspec.dev/docs/setup>).

### Example structure after the first features

```
openspec/
├── config.yaml
├── specs/
│   ├── task-management/
│   │   └── spec.md
│   ├── identity/
│   │   └── user-authentication/
│   │       └── spec.md
│   └── operations/
│       └── health-checks/
│           └── spec.md
└── changes/
    ├── add-task-management/
    │   ├── proposal.md
    │   ├── design.md
    │   ├── tasks.md
    │   └── specs/
    │       └── task-management/
    │           └── spec.md
    └── archive/
```

A change can affect more than one capability, so its `specs/` directory can contain multiple capability-specific specification files.

### Important distinction

The change name describes the work being done. The capability name describes a durable area of application behavior.

Good change names:

- `add-task-management`
- `add-user-authentication`
- `add-task-search`
- `add-production-health-checks`

Good capability names:

- `task-management`
- `user-authentication`
- `task-search`
- `health-checks`

Avoid creating a new capability for every individual implementation task.

### Inspect the current state

```
openspec list
openspec list --specs
openspec view
```

Use `openspec show` to inspect relevant changes and specifications. Consult `openspec --help` and the [OpenSpec CLI reference](<https://openspec.dev/docs/cli>) for the installed version's supported options.

### Exit criteria

Everyone understands where authoritative behavior is defined, where pending work lives, and how completed changes become part of the current specification.

---

## 9. Step 8: Configure OpenSpec Project Context

### Objective

Give OpenSpec enough context to generate changes that follow the project's actual architecture and conventions.

Review `openspec/config.yaml` and the current documentation for the installed OpenSpec version before modifying the configuration.

Project context should identify:

- Application purpose.
- Selected language and framework.
- Architectural boundaries.
- Coding conventions.
- Test commands.
- Security expectations.
- ADR location.
- Relevant documentation.
- Restrictions on dependencies and infrastructure.

For example, the conceptual context could be:

```
# Illustrative only. Preserve the schema and field names
# supported by the installed OpenSpec version.

schema: spec-driven
```

Do not paste unsupported keys into the real configuration. Add project context through the supported configuration fields or project instructions documented for the installed version.

The default `spec-driven` workflow generates:

- `proposal.md`
- `specs/**/*.md`
- `design.md`
- `tasks.md`

See [OpenSpec's specification-driven schema](<https://openspec.dev/docs/schemas/spec-driven>).

### Rules for writing specifications

A specification describes observable behavior, not internal implementation details.

Good:

> The system SHALL allow an authenticated user to create a task with a nonempty title.

Not suitable as a behavioral requirement:

> Create a `TaskService` class and call `TaskRepository.save()`.

The second statement belongs in a design document or task checklist because the implementation could change without altering the externally observable behavior.

### Exit criteria

OpenSpec has enough project context to generate meaningful, consistent planning artifacts without hardcoding a particular implementation prematurely.

---

# Phase IV — Build the Initial Application in Deliberate Increments

## 10. Step 9: Explore the First Feature

### Objective

Use OpenCode to clarify the first feature before creating a formal change proposal.

Start with the smallest capability that provides a useful end-to-end outcome.

For this example, that is task creation and retrieval.

### Prompt example

```
Help me explore the first useful capability of this application.

Read:
- AGENTS.md
- docs/product/PRODUCT_BRIEF.md
- all relevant accepted ADRs
- openspec/config.yaml

The repository is initially empty apart from documentation
and tooling.

Identify:
1. The minimum user-visible capability to implement.
2. The requirements needed to verify that capability.
3. The architecture decisions required before implementation.
4. Security and failure scenarios.
5. What can safely be deferred.

Do not implement the application yet.
Do not invent a production stack if the project has not selected one.
Present assumptions and alternatives for review.
```

OpenSpec supports an exploration-first approach for projects that have not yet chosen a stack or fully defined their architecture. See the [OpenSpec Quickstart](<https://openspec.dev/docs/quickstart>).

### Review the exploration

Ask:

- Does the feature produce a useful user outcome?
- Are the acceptance criteria measurable?
- Are the architecture choices justified by actual requirements?
- Are failure scenarios included?
- Is the scope small enough to implement and test in a few coherent increments?
- Are there dependencies on authentication or infrastructure that must be addressed first?

Exploration is for learning and decision-making. It is not permission to implement every suggestion.

### Exit criteria

The first capability is clearly defined, the necessary architectural decisions are resolved, and the team is ready to create a formal change.

---

## 11. Step 10: Propose the First OpenSpec Change

### Objective

Create a formal, reviewable description of the work before implementation.

In the OpenCode chat, use the OpenSpec proposal command supported by the installed integration.

For the standard OpenSpec workflow, the command is typically:

```
/opsx:propose add-task-management
```

If the installed integration exposes a different command, use the command registered by that integration.

### Example proposal

`openspec/changes/add-task-management/proposal.md`:

```
# Add Task Management

## Why

Users need a durable way to create and retrieve tasks.

This capability establishes the initial task-management workflow
and validates the application's core request, business-rule,
persistence, and testing boundaries.

## What Changes

- Add task creation.
- Add task retrieval.
- Validate task titles.
- Persist task records.
- Return documented success and validation responses.

## Capabilities

### New Capabilities

- task-management: Create and retrieve tasks.

### Modified Capabilities

None.

## Impact

- Application domain logic.
- API or application interface.
- Database schema.
- Automated tests.
- Local development documentation.
```

The example intentionally does not specify framework-specific class names or database implementation details.

### Review before coding

Read the proposal and make sure:

- The problem is real and clearly described.
- The scope is bounded.
- The capability path is appropriate.
- The change does not overlap confusingly with another active change.
- The impact section identifies all relevant boundaries.

### Exit criteria

The proposal is approved by the appropriate reviewer before the agent writes application code.

---

## 12. Step 11: Write Testable Feature Specifications

### Objective

Define the required behavior and the scenarios that demonstrate whether the feature works.

OpenSpec uses delta specifications inside a change. These describe the requirements being added, modified, removed, or renamed relative to the current application specification.

### Example task-management specification

`openspec/changes/add-task-management/specs/task-management/spec.md`:

```
# Spec Delta

## Purpose

Provide users with a durable way to create and retrieve tasks.

## ADDED Requirements

### Requirement: Create a task

The system SHALL allow a valid task to be created and persisted.

#### Scenario: Successful creation

- **WHEN** a valid task title is submitted
- **THEN** the system creates a task
- **AND** returns the task identifier
- **AND** the task can subsequently be retrieved

#### Scenario: Empty title

- **WHEN** a task is submitted with an empty title
- **THEN** the system rejects the request
- **AND** returns a documented validation error

### Requirement: Retrieve a task

The system SHALL allow a task to be retrieved by its identifier.

#### Scenario: Existing task

- **WHEN** a valid identifier refers to an existing task
- **THEN** the system returns that task

#### Scenario: Unknown task

- **WHEN** an identifier does not refer to an existing task
- **THEN** the system returns the documented not-found outcome
```

The scenarios can later become automated tests. They do not need to name classes, methods, or framework-specific constructs.

### Additional cases to consider

For a production feature, ask whether the specification should also cover:

- Missing request fields.
- Whitespace-only titles.
- Maximum title length.
- Invalid identifiers.
- Persistence failures.
- Duplicate requests and retry behavior.
- Authorization, if users own separate tasks.
- Data consistency.
- Response schema and compatibility.

Do not automatically include every conceivable edge case in the first specification. Include the cases relevant to the product, security model, and failure risks.

### Requirement quality rules

Each requirement should:

1. Describe one behavior.
2. State an unambiguous expectation.
3. Include at least one scenario.
4. Be independently verifiable where practical.
5. Avoid implementation-specific instructions.
6. Specify relevant error behavior.

OpenSpec uses specific Markdown structure for delta specifications. In particular, requirement headings and `WHEN`/`THEN` scenario structures matter for validation. Consult the [specification schema](<https://openspec.dev/docs/schemas/spec-driven>) before inventing custom formats.

### Exit criteria

The feature can be tested against the specification without needing to guess what successful or failed behavior means.

---

## 13. Step 12: Create the Technical Design

### Objective

Describe how the approved behavior will be implemented within the accepted architecture.

The OpenSpec `design.md` artifact is the natural place to describe implementation decisions that are specific to a proposed change.

### Example design

`openspec/changes/add-task-management/design.md`:

```
# Design: Task Management

## Architecture

Use the existing application architecture established by the
accepted ADRs.

Keep task validation and business rules separate from transport
and persistence concerns where the selected stack supports these
boundaries naturally.

## Data model

A task contains:

- id
- title
- status
- created_at
- updated_at

The identifier format and timestamp representation must follow
the project-wide conventions.

## Request flow

1. Receive a task creation request.
2. Validate the input.
3. Apply business rules.
4. Persist the task.
5. Return the documented response.
6. Verify retrieval through the normal application interface.

## Failure handling

- Invalid input returns a validation response.
- Missing records return a not-found response.
- Unexpected infrastructure failures are logged safely and
  return an appropriate server error.

## Testing

- Unit tests cover task validation and business rules.
- Integration tests cover persistence and retrieval.
- Interface tests cover response status and payload.
```

### Reference the ADRs

If the application uses a modular monolith, reference the accepted architecture ADR rather than rearguing the decision in every feature design.

If the change requires a genuinely new architectural choice, create or update an ADR as part of the change before implementing the affected design.

### Avoid overdesign

The first feature does not need to establish every future abstraction. Design only the boundaries needed to satisfy the current requirements while remaining consistent with the accepted architecture.

### Exit criteria

The implementation approach is specific enough to estimate, test, and review, but not so prescriptive that harmless implementation details become contractual requirements.

---

## 14. Step 13: Break the Design into Implementation Tasks

### Objective

Convert the approved design into a sequence of small, verifiable tasks.

OpenSpec generates `tasks.md` after the proposal, specifications, and design have been prepared in the default specification-driven workflow.

### Example tasks

`openspec/changes/add-task-management/tasks.md`:

```
## 1. Domain and persistence

- [ ] 1.1 Create the task domain model.
- [ ] 1.2 Implement task title validation.
- [ ] 1.3 Add the task persistence mechanism.
- [ ] 1.4 Add the database migration if applicable.

## 2. Application interface

- [ ] 2.1 Implement task creation.
- [ ] 2.2 Implement task retrieval.
- [ ] 2.3 Add input and response validation.
- [ ] 2.4 Implement documented error handling.

## 3. Verification

- [ ] 3.1 Add domain unit tests.
- [ ] 3.2 Add persistence integration tests.
- [ ] 3.3 Add interface tests.
- [ ] 3.4 Verify behavior against every scenario.

## 4. Documentation

- [ ] 4.1 Document local setup.
- [ ] 4.2 Document the task interface.
- [ ] 4.3 Document required configuration.
```

Adapt this checklist to the chosen framework and the generated task template.

### What makes a good implementation task?

A task should have:

- A bounded scope.
- A clear outcome.
- A way to verify completion.
- A manageable set of files or concerns.
- Minimal dependence on unrelated unfinished work.

For example, "build the backend" is too broad. "Add integration tests proving that a created task can be retrieved from the configured test database" is more actionable.

### Review task dependencies

The ordering above is illustrative. Some teams prefer a vertical-slice order in which an initial minimal API and its persistence path are implemented and tested before secondary refinements.

The key is to make dependencies explicit and avoid marking tasks complete merely because code has been generated.

### Exit criteria

All planned tasks can be mapped to the specification or to necessary supporting engineering work, and each task has a verification strategy.

---

## 15. Step 14: Validate the OpenSpec Change Before Coding

### Objective

Catch incomplete or inconsistent requirements before implementation begins.

Use the actual change identifier and validate the generated artifacts.

```
openspec list
openspec status --help
openspec validate --help
```

For versions supporting the following form:

```
openspec validate add-task-management
```

Use strict validation where supported and appropriate.

```
openspec validate --help
```

Then inspect the proposal, all delta specifications, design, and tasks.

### Review checklist

- [ ]The proposal describes the intended outcome.
- [ ]Each declared capability has a corresponding specification delta.
- [ ]Existing capabilities are modified rather than duplicated.
- [ ]Each requirement has at least one scenario.
- [ ]The design respects accepted ADRs.
- [ ]Tasks cover all specified behavior.
- [ ]Tests are planned for normal and relevant failure paths.
- [ ]Security requirements are not missing.
- [ ]Dependencies and unresolved assumptions are documented.

Do not treat a successful structural validation as proof that the requirements are correct. Structural validation and engineering review solve different problems.

### Exit criteria

The change is internally consistent and has received human approval for implementation.

---

## 16. Step 15: Implement the Change with OpenCode

### Objective

Implement the approved plan without allowing the agent to silently expand the scope.

Start with a fresh OpenCode session when practical, particularly if a long planning session has accumulated unrelated context.

### Example

```
/opsx:apply
```

If the installed integration supports naming the change in the command, use the appropriate form. Otherwise, explicitly identify the approved change in the conversation.

Prompt:

```
Apply the approved OpenSpec change add-task-management.

Read the proposal, specification deltas, design, tasks, AGENTS.md,
and relevant ADRs before making changes.

Work through tasks.md incrementally.

For each task:
1. Inspect the existing repository state.
2. Implement the smallest coherent change.
3. Add or update relevant automated tests.
4. Run focused verification.
5. Update the task checklist only after verification.
6. Report failures, assumptions, and deviations.

Do not add unrelated features.
Do not change accepted architectural decisions without approval.
Do not claim a test passed unless you executed it and observed
a successful result.
```

### Preferred implementation pattern

For each task:

1. Read the relevant requirements and design.
2. Make a small implementation change.
3. Add or update tests.
4. Run the focused test suite.
5. Inspect the diff.
6. Resolve failures.
7. Update task status.
8. Continue to the next task.

This creates a series of inspectable checkpoints instead of a large, opaque code-generation operation.

### Example verification cycle

```
git status --short
git diff --check
git diff
```

Then execute the repository's actual formatting, linting, type-checking, and test commands.

For example, a JavaScript project might use:

```
npm run lint
npm run typecheck
npm test
npm run build
```

These commands are illustrative. Define the actual scripts for the selected stack and ensure they are documented in the README.

### Handling an implementation mismatch

If the agent discovers that the design cannot satisfy the specification:

- Stop the affected implementation.
- Describe the mismatch.
- Determine whether the specification is wrong, incomplete, or merely difficult to implement.
- Revise the change artifacts if necessary.
- Obtain approval for material changes.
- Resume implementation from the revised plan.

Do not silently alter requirements to make an existing implementation appear correct.

### Exit criteria

Every task is complete, focused tests pass, the diff has been inspected, and the implementation satisfies the intended behavior.

---

## 17. Step 16: Verify Behavior Against the Specifications

### Objective

Independently check that the implementation satisfies the specification rather than merely compiling.

If the installed OpenSpec workflow includes a verification command, use it. Some OpenSpec workflow profiles expose `/opsx:verify`; verify that it is available in the current integration before relying on it.

### Verification dimensions

**Completeness**

- Are all requirements implemented?
- Are all scenarios covered?
- Are any tasks incomplete?

**Correctness**

- Does the code produce the expected outcomes?
- Are invalid inputs rejected?
- Are relevant failure modes handled?

**Coherence**

- Does the implementation follow accepted ADRs?
- Are module boundaries respected?
- Is behavior consistent with existing capabilities?

**Regression safety**

- Do existing tests still pass?
- Have API contracts or data formats changed unintentionally?
- Are migrations compatible with the deployment approach?

### Example verification prompt

```
Review the implementation of add-task-management against its
OpenSpec artifacts.

Do not modify files during this review.

For every requirement and scenario:
- Identify the implementation location.
- Identify the corresponding automated test.
- Report missing or inadequate coverage.
- Report behavior that differs from the specification.
- Report violations of accepted ADRs.
- Report any unverified production assumptions.

Distinguish confirmed defects from risks or recommendations.
```

A read-only OpenCode review agent is useful here because it reduces the risk of a reviewer modifying the same implementation it is evaluating. See [OpenCode agents](<https://docs.opencode.ai/docs/agents/>).

### Testing layers

Use the appropriate layers for the application:

| Test layer | Purpose | Example |
| --- | --- | --- |
| Unit | Isolated business behavior | Reject a blank task title |
| Integration | Interaction between components | Persist and retrieve a task |
| API or contract | Externally observable interface | Verify status and response body |
| End-to-end | User-visible workflow | Create and view a task |
| Security | Authorization and abuse resistance | Prevent cross-user task access |
| Smoke | Basic deployed functionality | Verify health and core endpoint |

Not every feature requires a browser test, but critical user workflows should have appropriate end-to-end coverage before production.

### Exit criteria

All applicable verification layers pass, the acceptance criteria are satisfied, and unresolved issues have been explicitly recorded and dispositioned.

---

## 18. Step 17: Review the Change and Archive It

### Objective

Complete the feature's lifecycle while preserving the current specification and historical implementation plan.

Before archiving:

1. Review the code diff.
2. Confirm all required checks passed.
3. Confirm the specification and implementation agree.
4. Review any ADR changes.
5. Ensure no credentials or generated artifacts were committed.
6. Confirm task status accurately reflects reality.
7. Obtain the required human review and merge approval.

### Archive with OpenSpec

For the standard workflow:

```
/opsx:archive
```

Use the appropriate installed command if the integration differs.

OpenSpec archival merges the change's specification deltas into the current specifications and moves the completed change into the archive. See the [OpenSpec Quickstart](<https://openspec.dev/docs/quickstart>).

### Verify the resulting state

```
openspec list
openspec list --specs
```

Inspect the updated capability specification and archived change.

The important distinction is:

- `openspec/specs/` describes the system's current expected behavior.
- `openspec/changes/archive/` preserves the history of how changes were planned and completed.

### Git workflow

The change artifacts and source code should be version-controlled together.

A typical workflow is:

```
git checkout -b feature/add-task-management

# Implement, test, and review the approved change.

git diff --check
git status --short
git diff

git add .
git commit -m "feat: add task management"
```

For a team using pull requests, push the branch and open a review before merging:

```
git push -u origin feature/add-task-management
```

The exact branch and commit conventions should follow the repository's contribution policy.

**Important:** Do not archive a change simply because the implementation agent has stopped working. Archive only when the team is satisfied that the change is complete and the relevant specifications accurately represent the shipped behavior.

---

# Phase V — Choose a Module and Feature Delivery Strategy

## 19. Step 18: Decide How to Organize Specifications

Two approaches work well with OpenSpec. They are alternatives, not competing requirements.

### Approach A: Feature-first delivery

Use one OpenSpec change for one coherent, user-visible capability.

Example:

```
add-task-management
add-task-editing
add-task-completion
add-user-authentication
add-task-ownership
```

Each change creates or updates one or more capability specifications.

This approach is appropriate when:

- The product is small or medium-sized.
- Features can be delivered independently.
- The architecture is still evolving.
- The team wants rapid feedback from end-to-end behavior.

**Advantage:** Each change has a concrete outcome and can be implemented, tested, reviewed, and deployed independently.

**Risk:** If capability boundaries are not maintained, the specifications can become fragmented or duplicated.

### Approach B: Module-oriented planning with feature-first implementation

First establish the system's major modules, then define individual feature changes within each module.

Example:

```
Module: Identity
    ├── add-user-registration
    ├── add-user-authentication
    ├── add-session-management
    └── add-password-recovery

Module: Task Management
    ├── add-task-creation
    ├── add-task-editing
    ├── add-task-completion
    └── add-task-search

Module: Operations
    ├── add-health-checks
    ├── add-structured-logging
    ├── add-monitoring
    └── add-backup-verification
```

This approach is useful when the application has multiple business domains or several teams are working in parallel.

**Advantage:** Dependencies, ownership, and architectural boundaries become easier to understand.

**Risk:** A large module plan can become an artificial waterfall phase if implementation is delayed until every module is completely designed.

### Recommended combination

For most new applications:

1. Define broad modules and boundaries in the architecture documentation.
2. Create durable capability specifications for application behavior.
3. Implement one small feature change at a time.
4. Introduce additional module detail only when real requirements justify it.
5. Deploy complete vertical slices whenever practical.

A module is an architectural boundary. A feature is a unit of behavior change. They should not be forced to correspond one-to-one.

---

## 20. Step 19: Build the Remaining Application in Dependency Order

### Objective

Extend the initial working slice into a complete application without creating unnecessary dependencies or implementing features before their prerequisites exist.

The following sequence is illustrative for a task-management application.

| Stage | Change | Prerequisites | Main outcome |
| --- | --- | --- | --- |
| 1 | `add-task-management` | Repository and architecture | Create and retrieve tasks |
| 2 | `add-task-editing` | Task management | Update task details |
| 3 | `add-task-completion` | Task management | Complete and reopen tasks if required |
| 4 | `add-user-authentication` | Identity architecture | Authenticate users |
| 5 | `add-task-ownership` | Authentication | Restrict tasks to authorized users |
| 6 | `add-frontend-workflows` | API and UX decisions | Complete user workflows |
| 7 | `add-input-abuse-protection` | Interface and threat model | Protect against malformed or abusive requests |
| 8 | `add-production-health-checks` | Runtime architecture | Expose readiness and liveness information |
| 9 | `add-operational-observability` | Logging and hosting decisions | Diagnose application behavior |
| 10 | `add-production-release-pipeline` | Build and deployment design | Deliver repeatable releases |

The exact order may change according to the product. For example, if authentication is a prerequisite for every task operation, implement the relevant identity foundations earlier.

### Repeat the same lifecycle for every feature

For each row:

1. Explore the behavior and relevant dependencies.
2. Propose the OpenSpec change.
3. Review and update specifications.
4. Review the technical design.
5. Break work into implementation tasks.
6. Validate the change artifacts.
7. Apply the change with OpenCode.
8. Run focused and regression tests.
9. Review the implementation.
10. Archive the change after completion.
11. Merge and deploy according to the release policy.

### Example: task ownership

The task-ownership feature is especially important because it introduces an authorization boundary.

Its requirements should define:

- How the task owner is determined.
- Who may read, edit, and complete a task.
- What happens when a different user attempts access.
- Whether administrators have a distinct access policy.
- Whether unauthenticated access is permitted.
- How the system responds when ownership cannot be verified.

Do not treat an authenticated request as automatically authorized. Authentication identifies the caller; authorization determines whether that caller may perform the requested operation.

### Exit criteria

The planned capabilities have been implemented as independent, traceable changes, with architectural and behavioral consistency maintained across modules.

---

# Phase VI — Make the Application Reproducible

## 21. Step 20: Standardize Local Development

### Objective

Make the application build and run reliably on a clean developer machine and in CI.

The precise implementation depends on the chosen stack, but every project should provide a predictable local workflow.

### Required developer commands

Document equivalents for:

```
install dependencies
configure local environment
start required services
apply database migrations
start application
run tests
run linting and type checks
build release artifact
```

For a JavaScript project, a common set of commands might be:

```
npm ci
npm run dev
npm run lint
npm run typecheck
npm test
npm run build
```

Add only scripts that actually exist in `package.json`.

### Environment configuration

Provide an `.env.example` file containing names and safe sample values for required configuration:

```
APP_ENV=development
APP_PORT=3000
DATABASE_URL=replace-with-local-database-url
LOG_LEVEL=debug
```

Never include real credentials or production secrets.

The application should fail clearly when required configuration is missing or invalid. Avoid silently substituting insecure defaults in production.

### Database migrations

If a relational database is selected, version the schema using migrations.

A clean environment should be able to:

1. Create an empty database.
2. Apply all migrations.
3. Start the application.
4. Execute integration tests.

Avoid relying on a developer's manually modified database.

### Dependency management

Commit the relevant lockfile and document the supported runtime version. CI should install dependencies reproducibly and should not silently upgrade production dependencies during every build.

### Exit criteria

A developer can follow the README from a clean checkout and reach a working local environment without undocumented manual intervention.

---

# Phase VII — Establish Continuous Integration

## 22. Step 21: Implement the CI Quality Gates

### Objective

Ensure that proposed changes are checked automatically before they are merged.

The first CI pipeline should be simple and reliable. Expand it as the application's needs become clearer.

### Minimum checks

- Dependency installation.
- Formatting or format validation.
- Linting.
- Static type checking where applicable.
- Unit tests.
- Integration tests where the required services are available.
- Production build.
- Dependency and secret checks appropriate to the stack.

### Example pipeline

The following is conceptual YAML, not a ready-to-run workflow:

```
name: CI

on:
  pull_request:
  push:
    branches:
      - main

jobs:
  verify:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout source
        uses: actions/checkout@v4

      - name: Set up runtime
        run: echo "Install the pinned project runtime"

      - name: Install dependencies
        run: echo "Run the reproducible dependency install"

      - name: Validate formatting and lint
        run: echo "Run formatting and lint checks"

      - name: Run tests
        run: echo "Run the required test suites"

      - name: Build
        run: echo "Build the production artifact"
```

Replace every placeholder with actual commands. Pin third-party actions to appropriate immutable references according to the organization's supply-chain policy. Do not treat this example as a complete secure CI configuration.

### Add OpenSpec validation

Where appropriate, include a CI step that validates active OpenSpec changes and their structure.

For example, after confirming the installed CLI's behavior:

```
openspec validate --help
```

Add the supported validation command to the pipeline and define how CI distinguishes a pull request with an active change from one that legitimately contains only documentation or tooling work.

Do not invent a rule that requires a behavior specification for a pure refactor. Use the workflow's documented mechanism for changes that do not alter externally observable behavior.

### Pull request checklist

Every pull request should answer:

- What requirement does this change satisfy?
- Which OpenSpec change describes it?
- Which ADRs constrain the implementation?
- What tests were run?
- Are any migrations required?
- Are configuration changes required?
- Does the change affect security or privacy?
- Can the change be rolled back safely?

### Exit criteria

A proposed change cannot be merged unless its required automated checks pass and the required human review has been completed.

---

# Phase VIII — Production Readiness

## 23. Step 22: Define the Production Architecture

### Objective

Convert the local application architecture into a deployable, operable production system.

Production architecture must account for more than application hosting. It includes data persistence, network access, credentials, deployment mechanics, logging, recovery, and operational ownership.

### Decisions to document in ADRs

At minimum, consider:

1. Hosting platform and deployment model.
2. Database hosting and connectivity.
3. Network boundaries and inbound access.
4. Secret management.
5. Application configuration.
6. Logging and monitoring.
7. Backup and restore.
8. Migration and release strategy.
9. Rollback strategy.
10. Scaling and capacity limits.

Record accepted decisions in the ADR directory and reference them from deployment-specific OpenSpec changes.

### Example logical architecture

```
                  Users
                    |
                    v
             Public HTTPS entry
                    |
                    v
             Application runtime
              /             
             v               v
       Database         Log / Error
       (private)        collection
             |
             v
       Backup storage
```

This is only a conceptual diagram. A production design must specify actual services, network policies, identity, data flow, and failure behavior.

### Environment separation

At minimum, distinguish:

- Local development.
- Automated test environments.
- Staging or pre-production.
- Production.

Use separate data stores and credentials. Production data should not be copied into development environments without an explicitly approved, privacy-preserving process.

### Exit criteria

The team has a documented production topology, a deployment mechanism, an operational owner, and a plan for failure and recovery.

---

## 24. Step 23: Implement Security as a Cross-Cutting Requirement

### Objective

Ensure security requirements are included in the product specifications, architecture decisions, code, tests, and release gates.

Security is not a single feature that can be postponed until after all user-visible features have been built.

### Security areas to cover

- Authentication and authorization.
- Input validation and output encoding.
- Secure session and token handling.
- Secret management.
- Dependency and build security.
- Database access controls.
- Rate limiting and abuse protection where needed.
- Error messages that do not expose sensitive information.
- Auditability of security-sensitive operations.
- Data retention and deletion.
- Backup confidentiality.
- Secure transport.
- Administrative access and production permissions.

### Use a security reference standard

For web applications, consider the OWASP Application Security Verification Standard (ASVS).

Choose applicable controls based on the application's risk, data sensitivity, and regulatory obligations rather than claiming compliance solely because a checklist exists.

### Security feature example

An OpenSpec change for task ownership might contain:

```
### Requirement: Enforce task ownership

The system SHALL prevent a user from accessing tasks
they are not authorized to access.

#### Scenario: Owner accesses task

- **WHEN** an authenticated user requests their own task
- **THEN** the system returns the task if it exists

#### Scenario: User requests another user's task

- **WHEN** an authenticated user requests a task they do not own
- **THEN** the system denies access according to the documented
  authorization policy
```

The exact response may be `403` or `404` depending on the chosen policy. Make the choice deliberately, document it, and test it.

### Security verification

For every security-sensitive change:

1. Identify the threat and affected trust boundary.
2. Add or update relevant specifications.
3. Implement authorization and validation.
4. Add negative tests.
5. Review logs and error responses for sensitive information.
6. Scan dependencies and build artifacts.
7. Verify production permissions and secret handling.

### Exit criteria

Security-sensitive requirements have been reviewed and tested, and any accepted residual risks are documented.

---

## 25. Step 24: Build the Production Artifact

### Objective

Create a deployable artifact that is reproducible, traceable to source, and independent of a developer's local environment.

The artifact might be a container image, platform-native package, static asset bundle, or another supported deployment unit.

### Required properties

- The artifact is built from a known source revision.
- Dependencies are locked or otherwise reproducibly resolved.
- The build process is automated.
- Runtime configuration is supplied separately.
- Credentials are not embedded in the artifact.
- The artifact can be identified by an immutable version or digest.
- Tests and required scans complete before release.
- The same artifact can be promoted between environments where the platform supports this approach.

### Example release metadata

```
Application: task-manager
Source revision: <git-commit-sha>
Build identifier: <ci-build-id>
Artifact digest: <immutable-artifact-digest>
Target environment: staging
```

The values should be generated by CI. Do not manually invent identifiers or treat a mutable tag as a sufficient artifact identity.

### Database migration policy

Database changes deserve special attention because rolling back application code does not necessarily roll back data safely.

Prefer compatible, staged migrations when possible:

1. Add backward-compatible schema changes.
2. Deploy code that supports the transition.
3. Migrate data if necessary.
4. Switch behavior.
5. Remove obsolete schema only after compatibility is established.

The exact sequence depends on the database and the nature of the change.

### Exit criteria

The application can be built from a known revision, its artifact is traceable, and its configuration and database migration requirements are understood.

---

## 26. Step 25: Establish the Deployment Pipeline

### Objective

Automate deployment while retaining appropriate approval, access control, and rollback mechanisms.

A typical pipeline has the following stages:

```
Pull request
    |
    v
Automated checks
    |
    v
Review and merge
    |
    v
Build immutable artifact
    |
    v
Deploy to staging
    |
    v
Run smoke and integration checks
    |
    v
Production approval
    |
    v
Deploy to production
    |
    v
Verify health and critical workflows
    |
    v
Monitor release
```

### Deployment controls

- Restrict production deployment permissions.
- Require appropriate approval for production releases.
- Use managed secret storage.
- Avoid exposing production credentials to untrusted pull requests.
- Prefer short-lived deployment credentials and workload identity where supported.
- Record which revision and artifact were deployed.
- Ensure the previous known-good version can be identified.
- Document how to stop a failed rollout.
- Define how database changes affect rollback.

### Example deployment procedure

The following commands are illustrative placeholders:

```
# Build and test the release artifact.
./scripts/build-release.sh

# Deploy to staging.
./scripts/deploy.sh staging

# Verify the staging deployment.
./scripts/smoke-test.sh staging
```

The scripts must be implemented for the selected platform and should fail clearly when any required operation fails.

### CI/CD references

If using GitHub Actions, consult the official documentation for deployment environments and OpenID Connect in GitHub Actions.

Deployment environments can be used for protection rules and environment-scoped secrets. OpenID Connect can support short-lived cloud credentials instead of long-lived cloud access keys when the cloud provider and workflow are configured appropriately.

### Exit criteria

Staging deployment is repeatable, production access is restricted, release artifacts are traceable, and the rollback process has been rehearsed.

---

# Phase IX — Verify, Release, and Operate

## 27. Step 26: Prepare the First Production Release

### Objective

Establish a release candidate that satisfies the functional, operational, and security requirements.

The first production release is not simply the first successful build.

### Release checklist

#### Product and specifications

- [ ]All required initial capabilities are implemented.
- [ ]OpenSpec requirements reflect the intended behavior.
- [ ]No required scenarios remain unimplemented.
- [ ]OpenSpec changes have been reviewed and appropriately archived.

#### Engineering quality

- [ ]Formatting, linting, type checks, and required tests pass.
- [ ]Production build succeeds.
- [ ]Dependency and security checks pass.
- [ ]No known critical defects remain unresolved.
- [ ]Database migrations have been rehearsed.

#### Operations

- [ ]Production configuration is complete.
- [ ]Secrets are stored appropriately.
- [ ]HTTPS and access controls are configured.
- [ ]Health checks are functional.
- [ ]Logging and error reporting are available.
- [ ]Alerts and operational ownership are established.
- [ ]Backup and restore procedures are documented.
- [ ]Rollback has been tested.
- [ ]Support and incident-response instructions are available.

#### Release authorization

- [ ]The release artifact is identified.
- [ ]Staging smoke tests pass.
- [ ]The production deployment is approved.
- [ ]The team knows how to verify the deployed version.

### Release notes

Generate release notes from the actual merged changes and include:

- New capabilities.
- Behavior changes.
- Configuration changes.
- Database migrations.
- Known limitations.
- Operational considerations.
- Rollback or recovery instructions where relevant.

### Exit criteria

The release owner confirms that the application meets the defined release gates and is ready for controlled production deployment.

---

## 28. Step 27: Deploy to Production

### Objective

Release the verified artifact into the production environment and confirm that it operates correctly.

Use the actual deployment platform's documented procedure.

### Deployment sequence

1. Confirm the approved release candidate.
2. Confirm production configuration and required secrets.
3. Verify database migration readiness.
4. Take any required pre-release backup.
5. Deploy using the approved rollout method.
6. Run health checks.
7. Verify critical application workflows.
8. Inspect error rates and logs.
9. Confirm that the expected revision is running.
10. Monitor for regressions and unexpected resource use.
11. Record the deployment outcome.

### Smoke tests

Smoke tests should exercise the deployed application rather than merely confirming that the process starts.

Examples:

- The public application entry point responds successfully.
- The health endpoint reports the expected status.
- The application can connect to its required database.
- A critical API route behaves as expected.
- Authentication and authorization operate correctly.
- A basic user workflow succeeds in a safe test context.

Avoid running destructive test operations against real customer data.

### Rollback decision

Define in advance what constitutes a failed release.

Examples include:

- Critical health checks fail.
- Error rates exceed the agreed threshold.
- Core user workflows fail.
- Data integrity is at risk.
- Authorization controls are not functioning correctly.

Rollback may mean redeploying a prior application artifact, disabling a feature flag, or applying a forward fix. Database changes can constrain these options, so migration compatibility must be considered before deployment.

### Exit criteria

The application is running in production, critical workflows are verified, no release-blocking issue is detected, and the deployment record is complete.

---

## 29. Step 28: Establish Production Observability

### Objective

Make it possible to determine whether the application is working, how users experience it, and why failures occur.

### Minimum operational signals

**Logs**

- Application errors.
- Request failures.
- Authentication and authorization failures where appropriate.
- Database and dependency failures.
- Deployment and startup events.

**Metrics**

- Request volume.
- Error rate.
- Response latency.
- Resource utilization.
- Database health and saturation.
- Queue depth or background-job failures if applicable.

**Alerts**

- Application unavailable.
- Critical workflow failure.
- Elevated error rate.
- Resource exhaustion.
- Database connectivity or saturation problems.
- Backup or recovery failures where monitoring is available.

### Health checks

Define health-check semantics deliberately.

- **Liveness:** Is the process functioning sufficiently to continue running?
- **Readiness:** Can the application currently accept the work it claims it can handle?

A health check should not reveal credentials, internal network details, or sensitive infrastructure information.

### Operational documentation

Maintain runbooks for:

- Application startup and shutdown.
- Deployment.
- Rollback.
- Database migration.
- Backup and restore.
- Incident investigation.
- Secret rotation.
- Common failure modes.
- Escalation and incident ownership.

### Exit criteria

The team can detect common production failures, identify the deployed version, investigate incidents, and follow documented recovery procedures.

---

## 30. Step 29: Maintain the Application Through OpenSpec Changes

### Objective

Ensure that maintenance, bug fixes, performance improvements, and new capabilities follow the same controlled workflow as the initial implementation.

Production delivery does not end the specification-driven process.

### Bug-fix example

Suppose users report that task retrieval sometimes returns stale data.

The workflow becomes:

1. Explore the failure and collect evidence.
2. Identify whether the issue is a specification defect, implementation defect, or operational problem.
3. Write a regression test that demonstrates the failure.
4. Propose an OpenSpec change if the required behavior changes or needs clarification.
5. Record an ADR if a meaningful architectural decision changes.
6. Implement and verify the fix.
7. Review and archive the change.
8. Deploy through the established release pipeline.
9. Confirm that the incident is resolved.

Not every bug fix needs a new behavioral requirement. If the existing specification already defines the correct behavior, preserve that specification and fix the implementation. Follow the installed OpenSpec workflow's supported mechanism for changes that do not alter externally observable behavior.

### Evolving the architecture

Revisit ADRs when:

- Actual traffic invalidates capacity assumptions.
- A new product requirement crosses existing module boundaries.
- A dependency becomes unsuitable or unsupported.
- Reliability requirements change.
- Operational costs become unacceptable.
- A security or compliance requirement changes the architecture.

Do not treat an ADR as permanent merely because it was accepted. Its purpose is to preserve the reasoning behind a decision and make future changes deliberate.

### Exit criteria

Maintenance changes remain traceable, regression-tested, and deployable without bypassing the engineering controls established for the initial release.

---

# Phase X — Standard Operating Procedures

## 31. The Standard Feature Workflow

This is the default procedure for a new feature.

### Step A: Understand

In OpenCode:

```
Explore the requested capability.

Read the relevant OpenSpec specifications, ADRs, product
requirements, and existing implementation.

Identify missing requirements, edge cases, and dependencies.
Do not implement anything yet.
```

### Step B: Propose

Use the installed OpenSpec proposal command, typically:

```
/opsx:propose add-feature-name
```

### Step C: Review

Read:

```
openspec/changes/add-feature-name/proposal.md
openspec/changes/add-feature-name/specs/
openspec/changes/add-feature-name/design.md
openspec/changes/add-feature-name/tasks.md
```

Review all generated artifacts before implementation.

### Step D: Validate

Run the supported OpenSpec validation command and check that the task list is complete and consistent.

### Step E: Apply

Use the OpenSpec apply workflow through OpenCode:

```
/opsx:apply
```

Implement incrementally and run the relevant tests.

### Step F: Verify

Run the full required test suite, inspect the diff, and verify the implementation against every relevant requirement and scenario.

Use a verification command if the installed workflow provides one.

### Step G: Review and merge

Obtain the required human review, pass CI, and merge through the team's approved Git workflow.

### Step H: Archive

Use the installed OpenSpec archival command, typically:

```
/opsx:archive
```

Confirm that the current specifications and archive reflect the completed change.

### Step I: Release

Deploy through CI/CD when the change is approved for release. Run smoke tests and monitor the deployment.

---

## 32. Handling Changes That Affect Existing Capabilities

A change should update an existing capability's specification when it changes behavior already described by that capability.

For example, suppose the application currently allows tasks to be retrieved by identifier, and the team adds a requirement that retrieval must enforce ownership.

The proposal should identify `task-management` as a modified capability if the new requirement changes the existing task retrieval behavior.

The change specification should contain the full updated requirement under the appropriate `MODIFIED Requirements` section, rather than a partial replacement that omits existing scenarios.

Conversely, adding a genuinely separate capability—such as exporting tasks—may be better represented as a new capability specification.

### Decision rule

Ask:

- Is this a new externally observable behavior?
- Is this a change to an existing behavior?
- Is it only an internal refactor with no behavioral change?
- Does it introduce a material architectural decision?

Use the answers to determine whether to create a new capability, modify an existing specification, use the documented no-spec-change mechanism, or create an ADR.

---

## 33. Handling Parallel Work

Parallel work is appropriate only when dependencies and shared boundaries are sufficiently clear.

For example, after defining a stable API contract, separate contributors may be able to work on frontend and backend implementation.

However, avoid concurrent changes to the same capability specifications without coordination.

### Suggested coordination rules

1. Assign each active change a clear owner.
2. Identify shared capabilities and files before starting parallel work.
3. Keep shared API contracts and data models explicit.
4. Avoid two changes independently redefining the same requirement.
5. Integrate and test changes together before release.
6. Resolve specification conflicts before archiving.

OpenSpec has workflow support for managing multiple changes, but tool support does not eliminate the need for architectural coordination. Review the [OpenSpec workflow documentation](<https://openspec.dev/docs/quickstart>) and the installed workflow's guidance before using advanced parallel or bulk-archival features.

---

## 34. Common Failure Modes and Preventive Controls

| Failure mode | Why it is a problem | Preventive control |
| --- | --- | --- |
| Asking the agent to build everything at once | Scope becomes too large to review | Small, bounded OpenSpec changes |
| Coding before reviewing specifications | Requirements are silently guessed | Approval gate before apply |
| Writing vague requirements | Tests cannot establish completion | Observable behavior and scenarios |
| Treating an ADR as a feature spec | Decisions and expected behavior become mixed | Separate architecture records and behavior specs |
| Overengineering the initial architecture | More components create unnecessary failure modes | Minimum sufficient architecture |
| Skipping integration tests | Component-level success hides boundary failures | Test actual persistence and interfaces |
| Trusting generated tests without review | Tests may simply confirm the implementation's assumptions | Review tests against the independent specification |
| Marking tasks complete without execution | Progress becomes misleading | Verify before checking off tasks |
| Archiving before verification | The authoritative spec may describe unverified behavior | Review and verification gates |
| Treating a successful build as production readiness | Operational and security failures remain undetected | Release checklist and staging rehearsal |
| Deploying with incompatible migrations | Rollback may become impossible | Migration compatibility strategy |
| Giving the agent unrestricted production access | Mistakes can cause irreversible damage | Explicit permissions and human approval |
| Forgetting to update specifications after a behavior change | The documented system diverges from the implementation | OpenSpec review and archival |
| Treating every refactor as a new capability | Specifications become noisy and misleading | Use the documented no-behavior-change workflow |

---

# Phase XI — Final Project Checklist

## 35. Repository and Tooling

- [ ]Git repository initialized.
- [ ]README and ignore rules committed.
- [ ]OpenSpec installed and initialized.
- [ ]OpenCode installed and verified.
- [ ]Project `AGENTS.md` reviewed.
- [ ]Dependency and runtime versions documented.
- [ ]Local development commands established.

## 36. Product and Architecture

- [ ]Product brief approved.
- [ ]Initial scope and deferred features identified.
- [ ]Initial vertical slice selected.
- [ ]Architectural boundaries documented.
- [ ]Foundational ADRs accepted.
- [ ]Security and deployment constraints considered.
- [ ]Technology stack documented.

## 37. OpenSpec Workflow

- [ ]OpenSpec configuration reviewed.
- [ ]Current specifications and change directories understood.
- [ ]Feature proposal reviewed.
- [ ]Requirement scenarios are testable.
- [ ]Design references relevant ADRs.
- [ ]Tasks cover the approved scope.
- [ ]OpenSpec validation passes where applicable.
- [ ]Implementation matches the specification.
- [ ]Completed changes are reviewed and archived.

## 38. Engineering Quality

- [ ]Unit tests pass.
- [ ]Integration tests pass.
- [ ]Relevant end-to-end tests pass.
- [ ]Linting and type checks pass.
- [ ]Production build succeeds.
- [ ]Database migrations are reproducible.
- [ ]Authorization and failure paths are tested.
- [ ]Dependencies and secrets are checked.
- [ ]CI blocks merges when required checks fail.

## 39. Production Deployment

- [ ]Production architecture documented.
- [ ]Environments and credentials separated.
- [ ]Production artifact is traceable to a source revision.
- [ ]Deployment is automated.
- [ ]Staging verification passes.
- [ ]Production deployment is approved.
- [ ]Health checks and smoke tests pass.
- [ ]Logging, monitoring, and alerting are functional.
- [ ]Backups and restoration procedures are documented.
- [ ]Rollback strategy is tested.
- [ ]Operational runbooks are available.
- [ ]Deployment outcome is recorded.

---

# Phase XII — Authoritative References

Use the official documentation as the source of truth for command syntax, installation procedures, configuration options, and supported workflow behavior. CLI and integration behavior may change over time, so validate commands against the versions installed in the repository.

## OpenSpec

1. [OpenSpec Quickstart](<https://openspec.dev/docs/quickstart>) — End-to-end workflow from exploration through proposal, apply, and archive.
2. [OpenSpec Installation](<https://openspec.dev/docs/installation>) — Prerequisites and installation methods.
3. [OpenSpec Project Setup](<https://openspec.dev/docs/setup>) — Initializing a repository and understanding the generated structure.
4. [OpenSpec CLI Reference](<https://openspec.dev/docs/cli>) — Supported CLI commands for listing, inspecting, validating, and archiving changes.
5. [OpenSpec Specification-Driven Schema](<https://openspec.dev/docs/schemas/spec-driven>) — Structure and responsibilities of proposals, specification deltas, design documents, and task lists.

## OpenCode

6. OpenCode Documentation — Main documentation and setup.
7. [OpenCode Agents](<https://docs.opencode.ai/docs/agents/>) — Planning, implementation, specialized agents, and agent configuration.
8. [OpenCode Rules](<https://docs.opencode.ai/docs/rules/>) — Project instructions through `AGENTS.md`.
9. [OpenCode Permissions](<https://docs.opencode.ai/docs/permissions/>) — Approval, allow, and deny controls for tools and commands.
10. [OpenCode CLI](<https://docs.opencode.ai/docs/cli/>) — Terminal commands and CLI usage.

## Delivery and Security

11. GitHub Actions Documentation — CI/CD workflows and automation.
12. GitHub Actions Deployment Environments — Environment protection and deployment configuration.
13. GitHub Actions OpenID Connect — Short-lived identity credentials for supported external services.
14. OWASP Application Security Verification Standard — A structured reference for application security verification.

---

# Conclusion

The recommended approach is to establish the repository and toolchain first, make the foundational architectural decisions explicit, and then build the application through small, independently verifiable OpenSpec changes.

Use OpenCode to accelerate exploration, implementation, testing, and review—but keep the requirements, architectural constraints, and release decisions explicit and reviewable.

The resulting engineering system should maintain a clear relationship between:

- **Product intent** in the product brief.
- **Architectural reasoning** in ADRs.
- **Expected behavior** in OpenSpec specifications.
- **Implementation approach** in change designs.
- **Execution progress** in task checklists.
- **Verified behavior** in automated tests.
- **Production delivery** in CI/CD and deployment records.
- **Operational reality** in monitoring, runbooks, and incident feedback.

The process is successful when a developer can start from a clean checkout, understand why the architecture exists, identify the specification behind a feature, reproduce its tests, deliver the change safely, and determine whether the resulting production system is healthy.

That is the standard to maintain from the first commit through every subsequent production release.