#!/bin/sh

# Create the necessary directory and copy the settings.php file
mkdir -p ./drupal/web/sites/default/
sudo cp settings/settings.php ./drupal/web/sites/default/settings.php

# Check for the --no-cache flag
NO_CACHE_FLAG=""

for arg in "$@"
do
  if [ "$arg" = "--no-cache" ]; then
    NO_CACHE_FLAG="--no-cache"
    break
  fi
done

# Build and start the Docker containers with or without the --no-cache flag
docker compose build $NO_CACHE_FLAG
docker-compose up -d --force-recreate
