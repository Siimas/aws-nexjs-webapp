# CodeDeploy Application
resource "aws_codedeploy_app" "codedeploy-app" {
  name = "my-codedeploy-app"
}

# CodeDeploy Deployment Group
resource "aws_codedeploy_deployment_group" "codedeploy-deployment-group" {
  deployment_group_name = var.codedeploy_deployment_group_name
  app_name              = aws_codedeploy_app.codedeploy-app.name
  service_role_arn      = aws_iam_role.codedeploy_role.arn
  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }
    terminate_blue_instances_on_deployment_success {
      action = "TERMINATE"
    }
  }
  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
  autoscaling_groups = [aws_autoscaling_group.project-frontend-ec2-asg.name]
  load_balancer_info {
    target_group_info {
      name = aws_lb.project-alb.name
    }
  }
}