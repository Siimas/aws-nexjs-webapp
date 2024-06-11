# Create NACL for Public Subnets
resource "aws_network_acl" "main-project-nacl" {
  vpc_id = aws_vpc.project-vpc.id
  subnet_ids = [
    aws_subnet.project-public-subnet-01a.id,
    aws_subnet.project-public-subnet-01b.id,
    aws_subnet.project-public-subnet-01c.id
  ]
  ingress {
    protocol   = "-1"
    action     = "allow"
    rule_no    = 100
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = "-1"
    action     = "allow"
    rule_no    = 100
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "Project - NACL for Public Subnets"
  }
}

# Create Security Group for Frontend EC2 Intances
resource "aws_security_group" "frontend-ec2-instances-sg" {
  name   = "Frontend EC2 Instances SG"
  vpc_id = aws_vpc.project-vpc.id

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
  }

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }

  # EC2 Instance Connect 
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }

  // Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}