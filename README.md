# Introduction
This repository is designed to demonstrate my expertise in various AWS services and practices, including DevOps, cloud architecture, automation, and more.

## Motivation
I created this repository to consolidate my knowledge and experience with AWS, share best practices, and provide a portfolio of my work. Cloud computing is a critical skill in today's tech landscape, and I am passionate about continuously learning and improving my abilities in this field. The best way to showcase these skills is by applying them to real-world scenarios, such as deploying an auto-scalable and highly available web application for a SaaS.

## Objective
Deploy an auto-scalable and highly available web application for a SaaS using AWS.

# Project Requirements
- Utilize Infrastructure as Code (IaC).
- Implement DevOps practices by configuring CI/CD pipelines.
- Use AWS Elastic Load Balancing (ELB) to distribute network traffic.
- Use Auto Scaling Groups (ASG) for application scaling.
- Use Amazon DynamoDB for the database.
- Monitor the AWS services using CloudWatch and CloudTrail.
- Implement security best practices, such as using IAM roles and policies, enabling encryption, and setting up security groups.
- Design a VPC with appropriate subnets, route tables, and gateways.
- Implement a backup and recovery strategy for critical data.
- Perform load and performance testing.
- Ensure compliance with relevant regulations and standards.
- Use AWS Cost Management tools to monitor and optimize costs.
- Provide comprehensive documentation for setup, deployment, and maintenance.

# Technologies and Tools
- AWS: ELB, ASG .
- Tools: Docker.
- IaC: Terraform.
- DevOps: Github Actions, Docker Hub.

# Architecture Overview
In this section, I will outline the architecture of the deployed web application, detailing the components used and the rationale behind each architectural decision.

## Architecture Diagram

![Cloud Architecture (1)](https://github.com/Siimas/AWS-WebApp-Showcase/assets/61023827/5c49d3ca-feb5-43f4-af05-b5d5f1fec332)

## Components and Decisions
- VPC (Virtual Private Cloud):

- Subnets:

- EC2 Instances:

- Auto Scaling Groups:

- Load Balancer:
    - Application Load Balancer (ALB)

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
