# Create Launch Template
resource "aws_launch_template" "project-frontend-ec2-lt" {
  name                   = "Project-FrontendEC2LaunchTemplate"
  image_id               = "ami-052984d1804039ba8"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.frontend-ec2-instances-sg.id]
  iam_instance_profile {
    name = aws_iam_role.project-ec2-s3-dynamodb-access.name
  }
  user_data = filebase64("ec2_frontend_launch_commands.sh")
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "project-frontend-ec2-asg" {
  name                      = "Project-FrontendEC2ASG"
  max_size                  = 5
  min_size                  = 1
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  vpc_zone_identifier = [
    aws_subnet.project-public-subnet-01a.id,
    aws_subnet.project-public-subnet-01b.id,
    aws_subnet.project-public-subnet-01c.id
  ]

  launch_template {
    id      = aws_launch_template.project-frontend-ec2-lt.id
    version = "$Latest"
  }

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }
}