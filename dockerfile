# Use the official Nginx base image
FROM nginx:latest

# Copy custom HTML files to the default Nginx directory
COPY html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
