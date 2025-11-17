# outputs.tf - Output definitions for Terraform resources

output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.web.id
}

output "container_name" {
  description = "Name of the Docker container"
  value       = docker_container.web.name
}

output "container_ip" {
  description = "IP address of the Docker container"
  value       = docker_container.web.network_data[0].ip_address
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.image_id
}

output "access_url" {
  description = "URL to access the application"
  value       = "http://localhost:${var.external_port}"
}

output "image_used" {
  description = "Docker image used for the container"
  value       = var.image_name
}