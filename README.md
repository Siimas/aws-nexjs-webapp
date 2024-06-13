# Project Overview

This repository showcases a scalable, secure, and cost-effective cloud architecture designed to demonstrate my skills in cloud computing and AWS services. The primary objective of this project is to provide a comprehensive example of how to design, deploy, and manage a cloud-based solution using best practices and industry standards.

In this project, I have leveraged a variety of AWS services to create a robust infrastructure suitable for a modern web application. The architecture includes a range of components such as virtual networks, scalable compute resources, managed databases, and integrated security measures.

## Architecture Diagram

![Cloud Architecture (1)](https://github.com/Siimas/AWS-WebApp-Showcase/assets/61023827/5c49d3ca-feb5-43f4-af05-b5d5f1fec332)

## Features
- Highly Available and Scalable Architecture: Utilizes Amazon EC2 Auto Scaling and Elastic Load Balancing to ensure high availability and scalability.
- Secure Networking: Implements VPCs, subnets, security groups, and network ACLs to secure network communication.
- Managed Databases: Uses Amazon DynamoDB for a managed, scalable, and reliable database solution.
- Infrastructure as Code: Infrastructure is defined using Terraform, enabling repeatable and consistent deployments.
- Monitoring and Logging: Integrates Amazon CloudWatch and AWS CloudTrail for monitoring and logging infrastructure activities.

## Technologies Used
- Amazon EC2: For scalable virtual compute instances.
- Amazon S3: For scalable object storage.
- Amazon DynamoDB: For managed non-relational database services.
- Amazon VPC: For networking and security configurations.
- Terraform: For Infrastructure as Code (IaC).
- Amazon CloudWatch: For monitoring and logging.
- AWS CloudTrail: For auditing and compliance.
- Docker: For containerizing applications.

## Prerequisites
To deploy and manage this infrastructure, you will need:

- An AWS account with appropriate permissions.
- AWS CLI configured on your local machine.
- Terraform installed on your local machine (if using Terraform for IaC).
- Basic understanding of AWS services and cloud architecture.

# Detailed Documentation

todo...

## Architecture Details

- Create a detailed documentation file (e.g., ARCHITECTURE.md) to explain the architecture in-depth.
- Break down each component of your infrastructure, explaining its role and why it was chosen.
- Describe how different components interact with each other.

**Questions**:

- Should it be Serverless, why?

## Service Descriptions

- For each AWS service used, create a separate section in your documentation (or a separate file, if needed) explaining:
- Purpose: Why the service is used in the project.
- Configuration: How the service is configured, including key settings and parameters.

# Usage Instructions

todo...

## Step-by-Step Guide

- Provide detailed, step-by-step instructions on how to deploy the infrastructure. This can be in a file like DEPLOYMENT.md.
- Include any commands that need to be run, environment variables that need to be set, etc.
- If there are post-deployment steps (e.g., configuring a service, setting up monitoring), document those as well.

## Example Scenarios:
- Include example scenarios or use cases in which your infrastructure can be used.
- This helps showcase the practical applications of your setup.
