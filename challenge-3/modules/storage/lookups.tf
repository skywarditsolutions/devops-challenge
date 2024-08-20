data "aws_vpc" "system" {
  filter {
    name = "tag:Name"
    values = ["${var.system}-${var.environment}"]
  }
}