resource "aws_vpc" "shahzaib-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  instance_tenancy = "default"

  tags = {
    Name = "shahzaib-vpc-${var.environment}"
  }
}

resource "aws_subnet" "shahzaib-public-subnet" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.shahzaib-vpc.id # - Interpolation of VPC ID from the aws_vpc resource.
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = var.availability_zone[count.index]

  tags = {
    Name = "shahzaib-public-subnet-${var.environment}"
  }
}

resource "aws_subnet" "shahzaib-private-subnet" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.shahzaib-vpc.id # - Interpolation of VPC ID from the aws_vpc resource.
    cidr_block = var.private_subnet_cidr[count.index]
    availability_zone = var.availability_zone[count.index]

  tags = {
    Name = "shahzaib-private-subnet-${var.environment}"
  }
}

resource "aws_internet_gateway" "shahzaib-igw" {
  vpc_id = aws_vpc.shahzaib-vpc.id # - Interpolation of VPC ID from the aws_vpc resource.

  tags = {
    Name = "shahzaib-igw-${var.environment}"
  }
}

resource "aws_route_table" "shahzaib-public-rt" {
  vpc_id = aws_vpc.shahzaib-vpc.id # - Interpolation of VPC ID from the aws_vpc resource.

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shahzaib-igw.id # - Interpolation of Internet Gateway ID from the aws_internet_gateway resource.
  }
}

resource "aws_route_table_association" "shahzaib-public-rt-association" {
    count = length(aws_subnet.shahzaib-public-subnet)
    subnet_id = aws_subnet.shahzaib-public-subnet[count.index].id # - Interpolation of Subnet ID from the aws_subnet resource.
    route_table_id = aws_route_table.shahzaib-public-rt.id # - Interpolation of Route Table ID from the aws_route_table resource.
}

resource "aws_route_table" "shahzaib-private-rt" {
    vpc_id = aws_vpc.shahzaib-vpc.id # - Interpolation of VPC ID from the aws_vpc resource.
}

resource "aws_route_table_association" "shahzaib-private-rt-association" {
    count          = length(aws_subnet.shahzaib-private-subnet)
    subnet_id = aws_subnet.shahzaib-private-subnet[count.index].id # - Interpolation of Subnet ID from the aws_subnet resource.
    route_table_id = aws_route_table.shahzaib-private-rt.id # - Interpolation of Route Table ID from the aws_route_table resource.
}
