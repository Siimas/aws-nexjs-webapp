resource "aws_network_acl" "main-project-nacl" {
  vpc_id = aws_vpc.project-vpc.id
  subnet_ids = [
    aws_subnet.project-public-subnet-01a.id,
    aws_subnet.project-public-subnet-01b.id,
    aws_subnet.project-public-subnet-01c.id
  ]
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  tags = {
    Name = "Project - NACL for Public Subnets"
  }
}

resource "aws_security_group" "frontend-ec2-instances-sg" {
  name   = "Frontend EC2 Instances SG"
  vpc_id = aws_vpc.project-vpc.id

  ingress = []
  egress  = []
}