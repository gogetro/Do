# Use official Node.js image as the base
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install --production

# Copy rest of the application code
COPY . .

# Build Next.js app
RUN npm run build

# Expose port (default for Next.js)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
