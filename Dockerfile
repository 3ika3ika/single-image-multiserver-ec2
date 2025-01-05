# Use the official Nginx image as the base
FROM nginx:latest

# Copy the custom Nginx configuration file
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copy all web server content into the Nginx HTML directory
COPY webapp-content/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
