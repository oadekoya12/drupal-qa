#!/bin/sh
mkdir -p ./drupal/web/sites/default/
sudo cp settings/settings.php ./drupal/web/sites/default/settings.php

# Build and start the Docker containers
docker compose build  --no-cache
docker-compose up -d --force-recreate
