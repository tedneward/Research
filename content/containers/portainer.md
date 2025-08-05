title=Portainer
tags=container, tool
summary=A universal container management platform
~~~~~~

[Website](https://www.portainer.io/) | [Source](https://github.com/portainer/portainer) - Community Edition

```
version: '3'

services:
  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    ports:
      - "9443:9443"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./portainer-data:/data
    restart: always
```

