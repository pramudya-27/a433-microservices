#!/bin/bash

# Pastikan eksekusi script berjalan di direktori yang sama dengan Dockerfile

# Mengambil username dari Environment Variable untuk GitHub Container Registry
USERNAME=${CR_USERNAME:-pramudya-27}

# 1. Build image dengan nama item-app dan tag v1
echo "=== 1. Membangun Docker image item-app:v1 ==="
docker build -t item-app:v1 .

# 2. Cek daftar image di lokal untuk memastikan build berhasil
echo "=== 2. Menampilkan daftar Docker image ==="
docker images | grep item-app

# 3. Tag image mengikuti standar GitHub Container Registry (ghcr.io)
echo "=== 3. Memberikan tag untuk GitHub Container Registry ==="
docker tag item-app:v1 ghcr.io/$USERNAME/item-app:v1

# 4. Login ke GitHub Container Registry menggunakan environment variables untuk keamanan
echo "=== 4. Login ke GitHub Container Registry ==="
if [ -z "$CR_PAT" ]; then
  echo "Peringatan: Environment variable CR_PAT tidak diset. Silakan set password/token terlebih dahulu."
else
  echo "$CR_PAT" | docker login ghcr.io -u "$USERNAME" --password-stdin
fi

# 5. Push image ke GitHub Container Registry
echo "=== 5. Melakukan push image ke ghcr.io ==="
docker push ghcr.io/$USERNAME/item-app:v1

echo "Proses build dan push selesai!"
