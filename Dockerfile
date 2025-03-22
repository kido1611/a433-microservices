FROM node:14.21-alpine AS builder

# Memberi label pada hasil image
LABEL org.opencontainers.image.description="karsajobs-ui"
LABEL org.opencontainers.image.source="https://github.com/kido1611/a433-microservices"

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8000
CMD [ "npm", "run", "serve" ]
