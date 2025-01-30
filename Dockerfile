# Use the official Drupal image from Docker Hub
FROM drupal:10.4-php8.3-apache-bookworm

# Set ARG and ENV for user IDs
ARG UUID=1000
ARG GUID=1000
ENV UUID=$UUID
ENV GUID=$GUID
ENV GNAME="drupal"
ENV UNAME="drupal"


# Set working directory
# WORKDIR /var/www/html

# Install any additional dependencies if required as root
USER root
RUN apt-get update && apt-get install -y \
    git \
    unzip

# Set the ServerName directive globally
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Add drupal user and group if they don't exist
RUN if ! getent group drupal; then groupadd -g $GUID drupal; fi && \
    if ! id -u drupal > /dev/null 2>&1; then useradd -m -u $UUID -g $GUID drupal; fi


# Ensure correct ownership and permissions
RUN chown -R drupal:drupal /var/www/html && \
    mkdir -p /opt/drupal && \
    chown -R drupal:drupal /opt/drupal

# Switch to drupal user
USER drupal

# Run Composer install in the Drupal directory
# WORKDIR /var/www/html
# RUN ls -al /var/www/html; 
# RUN composer install --working-dir=..

# Set working directory for drupal user
# WORKDIR /var/www/html

# Use CMD to ensure working directory is set correctly
CMD ["apache2-foreground"]
