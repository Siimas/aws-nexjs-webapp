#!/bin/bash
sudo yum update -y
sudo yum install ruby -y
sudo yum install wget

# Install code deploy agent
sudo wget https://aws-codedeploy-eu-west-3.s3.eu-west-3.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto

# Install Docker
sudo yum install -y docker
sudo usermod -a -G docker ec2-user

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose version

# Start Docker
sudo service docker start

sudo mkdir app
sudo cd app