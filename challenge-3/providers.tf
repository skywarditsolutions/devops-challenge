################################
## Providers
################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.21.0"
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