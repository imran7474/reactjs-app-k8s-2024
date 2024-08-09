# Stage 1: Build Stage
FROM node:20.0-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Production Stage
FROM nginx:alpine

# Copy the build artifacts from the build stage to the Nginx public directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for the Nginx server
EXPOSE 80

# Start Nginx without the daemon mode
CMD ["nginx", "-g", "daemon off;"]
