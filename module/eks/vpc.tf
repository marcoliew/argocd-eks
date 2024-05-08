
locals {
    subnet_cidr = [for k, v in local.azs : cidrsubnet("172.16.0.0/16", 3, k + 4)]
    azs             = slice(data.aws_availability_zones.available.names, 0, 2)
}


data "aws_vpc" "eks_vpc" {
  id = var.eks_vpc_id
}

# resource "aws_subnet" "eks_subnets" {
#   for_each = toset(local.azs)

#   vpc_id            = data.aws_vpc.eks_vpc.id
#   availability_zone = each.value
#   cidr_block        = local.subnet_cidr[index(local.azs, each.value)]
# }


data "aws_availability_zones" "available" {
  state = "available"
}
