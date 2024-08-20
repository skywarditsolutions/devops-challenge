data "aws_vpc" "system" {
  filter {
    name = "tag:Name"
    values = ["${var.system}-${var.environment}"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
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

data "aws_security_group" "ec2" {
  filter {
    name = "tag:Name"
    values = ["${var.system}-${var.environment}-ec2"]
  }
}