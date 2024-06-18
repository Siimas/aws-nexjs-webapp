# IAM role for CodePipeline
resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      }
    ]
  })
}

# IAM policy for CodePipeline
resource "aws_iam_policy" "codepipeline_policy" {
  name        = "codepipeline-policy"
  description = "Policy for CodePipeline"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          "codecommit:*",
          "codebuild:*",
          "codedeploy:*",
          "iam:PassRole",
          "codestar-connections:UseConnection",
          "codestar-connections:PassConnection"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach policy to CodePipeline role
resource "aws_iam_role_policy_attachment" "codepipeline_role_attachment" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = aws_iam_policy.codepipeline_policy.arn
}

# IAM role for CodeBuild
resource "aws_iam_role" "codebuild_role" {
  name = "codebuild-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      }
    ]
  })
}

# IAM policy for CodeBuild
resource "aws_iam_policy" "codebuild_policy" {
  name        = "codebuild-policy"
  description = "Policy for CodeBuild"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:*",
          "s3:*",
          "codecommit:*",
          "codebuild:*",
          "ecr:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach policy to CodeBuild role
resource "aws_iam_role_policy_attachment" "codebuild_role_attachment" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.codebuild_policy.arn
}

# Source stage (CodeCommit example)
resource "aws_codecommit_repository" "repo" {
  repository_name = "my-repo"
  description     = "My demonstration repository"
}


# IAM role for CodeDeploy
resource "aws_iam_role" "codedeploy_role" {
  name = "codedeploy-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codedeploy.amazonaws.com"
        }
      }
    ]
  })
}

# Attach policy to CodeDeploy role
resource "aws_iam_role_policy_attachment" "codedeploy_role_attachment" {
  role       = aws_iam_role.codedeploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

# IAM role policy (inline policy) for CodeDeploy S3 access
resource "aws_iam_role_policy" "codedeploy_s3_access" {
  name   = "CodeDeployS3Access"
  role   = aws_iam_role.codedeploy_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:*"
        ],
        Resource = "arn:aws:s3:::${var.devops_s3_bucket_name}/*"
      }
    ]
  })
}