# Use the official Drupal image from Docker Hub
FROM drupal:10.0

# Set ARG and ENV for user IDs
ARG UUID=1000
ARG GUID=1000
ENV UUID=$UUID
ENV GUID=$GUID

# Set working directory
WORKDIR /var/www/html

# Install any additional dependencies if required as root
USER root
RUN apt-get update && apt-get install -y \
    git \
    unzip

# Set the ServerName directive globally
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Add drupal user and group if they don't exist
RUN if ! getent group drupal; then groupadd -g $GUID drupal; fi && \
    if ! id -u drupal >/dev/null 2>&1; then useradd -m -u $UUID -g $GUID drupal; fi

# Ensure correct ownership and permissions
RUN chown -R drupal:drupal /var/www/html && \
    mkdir -p /opt/drupal && \
    chown -R drupal:drupal /opt/drupal

# Switch to drupal user
USER drupal

# Run Composer install in the Drupal directory
RUN composer install -d /opt/drupal

# Copy custom modules, themes, or other files if needed
# COPY ./custom_modules /var/www/html/modules/custom

# Set file permissions if needed
# RUN chown -R www-data:www-data /var/www/html/modules/custom
