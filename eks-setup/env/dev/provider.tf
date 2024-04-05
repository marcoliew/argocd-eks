provider "aws" {
  region = "ap-southeast-2"
  #profile = "staging"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.62"
    }
  }
  cloud {
    organization = "usydstaging"

    workspaces {
      name = "argocd_eks_dev"
    }
  }

}
