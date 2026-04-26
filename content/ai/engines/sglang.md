title=SGLang
tags=ai, engine
summary=High-performance serving framework for large language and multimodal models.
~~~~~~

[Website](https://docs.sglang.io/) | [Source](https://github.com/sgl-project/sglang)

## Installation

### Docker
The docker images are available on Docker Hub at [lmsysorg/sglang](https://hub.docker.com/r/lmsysorg/sglang/tags), built from [Dockerfile](https://github.com/sgl-project/sglang/tree/main/docker). Replace `<secret>` below with your huggingface hub [token](https://huggingface.co/docs/hub/en/security-tokens).

Command

```
docker run --gpus all \
    --shm-size 32g \
    -p 30000:30000 \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    --env "HF_TOKEN=<secret>" \
    --ipc=host \
    lmsysorg/sglang:latest \
    python3 -m sglang.launch_server --model-path meta-llama/Llama-3.1-8B-Instruct --host 0.0.0.0 --port 30000
```

For production deployments, use the `runtime` variant which is significantly smaller (~40% reduction) by excluding build tools and development dependencies:

Command

```
docker run --gpus all \
    --shm-size 32g \
    -p 30000:30000 \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    --env "HF_TOKEN=<secret>" \
    --ipc=host \
    lmsysorg/sglang:latest-runtime \
    python3 -m sglang.launch_server --model-path meta-llama/Llama-3.1-8B-Instruct --host 0.0.0.0 --port 30000
```

You can also find the nightly docker images [here](https://hub.docker.com/r/lmsysorg/sglang/tags?name=nightly). Notes:

-   On B300/GB300 (SM103) or CUDA 13 environment, we recommend using the nightly image at `lmsysorg/sglang:dev-cu13` or stable image at `lmsysorg/sglang:latest-cu130-runtime`. Please, do not re-install the project as editable inside the docker image, since it will override the version of libraries specified by the cu13 docker image.

## Launch a Server

Start the SGLang server with a model. Here we use `qwen/qwen2.5-0.5b-instruct` as a lightweight example:

```
python3 -m sglang.launch_server --model-path qwen/qwen2.5-0.5b-instruct --host 0.0.0.0 --port 30000
```

Wait until you see `The server is fired up and ready to roll!` in the terminal output.

Once the server is running, API documentation is available at:

-   **Swagger UI**: `http://localhost:30000/docs`
-   **ReDoc**: `http://localhost:30000/redoc`
-   **OpenAPI Spec**: `http://localhost:30000/openapi.json`

The server automatically applies the chat template from the Hugging Face tokenizer. You can override it with `--chat-template` when launching.

## Related Implementations

- [mini-sglang](https://github.com/sgl-project/mini-sglang) - a lightweight yet high-performance inference framework for Large Language Models

## Send Requests

SGLang is fully **OpenAI API-compatible**, so you can use the same tools and libraries you already know.

Using cURL

```
curl http://localhost:30000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "qwen/qwen2.5-0.5b-instruct",
    "messages": [
      {"role": "user", "content": "What is the capital of France?"}
    ]
  }'
```

Using OpenAI Python Client

Install the OpenAI Python library if you haven’t:

```
pip install openai
```

Then send a request:

Example

```
import openai

client = openai.Client(base_url="http://127.0.0.1:30000/v1", api_key="None")

response = client.chat.completions.create(
    model="qwen/qwen2.5-0.5b-instruct",
    messages=[
        {"role": "user", "content": "List 3 countries and their capitals."},
    ],
    temperature=0,
    max_tokens=64,
)

print(response.choices[0].message.content)
```

Streaming

Example

```
import openai

client = openai.Client(base_url="http://127.0.0.1:30000/v1", api_key="None")

response = client.chat.completions.create(
    model="qwen/qwen2.5-0.5b-instruct",
    messages=[
        {"role": "user", "content": "List 3 countries and their capitals."},
    ],
    temperature=0,
    max_tokens=64,
    stream=True,
)

for chunk in response:
    if chunk.choices[0].delta.content:
        print(chunk.choices[0].delta.content, end="", flush=True)
```

Using Python Requests

Example

```
import requests

url = "http://localhost:30000/v1/chat/completions"

data = {
    "model": "qwen/qwen2.5-0.5b-instruct",
    "messages": [{"role": "user", "content": "What is the capital of France?"}],
}

response = requests.post(url, json=data)
print(response.json())
```

Using the Native `/generate` API

SGLang also provides a native `/generate` endpoint for more flexibility.

Example

```
import requests

response = requests.post(
    "http://localhost:30000/generate",
    json={
        "text": "The capital of France is",
        "sampling_params": {
            "temperature": 0,
            "max_new_tokens": 32,
        },
    },
)

print(response.json())
```

Streaming with `/generate`

Example

```
import requests
import json

response = requests.post(
    "http://localhost:30000/generate",
    json={
        "text": "The capital of France is",
        "sampling_params": {
            "temperature": 0,
            "max_new_tokens": 32,
        },
        "stream": True,
    },
    stream=True,
)

prev = 0
for chunk in response.iter_lines(decode_unicode=False):
    chunk = chunk.decode("utf-8")
    if chunk and chunk.startswith("data:"):
        if chunk == "data: [DONE]":
            break
        data = json.loads(chunk[5:].strip("\n"))
        output = data["text"]
        print(output[prev:], end="", flush=True)
        prev = len(output)
```

* * *

Offline Batch Inference (No Server)

SGLang also supports offline batch inference using the `Engine` class directly — no HTTP server required.

Example

```
import sglang as sgl

llm = sgl.Engine(model_path="qwen/qwen2.5-0.5b-instruct")

prompts = [
    "Hello, my name is",
    "The president of the United States is",
    "The capital of France is",
    "The future of AI is",
]

sampling_params = {"temperature": 0.8, "top_p": 0.95}

outputs = llm.generate(prompts, sampling_params)

for prompt, output in zip(prompts, outputs):
    print(f"Prompt: {prompt}\nGenerated text: {output['text']}\n")

llm.shutdown()
```

