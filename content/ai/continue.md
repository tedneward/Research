title=Continue.dev
tags=ai, agent, coding, tool
summary=Open-source (?) CLI and IDE agent for coding models.
~~~~~~

[Website](https://www.continue.dev/) | [Source](https://github.com/continuedev/continue)

## Getting Started

### VS Code
Go to the Extensions view (Ctrl+Shift+X or Cmd+Shift+X). Search for "Continue" and install the official extension by Continue. 

To use Ollama:

* Autodetect: Open the Continue sidebar in VS Code. Click on the model selector dropdown (often a gear icon or the current model name). Select the Autodetect option. Continue will scan for available local Ollama models, which you can then select.
* Manual Configuration (`config.json`): Open the Continue sidebar and click the settings cog icon in the bottom right. This opens the config.json file. Add or modify the models array and tabAutocompleteModel settings to include your Ollama model. The default API base is usually http://localhost:11434. Example `config.json`:

        {
            "models": [
                {
                "title": "Codellama",
                "provider": "ollama",
                "model": "codellama"
                }
            ],
            "tabAutocompleteModel": {
                "title": "Codellama Autocomplete",
                "provider": "ollama",
                "model": "codellama"
            }
        }

## Resources

### Articles/Blogs/Essays

#### Ollama
- [Using Ollama with Continue: A Developer's Guide](https://docs.continue.dev/guides/ollama-guide)

