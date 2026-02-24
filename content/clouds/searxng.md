title=SearXng
tags=cloud, distribution, ai
summary=A free internet metasearch engine which aggregates results from up to 247 search services.
~~~~~~

[Website](https://docs.searxng.org/) | [Source](https://github.com/searxng/searxng)

Get started with SearXNG by using one of the instances listed at searx.space. If you don’t trust anyone, you can [set up your own](https://docs.searxng.org/admin/installation.html).

## Installation

Pull the latest image: `$ docker pull docker.io/searxng/searxng:latest`

Run:
```
# Create directories for configuration and persistent data
$ mkdir -p ./searxng/config/ ./searxng/data/
$ cd ./searxng/

# Run the container
$ docker run --name searxng -d \
    -p 8888:8080 \
    -v "./config/:/etc/searxng/" \
    -v "./data/:/var/cache/searxng/" \
    docker.io/searxng/searxng:latest
```

This will start SearXNG in the background, accessible at http://localhost:8888

