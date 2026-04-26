title=Local AI
tags=ai, tool, engine, chat ui
summary=Locally-installed host for LLMs.
~~~~~~

[Website](https://localai.io/) | [Source](https://github.com/mudler/LocalAI)

## Installation


```
# With Docker
docker run -p 8080:8080 --name local-ai -ti localai/localai:latest

# Or with Podman
podman run -p 8080:8080 --name local-ai -ti localai/localai:latest
```

### Starting LocalAI

Once installed, start LocalAI. For Docker installations:

```bash
docker run -p 8080:8080 --name local-ai -ti localai/localai:latest-cpu
```

For GPU acceleration, choose the image that matches your hardware:

| Hardware | Docker image |
| --- | --- |
| CPU only | `localai/localai:latest-cpu` |
| NVIDIA CUDA | `localai/localai:latest-gpu-nvidia-cuda-12` |
| AMD (ROCm) | `localai/localai:latest-gpu-hipblas` |
| Intel GPU | `localai/localai:latest-gpu-intel` |
| Vulkan | `localai/localai:latest-gpu-vulkan` |

For NVIDIA GPUs, add `--gpus all`. For AMD/Intel/Vulkan, add the appropriate `--device` flags. See [Container images](https://localai.io/basics/container/) for the full reference.

### Downloading models from the CLI

When starting LocalAI (either via Docker or via CLI) you can specify as argument a list of models to install automatically before starting the API, for example:

```bash
local-ai run llama-3.2-1b-instruct:q4_k_m
local-ai run huggingface://TheBloke/phi-2-GGUF/phi-2.Q8_0.gguf
local-ai run ollama://gemma:2b
local-ai run https://gist.githubusercontent.com/.../phi-2.yaml
local-ai run oci://localai/phi-2:latest
```

You can also manage models with the CLI:

```bash
local-ai models list          # List available models in the gallery
local-ai models install <name> # Install a model
```

