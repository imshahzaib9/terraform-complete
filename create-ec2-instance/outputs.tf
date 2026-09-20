output "ec2_public_ip" {
  value = aws_instance.my-ec2-instance.public_ip
}

output "ec2_private_ip" {
  value = aws_instance.my-ec2-instance.private_ip
}

output "public_dns" {
  value = aws_instance.my-ec2-instance.public_dns
}

output "private_dns" {
  value = aws_instance.my-ec2-instance.private_dns
}

output "hostname_type" {
  value = aws_instance.my-ec2-instance.instance_type
}
