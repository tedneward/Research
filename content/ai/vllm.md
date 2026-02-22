title=vLLM
tags=ai, runtime
summary=Easy, fast, and cheap LLM serving for everyone
~~~~~~

[Website](https://docs.vllm.ai/en/stable/) | [Source](https://github.com/vllm-project/vllm)

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
