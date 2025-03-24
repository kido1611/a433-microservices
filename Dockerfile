FROM node:18-alpine AS base

# set working directory
WORKDIR /src

# Memberi label pada hasil image
LABEL org.opencontainers.image.description="order-service"
LABEL org.opencontainers.image.source="https://github.com/kido1611/a433-microservices"
LABEL org.opencontainers.image.authors="Muhammad Abdusy Syukur (kido1611)"

# Set env
ENV NODE_ENV=production
ENV AMQP_URL=
ENV PORT=3000

# Hanya copy package.json dan file.js saja
COPY package*.json ./
COPY ./*.js ./

# Install dependency
RUN npm ci

# set command
CMD ["node", "index.js"]
