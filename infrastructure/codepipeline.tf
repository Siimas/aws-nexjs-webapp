# CodeBuild project
resource "aws_codebuild_project" "build" {
  name          = "codebuild-project"
  description   = "Build project for CodePipeline"
  build_timeout = "5"

  source {
    type      = "GITHUB"
    location  = "https://github.com/your-github-username/your-repository-name"
    buildspec = <<EOF
version: 0.2

phases:
  install:
    runtime-versions:
      nodejs: 12
  build:
    commands:
      - echo "Building..."
EOF
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:4.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }

  service_role = aws_iam_role.codebuild_role.arn
}

# CodePipeline
resource "aws_codepipeline" "pipeline" {
  name           = "codepipeline"
  pipeline_type  = "V2"
  role_arn       = aws_iam_role.codepipeline_role.arn
  execution_mode = "QUEUED"

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.devops-bucket.bucket
  }

  trigger {
    provider_type = "CodeStarSourceConnection"
    git_configuration {
      source_action_name = "Source"
      push {
        branches {
          includes = ["main"]
        }
        file_paths {
          includes = ["**/frontend/**"]
        }
      }
    }
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.github_connection_arn
        FullRepositoryId = "${var.github_username}/${var.repository_name}"
        BranchName       = var.branch_name

      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = aws_codebuild_project.build.name
      }
    }
  }
}