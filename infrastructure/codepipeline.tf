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

    action {
      name             = "S3Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["s3_output"]

      configuration = {
        S3Bucket    = aws_s3_bucket.devops-bucket.bucket
        S3ObjectKey = "deployment/deployment.zip"
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

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      version         = "1"
      input_artifacts = ["s3_output"]
      configuration = {
        ApplicationName     = aws_codedeploy_app.codedeploy-app.name
        DeploymentGroupName = var.codedeploy_deployment_group_name
      }
    }
  }
}