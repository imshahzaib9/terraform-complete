variable "aws_region" {
  type = string
  default = "us-east-1"
}

/* VPC Configuration */

variable "environment" {
  type = string
  default = "dev"

  validation {
    condition = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be development, staging, or production."
  }
}

variable "vpc_cidr" {
  type = string
  description = "The CIDR block for the VPC."
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "The CIDR blocks for the public subnets."
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "The CIDR blocks for the private subnets."
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zone" {
  type = list(string)
  description = "The availability zones for the subnets."
  default = ["us-east-1a", "us-east-1b"]
}

