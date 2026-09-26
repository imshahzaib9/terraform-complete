# Configure the AWS Provider
provider "aws" {
  region = var.aws-region
}

provider "aws" {
  alias  = "stockholm"
  region = "eu-north-1"
}
