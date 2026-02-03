title=Gitea
tags=backend, git
summary=Private, Fast, Reliable DevOps Platform.
~~~~~~

[Website](https://about.gitea.com/) | [Source](https://github.com/go-gitea/gitea)

## Docker setup

    ```
    version: '3'

    services:
    gitea:
        image: gitea/gitea:latest
        container_name: gitea
        environment:
        - USER_UID=1000
        - USER_GID=1000
        volumes:
        - ./gitea:/data
        ports:
        - "3000:3000"
        - "222:22"
        restart: always
    ```


