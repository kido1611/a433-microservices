#/bin/sh

# build docker image dengan namespace ghcr.io/kido1611/item-app dan versi v1
docker build -t ghcr.io/kido1611/item-app:v1 .

# push container image
docker push ghcr.io/kido1611/item-app:v1
