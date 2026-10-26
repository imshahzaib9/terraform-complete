terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "my-remote-backend-bucket-09091999"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-remote-backend-lock-table"
    encrypt        = true
    use_lockfile     = true
  }
}
