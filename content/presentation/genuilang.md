title=Gen-UI-Lang
tags=presentation, language, ai
summary=a compact, LLM-friendly language for describing UIs in a few readable lines; write one UI expression and render it to HTML, React JSX, Gradio, or other targets.
~~~~~~

[Website](https://gen-ui-lang.github.io/) | [Source](https://github.com/Pro-GenAI/Gen-UI-Lang)

## Getting Started

Install locally:

    pip install -e .

Create and render a UI (Python):

    from gen_ui_lang import genui, row, text, btn, chart, to_html

    n = genui(
        row(text("Sales Overview"), btn("Load")),
        chart(type="line", data="sales_q4"),
    )

    print(to_html(n))  # quick HTML preview

Run a demo server:

    python examples/demo_server.py

Run the chatbot UI (calls an LLM if configured):

    python examples/chat_server.py

Notes:

-   The servers in `examples/` require additional packages like `fastapi` and `uvicorn` (and `tiktoken` for the chat UI).
-   For LLM calls via `get_response(...)`, set `OPENAI_API_KEY` and `OPENAI_MODEL` in your environment (a `.env` file is supported).

## Features

-   **LLM-first design:** Intentionally concise and predictable allowing LLMs to generate UI code reliably with fewer tokens.
-   **Multi-target output:** Author once, render everywhere — quick HTML previews, React components, Gradio demos, and more.
-   **Consistent cross-target language:** Use the same snippet to target multiple frameworks, reducing duplication and cognitive load.
-   **Faster iteration:** Compact syntax makes prototyping and experimentation quicker than hand-authoring verbose HTML or JSX.

## Why it matters

Gen-UI-Lang sits at the sweet spot between human-readable code and a machine-actionable code. It's small enough to iterate with and structured enough to transform programmatically — ideal for prototypes, demos, and LLM-driven Generative UI workflows.

**Elevator pitch** Describe a UI in a single expression and render it to multiple targets. Example:

```
genui(
    row(
        text("Sales Overview"),
        btn("Load", on_load=lambda: get_graph(2001, 2002))
    ),
    chart(type="line", data="sales_q4"),
)
```

This expression is an AST built from `Node` factories (`genui`, `row`, `text`, `btn`, `chart`) that can be converted to HTML or other formats using the included renderers.

**Core strengths**

-   **Minimal syntax:** Factory functions map directly to component concepts (`genui`, `row`, `col`, `card`, `text`, `btn`, `input`, `table`, `graph`/`chart`), making UIs expressive and compact.
-   **Extensible core:** The AST is implemented with `Node` objects (see `gen_ui_lang/core.py`), so adding nodes or renderers is straightforward.
-   **LLM integration:** Helpers in `gen_ui_lang/utils/llm_utils.py` make it simple to ask an LLM to return `ui(...)` snippets when available.

**Key features:**

-   Node factories: `genui`, `row`, `col`, `card`, `text`, `btn`, `input`, `table`, `graph`/`chart`.
-   Simple renderer: `to_html(node)` (see `gen_ui_lang/core.py`).
-   LLM helper: `get_response(messages, use_genui=True)` to request Gen-UI-Lang formatted replies (see `gen_ui_lang/utils/llm_utils.py`).
