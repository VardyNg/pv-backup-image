This repo contains the Dockerfile and instruction that produced vardyng/ubuntu-aws-cli image.

### Build image
```sh
docker buildx create --name mybuilder mybuilder
```
```sh
docker buildx use mybuilder
```
```sh
TAG=22.04-v2
IMAGE=vardyng/ubuntu-aws-cli
```
```sh
docker buildx build --load --platform linux/amd64 -t $IMAGE:$TAG-amd .
```

```sh
docker push $IMAGE:$TAG-amd
```
```sh
docker buildx build --load --platform linux/arm64/v8 -t $IMAGE:$TAG-arm .
```
```sh
docker push $IMAGE:$TAG-arm
```

### Create and push manifest
```sh
docker manifest create $IMAGE:$TAG $IMAGE:$TAG-amd $IMAGE:$TAG-arm --amend
```
```sh
docker manifest push $IMAGE:$TAG
```