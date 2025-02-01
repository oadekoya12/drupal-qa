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
    default-mysql-client \
    curl \
    gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_23.x \
        -o nodesource_setup.sh \
    && bash nodesource_setup.sh \
    && apt install -y nodejs

RUN apt-get install libglib2.0-0\ 
    libnss3\               
    libnspr4\              
    libdbus-1-3\           
    libatk1.0-0\           
    libatk-bridge2.0-0\    
    libcups2\              
    libxcomposite1\        
    libxdamage1\           
    libxfixes3\            
    libxrandr2\            
    libgbm1\               
    libxkbcommon0\         
    libpango-1.0-0\        
    libcairo2\             
    libasound2\            
    libatspi2.0-0 

# Install Playwright
# RUN npm install -g @playwright/test

# Set the ServerName directive globally
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Add drupal user and group if they don't exist
RUN if ! getent group drupal; then groupadd -g $GUID drupal; fi && \
    if ! id -u drupal > /dev/null 2>&1; then useradd -m -u $UUID -g $GUID drupal; fi

# Ensure correct ownership and permissions
RUN chown -R drupal:drupal /var/www/html && \
    mkdir -p /opt/drupal /opt/tests /opt/include && \
    chown -R drupal:drupal /opt

# Switch to drupal user
USER drupal

# Use CMD to ensure working directory is set correctly
CMD ["apache2-foreground"]
