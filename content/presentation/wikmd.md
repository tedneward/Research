title=Wikmd
tags=presentation, wiki, markdown, browser
summary=A file based wiki that uses markdown.
~~~~~~

[Website](https://linbreux.github.io/wikmd/) | [Source](https://github.com/Linbreux/wikmd)

## Installation
### Docker-Compose

```
---
version: "2.1"
services:
  wikmd:
    image: linbreux/wikmd:latest
    container_name: wikmd
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Paris
    volumes:
      - /path/to/wiki:/wiki
    ports:
      - 5000:5000
    restart: unless-stopped

```

### Docker (CLI)
```
docker run -d \
  --name wikmd \
  -e TZ=Europe/Paris \
  -e PUID=1000 \
  -e PGID=1000 \
  -e WIKMD_LOGGING=1 `#optional` \
  -p 5000:5000 \
  -v /path/to/wiki:/wiki \
  --restart unless-stopped \
  linbreux/wikmd:latest

```

