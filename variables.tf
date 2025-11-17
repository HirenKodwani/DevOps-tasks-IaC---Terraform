# variables.tf - Variable definitions for Terraform configuration

variable "container_name" {
  description = "Name of the Docker container"
  type        = string
  default     = "terraform-nginx-container"
}

variable "external_port" {
  description = "External port to expose the container"
  type        = number
  default     = 8080
  
  validation {
    condition     = var.external_port > 0 && var.external_port < 65536
    error_message = "Port must be between 1 and 65535."
  }
}

variable "image_name" {
  description = "Docker image name to use"
  type        = string
  default     = "nginx:alpine"
}