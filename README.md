# Terraform Script: Provisioning an EC2 Instance with NGINX using AWS Provider
 
This Terraform script automates the provisioning of an EC2 instance on AWS with NGINX installed and configured.
 
## Prerequisites
 
- AWS Account with appropriate permissions
- Terraform installed on your local machine
 
## Configuration
 
### AWS Provider
 
- Sets the AWS region to `us-east-2`.
 
### Security Group
 
- Allows inbound traffic on port 22 (SSH) and port 80 (HTTP) from any IP (`0.0.0.0/0`).
 
### EC2 Instance
 
- Launches a `t2.micro` instance using the specified AMI (`ami-0286724fac31a786d`).
- Configures NGINX using user data script to:
  - Update package repositories and install NGINX.
  - Start and enable NGINX service.
 
## Usage
 
1. Clone the repository.
2. Navigate to the directory containing `main.tf`.
3. Initialize Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply
   terraform destroy
