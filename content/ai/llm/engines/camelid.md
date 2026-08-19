title=Camelid
tags=ai, llm, inference engine
summary=Run supported GGUF language, vision, and embedding models locally with a Rust-native engine.
~~~~~~

[Source](https://github.com/timtoole02/Camelid)

Camelid loads GGUF models directly, serves them over a local OpenAI-style API, and gates every optimized path on token-for-token parity with a reference implementation. It is not a wrapper around Ollama or llama.cpp — the tokenizer, GGUF loader, CPU kernels, and Metal GPU path are all implemented in this repository, shipping as a single static Rust binary with no Python.

Camelid is an open-source, Rust-native local AI inference engine for running supported GGUF large language models (LLMs), vision-language models (VLMs), and embedding models on Windows, macOS, and Linux. Use it as a desktop app, a browser-based local AI chat interface, a terminal application, or a self-hosted OpenAI-compatible API for your own tools and applications.

Model inference runs on your hardware, with CPU execution, Apple Silicon Metal acceleration, and NVIDIA CUDA acceleration available within the documented support boundaries. Camelid is designed for private local AI chat, offline inference after model download, GGUF model testing, and local LLM application development without a Python, Node.js, or Docker runtime.

## Why Camelid?

-   **Local by default.** Models and inference stay on your machine unless you expose the server.
-   **One engine, several interfaces.** Use the desktop app, browser chat, terminal UI, or HTTP API.
-   **Simple distribution.** The engine and web UI ship together as one binary.
-   **Hardware acceleration.** Use Metal on Apple Silicon, CUDA on supported NVIDIA paths, or CPU fallback.
-   **Developer APIs.** Build against chat, Responses, embeddings, reranking, and structured-output endpoints.
-   **Evidence-backed compatibility.** Support applies to exact model files and quantizations validated against a pinned llama.cpp reference.

### Command line

After downloading and unpacking an engine archive, start a browser chat with:

    camelid pull 3b_instruct_q8
    camelid serve --model models/Llama-3.2-3B-Instruct-Q8_0.gguf

Camelid opens `http://127.0.0.1:8181`. Use `camelid chat` for the terminal UI, or add `--no-open` to run the server without opening a browser.

Run `camelid pull` without an argument to list the curated model catalog.

**Warning** A non-loopback listener requires authentication. Prefer an API key file:

`camelid serve --addr 0.0.0.0:8181 --api-key-file ./camelid-api.key`

See [configuration](https://github.com/timtoole02/Camelid/blob/main/docs/CONFIGURATION.md) for CORS, TLS, and remote-deployment options.

## Supported models

Camelid deliberately supports exact model-and-quantization combinations rather than entire model families. Each supported file is validated token-for-token against a pinned llama.cpp reference. Files outside the supported set fail closed instead of silently using an unverified path.

Good starting points:

| Goal | Model | Pull ID |
| --- | --- | --- |
| Smallest end-to-end test (~1.2 GB) | TinyLlama 1.1B Chat Q8\\_0 | `tinyllama` |
| **Recommended first model** | Llama 3.2 3B Instruct Q8\\_0 | `3b_instruct_q8` |
| Compact Windows CPU or tested M4 Metal chat (~2.9 GB) | LFM2.5 2.6B Q8\\_0 | `lfm2_5_2_6b` |
| Local embeddings and semantic retrieval | Nomic Embed Text v1.5 Q8\\_0 | `nomic` |
| Fits a 16 GB Apple Silicon Mac | Mistral 7B Instruct v0.3 Q8\\_0 | `mistral` |
| Reasoning and coding on a small budget | Qwen3 4B Q4\\_K\\_M | `qwen3_4b_q4` |
| Compact PrismML GPU model | Bonsai 4B Q1\\_0 | `bonsai_4b_q1` |
| PrismML browser/API vision | Bonsai 27B Q1\\_0 | `bonsai_27b_q1` |

## Ways to use Camelid

| Interface | Start it with | Best for |
| --- | --- | --- |
| **Desktop app** | Install from [Quick start](https://github.com/timtoole02/Camelid#quick-start) | Native app with bundled engine |
| **Browser chat** | `camelid serve --model <gguf>` | Everyday local chat |
| **Terminal UI** | `camelid chat` | Shell and SSH workflows |
| **HTTP API** | Start `camelid serve` | Chat, image input, embeddings, and reranking |
| **Agent mode** | `camelid chat --agent --model <gguf>` | Approval-gated tools in a repository |
| **Workspace** (preview) | Open **Workspace** in the web UI | Read-only analysis of a local folder |

Agent mode confines file tools to a workspace root and keeps network access off unless enabled. Workspace is read-only and resumable. Both require a model marked `tool_capable` in the compatibility ledger. Review the [agent documentation](https://github.com/timtoole02/Camelid/blob/main/DOCS.md) and every requested action before enabling additional tools or network access.

## OpenAI-compatible API

`camelid serve` exposes the browser UI and API on the same port. Read the loaded model ID from `GET /v1/models`, then call the chat-completions endpoint:

    curl http://127.0.0.1:8181/v1/chat/completions \\
    -H "Content-Type: application/json" \\
    -d '{
        "model": "Llama 3.2 3B Instruct",
        "messages": \[{"role": "user", "content": "Why is local inference useful?"}\],
        "max\_tokens": 128,
        "temperature": 0
    }'

Camelid also supports `/v1/responses`, `/v1/embeddings`, `/v1/rerank`, streaming, local image input on supported VLM rows, function tools, structured text formats, conversations, and optional local SQLite storage. The machine-readable route and feature inventory is available from `/api/capabilities`.

## Platform support

| Platform | Distribution | Acceleration |
| --- | --- | --- |
| Windows x86\\_64 | Desktop installer, portable app, engine archive | Supported CUDA exact-row paths; CPU fallback |
| macOS Apple Silicon | Desktop DMG or engine archive | Metal and CPU |
| Linux x86\\_64 | Engine archive | CUDA compiled in; CPU fallback |

Hardware support is row- and configuration-specific. Consult [COMPATIBILITY.md](https://github.com/timtoole02/Camelid/blob/main/COMPATIBILITY.md) before relying on a particular GPU, model, or quantization combination.

## Build from source

Camelid uses the toolchain pinned in [rust-toolchain.toml](https://github.com/timtoole02/Camelid/blob/main/rust-toolchain.toml). The React/Vite web UI in `frontend/` is embedded in the engine binary.

    (cd frontend && npm ci && npm run build)
    cargo build --release --locked --bin camelid

See the [contributor quick start](https://github.com/timtoole02/Camelid/blob/main/docs/CONTRIBUTOR_QUICKSTART.md) for prerequisites and development setup.

## Documentation

-   [Documentation index](https://github.com/timtoole02/Camelid/blob/main/DOCS.md)
-   [Configuration reference](https://github.com/timtoole02/Camelid/blob/main/docs/CONFIGURATION.md)
-   [Architecture](https://github.com/timtoole02/Camelid/blob/main/docs/architecture/ARCHITECTURE.md)
-   [Validation matrix](https://github.com/timtoole02/Camelid/blob/main/docs/VALIDATION_MATRIX.md)
-   [Roadmap](https://github.com/timtoole02/Camelid/blob/main/ROADMAP.md)
