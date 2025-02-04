# Use a base image
FROM ubuntu:latest

# Set ARG and ENV for user IDs
ARG UUID=1000
ARG GUID=1000
ENV UUID=${UUID}
ENV GUID=${GUID}
ENV GNAME="drupal"
ENV UNAME="drupal"

# Install dependencies as root
USER root

# Install system tools
RUN apt-get update && apt-get install -y openjdk-11-jre wget unzip perl

# Remove existing users with UID 1000
RUN if getent passwd 1000 > /dev/null; then deluser --remove-home $(getent passwd 1000 | cut -d: -f1); fi

# Create drupal user/group if they don't exist
RUN if ! getent group ${GNAME} > /dev/null; then groupadd -g ${GUID} ${GNAME}; fi \
    && if ! id -u ${UUID} > /dev/null 2>&1; then useradd -m -u ${UUID} -g ${GUID} ${UNAME}; fi

# Download and install Allure
RUN wget https://github.com/allure-framework/allure2/releases/download/2.32.1/allure-2.32.1.zip -O /tmp/allure.zip && \
    unzip /tmp/allure.zip -d /opt/allure && \
    ln -s /opt/allure/allure-2.32.1/bin/allure /usr/local/bin/allure

# Set permissions for /allure-results directory
RUN mkdir -p /allure-results && chown -R ${UNAME}:${GNAME} /allure-results

# Expose port 4040
EXPOSE 4040

# Switch to non-root user
USER ${UNAME}

# Start the Allure service
CMD ["allure", "serve", "/allure-results"]
