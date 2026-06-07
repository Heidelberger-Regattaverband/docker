#!/bin/bash

source .env

docker compose pull
docker compose up -d

docker volume prune -f
docker system prune -f

docker logs ${CONTAINER_NAME} -f
