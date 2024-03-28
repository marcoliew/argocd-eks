provider "aws" {
  region = "ap-southeast-2"
  #profile = "staging"
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.56"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9"
    }
  }
  cloud {
    organization = "usydstaging"

    workspaces {
      name = "argocd_eks"
    }
  }

}
