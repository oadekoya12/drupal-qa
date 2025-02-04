# Use Node.js LTS version 22 to build the Playwright application
FROM node:22

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
RUN apt-get update && apt-get install -y git unzip curl inetutils-ping sudo

# Remove existing users with UID 1000
RUN if getent passwd 1000 > /dev/null; then deluser --remove-home $(getent passwd 1000 | cut -d: -f1); fi

# Create drupal user/group if they don't exist
RUN if ! getent group ${GNAME} > /dev/null; then groupadd -g ${GUID} ${GNAME}; fi \
    && if ! id -u ${UUID} > /dev/null 2>&1; then useradd -m -u ${UUID} -g ${GUID} ${UNAME}; fi

# Grant sudo privileges to the drupal user
RUN echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set working directory
WORKDIR /tests

# Switch to non-root user
USER ${UNAME}

# Copy package.json and package-lock.json
COPY package.json ./
COPY package-lock.json ./

# Install dependencies as non-root user
RUN sudo npm install
RUN sudo npx playwright install

# Copy the rest of the test files
COPY . .

# Set permissions for /tests directory
RUN sudo chown -R ${UNAME}:${GNAME} /tests

# Run Playwright tests
CMD ["npx", "playwright", "test"]
