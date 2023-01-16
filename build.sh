# bin/bash
docker buildx create --name mybuilder mybuilder
docker buildx use mybuilder
TAG=v1
IMAGE=vardyng/pv-backup-image
docker buildx build --build-arg AWS_CLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" --load --platform linux/amd64 -t $IMAGE:$TAG-amd .
docker push $IMAGE:$TAG-amd
docker buildx build --build-arg AWS_CLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" --load --platform linux/arm64/v8 -t $IMAGE:$TAG-arm .
docker push $IMAGE:$TAG-arm
docker manifest create $IMAGE:$TAG $IMAGE:$TAG-amd $IMAGE:$TAG-arm --amend
docker manifest push $IMAGE:$TAG