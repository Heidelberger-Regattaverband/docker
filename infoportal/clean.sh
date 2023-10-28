#!/bin/bash

docker-compose pull

docker-compose down

docker volume prune -f

docker system prune -f