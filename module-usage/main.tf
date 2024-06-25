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