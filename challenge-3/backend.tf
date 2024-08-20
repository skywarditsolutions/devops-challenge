terraform {
  backend "s3" {
    bucket         = "wac.terraform.state"
    key            = "challenge-api.tfstate"
    region         = "us-east-2"
    dynamodb_table = "wac.terraform.state"
    encrypt        = true
  }
}