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

# install bash and wait-for-it
# digunakan untuk menunggu rabbitmq
RUN apk add --no-cache bash=5.2.37-r0 && \ 
  wget -q -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
  chmod +x /bin/wait-for-it.sh

# export port 3000
EXPOSE 3000

# set command
CMD ["node", "index.js"]
