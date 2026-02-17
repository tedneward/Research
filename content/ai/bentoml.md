title=BentoML
tags=ai, runtime, platform
summary=The easiest way to serve AI apps and models - Build Model Inference APIs, Job queues, LLM apps, Multi-model pipelines, and more! (Unified Model Serving Framework)
~~~~~~

[Website](https://bentoml.com/) | [Source](https://github.com/bentoml/bentoml)

## What is BentoML?

[](https://github.com/bentoml/bentoml#what-is-bentoml)

BentoML is a Python library for building online serving systems optimized for AI apps and model inference.

-   **Easily build APIs for Any AI/ML Model.** Turn any model inference script into a REST API server with just a few lines of code and standard Python type hints.
-   **Docker Containers made simple.** No more dependency hell! Manage your environments, dependencies and model versions with a simple config file. BentoML automatically generates Docker images, ensures reproducibility, and simplifies how you deploy to different environments.
-   **Maximize CPU/GPU utilization.** Build high performance inference APIs leveraging built-in serving optimization features like dynamic batching, model parallelism, multi-stage pipeline and multi-model inference-graph orchestration.
-   **Fully customizable.** Easily implement your own APIs or task queues, with custom business logic, model inference and multi-model composition. Supports any ML framework, modality, and inference runtime.
-   **Ready for Production.** Develop, run and debug locally. Seamlessly deploy to production with Docker containers or [BentoCloud](https://www.bentoml.com/).

## Getting started

[](https://github.com/bentoml/bentoml#getting-started)

Install BentoML:

```
# Requires Python≥3.9
pip install -U bentoml
```

Define APIs in a `service.py` file.

import bentoml

@bentoml.service(
    image\=bentoml.images.Image(python\_version\="3.11").python\_packages("torch", "transformers"),
)
class Summarization:
    def \_\_init\_\_(self) \-> None:
        import torch
        from transformers import pipeline

        device \= "cuda" if torch.cuda.is\_available() else "cpu"
        self.pipeline \= pipeline('summarization', device\=device)

    @bentoml.api(batchable\=True)
    def summarize(self, texts: list\[str\]) \-> list\[str\]:
        results \= self.pipeline(texts)
        return \[item\['summary\_text'\] for item in results\]

### 💻 Run locally

[](https://github.com/bentoml/bentoml#-run-locally)

Install PyTorch and Transformers packages to your Python virtual environment.

pip install torch transformers  # additional dependencies for local run

Run the service code locally (serving at [http://localhost:3000](http://localhost:3000/) by default):

bentoml serve

You should expect to see the following output.

```
[INFO] [cli] Starting production HTTP BentoServer from "service:Summarization" listening on http://localhost:3000 (Press CTRL+C to quit)
[INFO] [entry_service:Summarization:1] Service Summarization initialized
```

Now you can run inference from your browser at [http://localhost:3000](http://localhost:3000/) or with a Python script:

import bentoml

with bentoml.SyncHTTPClient('http://localhost:3000') as client:
    summarized\_text: str \= client.summarize(\[bentoml.\_\_doc\_\_\])\[0\]
    print(f"Result: {summarized\_text}")

### 🐳 Deploy using Docker

[](https://github.com/bentoml/bentoml#-deploy-using-docker)

Run `bentoml build` to package necessary code, models, dependency configs into a Bento - the standardized deployable artifact in BentoML:

bentoml build

Ensure [Docker](https://docs.docker.com/) is running. Generate a Docker container image for deployment:

bentoml containerize summarization:latest

Run the generated image:

docker run --rm -p 3000:3000 summarization:latest