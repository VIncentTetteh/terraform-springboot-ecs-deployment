```markdown
# Terraform Module for Spring Boot Application Deployment

This Terraform module containerizes a Spring Boot Java application using a Dockerfile, creates an ECR repository, pushes the image there, stores the `.env` file in an S3 bucket, creates an ECS cluster with a task, service, and load balancer, and deploys the Docker image. It also attaches the environment file from S3 and returns the URL to access the application on ECS.

## Usage

In your Spring Boot application directory, create a Terraform configuration file (e.g., `main.tf`) that uses this module:

```hcl
module "springboot_app" {
  source          = "../terraform-module"
  aws_region      = "us-east-1"
  app_name        = "my-springboot-app"
  s3_bucket_name  = "my-springboot-app-env"
  env_file_path   = "./.env"
  dockerfile_path = "./Dockerfile"
  subnets         = ["subnet-0123456789abcdef0"]  # Replace with your subnet IDs
  vpc_id          = "vpc-0123456789abcdef0"       # Replace with your VPC ID
}

output "app_url" {
  value = module.springboot_app.app_url
}
```

Then run the following commands in your Spring Boot application directory:

```sh
terraform init
terraform apply
```

## Inputs

| Name             | Description                                         | Type          | Default       | Required |
|------------------|-----------------------------------------------------|---------------|---------------|----------|
| `aws_region`     | AWS region                                          | `string`      | `"us-east-1"` | no       |
| `app_name`       | Name of the Spring Boot application                 | `string`      | n/a           | yes      |
| `s3_bucket_name` | S3 bucket name for storing the `.env` file          | `string`      | n/a           | yes      |
| `env_file_path`  | Path to the `.env` file                             | `string`      | n/a           | yes      |
| `dockerfile_path`| Path to the Dockerfile                              | `string`      | n/a           | yes      |
| `subnets`        | Subnets for the ECS service                         | `list(string)`| n/a           | yes      |
| `vpc_id`         | VPC ID for the ECS service                          | `string`      | n/a           | yes      |

## Outputs

| Name      | Description                        |
|-----------|------------------------------------|
| `app_url` | URL of the application             |

## Directory Structure

Ensure your directory structure looks like this:

```
