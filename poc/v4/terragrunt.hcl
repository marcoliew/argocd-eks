locals {
  tfc_hostname     = "app.terraform.io" # For TFE, substitute the custom hostname for your TFE host
  tfc_organization = "usydstaging"
  resource         = reverse(split("/", get_terragrunt_dir()))[0] # This will find the name of the module, such as "vpc"
  env              = reverse(split("/", get_terragrunt_dir()))[1] # This will find the name of the module, such as "dev"
  version          = reverse(split("/", get_terragrunt_dir()))[2] # This will find the name of the module, such as "poc"
  prj              = "argocdprj"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "aws" {
    region = "ap-southeast-2"
}

terraform {

  cloud {
    organization = "${local.tfc_organization}"

    workspaces {
      project = "${local.prj}"
      name = "${local.version}-${local.resource}-${local.env}"
    }
  }

}

EOF
}
