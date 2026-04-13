title=vLLM
tags=ai, inference engine
summary=Easy, fast, and cheap LLM serving for everyone
~~~~~~

[Website](https://vllm.ai/) | [Source](https://github.com/vllm-project/) | [Docs](https://docs.vllm.ai/en/stable/) | [Docker Hub](https://hub.docker.com/r/vllm/vllm-openai/)

Looks more complicated than Ollama or LocalAI, which makes a certain amount of sense, I suppose. 

vLLM can only serve one model at a time; to run multiple models, run separate instances of vLLM on different ports.

## Getting Started

### Docker
vLLM offers an official Docker image for deployment. The image can be used to run OpenAI compatible server and is available on Docker Hub as `vllm/vllm-openai`.

```
docker run --runtime nvidia --gpus all \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    --env "HF_TOKEN=$HF_TOKEN" \
    -p 8000:8000 \
    --ipc=host \
    vllm/vllm-openai:latest \
    --model Qwen/Qwen3-0.6B
```

## Resources

### Hardware

- [vLLM on Mac Studio M4](https://medium.com/@michael.hannecke/hands-on-vllm-metal-on-mac-studio-m4-6263062c8c2d)

### Related projects

- [vllm-playground](micytao.github.io/vllm-workshop/) | [Source](https://github.com/micytao/vllm-playground): A modern web interface for managing and interacting with vLLM servers (www.github.com/vllm-project/vllm). Supports both GPU and CPU modes, with special optimizations for macOS Apple Silicon and enterprise deployment on OpenShift/Kubernetes.

### Reading

- [Moving from Ollama to vLLM: Finding Stability for High-Throughput LLM Serving](https://pub.towardsai.net/moving-from-ollama-to-vllm-finding-stability-for-high-throughput-llm-serving-74d3dc9702c8)
