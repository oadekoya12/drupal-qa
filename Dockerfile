# Use the official Drupal image from Docker Hub
FROM drupal:10.4-php8.3-apache-bookworm

# Set ARG and ENV for user IDs
ARG UUID=1000
ARG GUID=1000
ENV UUID=$UUID
ENV GUID=$GUID
ENV GNAME="drupal"
ENV UNAME="drupal"

# Install any additional dependencies if required as root
USER root
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    default-mysql-client  # Install MySQL client

# Set the ServerName directive globally
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Add drupal user and group if they don't exist
RUN if ! getent group drupal; then groupadd -g $GUID drupal; fi && \
    if ! id -u drupal > /dev/null 2>&1; then useradd -m -u $UUID -g $GUID drupal; fi

# Ensure correct ownership and permissions
RUN mkdir -p /opt/include
RUN chown -R drupal:drupal /var/www/html /opt/include && \
    mkdir -p /opt/drupal && \
    chown -R drupal:drupal /opt/drupal

# Switch to drupal user
USER drupal

COPY ./optinclude/compinstall.sh /opt/include/compinstall.sh

# Use CMD to ensure working directory is set correctly
CMD ["apache2-foreground"]
