terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }

  backend "local" {}
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "homelab"
      Environment = var.environment
      ManagedBy   = "opentofu"
      Repository  = "ponack/homelab-infra"
    }
  }
}
