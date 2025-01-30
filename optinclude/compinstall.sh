#!/bin/sh
composer install --working-dir=..

drush site:install -y \
    --db-url=mysql://drupal:drupal@db/drupal \
    --site-name="Drupal QA Demo" \
    --account-name=drupal \
    --account-mail=drupal@example.org \
    --account-pass=drupal