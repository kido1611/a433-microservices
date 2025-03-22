FROM node:14.21-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:14.21-alpine AS runtime

# Memberi label pada hasil image
LABEL org.opencontainers.image.description="karsajobs-ui"
LABEL org.opencontainers.image.source="https://github.com/kido1611/a433-microservices"

WORKDIR /app
RUN npm install -g serve@14.2.4
COPY --from=builder /app/dist /app/
EXPOSE 8000
CMD [ "serve", "-s", "/app", "-l", "8000" ]
