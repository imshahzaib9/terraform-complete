variable "ami_id" {
  type   = string
  default = "ami-0f8a61b66d1accaee"
}

variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_volume_size" {
  type    = number
  default = 50
}

variable "aws_volume_type" {
  type    = string
  default = "gp3"
}
