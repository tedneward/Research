title=OpenNotebook
tags=ai, studio
summary=An open-source collection of notebooks for LLMs.
~~~~~~

[Website](https://www.open-notebook.ai/) | [Source](https://github.com/lfnovo/open-notebook)

To run: 
```
docker run -d \
  --name open-notebook \
  -p 8502:8502 -p 5055:5055 \
  -v ./notebook_data:/app/data \
  -v ./surreal_data:/mydata \
  -e OPENAI_API_KEY=your_key \
  lfnovo/open_notebook:v1-latest-single
```

* `-d` runs the container in detached mode
* `--name open-notebook` names the container for easy reference
* `-p 8502:8502 -p 5055:5055` maps ports for the web interface and API access
* `-v ./notebook_data:/app/data` and `-v ./surreal_data:/mydata` mount local folders to persist notes and database files. This ensures that your data is stored on your machine and remains intact even if the container is restarted
* `-e OPENAI_API_KEY=your_key` allows integration with OpenAI models if desired
* `lfnovo/open_notebook:v1-latest-single` specifies the container image

After running the container, navigate to:

* Main Interface: http://localhost:8502
* API Access: http://localhost:5055
* API Documentation: http://localhost:5055/docs

After deployment, two folders appear in the local directory:

* notebook_data: Stores all notes, summaries, and AI-processed content
* surreal_data: Contains underlying database files for Open Notebook's internal storage

---

```
docker run -d \
  --name open-notebook \
  -p 8502:8502 -p 5055:5055 \
  -v ./notebook_data:/app/data \
  -v ./surreal_data:/mydata \
  lfnovo/open_notebook:v1-latest-single
```

Docker compose
```
services:
  surrealdb:
    image: surrealdb/surrealdb:v2
    command: start --user root --pass password --bind 0.0.0.0:8000 rocksdb:/mydata/mydatabase.db
    ports:
      - "8000:8000"
    volumes:
      - ./surreal_data:/mydata

  open_notebook:
    image: lfnovo/open_notebook:v1-latest-single
    pull_policy: always
    ports:
      - "8502:8502"  # Web UI (React frontend)
      - "5055:5055"  # API (required!)
    environment:
      # NO API KEYS NEEDED - Using Ollama (free, local)
      - OLLAMA_API_BASE=http://ollama:11434

      # Database (required)
      - SURREAL_URL=ws://surrealdb:8000/rpc
      - SURREAL_USER=root
      - SURREAL_PASSWORD=password
      - SURREAL_NAMESPACE=open_notebook
      - SURREAL_DATABASE=open_notebook
    volumes:
      - ./notebook_data:/app/data
      - ./surreal_data:/mydata
    depends_on:
      - surrealdb
    restart: always

  ollama:
    image: ollama/ollama:latest
    ports:
      - "11434:11434"
    volumes:
      - ./ollama_models:/root/.ollama
    environment:
      # Optional: set GPU support if available
      - OLLAMA_NUM_GPU=0
    restart: always
```
