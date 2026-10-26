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
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "The CIDR blocks for the public subnets."
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "The CIDR blocks for the private subnets."
}

variable "availability_zone" {
  type = list(string)
  description = "The availability zones for the subnets."
}