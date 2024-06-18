# CodeBuild project
resource "aws_codebuild_project" "build" {
  name          = "codebuild-project"
  description   = "Build project for CodePipeline"
  build_timeout = "5"

  source {
    type      = "GITHUB"
    location  = "https://github.com/${var.github_username}/${var.repository_name}"
    buildspec = file("frontend-buildspec.yml")
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