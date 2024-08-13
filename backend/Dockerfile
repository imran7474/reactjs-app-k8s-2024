# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Copy the .env file
COPY .env .env

# Expose the port the app runs on
EXPOSE 5000

# Start the application
CMD ["node", "index.js"]
