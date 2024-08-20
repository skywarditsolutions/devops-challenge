################################
## Providers
################################
terraform {
  required_version = ">= 1.9.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

################################
## Provider Configurations
################################
provider "aws" {
  region = local.aws_region
  default_tags {
    tags = {
      application = local.system
      stack       = local.environment
      note        = "Managed by Terraform"
    }
  }
}