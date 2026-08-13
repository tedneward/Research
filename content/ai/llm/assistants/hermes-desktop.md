title=Hermes Desktop
tags=ai, llm, coding, agent, assistant
summary=Hermes Desktop is a native AI assistant app by Nous Research that provides a desktop chat interface for Hermes Agent, an AI agent that can work with models, run tools, manage projects, use memory and skills, and connect to messaging gateways.
~~~~~~

[Website](https://hermes-agent.nousresearch.com/docs/user-guide/desktop) | [Source](https://github.com/NousResearch/hermes-agent) | [Ollama](https://docs.ollama.com/integrations/hermes-desktop)

## Quick start

```bash theme={"system"}
ollama launch hermes-desktop
```

Ollama handles the setup flow automatically:

1. **Install** - If Hermes isn't installed, Ollama prompts to install the Hermes command-line agent. On first desktop launch, Hermes builds its packaged desktop app.
2. **Model** - Pick a model from the selector
3. **Configure** - Ollama configures Hermes Desktop to use your selected Ollama model
4. **Launch** - Ollama opens Hermes Desktop

## Run directly with a model

```bash theme={"system"}
ollama launch hermes-desktop --model <model>
```

Run `ollama launch hermes-desktop` again to switch models later.

## Install Hermes Desktop directly

On macOS and Windows, the Hermes Desktop installer is the recommended upstream installation path. It installs the desktop app and Hermes Agent together. If you prefer the command line, `ollama launch hermes-desktop` remains the explicit Ollama-managed path and uses the same Hermes configuration, sessions, skills, and memory as the CLI.

To force Hermes to rebuild its packaged desktop app:

```bash theme={"system"}
ollama launch hermes-desktop -- --force-build
```
