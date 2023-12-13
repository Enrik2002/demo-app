# Stage 1: Build the application
FROM node:21 AS build
WORKDIR /app
COPY ./src /app

# Stage 2: Create a production-ready image with Nginx
FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# Copy the built artifacts from the previous stage
COPY --from=build /app /usr/share/nginx/html

# Copy Nginx configuration if needed
# COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose the port that Nginx will listen on
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]