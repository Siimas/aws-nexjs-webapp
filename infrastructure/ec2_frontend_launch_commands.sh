#!/bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo docker ps
sudo docker pull siimas/aws-skills-showcase:latest
sudo docker run -d -p 3000:3000 siimas/aws-skills-showcase:latest
