# main.tf - Terraform configuration for Docker container provisioning

# Configure Terraform settings and required providers
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"  # Linux/Mac
  # For Windows, uncomment the line below and comment the line above:
  # host = "npipe:////./pipe/docker_engine"
}

# Pull Docker image from Docker Hub
resource "docker_image" "nginx" {
  name         = var.image_name
  keep_locally = false
}

# Create Docker container
resource "docker_container" "web" {
  name  = var.container_name
  image = docker_image.nginx.image_id

  # Port mapping
  ports {
    internal = 80
    external = var.external_port
  }

  # Environment variables
  env = [
    "NGINX_HOST=localhost",
    "NGINX_PORT=80"
  ]

  # Container healthcheck
  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost"]
    interval = "30s"
    timeout  = "3s"
    retries  = 3
  }

  # Restart policy
  restart = "unless-stopped"

  # Container labels for identification
  labels {
    label = "managed_by"
    value = "terraform"
  }

  labels {
    label = "project"
    value = "terraform-docker-iac"
  }
}