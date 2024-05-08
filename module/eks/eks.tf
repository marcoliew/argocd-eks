module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.4"

  cluster_name                   = "${var.eks_cluster_id}-${var.env}"
  cluster_version                = var.eks_cluster_version
  cluster_endpoint_public_access = true
  
  # Give the Terraform identity admin access to the cluster
  # which will allow resources to be deployed into the cluster
  enable_cluster_creator_admin_permissions = true

  cluster_addons = {
    vpc-cni = {
      before_compute = true
      most_recent    = true
      configuration_values = jsonencode({
        env = {
          ENABLE_POD_ENI                    = "true"
          ENABLE_PREFIX_DELEGATION          = "true"
          POD_SECURITY_GROUP_ENFORCING_MODE = "standard"
        }
        nodeAgent = {
          enablePolicyEventLogs = "true"
        }
        enableNetworkPolicy = "true"
      })
    }
  }

  vpc_id     = data.aws_vpc.eks_vpc.id
  #subnet_ids = values(aws_subnet.eks_subnets)[*].id
  subnet_ids = ["subnet-062db183ebc6af2d9","subnet-0a7f8b9a96e6f383a"]

  create_cluster_security_group = false
  create_node_security_group    = false

  eks_managed_node_groups = {
    default = {
      instance_types       = [var.instance_type]
      force_update_version = true
      release_version      = var.ami_release_version

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      update_config = {
        max_unavailable_percentage = 50
      }

      labels = {
        workshop-default = "yes"
      }
    }
  }

  tags = merge(local.tags, {
    "karpenter.sh/discovery" = var.eks_cluster_id
  })
}

