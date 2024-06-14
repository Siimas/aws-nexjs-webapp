# Create VPC
resource "aws_vpc" "project-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.project_name} - VPC"
  }
}

# Create Public Subnet 01a
resource "aws_subnet" "project-public-subnet-01a" {
  vpc_id            = aws_vpc.project-vpc.id
  availability_zone = "eu-west-3a"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "${var.project_name} - Public Subnet 01A"
  }
}

# Create Public Subnet 01b
resource "aws_subnet" "project-public-subnet-01b" {
  vpc_id            = aws_vpc.project-vpc.id
  availability_zone = "eu-west-3b"
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name = "${var.project_name} - Public Subnet 01B"
  }
}

# Create Public Subnet 01c
resource "aws_subnet" "project-public-subnet-01c" {
  vpc_id            = aws_vpc.project-vpc.id
  availability_zone = "eu-west-3c"
  cidr_block        = "10.0.3.0/24"
  tags = {
    Name = "${var.project_name} - Public Subnet 01C"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "project-igw" {
  vpc_id = aws_vpc.project-vpc.id
  tags = {
    Name = "${var.project_name} - IGW"
  }
}

# Create Main Route Table
resource "aws_route_table" "project-main-rt" {
  vpc_id = aws_vpc.project-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-igw.id
  }
  tags = {
    Name = "${var.project_name} - Main Route Table"
  }
}

resource "aws_main_route_table_association" "project-main-rt-association" {
  vpc_id         = aws_vpc.project-vpc.id
  route_table_id = aws_route_table.project-main-rt.id
}

# Create Application Load Balancer
resource "aws_lb" "project-alb" {
  name               = "${var.project_name}-alb"
  load_balancer_type = "application"
  internal           = false
  ip_address_type    = "ipv4"
  subnets = [
    aws_subnet.project-public-subnet-01a.id,
    aws_subnet.project-public-subnet-01b.id,
    aws_subnet.project-public-subnet-01c.id
  ]
  security_groups = [aws_security_group.frontend-ec2-instances-sg.id]
}