FROM node:14-alpine

LABEL org.opencontainers.image.description="Todo APP untuk belajar membuat container image di Dicoding"
LABEL org.opencontainers.image.source="https://github.com/kido1611/a433-microservices"

WORKDIR /app
COPY . .
ENV NODE_ENV=production DB_HOST=item-db
RUN npm install --production --unsafe-perm && npm run build
EXPOSE 8080
CMD ["npm", "start"]
