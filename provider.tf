provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = var.project
      Environment = var.environment
    }
  }
  access_key = "AKIAZQ3DSO5PSWNFK5XE"
  secret_key = "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"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}