terraform {
  source = "github.com/marcoliew/argocd-tf-modules//vpc?ref=vpconly"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  env             = include.env.locals.env
  app_name        = "tgdemo1"
  azs             = ["ap-southeast-2a", "ap-southeast-2b"]
  private_subnets = ["172.20.0.0/19", "172.20.32.0/19"]
  public_subnets  = ["172.20.64.0/19", "172.20.96.0/19"]

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/dev-demo"  = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"         = 1
    "kubernetes.io/cluster/dev-demo" = "owned"
  }
}

