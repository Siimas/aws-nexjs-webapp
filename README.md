# Introduction
This repository is designed to demonstrate my expertise in various AWS services and practices, including DevOps, cloud architecture, automation, and more.

# Motivation
I created this repository to consolidate my knowledge and experience with AWS, share best practices, and provide a portfolio of my work. Cloud computing is a critical skill in today's tech landscape, and I am passionate about continuously learning and improving my abilities in this field.

# Objective
Deploy an auto-scalable and highly available Web App.

# Projects Overview
- Infrastructure as Code (IaC): Terraform.
- CI/CD Pipelines: Jenkins, CodePipeline, and GitHub Actions.
- Monitoring and Logging: CloudWatch dashboards and logging solutions.
- Security and Compliance: IAM policies and automated compliance checks.
- Cost Management: Scripts for cost optimization and budget alerts.
- Disaster Recovery: Backup solutions and disaster recovery plans.
- Load Balancer: Configurations for setting up load balancers to distribute traffic efficiently.
- Auto-Scaling Groups: Implementing auto-scaling groups to maintain application performance and availability.
- Database: Setup and management of DynamoDB for scalable and low-latency data storage.
- S3: Using S3 for object storage.

 Technologies and Tools
- AWS Services: ... .
- Tools: Docker.
- IaC: Terraform.
- DevOps: Github Actions, Docker Hub.

# Architecture Overview
In this section, I will outline the architecture of the deployed web application, detailing the components used and the rationale behind each architectural decision.

## Architecture Diagram

(Ensure you include a diagram that visualizes the architecture. You can create one using tools like AWS Architecture Icons, Lucidchart, or draw.io.)

![Cloud Architecture (1)](https://github.com/Siimas/AWS-WebApp-Showcase/assets/61023827/5c49d3ca-feb5-43f4-af05-b5d5f1fec332)

## Components and Decisions
- VPC (Virtual Private Cloud):

- Subnets:

- EC2 Instances:

- Auto Scaling Groups:

- Load Balancer:

### Database
For the database I chose DynamoDB, because ...

### File Storage
For file storage I chose S3, because ...

- CI/CD Pipelines:

- Monitoring and Logging:

- Security and Compliance:

- Cost Management:

- Disaster Recovery:

# DevOps Overview
In this section I will be explaining the decisions behind the CI and CD pipelines and how they were implemented.

## Containerization

TODO

## Github Action

TODO

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