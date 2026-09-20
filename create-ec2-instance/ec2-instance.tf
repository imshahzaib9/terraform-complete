resource "aws_key_pair" "my-test-key" {
  key_name   = "my-test-key"
  public_key = file("my-test-key.pub")
  
}

resource "aws_default_vpc" "my-default-vpc" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "my-default-subnet" {
  availability_zone = "us-east-1a"
  tags = {
    Name = "Default Subnet"
  }
}

data "aws_security_group" "my-custom-sg" {
  id = "sg-0068649ecc3f27943"
}

resource "aws_instance" "my-ec2-instance" {
  ami           = "ami-0f8a61b66d1accaee"
  instance_type = "t3.small"
  key_name      = aws_key_pair.my-test-key.key_name
  subnet_id     = aws_default_subnet.my-default-subnet.id
  vpc_security_group_ids = [data.aws_security_group.my-custom-sg.id]

  tags = {
    Name = "My-Test-EC2-Instance"
  }
}
