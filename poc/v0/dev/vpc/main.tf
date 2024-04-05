provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  backend "local" {
    path = "poc/v1/dev/vpc/terraform.tfstate"
  }
}

module "vpc" {
  #source = "../../../../module/vpc"
  source = "github.com/marcoliew/argocd-tf-modules//vpc?ref=vpconly"
  #source = "git@github.com:marcoliew/argocd-tf-modules.git?ref=vpconly"
  #source = "git::https://github.com/marcoliew/_git/argocd-tf-modules//vpc" #?ref=vpconly"
  

  env             = "dev"
  app_name        = "pocdemo"
  azs             = ["ap-southeast-2a", "ap-southeast-2b"]
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/dev-demo"  = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"         = 1
    "kubernetes.io/cluster/dev-demo" = "owned"
  }
}
