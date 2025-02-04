# Use Node.js LTS version 22 to build the Angular application
FROM node:22 AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install -g @angular/cli
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN ng build --configuration production

# Use NGINX to serve the application
FROM nginx:alpine

# Copy the built application from the builder stage
COPY --from=builder /app/dist/angular-app /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
