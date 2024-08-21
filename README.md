# AW31N_SDK_docker (WIP)

docker of AW31N_SDK

## Build docker image

```bash
docker build -t aw31n-sdk .
```

## Compile

```bash
docker pull aw31n-sdk:latest
docker run --rm -v $(pwd)/project_name:/SDK/apps/docker/project_name aw31n-sdk:latest /bin/bash -c "cd project_name/board/bd47 && make"
```
