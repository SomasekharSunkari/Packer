

variable "region" {
  description = "The AWS region to use for building the AMI"
  type        = string
}

variable "ami_name" {
  description = "The name of the AMI to create"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type to use for the AMI build"
  type        = string
}

variable "source_ami" {
  description = "The source AMI to use for creating the new AMI"
  type        = string
}

variable "owner_id" {
  description = "The owner ID for the source AMI"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which to launch the instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the instance"
  type        = string
}

# variable "ssh_private_key" {
#   description = "The path to the PEM file for SSH access"
#   type        = string
# }
