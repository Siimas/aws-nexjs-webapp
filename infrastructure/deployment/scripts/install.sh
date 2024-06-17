#!/bin/bash

cd /home/ec2-user/app

docer-compose stop;
docker-compose rm -f;
docker-compose pull;
docker-compose up -d;