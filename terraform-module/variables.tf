variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Name of the Spring Boot application"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name for storing the .env file"
  type        = string
}

variable "env_file_path" {
  description = "Path to the .env file"
  type        = string
}

variable "dockerfile_path" {
  description = "Path to the Dockerfile"
  type        = string
}

variable "subnets" {
  description = "Subnets for the ECS service"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the ECS service"
  type        = string
}
