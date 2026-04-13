title=Dify
tags=tool, ai, llm, workflow
summary=https://dify.ai/
~~~~~~

[Website](https://dify.ai/) | [Source](https://github.com/langgenius/dify/)

Dify is an open-source LLM app development platform. Its intuitive interface combines AI workflow, RAG pipeline, agent capabilities, model management, observability features (including [Opik](https://www.comet.com/docs/opik/integrations/dify), [Langfuse](https://docs.langfuse.com/), and [Arize Phoenix](https://docs.arize.com/phoenix)) and more, letting you quickly go from prototype to production. 

## Quick start

> Before installing Dify, make sure your machine meets the following minimum system requirements:
> 
> -   CPU >= 2 Core
> -   RAM >= 4 GiB

The easiest way to start the Dify server is through [Docker Compose](https://github.com/langgenius/dify/blob/main/docker/docker-compose.yaml). Before running Dify with the following commands, make sure that [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) are installed on your machine:

        cd dify
        cd docker
        cp .env.example .env
        docker compose up -d

After running, you can access the Dify dashboard in your browser at [http://localhost/install](http://localhost/install) and start the initialization process.

