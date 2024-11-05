packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

# variable "region" {}
# variable "ami_name" {}
# variable "instance_type" {}
# variable "source_ami" {}
# variable "owner_id" {}
# variable "vpc_id" {}
# variable "subnet_id" {}
# variable "ssh_private_key" {}
# variable "security_group_id" {}

source "amazon-ebs" "demo" {
  ami_name      = "Devsecops-by-sekhar-{{timestamp}}"
  instance_type = "t2.micro"
  region        = var.region
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240927"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  vpc_id                       = var.vpc_id
  subnet_id                    = var.subnet_id
  associate_public_ip_address  = true
  tags = {
    Name        = var.ami_name               # Use the ami_name variable for the AMI name tag
    Environment = "Production"                # Example of an environment tag
    Owner       = "Sekhar"                    # Example of an owner tag
    Project     = "DevSecOps Project"         # Example of a project tag
  }
#   security_group_ids           = [var.security_group_id]

  # Specify the path to the PEM file for SSH access
#   ssh_private_key_file = var.ssh_private_key
}

build {
  sources = ["source.amazon-ebs.demo"]

  provisioner "shell" {
    inline = [
      "echo 'File exists Check' > one.txt",
      "sudo apt update -y",
      "sudo apt install nginx -y"
    ]
  }
}

