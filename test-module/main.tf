module "dev-testing-infra" {
    source = "./test-module/module-01"
    environment = dev
    bucket_name = "shahzaib-bucket-09091999"
    instance_count = 1
    instance_type = "t3.small"
    ami_id = "ami-0f8a61b66d1accaee"
  }