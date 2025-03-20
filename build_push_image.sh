#/bin/sh

# build docker image dengan item-app dan versi v1
docker build -t item-app:v1 .

# melihat semua docker image yang ada di lokal
docker image ls

# menyalin docker image dengan namespace yang sesuai supaya bisa dipush ke container registry (Github)
# source item-app:v1
# target ghcr.io/kido1611/item-app:v1
docker tag item-app:v1 ghcr.io/kido1611/item-app:v1

# login container registry ghcr.io
echo $PASSWORD_GITHUB_PACKAGES | docker login -u kido1611 --password-stdin ghcr.io

# push container image
docker push ghcr.io/kido1611/item-app:v1
