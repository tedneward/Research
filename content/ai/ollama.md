title=Ollama
tags=ai, engine
summary=Host (?) for multiple open-source LLMs.
~~~~~~

[Website](https://ollama.com/) | [Source](https://github.com/ollama/ollama) | [Search (models)](https://ollama.com/search)

## Using

`ollama run ` *model name*: Download and run the given model
`ollama pull ` *model name*: Download the given model
`ollama serve ` *model name*: Run the downloaded model

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
