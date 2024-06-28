provider "aws" {
  region = "us-east-2"
}

 

# Security group to allow HTTP (port 80) and SSH (port 22) traffic
resource "aws_security_group" "security_group" {
  name = "amrit-security-group"

 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

 

# EC2 instance with user data script for installing NGINX
resource "aws_instance" "ec2instance" {
  ami                    = "ami-0286724fac31a786d"  # Replace with your desired AMI
  instance_type          = "t2.micro"
  key_name               = "punkeypair"  # Replace with your SSH key name
  vpc_security_group_ids = [aws_security_group.security_group.id]

 

  tags = {
    Name = "amrit-nginx-terraform"
  }

 

  user_data = <<-EOF
              #!/bin/bash
              set -e

 

              # Update and install NGINX
              sudo apt update -y
              sudo apt install -y nginx

 

              # Verify NGINX installation
              nginx -v

 

              # Start and enable NGINX service
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}

 

output "instance_public_ip" {
  value = aws_instance.ec2instance.public_ip
}


