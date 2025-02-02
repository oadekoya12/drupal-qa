# Use the official Drupal image from Docker Hub
FROM drupal:10.4-php8.3-apache-bookworm

# Set ARG and ENV for user IDs
ARG UUID=1000
ARG GUID=1000
ENV UUID=${UUID}
ENV GUID=${GUID}
ENV GNAME="drupal"
ENV UNAME="drupal"

# Install dependencies as root
USER root

# Install system tools and Node.js
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    default-mysql-client \
    curl \
    gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt install -y nodejs

# Install Playwright dependencies
RUN apt-get install -y \
    libglib2.0-0 \
    libnss3 \
    libnspr4 \
    libdbus-1-3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libxkbcommon0 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2 \
    libatspi2.0-0

# Configure Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Create drupal user/group if they don't exist
RUN if ! getent group ${GNAME} > /dev/null; then groupadd -g ${GUID} ${GNAME}; fi \
    && if ! id -u ${UNAME} > /dev/null 2>&1; then useradd -m -u ${UUID} -g ${GUID} ${UNAME}; fi

# Set permissions for Drupal and /opt directories
RUN chown -R ${UNAME}:${GNAME} /var/www/html \
    && mkdir -p /opt/drupal /opt/tests /opt/include \
    && chown -R ${UNAME}:${GNAME} /opt

# Switch to non-root user
USER ${UNAME}

# Start Apache in the foreground
CMD ["apache2-foreground"]
