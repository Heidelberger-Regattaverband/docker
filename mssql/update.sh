#!/bin/bash

source .env

docker compose pull
docker compose up --detach

docker volume prune --force --all
docker system prune --force --all

docker logs ${CONTAINER_NAME} --follow
