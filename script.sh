#!/bin/sh

# Build and start the Docker containers
docker compose build  --no-cache
docker-compose up -d --force-recreate
