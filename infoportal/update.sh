#!/bin/bash

docker-compose pull
docker-compose up -d

docker volume prune -f
docker system prune -f

docker logs infoportal -f