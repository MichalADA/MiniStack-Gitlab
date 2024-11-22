variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  default     = "us-east-1"
}

variable "subnet_id" {
  description = "ID of the subnet to use for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Name of the AWS key pair for SSH access"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to use"
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR block for SSH access"
  type        = string
}
