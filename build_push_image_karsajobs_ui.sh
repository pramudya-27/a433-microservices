#!/bin/bash

# Membangun Docker image dari Dockerfile di direktori saat ini dengan nama tag 'karsajobs-ui:latest'
docker build -t karsajobs-ui:latest .

# Menambahkan tag pada Docker image agar sesuai dengan registry GitHub Packages (GHCR)
docker tag karsajobs-ui:latest ghcr.io/pramudya-27/karsajobs-ui:latest

# Login ke GitHub Packages (ghcr.io) menggunakan environment variable CR_PAT (Personal Access Token)
echo $CR_PAT | docker login ghcr.io -u pramudya-27 --password-stdin

# Mengunggah (push) Docker image ke repository GitHub Packages
docker push ghcr.io/pramudya-27/karsajobs-ui:latest
