title=OfficeCLI
tags=tool, ai, microsoft office, console
summary=The first and best command-line tool purpose-built for AI agents to read, edit, and automate Word, Excel, and PowerPoint files.
~~~~~~

[Website](https://www.officecli.ai/) | [Source](https://github.com/iOfficeAI/OfficeCLI)

Agent-chat installation: `curl -fsSL https://officecli.ai/SKILL.md` "Paste this into your AI agent's chat — it will read the skill file and install everything automatically. The skill file teaches the agent how to install the binary and use all commands."

> OfficeCLI ships with a [SKILL.md](https://github.com/iOfficeAI/OfficeCLI/blob/main/SKILL.md) (239 lines, ~8K tokens) that covers command syntax, architecture, and common pitfalls. After installation, your agent can immediately create, read, and modify any Office document.

## Quick Start

From zero to a finished presentation in seconds:

    # Create a new PowerPoint
    officecli create deck.pptx

    # Add a slide with a title and background color
    officecli add deck.pptx / --type slide --prop title="Q4 Report" --prop background=1A1A2E

    # Add a text shape to the slide
    officecli add deck.pptx /slide\[1\] --type shape \\
      --prop text="Revenue grew 25%" --prop x=2cm --prop y=5cm \\
      --prop font=Arial --prop size=24 --prop color=FFFFFF

    # View the outline of the presentation
    officecli view deck.pptx outline

Output:

```
Slide 1: Q4 Report
  Shape 1 [TextBox]: Revenue grew 25%
```

    # Get structured JSON for any element
    officecli get deck.pptx /slide\[1\]/shape\[1\] --json

Output:

    {
        "tag": "shape",
        "path": "/slide\[1\]/shape\[1\]",
        "attributes": {
            "name": "TextBox 1",
            "text": "Revenue grew 25%",
            "x": "720000",
            "y": "1800000"
        }
    }

## Why OfficeCLI?

What used to take 50 lines of Python and 3 separate libraries:

    from pptx import Presentation
    from pptx.util import Inches, Pt
    prs \= Presentation()
    slide \= prs.slides.add\_slide(prs.slide\_layouts\[0\])
    title \= slide.shapes.title
    title.text \= "Q4 Report"
    \# ... 45 more lines ...
    prs.save('deck.pptx')

Now takes one command:

    officecli add deck.pptx / --type slide --prop title="Q4 Report"

**What OfficeCLI can do:**

-   **Create** documents from scratch -- blank or with content
-   **Read** text, structure, styles, formulas -- in plain text or structured JSON
-   **Analyze** formatting issues, style inconsistencies, and structural problems
-   **Modify** any element -- text, fonts, colors, layout, formulas, charts, images
-   **Reorganize** content -- add, remove, move, copy elements across documents

**Word** — [paragraphs](https://github.com/iOfficeAI/OfficeCLI/wiki/word-paragraph), [runs](https://github.com/iOfficeAI/OfficeCLI/wiki/word-run), [tables](https://github.com/iOfficeAI/OfficeCLI/wiki/word-table), [styles](https://github.com/iOfficeAI/OfficeCLI/wiki/word-style), [headers/footers](https://github.com/iOfficeAI/OfficeCLI/wiki/word-header-footer), [images](https://github.com/iOfficeAI/OfficeCLI/wiki/word-picture), [equations](https://github.com/iOfficeAI/OfficeCLI/wiki/word-equation), [comments](https://github.com/iOfficeAI/OfficeCLI/wiki/word-comment), [footnotes](https://github.com/iOfficeAI/OfficeCLI/wiki/word-footnote), [watermarks](https://github.com/iOfficeAI/OfficeCLI/wiki/word-watermark), [bookmarks](https://github.com/iOfficeAI/OfficeCLI/wiki/word-bookmark), [TOC](https://github.com/iOfficeAI/OfficeCLI/wiki/word-toc), [charts](https://github.com/iOfficeAI/OfficeCLI/wiki/word-chart), [hyperlinks](https://github.com/iOfficeAI/OfficeCLI/wiki/word-hyperlink), [sections](https://github.com/iOfficeAI/OfficeCLI/wiki/word-section), [form fields](https://github.com/iOfficeAI/OfficeCLI/wiki/word-formfield), [content controls (SDT)](https://github.com/iOfficeAI/OfficeCLI/wiki/word-sdt), [fields](https://github.com/iOfficeAI/OfficeCLI/wiki/word-field), [document properties](https://github.com/iOfficeAI/OfficeCLI/wiki/word-document)

**Excel** — [cells](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-cell), formulas (150+ built-in functions with auto-evaluation), [sheets](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-sheet), [tables](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-table), [conditional formatting](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-conditionalformatting), [charts](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-chart), [pivot tables](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-pivottable), [named ranges](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-namedrange), [data validation](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-validation), [images](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-picture), [sparklines](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-sparkline), [comments](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-comment), [autofilter](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-autofilter), [shapes](https://github.com/iOfficeAI/OfficeCLI/wiki/excel-shape), CSV/TSV import, `$Sheet:A1` cell addressing

**PowerPoint** — [slides](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-slide), [shapes](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-shape), [images](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-picture), [tables](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-table), [charts](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-chart), [animations](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-slide), [morph transitions](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-morph-check), [3D models (.glb)](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-3dmodel), [slide zoom](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-zoom), [equations](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-equation), [themes](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-theme), [connectors](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-connector), [video/audio](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-video), [groups](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-group), [notes](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-notes), [placeholders](https://github.com/iOfficeAI/OfficeCLI/wiki/ppt-placeholder)

## Installation

Ships as a single self-contained binary. The .NET runtime is embedded -- nothing to install, no runtime to manage.

**One-line install:**

macOS / Linux: `curl -fsSL https://raw.githubusercontent.com/iOfficeAI/OfficeCLI/main/install.sh | bash`

Windows (PowerShell): `irm https://raw.githubusercontent.com/iOfficeAI/OfficeCLI/main/install.ps1 | iex`

**Or download manually** from [GitHub Releases](https://github.com/iOfficeAI/OfficeCLI/releases):

| Platform | Binary |
| --- | --- |
| macOS Apple Silicon | `officecli-mac-arm64` |
| macOS Intel | `officecli-mac-x64` |
| Linux x64 | `officecli-linux-x64` |
| Linux ARM64 | `officecli-linux-arm64` |
| Windows x64 | `officecli-win-x64.exe` |
| Windows ARM64 | `officecli-win-arm64.exe` |

Verify installation: `officecli --version`

**Or self-install from a downloaded binary:** `officecli install`

Updates are checked automatically in the background. Disable with `officecli config autoUpdate false` or skip per-invocation with `OFFICECLI_SKIP_UPDATE=1`. Configuration lives under `~/.officecli/config.json`.

## Three-Layer Architecture

Start simple, go deep only when needed.

| Layer | Purpose | Commands |
| --- | --- | --- |
| **L1: Read** | Semantic views of content | `view` (text, annotated, outline, stats, issues, html) |
| **L2: DOM** | Structured element operations | `get`, `query`, `set`, `add`, `remove`, `move` |
| **L3: Raw XML** | Direct XPath access — universal fallback | `raw`, `raw-set`, `add-part`, `validate` |

# L1 — high-level views

    officecli view report.docx annotated
    officecli view budget.xlsx text --cols A,B,C --max-lines 50

# L2 — element-level operations

    officecli query report.docx "run:contains(TODO)"
    officecli add budget.xlsx / --type sheet --prop name="Q2 Report"
    officecli move report.docx /body/p\[5\] --to /body --index 1

# L3 — raw XML when L2 isn't enough

    officecli raw deck.pptx /slide\[1\]
    officecli raw-set report.docx document \\
    --xpath "//w:p\[1\]" --action append \\
    --xml '<w:r><w:t>Injected text</w:t></w:r>'

## AI Integration

### MCP Server

Built-in [MCP](https://modelcontextprotocol.io/) server — register with one command:

    officecli mcp claude       # Claude Code
    officecli mcp cursor       # Cursor
    officecli mcp vscode       # VS Code / Copilot
    officecli mcp lmstudio     # LM Studio
    officecli mcp list         # Check registration status

Exposes all document operations as tools over JSON-RPC — no shell access needed.

### Direct CLI Integration

Get OfficeCLI working with your AI agent in two steps:

1.  **Install the binary** -- one command (see [Installation](https://github.com/iOfficeAI/OfficeCLI#installation))
2.  **Done.** OfficeCLI automatically detects your AI tools (Claude Code, GitHub Copilot, Codex) by checking known config directories and installs its skill file. Your agent can immediately create, read, and modify any Office document.

**Manual setup (optional)**

If auto-install doesn't cover your setup, you can install the skill file manually:

**Feed SKILL.md to your agent directly:**

    curl -fsSL https://officecli.ai/SKILL.md

**Install as a local skill for Claude Code:**

    curl -fsSL https://officecli.ai/SKILL.md -o ~/.claude/skills/officecli.md

**Other agents:** Include the contents of `SKILL.md` (239 lines, ~8K tokens) in your agent's system prompt or tool description.

**Call from any language:**

Python:

    import subprocess, json
    def cli(\*args): return subprocess.check\_output(\["officecli", \*args\], text\=True)
    cli("create", "deck.pptx")
    cli("set", "deck.pptx", "/slide\[1\]/shape\[1\]", "--prop", "text=Hello")

JavaScript:

    const { execFileSync } \= require('child\_process')
    const cli \= (...args) \=> execFileSync('officecli', args, { encoding: 'utf8' })
    cli('set', 'deck.pptx', '/slide\[1\]/shape\[1\]', '--prop', 'text=Hello')

Every command supports `--json` for structured output. Path-based addressing means agents don't need to understand XML namespaces.
