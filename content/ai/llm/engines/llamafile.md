title=Llamafile
tags=ai, llm, inference engine, native
summary=Compile a LLM model into a single executable for fast execution.
~~~~~~

[Website](https://docs.mozilla.ai/llamafile) | [Source](https://github.com/mozilla-ai/llamafile) | [Pre-built executables](https://huggingface.co/mozilla-ai/llamafile_0.10)

Our goal is to make open LLMs much more accessible to both developers and end users. We're doing that by combining [llama.cpp](https://github.com/ggerganov/llama.cpp) with [Cosmopolitan Libc](https://github.com/jart/cosmopolitan) into one framework that collapses all the complexity of LLMs down to a single-file executable (called a "llamafile") that runs locally on most operating systems and CPU archiectures, with no installation.

llamafile also includes [**whisperfile**](https://docs.mozilla.ai/llamafile/whisperfile/index), a single-file speech-to-text tool built on [whisper.cpp](https://github.com/ggerganov/whisper.cpp) and the same Cosmopolitan packaging. It supports transcription and translation of audio files across all the same platforms, with no installation required.

## Quick Start

Download and run your first llamafile in minutes:

    # Download an example model (Qwen3.5 0.8B)
    curl -LO https://huggingface.co/mozilla-ai/llamafile\_0.10/resolve/main/Qwen3.5-0.8B-Q8\_0.llamafile

    # Make it executable (macOS/Linux/BSD)
    chmod +x Qwen3.5-0.8B-Q8\_0.llamafile

    # Run it
    ./Qwen3.5-0.8B-Q8\_0.llamafile

We chose this model because that's the smallest one we have built a llamafile for, so most likely to work out-of-the-box for you. If you have powerful hardware and/or GPUs, [feel free to choose](https://docs.mozilla.ai/llamafile/getting-started/pre-built-llamafiles) larger and more expressive models which should provide more accurate responses.

**Windows users:** Rename the file to add `.exe` extension before running.

**Note - Only executables under 4GB can run on Windows, so any llamafile above 4GB won't work. Download the [llamafile](https://github.com/mozilla-ai/llamafile/releases) binary and run it with any [external weights/models(GGUF)](https://docs.mozilla.ai/llamafile/getting-started/quickstart#using-llamafile-with-external-weights).**

