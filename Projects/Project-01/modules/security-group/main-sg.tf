resource "aws_security_group" "sg-for-alb" {
  name        = "${var.environment}-sg-for-alb"
  description = "Security group for ALB"

  vpc_id = var.vpc_id # - Interpolation of VPC ID from the aws_vpc resource.

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.environment}-sg-for-alb"
    }
}

resource "aws_security_group" "sg-for-ecs" {
  name        = "${var.environment}-sg-for-ecs"
  description = "Security group for ECS"

  vpc_id = var.vpc_id # - Interpolation of VPC ID from the aws_vpc resource.

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.environment}-sg-for-ecs"
    }
}
