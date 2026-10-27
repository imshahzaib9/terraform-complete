variable "environment" {
  type = string
  default = "dev"

  validation {
    condition = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be development, staging, or production."
  }
}

variable "vpc_id" {
  type = string
  description = "The ID of the VPC where the security group will be created."
}
