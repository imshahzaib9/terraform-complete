output "ec2_public_ip" {
  #This output is used witht he count meta argument. It will return a list of public IPs for all the instances created using the count meta argument.
  #value = aws_instance.my-ec2-instance[*].public_ip
  
  #value = aws_instance.my-ec2-instance.public_ip

  #This output is used with the for_each meta argument. It will return a list of public IPs for all the instances created using the for_each meta argument.
  value = [
    for instance in aws_instance.my-ec2-instance : instance.public_ip
    ]
}

output "ec2_private_ip" {
  #value = aws_instance.my-ec2-instance[*].private_ip
  #value = aws_instance.my-ec2-instance.private_ip
  
  value = [
    for instance in aws_instance.my-ec2-instance : instance.private_ip
    ]
}

output "public_dns" {
  #value = aws_instance.my-ec2-instance[*].public_dns
  #value = aws_instance.my-ec2-instance.public_dns

  value = [
    for instance in aws_instance.my-ec2-instance : instance.public_dns
    ]
}

output "private_dns" {
  #value = aws_instance.my-ec2-instance[*].private_dns
  #value = aws_instance.my-ec2-instance.private_dns

  value = [
    for instance in aws_instance.my-ec2-instance : instance.private_dns
    ]
}

output "hostname_type" {
  #value = aws_instance.my-ec2-instance[*].instance_type
  #value = aws_instance.my-ec2-instance.instance_type

  value = [
    for instance in aws_instance.my-ec2-instance : instance.instance_type
    ]
}
