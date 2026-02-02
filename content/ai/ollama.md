title=Ollama
tags=ai, engine
summary=Host (?) for multiple open-source LLMs.
~~~~~~

[Website](https://ollama.com/) | [Source](https://github.com/ollama/ollama) | [Search (models)](https://ollama.com/search)

## Using

`ollama run ` *model name*: Download and run the given model
`ollama pull ` *model name*: Download the given model
`ollama serve ` *model name*: Run the downloaded model
`ollama launch ` *tool*: Run the given tool (or, if no *tool* is given, provide a list--Claude Code, Codex, etc) 

### Client SDKs

[Python](https://github.com/ollama/ollama-python) | [JS](https://github.com/ollama/ollama-js) | 

Install: `pip install ollama`

Usage:
```
from ollama import chat
from ollama import ChatResponse

response: ChatResponse = chat(model='gemma3', messages=[
  {
    'role': 'user',
    'content': 'Why is the sky blue?',
  },
])
print(response['message']['content'])
# or access fields directly from the response object
print(response.message.content)
```

Streaming responses:
```
from ollama import chat

stream = chat(
    model='gemma3',
    messages=[{'role': 'user', 'content': 'Why is the sky blue?'}],
    stream=True,
)

for chunk in stream:
  print(chunk['message']['content'], end='', flush=True)
```

### Using from VSCode

Install Continue.dev extension; 

### Using with Claude Code

`ollama launch claude` - seems to handle configuration well (v 0.15+)

Another article recommends exporting some environment variables:

"To run Claude Code, type the following command in a PowerShell command-line window."

```
PS C:\Users\thoma> $env:ANTHROPIC_AUTH_TOKEN = "ollama"
PS C:\Users\thoma> $env:ANTHROPIC_API_KEY = ""
PS C:\Users\thoma> $env:ANTHROPIC_BASE_URL = "http://localhost:11434"

PS C:\Users\thoma> claude --model gpt-oss:20b --allow-dangerously-skip-permissions
```

[This article](https://medium.com/ai-software-engineer/i-tested-new-ollama-launch-for-claude-code-codex-opencode-more-bfae2af3c3db) confirms that:

"The setup handles the Anthropic API configuration behind the scenes. Previously, you’d need to manually set:

```
export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_BASE_URL=http://localhost:11434
```

By default, Ollama sets context length to 4,096 tokens.

Coding tools need much more than that to work properly. ***You’ll want at least 64,000 tokens for Claude Code and similar tools.***"

## Models

- Qwen2.5-coder:7b (around 4.7GB) — Good balance for coding: `ollama pull qwen2.5-coder:7b`
- Starcoder2:3b (around 1.7GB) — Compact coding model: `ollama pull starcoder2:3b`
- Qwen2.5-coder:1.5b (around 1GB) — Lightweight option: `ollama pull qwen2.5-coder:1.5b`
- Deepseek-coder:1.3b (around 776MB) — Smallest coding model: `ollama pull deepseek-coder:1.3b`

## Reading

### Articles

- [How to Integrate Local LLMs With Ollama and Python](https://realpython.com/ollama-python/)
- https://stal.blogspot.com/2025/12/ollama-local-llms-made-easy.html: "Furthermore, Ollama provides a straightforward RESTful API, offering developers an easy method to integrate local LLM capabilities into their custom applications and workflows, allowing programmatic access to generation, chat, and embedding functionalities. A particularly powerful feature is model customization through "Modelfiles," which grant users the ability to create bespoke models by modifying existing ones or by combining different components. These configuration files define parameters, system prompts, and other operational settings, enabling fine-grained control over model behavior. An example of a simple Modelfile might look like this:

        FROM llama2

        PARAMETER temperature 0.7

        SYSTEM You are a helpful assistant.

  This Modelfile instructs Ollama to base a new model on Llama 2, set a specific inference temperature, and provide a default system prompt. The tool also boasts comprehensive cross-platform support, ensuring its functionality across multiple operating systems including macOS, Linux, and Windows, thereby broadening its accessibility to a diverse user base. Crucially, Ollama leverages GPU hardware for accelerated inference whenever such resources are available, which dramatically speeds up model responses and processing times by offloading computational tasks. Finally, it maintains a continually growing model hub, providing a curated collection of pre-trained models, including popular choices like Llama 2, Mistral, and various others, all available for direct and convenient download.

### Docs

- [Image generation (experimental)](https://ollama.com/blog/image-generation): "Ollama now supports image generation on macOS, with Windows and Linux coming soon. `ollama run x/z-image-turbo "your prompt"` Images save to your current directory."
