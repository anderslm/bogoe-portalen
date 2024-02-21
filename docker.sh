#/bin/sh

docker ps -aqf "ancestor=portalen" | xargs docker rm --force
docker build -t portalen .
docker run -dp 127.0.0.1:8000:8000 portalen
