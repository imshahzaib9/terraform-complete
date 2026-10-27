output "vpc_id" {
  value = aws_vpc.shahzaib-vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.shahzaib-public-subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.shahzaib-private-subnet[*].id
}
