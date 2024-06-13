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

# Create IAM Instance Profile for EC2
resource "aws_iam_instance_profile" "project-ec2-s3-dynamodb-access" {
  name = "project-ec2-s3-dynamodb-access"
  role = aws_iam_role.project-ec2-s3-dynamodb-access.name
}

# CodePipeline

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "codepipeline_role" {
  name               = "test-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "codepipeline_policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObjectAcl",
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.devops-bucket.arn,
      "${aws_s3_bucket.devops-bucket.arn}/*"
    ]
  }

  statement {
    effect    = "Allow"
    actions   = ["codestar-connections:UseConnection"]
    resources = [aws_codestarconnections_connection.example.arn]
  }

  statement {
    effect = "Allow"

    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name   = "codepipeline_policy"
  role   = aws_iam_role.codepipeline_role.id
  policy = data.aws_iam_policy_document.codepipeline_policy.json
}