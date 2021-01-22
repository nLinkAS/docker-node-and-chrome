# docker-node-and-chrome
A Docker image definition of node and chrome

## How to build the node environment
```
docker build -t <IMAGE_NAME> .

Example:
docker build -t ci-build-env .
```

## How to run the node environment
```
docker run --rm -t --volume=<FULL_PATH_TO_LOCAL_PROJECT>:<IMAGE_PROJECT_PATH> --workdir="<IMAGE_PROJECT_PATH>"  --name <CONTAINER_NAME> <IMAGE_NAME>

Example:
docker run --rm -t --volume=/home/my-npm-project:/mnt/project --workdir="/mnt/project" --name ci-builder ci-build-env
```

## How to run npm commands
```
docker exec <CONTAINER_NAME> <NPM_COMMAND>

Example (show npm version):
docker exec ci-builder npm version

Example (install npm dependencies):
docker exec ci-builder npm install

Example (build npm project):
docker exec ci-builder npm run build
```
