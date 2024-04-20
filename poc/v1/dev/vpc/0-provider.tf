provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  required_version = ">= 1.0"

  backend "local" {
    path = "poc/v1/dev/vpc/terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.62"
    }
  }
}
