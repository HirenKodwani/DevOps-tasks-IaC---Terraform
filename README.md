Infrastructure as Code (IaC) demonstration using Terraform to provision and manage Docker containers.

🎯 Project Overview
This project demonstrates Infrastructure as Code principles by using Terraform to:

Provision a Docker container running Nginx

Manage infrastructure lifecycle (create, update, destroy)

Implement best practices for IaC

Track infrastructure state

Define reusable and version-controlled infrastructure

📋 Prerequisites
Before you begin, ensure you have installed:

Docker (20.10+)

Download Docker Desktop

Verify: docker --version

Terraform (1.0+)

Download Terraform

Verify: terraform --version

🚀 Quick Start
1. Clone Repository
bash
git clone https://github.com/YOUR_USERNAME/terraform-docker-iac.git
cd terraform-docker-iac
2. Initialize Terraform
bash
# Download required providers
terraform init
3. Preview Changes
bash
# See what Terraform will create
terraform plan
4. Apply Configuration
bash
# Create the infrastructure
terraform apply
# Type 'yes' when prompted
5. Verify Deployment
bash
# Check running containers
docker ps

# Access the application
curl http://localhost:8080
# Or open in browser: http://localhost:8080
6. View Outputs
bash
# Display all outputs
terraform output
7. Destroy Infrastructure
bash
# Remove all created resources
terraform destroy
# Type 'yes' when prompted
📁 Project Structure
text
terraform-docker-iac/
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Variable definitions
├── outputs.tf              # Output definitions
├── .gitignore             # Git ignore rules
├── README.md              # This file
├── logs/                  # Execution logs (gitignored)
│   ├── terraform-init.log
│   ├── terraform-plan.log
│   ├── terraform-apply.log
│   ├── terraform-state.log
│   ├── terraform-outputs.log
│   └── terraform-destroy.log
└── screenshots/           # Process screenshots
    ├── 01-terraform-init.png
    ├── 02-terraform-plan.png
    ├── 03-terraform-apply.png
    ├── 04-terraform-state.png
    ├── 05-docker-ps.png
    ├── 06-nginx-running.png
    └── 07-terraform-destroy.png
📝 Configuration Files
main.tf
Main Terraform configuration containing:

Provider configuration (Docker)

Resource definitions (image, container)

Docker container settings

variables.tf
Customizable variables:

container_name - Name of the Docker container (default: "terraform-nginx-container")

external_port - External port mapping (default: 8080)

image_name - Docker image to use (default: "nginx:alpine")

outputs.tf
Exported values after apply:

Container ID

Container name

Container IP address

Access URL

Image information
