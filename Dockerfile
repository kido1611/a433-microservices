# Membuat image dari node:14-alpine
FROM node:14-alpine

# Memberi label pada hasil image
LABEL org.opencontainers.image.description="Todo APP untuk belajar membuat container image di Dicoding"
LABEL org.opencontainers.image.source="https://github.com/kido1611/a433-microservices"

# Mengganti workdir ke /app
WORKDIR /app

# menyalin semua file (termasuk directory) ke /app
COPY . .

# Set default ENV untuk image
ENV NODE_ENV=production DB_HOST=item-db

# Jalankan perintah install dan build pada app
RUN npm install --production --unsafe-perm && npm run build

# Expose port 8080
EXPOSE 8080

# Gunakan perintah npm start untuk menjalankan app
CMD ["npm", "start"]
