#!/bin/bash

docker compose pull
docker compose up --detach

docker volume prune --force --all
docker system prune --force --all

docker logs infoportal --follow
