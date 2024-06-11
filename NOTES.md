# Todo

- [ ] Update the Frontend EC2 Instances by pulling the latest docker image (DevOps).
- [ ] Configure a reverse proxy for the Frontend EC2 Launch Commands

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