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

