module "eks_blueprints_addons" {
    source  = "aws-ia/eks-blueprints-addons/aws"
    version = "1.16.2"

    enable_aws_load_balancer_controller = true
    aws_load_balancer_controller = {

        set = [{
        name  = "enableServiceMutatorWebhook"
        value = "false"
        }]        
        # wait = true
        # # set = [{
        # #   name  = "enableServiceMutatorWebhook"
        # #   value = "false"
        # # }]    
    }

    eks_addons = {
        aws-ebs-csi-driver = {
            most_recent = true
            service_account_role_arn = module.ebs_csi_driver_irsa.iam_role_arn
        }
        # aws-efs-csi-driver = {
        #     most_recent = true
        #     #service_account_role_arn = module.efs_csi_driver_irsa.iam_role_arn
        # }        
        coredns = {
        most_recent = true
        }
        kube-proxy = {
        most_recent = true
        }
    }

    #enable_aws_efs_csi_driver                    = true
    #enable_aws_fsx_csi_driver                    = true
    #enable_cluster_proportional_autoscaler = true
    enable_karpenter                       = true
    #enable_kube_prometheus_stack           = true
    enable_metrics_server                  = true
    #enable_external_dns                    = true
    #enable_cert_manager                    = true  
    enable_argocd                                = true
    enable_cluster_autoscaler                    = true

    cluster_name      = module.eks.cluster_name
    cluster_endpoint  = module.eks.cluster_endpoint
    cluster_version   = module.eks.cluster_version
    oidc_provider_arn = module.eks.oidc_provider_arn
}

module "ebs_csi_driver_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.39.0"

  role_name_prefix = "${var.eks_cluster_id}-ebs-csi-"

  attach_ebs_csi_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:ebs-csi-controller-sa"]
    }
  }

  tags = local.tags
}

# module "efs_csi_driver_irsa" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
#   version = "5.39.0"

#   role_name_prefix = "${var.eks_cluster_id}-efs-csi-"

#   attach_efs_csi_policy = true

#   oidc_providers = {
#     main = {
#       provider_arn               = module.eks.oidc_provider_arn
#       namespace_service_accounts = ["kube-system:efs-csi-controller-sa"]
#     }
#   }

#   tags = local.tags
# }

# # Reference: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon
# # Resource: EBS CSI Driver AddOn EKS Add-Ons (aws_eks_addon)
# resource "aws_eks_addon" "eks_cluster_ebs_csi_addon" {
#   cluster_name             = var.eks_cluster_id
#   addon_name               = "aws-ebs-csi-driver"
#   #addon_version            = "v1.25.0-eksbuild.1"
#   service_account_role_arn = module.ebs_csi_driver_irsa.iam_role_arn
#   depends_on = [
#     module.ebs_csi_driver_irsa
#   ]
#   tags = {
#     tag-key = "${var.eks_cluster_id}-ebs-csi-addon"
#   }
# }

# resource "aws_eks_addon" "eks_cluster_efs_csi_addon" {
#   cluster_name             = var.eks_cluster_id
#   addon_name               = "aws-efs-csi-driver"
#   #addon_version            = "v1.25.0-eksbuild.1"
#   service_account_role_arn = module.efs_csi_driver_irsa.iam_role_arn
#   depends_on = [
#     module.efs_csi_driver_irsa
#   ]
#   tags = {
#     tag-key = "${var.eks_cluster_id}-efs-csi-addon"
#   }
# }

# module "iam_assumable_role_lattice" {
#   source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
#   version                       = "5.39.0"
#   create_role                   = true
#   role_name                     = "${var.eks_cluster_id}-lattice"
#   provider_url                  = var.eks_oidc_issuer_url
#   role_policy_arns              = [aws_iam_policy.lattice.arn]
#   oidc_fully_qualified_subjects = ["system:serviceaccount:gateway-api-controller:gateway-api-controller"]

#   #tags = var.tags
# }

# resource "aws_iam_policy" "lattice" {
#   name        = "${var.eks_cluster_id}-lattice"
#   path        = "/"
#   description = "Policy for Lattice controller"

#   policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "vpc-lattice:*",
#                 "iam:CreateServiceLinkedRole",
#                 "ec2:DescribeVpcs",
#                 "ec2:DescribeSubnets",
#                 "ec2:DescribeTags",
#                 "ec2:DescribeSecurityGroups",
#                 "logs:CreateLogDelivery",
#                 "logs:GetLogDelivery",
#                 "logs:UpdateLogDelivery",
#                 "logs:DeleteLogDelivery",
#                 "logs:ListLogDeliveries",
#                 "tag:GetResources"
#             ],
#             "Resource": "*"
#         }
#     ]
# }
# EOF

# }