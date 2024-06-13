resource "aws_ecr_repository" "frontend-devops-ecr" {
  name                 = "frontend-devops-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}