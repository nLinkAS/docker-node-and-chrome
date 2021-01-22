# docker-node-and-chrome
Docker image definition of node and chrom on a ubuntu 20.04 base

## How to build
```
docker build -t <CONTAINER_NAME> .
```

eg.
```
docker build -t ci-builder .
```

## How to run
```
docker run --rm -t --volume=<FULL_PATH_TO_LOCAL_PROJECT>:/mnt/project <CONTAINER_NAME> <CODE>
```

eg 1 - install npm project dependencies
```
docker run --rm -t --volume=/home/my-nmp-project:/mnt/project ci-builder npm install
```

eg 2 - build npm project
```
docker run --rm -t --volume=/home/my-nmp-project:/mnt/project ci-builder npm run build
```

---

Note!
A different node version can be chosen by setting the "NODE_VERSION" build arg. Default is 14.15.3 (latest as time of writing)
