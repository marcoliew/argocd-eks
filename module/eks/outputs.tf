# output "environment_variables" {
#   description = "Environment variables to be added to the IDE shell"
#   value = {
#     EBS_CSI_ADDON_ROLE = module.ebs_csi_driver_irsa.iam_role_arn
#   }
# }

# ############################################################################################################
# # EKS Add-On - EBS CSI Driver
# ############################################################################################################
# output "eks_cluster_ebs_addon_arn" {
#   description = "Amazon Resource Name (ARN) of the EKS add-on"
#   value       = aws_eks_addon.eks_cluster_ebs_csi_addon.arn
# }
# output "eks_cluster_ebs_addon_id" {
#   description = "EKS Cluster name and EKS Addon name"
#   value       = aws_eks_addon.eks_cluster_ebs_csi_addon.id
# }
# output "eks_cluster_ebs_addon_time" {
#   description = "Date and time in RFC3339 format that the EKS add-on was created"
#   value       = aws_eks_addon.eks_cluster_ebs_csi_addon.created_at
# }

# output "subnets_ids" {
#   description = "Date and time in RFC3339 format that the EKS add-on was created"
#   value       = values(aws_subnet.eks_subnets)[*].id
# }

# output "subnets_cidr" {
#   description = "Date and time in RFC3339 format that the EKS add-on was created"
#   value       = local.subnet_cidr
# }