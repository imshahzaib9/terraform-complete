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
  
  #this is a meta argument that allows you to create multiple instances of the same resource. In this case, we are creating 2 EC2 instances.
  #count = 2

  #for_each meta argument allows you to create multiple instances of the same resource using a map or set of strings. In this case, we are creating 2 EC2 instances with different names and instance types.
  for_each = tomap({
    Shahzaib-01 = "t3.small",
    Shahzaib-02 = "t3.small"
  })

  ami           = var.ami_id
  #instance_type = var.instance_type
  instance_type = each.value
  key_name      = aws_key_pair.my-test-key.key_name
  subnet_id     = aws_default_subnet.my-default-subnet.id
  vpc_security_group_ids = [data.aws_security_group.my-custom-sg.id]

  root_block_device {
    volume_size = var.aws_volume_size
    volume_type = var.aws_volume_type
  }

  user_data = file("install-script.sh")

  #Depends_on meta argument is used to specify that the creation of this resource depends on the creation of another resource. In this case, we are specifying that the creation of the EC2 instance depends on the creation of the key pair.
  depends_on = [ aws_key_pair.my-test-key ]

  tags = {
    #Name = "My-Test-EC2-Instance"
    Name = each.key
  }
}
