module "dev-testing-infra" {
    source = "./module-01"
    environment = "dev"
    bucket_name = "shahzaib-bucket-09091999"
    instance_count = 1
    instance_type = "t3.small"
    ami_id = "ami-0f8a61b66d1accaee"
  }

  module "stage-testing-infra" {
    source = "./module-01"
    environment = "stage"
    bucket_name = "shahzaib-bucket-09091999"
    instance_count = 2
    instance_type = "t2.nano"
    ami_id = "ami-0f8a61b66d1accaee"
  }

  module "prod-testing-infra" {
    source = "./module-01"
    environment = "prod"
    bucket_name = "shahzaib-bucket-09091999"
    instance_count = 2
    instance_type = "t2.large"
    ami_id = "ami-0f8a61b66d1accaee"
  }
