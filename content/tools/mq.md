title=mq
tags=tool, markdown, library, python
summary=jq-like command-line tool for markdown processing.
~~~~~~

[Website](https://mqlang.org/) | [Source](https://github.com/harehare/mq)

## [Why mq?](https://github.com/harehare/mq#why-mq)

mq makes working with Markdown files as easy as jq makes working with JSON. It's especially useful for:

-   **LLM Workflows**: Efficiently manipulate and process Markdown used in LLM prompts and outputs
-   **LLM Input Generation**: Generate structured Markdown content optimized for LLM consumption, since Markdown serves as the primary input format for most language models
-   **Documentation Management**: Extract, transform, and organize content across multiple documentation files
-   **Content Analysis**: Quickly extract specific sections or patterns from Markdown documents
-   **Batch Processing**: Apply consistent transformations across multiple Markdown files

Since LLM inputs are primarily in Markdown format, mq provides efficient tools for generating and processing the structured Markdown content that LLMs require.

## [Features](https://github.com/harehare/mq#features)

-   **Slice and Filter**: Extract specific parts of your Markdown documents with ease.
-   **Map and Transform**: Apply transformations to your Markdown content.
-   **Command-line Interface**: Simple and intuitive CLI for quick operations.
-   **Extensibility**: Easily extendable with custom functions.
-   **Built-in support**: Filter and transform content with many built-in functions and selectors.
-   **REPL Support**: Interactive command-line REPL for testing and experimenting.
-   **IDE Support**: VSCode Extension and Language Server **Protocol** (LSP) support for custom function development.
-   **Debugger**: Includes an experimental debugger (`mq-dbg`) for inspecting and stepping through mq queries interactively.
-   **External Subcommands**: Extend mq with custom subcommands by placing executable files starting with `mq-` in `~/.mq/bin/`.

## [Getting Started](https://github.com/harehare/mq#installation)

### [Quick Install](https://github.com/harehare/mq#quick-install)

`curl -sSL https://mqlang.org/install.sh | bash`

The installer will:

-   Download the latest mq binary for your platform
-   Install it to `~/.mq/bin/`
-   Update your shell profile to add mq to your PATH

### [Binaries](https://github.com/harehare/mq#binaries)

You can download pre-built binaries from the [GitHub releases page](https://github.com/harehare/mq/releases):

# macOS (Apple Silicon): `curl -L https://github.com/harehare/mq/releases/download/v0.5.6/mq-aarch64-apple-darwin -o /usr/local/bin/mq && chmod +x /usr/local/bin/mq`
# Linux x86\_64: `curl -L https://github.com/harehare/mq/releases/download/v0.5.6/mq-x86\_64-unknown-linux-gnu -o /usr/local/bin/mq && chmod +x /usr/local/bin/mq`
# Linux arm64: `curl -L https://github.com/harehare/mq/releases/download/v0.5.6/mq-aarch64-unknown-linux-gnu -o /usr/local/bin/mq && chmod +x /usr/local/bin/mq`
# Windows (PowerShell): `Invoke-WebRequest -Uri https://github.com/harehare/mq/releases/download/v0.5.6/mq-x86\_64-pc-windows-msvc.exe -OutFile "$env:USERPROFILE\\bin\\mq.exe"`

### [Homebrew](https://github.com/harehare/mq#homebrew)

    # Using Homebrew (macOS and Linux)
    brew install mq

### [Docker](https://github.com/harehare/mq#docker)

    $ docker run --rm ghcr.io/harehare/mq:0.5.6

### [Python](https://github.com/harehare/mq#python)

You can use mq in Python through the `markdown-query` package:

    # Install from PyPI
    pip install markdown-query

