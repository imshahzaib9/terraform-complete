/*If I entered the default values in the environment variable should I changed after it.
No, I can't changed. So I added only description */

variable "environment" {
  description = "The environment for the S3 bucket"
  type        = string
}

 variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
} 

variable "ami_id" {
  type   = string
  #default = "ami-0f8a61b66d1accaee"
  description = "The ID of the AMI to use for the EC2 instance"
}

variable "instance_count" {
  type    = number
  description = "Number of EC2 instances to create"
}

variable "instance_type" {
  type    = string
  description = "Type of EC2 instance to create"
}
