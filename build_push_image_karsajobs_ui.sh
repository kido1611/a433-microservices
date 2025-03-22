#/bin/sh

docker build -t ghcr.io/kido1611/karsajobs-ui:latest .

docker push ghcr.io/kido1611/karsajobs-ui:latest
