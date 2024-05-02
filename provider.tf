provider "aws" {
  region = var.region
  profile = "user-2"

  default_tags {
    tags = {
      Project     = var.project
      Environment = var.environment
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}
