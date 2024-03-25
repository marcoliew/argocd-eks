provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.56"
    }
  }
  cloud {
    organization = "usydstaging"

    workspaces {
      name = "argocd_eks"
    }
  }

}
