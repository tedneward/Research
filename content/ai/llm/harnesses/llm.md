title=LLM
tags=ai, llm, harness, python
summary=A CLI tool and Python library for interacting with OpenAI, Anthropic’s Claude, Google’s Gemini, Meta’s Llama and dozens of other Large Language Models, both via remote APIs and with models that can be installed and run on your own machine.
~~~~~~

[Website](https://llm.datasette.io/en/stable/) | [Source](https://github.com/simonw/llm)

## Quick start
First, install LLM using pip or Homebrew or pipx or uv: `pip install llm` / `brew install llm` / `pipx install llm` / `uv tool install llm`

If you have an OpenAI API key key you can run this:

    # Paste your OpenAI API key into this
    llm keys set openai

    # Run a prompt (with the default gpt-4o-mini model)
    llm "Ten fun names for a pet pelican"

    # Extract text from an image
    llm "extract text" -a scanned-document.jpg

    # Use a system prompt against a file
    cat myfile.py | llm -s "Explain this code"

Run prompts against Gemini or Anthropic with their respective plugins:

    llm install llm-gemini
    llm keys set gemini
    # Paste Gemini API key here
    llm -m gemini-2.0-flash 'Tell me fun facts about Mountain View'

    llm install llm-anthropic
    llm keys set anthropic
    # Paste Anthropic API key here
    llm -m claude-4-opus 'Impress me with wild facts about turnips'

You can also install a plugin to access models that can run on your local device. If you use Ollama:

    # Install the plugin
    llm install llm-ollama

    # Download and run a prompt against the Orca Mini 7B model
    ollama pull llama3.2:latest
    llm -m llama3.2:latest 'What is the capital of France?'
    To start an interactive chat with a model, use llm chat:

    llm chat -m gpt-4.1

    Chatting with gpt-4.1
    Type 'exit' or 'quit' to exit
    Type '!multi' to enter multiple lines, then '!end' to finish
    Type '!edit' to open your default editor and modify the prompt.
    Type '!fragment <my_fragment> [<another_fragment> ...]' to insert one or more fragments
    > Tell me a joke about a pelican
    Why don't pelicans like to tip waiters?

    Because they always have a big bill!