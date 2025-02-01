#!/bin/sh
composer install --working-dir=..

# drush site:install -y \
#     --db-url=mysql://drupal:drupal@db/drupal \
#     --site-name="Drupal QA Demo" \
#     --account-name=drupal \
#     --account-mail=drupal@example.org \
#     --account-pass=drupal

drush sql-drop -y
drush site:install -y \
    --site-name="Drupal QA Demo" \
    --account-name=drupal \
    --account-mail=drupal@example.org \
    --account-pass=drupal
drush entity:delete shortcut_set
drush un shortcut

drush cset system.site uuid 'f6a99468-6f29-4903-b697-3afba0c39708' -y
drush config-set -y "system.site" uuid "f6a99468-6f29-4903-b697-3afba0c39708"
drush cim -y