title=koboldcpp
tags=gamedev, ai, tool
summary=Run GGUF models easily with a KoboldAI UI.
~~~~~~

[Source](https://github.com/LostRuins/koboldcpp/)

KoboldCpp is an easy-to-use AI text-generation software for GGML and GGUF models, inspired by the original KoboldAI. It's a single self-contained distributable that builds off llama.cpp and adds many additional powerful features.

### Features

-   Single file executable, with no installation required and no external dependencies
-   Runs on CPU or GPU, supports full or partial offloaded
-   LLM text generation (Supports all GGML and GGUF models, backwards compatibility with ALL past models)
-   Image Generation and Image Editing (Stable Diffusion 1.5, SDXL, SD3, Flux, Qwen Image, Z-Image, Klein)
-   Video Generation (WAN 2.2)
-   Speech-To-Text (Voice Recognition) via Whisper
-   Text-To-Speech (Voice Generation) via Qwen3TTS, Kokoro, OuteTTS, Parler and Dia
-   Music Generation (Ace Step 1.5)
-   Image Recognition (Multimodal Vision)
-   MCP Server support and tool calling
-   Provides many compatible APIs endpoints for many popular webservices (KoboldCppApi OpenAiApi OllamaApi A1111ForgeApi ComfyUiApi WhisperTranscribeApi XttsApi OpenAiSpeechApi)
-   Bundled KoboldAI Lite UI with editing tools, save formats, memory, world info, author's note, characters, scenarios.
-   Includes multiple modes (chat, adventure, instruct, storywriter) and UI Themes (aesthetic roleplay, classic writer, corporate assistant, messsenger)
-   Supports loading Tavern Character Cards, importing many different data formats from various sites, reading or exporting JSON savefiles and persistent stories.
-   Many other features including new samplers, regex support, websearch, RAG via TextDB, image recognition/vision and more.
-   Ready-to-use binaries for Windows, MacOS, Linux. Runs directly with Colab, Docker, also supports other platforms if self-compiled (like Android (via Termux) and Raspberry PI).
