output "app_url" {
  description = "URL of the application"
  value       = aws_lb.app_lb.dns_name
}