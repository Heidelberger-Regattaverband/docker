#!/bin/bash

docker-compose pull

docker-compose up -d

docker logs infoportal -f