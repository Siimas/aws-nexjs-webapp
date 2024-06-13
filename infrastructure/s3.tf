resource "aws_s3_bucket" "devops-bucket" {
  bucket = "webapp-devops-bucket"

  tags = {
    Name        = "DevOps Bucket"
    Environment = "Prod"
  }
}

resource "aws_s3_bucket_versioning" "devops-bucket-versioning" {
  bucket = aws_s3_bucket.devops-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "nginx-file" {
  bucket = aws_s3_bucket.devops-bucket.id
  key    = "frontend/nginx.conf"
  source = "../frontend/nginx.conf"
}

resource "aws_s3_object" "docker-compose-file" {
  bucket = aws_s3_bucket.devops-bucket.id
  key    = "frontend/docker-compose.yml"
  source = "../frontend/docker-compose.yml"
}