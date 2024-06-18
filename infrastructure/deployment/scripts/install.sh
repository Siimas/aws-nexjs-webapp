#!/bin/bash

cd /home/ec2-user/app

AWS_DEFAULT_REGION=eu-west-3
ACCOUNT_ID='471112925329'
REPOSITORY_NAME=frontend-devops-ecr

aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com

docker-compose stop;
docker-compose rm -f;
docker-compose pull;
docker-compose up -d;