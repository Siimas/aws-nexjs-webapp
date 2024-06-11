# Create VPC
resource "aws_vpc" "project-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Project - VPC"
  }
}

# Create Public Subnet 01a
resource "aws_subnet" "project-public-subnet-01a" {
  vpc_id            = aws_vpc.project-vpc.id
  availability_zone = "eu-west-3a"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "Project - Public Subnet 01A"
  }
}

# Create Public Subnet 01b
resource "aws_subnet" "project-public-subnet-01b" {
  vpc_id            = aws_vpc.project-vpc.id
  availability_zone = "eu-west-3b"
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name = "Project - Public Subnet 01B"
  }
}

# Create Public Subnet 01c
resource "aws_subnet" "project-public-subnet-01c" {
  vpc_id            = aws_vpc.project-vpc.id
  availability_zone = "eu-west-3c"
  cidr_block        = "10.0.3.0/24"
  tags = {
    Name = "Project - Public Subnet 01C"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "project-igw" {
  vpc_id = aws_vpc.project-vpc.id
  tags = {
    Name = "Project - IGW"
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
    Name = "Project - Main Route Table"
  }
}