variable "region" {
  description = "AWS Region"
  type        = string
}

variable "project_name" {
  description = "Tne name of the project"
  type        = string
  default     = "project"
}

variable "github_connection_arn" {
  description = "The ARN of the GitHub connection created in the AWS console"
  type        = string
}

variable "github_username" {
  description = "The Github Username of the repository used for the connection"
  type        = string
}

variable "repository_name" {
  description = "The Repository name used for the connection"
  type        = string
}

variable "branch_name" {
  description = "The Branch name of Repository used for the connection"
  type        = string
}