#!/bin/bash
sudo yum update -y
sudo yum install ruby
sudo yum install wget

# Install Docker
sudo yum install -y docker
sudo usermod -a -G docker ec2-user

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose version

# Start Docker
sudo service docker start

mkdir app
cd app

# Pull Docker image, docker compose file and nginx file
# sudo aws s3 cp s3://webapp-devops-bucket/frontend/ . --recursive

# Start app with docker compose
# sudo docker-compose up -d

# Install code deploy agent
wget https://aws-codedeploy-eu-west-3.s3.eu-west-3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto