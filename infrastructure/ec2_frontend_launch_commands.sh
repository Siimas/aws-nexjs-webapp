#!/bin/bash
sudo yum update -y
sudo usermod -a -G docker ec2-user

# Install Docker
sudo yum install -y docker

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose version

# Start Docker
sudo service docker start

mkdir app
cd app

# Pull Docker image, docker compose file and nginx file
sudo aws s3 cp s3://webapp-devops-bucket/frontend/ . --recursive

# Start app with docker compose
sudo docker-compose up -d

