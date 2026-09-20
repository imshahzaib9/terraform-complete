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
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my-test-key.key_name
  subnet_id     = aws_default_subnet.my-default-subnet.id
  vpc_security_group_ids = [data.aws_security_group.my-custom-sg.id]

  root_block_device {
    volume_size = var.aws_volume_size
    volume_type = var.aws_volume_type
  }

  tags = {
    Name = "My-Test-EC2-Instance"
  }
}
