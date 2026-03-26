#!/bin/bash

# Membangun Docker image dari Dockerfile di direktori saat ini dengan nama tag 'karsajobs:latest'
docker build -t karsajobs:latest .

# Menambahkan tag pada Docker image agar sesuai dengan username dan repositori Docker Hub 
docker tag karsajobs:latest dio713/karsajobs:latest

# Login ke Docker Hub dan password yang diambil dari environment variable PASSWORD_DOCKER_HUB
echo $PASSWORD_DOCKER_HUB | docker login -u dio713 --password-stdin

# Mengunggah (push) Docker image ke repository Docker Hub
docker push dio713/karsajobs:latest
