# Project Overview

todo...

## Project Title: 
A clear and concise title for your project.

## Introduction
Briefly describe the purpose of the project and its goals.

## Architecture Diagram

![Cloud Architecture (1)](https://github.com/Siimas/AWS-WebApp-Showcase/assets/61023827/5c49d3ca-feb5-43f4-af05-b5d5f1fec332)

## Features
List the main features of your infrastructure.

## Technologies Used
Mention all the AWS services and other technologies you have utilized.

## Prerequisites
List any prerequisites needed to understand or deploy the project.

# Detailed Documentation

todo...

## Architecture Details:
- Create a detailed documentation file (e.g., ARCHITECTURE.md) to explain the architecture in-depth.
- Break down each component of your infrastructure, explaining its role and why it was chosen.
- Describe how different components interact with each other.

## Service Descriptions:
- For each AWS service used, create a separate section in your documentation (or a separate file, if needed) explaining:
- Purpose: Why the service is used in the project.
- Configuration: How the service is configured, including key settings and parameters.

# Usage Instructions

todo...

## Step-by-Step Guide:
- Provide detailed, step-by-step instructions on how to deploy the infrastructure. This can be in a file like DEPLOYMENT.md.
- Include any commands that need to be run, environment variables that need to be set, etc.
- If there are post-deployment steps (e.g., configuring a service, setting up monitoring), document those as well.

## Example Scenarios:
- Include example scenarios or use cases in which your infrastructure can be used.
- This helps showcase the practical applications of your setup.

# Commands
- Docker
  - ```docker-compose build client-dev```
  - ```docker-compose up client-dev```

- EC2
  - Launch:
    - ```sudo yum update -y```
    - ```sudo yum install -y docker```
    - ```sudo service docker start```
    - ```sudo usermod -a -G docker ec2-user```
    - ```sudo docker ps```
    - ```sudo docker pull siimas/aws-skills-showcase:latest```
    - ```sudo docker run -d -p 443:3000 siimas/aws-skills-showcase:latest```