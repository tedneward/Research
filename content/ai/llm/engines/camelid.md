title=Camelid
tags=ai, llm, engine
summary=A Rust-native local LLM inference engine — GGUF in, OpenAI-style API out, every claim backed by reproducible evidence.
~~~~~~

[Source](https://github.com/timtoole02/Camelid)

Camelid loads GGUF models directly, serves them over a local OpenAI-style API, and gates every optimized path on token-for-token parity with a reference implementation. It is not a wrapper around Ollama or llama.cpp — the tokenizer, GGUF loader, CPU kernels, and Metal GPU path are all implemented in this repository, shipping as a single static Rust binary with no Python.

