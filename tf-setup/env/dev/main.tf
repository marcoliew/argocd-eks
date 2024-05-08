module "eks" {
  source  = "../module/eks"

  env = var.dev
  #eks_oidc_issuer_url = "oidc.eks.ap-southeast-2.amazonaws.com/id/CEE8234F9D64DDDA7CB139DD20B74EDA"
  eks_cluster_id = var.eks_cluster_id
  eks_cluster_version = var.eks_cluster_version
  eks_vpc_id = var.eks_vpc_id
  instance_type = var.instance_type
  min_size     = 2
  max_size     = 5
  desired_size = 2

}
