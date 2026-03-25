# Base image: node versi 14
FROM node:14

# Set working directory ke /app
WORKDIR /app

# Copy seluruh source code ke dalam working directory
COPY . .

# Set environment variable sesuai dengan ketentuan
ENV NODE_ENV=production DB_HOST=item-db

# Install seluruh dependency untuk production dan jalankan build
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080
EXPOSE 8080

# Command utama saat container berjalan
CMD ["npm", "start"]
