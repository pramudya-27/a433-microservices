#!/bin/bash

# Membangun Docker image dari Dockerfile di direktori saat ini dengan nama tag 'karsajobs-ui:latest'
docker build -t karsajobs-ui:latest .

# Menambahkan tag pada Docker image agar sesuai dengan username dan repositori Docker Hub
docker tag karsajobs-ui:latest dio713/karsajobs-ui:latest

# Login ke Docker Hub dan password yang diambil dari environment variable PASSWORD_DOCKER_HUB
echo $PASSWORD_DOCKER_HUB | docker login -u dio713 --password-stdin

# Mengunggah (push) Docker image ke repository Docker Hub
docker push dio713/karsajobs-ui:latest
