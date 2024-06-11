# Create IAM Role
resource "aws_iam_role" "project-ec2-s3-dynamodb-access" {
  name = "ProjectEC2AccessToS3AndDynamoDB"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "Project - EC2 Access to S3 And DynamoDB"
  }
}

data "aws_iam_policy" "bynamodb-policy" {
  name = "AmazonDynamoDBFullAccess"
}

data "aws_iam_policy" "s3-policy" {
  name = "AmazonS3FullAccess"
}

# Attach IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "attach-policy-AmazonDynamoDBFullAccess" {
  role       = aws_iam_role.project-ec2-s3-dynamodb-access.name
  policy_arn = data.aws_iam_policy.bynamodb-policy.arn
}

# Attach IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "attach-policy-AmazonS3FullAccess" {
  role       = aws_iam_role.project-ec2-s3-dynamodb-access.name
  policy_arn = data.aws_iam_policy.s3-policy.arn 
}