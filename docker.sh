#/bin/sh

docker ps -aqf "ancestor=portalen" | xargs docker rm --force
docker build -t portalen .
docker run -dp 127.0.0.1:80:80 portalen
