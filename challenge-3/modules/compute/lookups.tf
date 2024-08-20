data "aws_vpc" "system" {
  filter {
    name   = "tag:Name"
    values = ["${var.system}-${var.environment}"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.system.id]
  }

  filter {
    name   = "tag:type"
    values = ["private"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_security_group" "alb" {
  filter {
    name   = "tag:Name"
    values = ["${var.system}-${var.environment}-alb"]
  }
}

data "aws_lb_target_group" "myapp" {
  name = "${var.system}-${var.environment}-myapp"
}