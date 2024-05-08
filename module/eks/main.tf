locals {

  region = "ap-southeast-2"

  tags = {
    created-by = "aux-v2"
    env        = var.eks_cluster_id
  }
}

# locals {
#   tags = {
#     created-by = "eks-workshop-v2"
#   }
# }

# data "aws_availability_zones" "available" {
#   state = "available"
# }

# locals {
# private_subnets = [for k, v in local.azs : cidrsubnet("172.16.0.0/16", 3, k + 4)]
#     azs             = slice(data.aws_availability_zones.available.names, 0, 2)
# }

