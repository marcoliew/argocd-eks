# tflint-ignore: terraform_unused_declarations
variable "eks_cluster_id" {
  description = "EKS cluster name"
  type        = string
}

variable "env" {
  description = "environment"
  type        = string
}

variable "ami_release_version" {
  description = "EKS node group ami version"
  type        = string
}

variable "eks_vpc_id" {
  description = "EKS vpc id"
  type        = string
}

variable "instance_type" {
  description = "node group instance type"
  type        = string
}


# tflint-ignore: terraform_unused_declarations
variable "eks_cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  type        = string
}

# # tflint-ignore: terraform_unused_declarations
# variable "cluster_security_group_id" {
#   description = "EKS cluster security group ID"
#   type        = any
# }

# # tflint-ignore: terraform_unused_declarations
# variable "addon_context" {
#   description = "Addon context that can be passed directly to blueprints addon modules"
#   type        = any
# }

# tflint-ignore: terraform_unused_declarations
# variable "tags" {
#   description = "Tags to apply to AWS resources"
#   type        = any
# }

# # tflint-ignore: terraform_unused_declarations
# variable "resources_precreated" {
#   description = "Have expensive resources been created already"
#   type        = bool
# }

# variable "eks_oidc_provider_arn" {
#   description = ""
#   type        = string
# }

variable "eks_oidc_issuer_url" {
  description = ""
  type        = string
}

variable "min_size" {
  description = ""
  type        = number
}

variable "desired_size" {
  description = ""
  type        = number
}

variable "max_size" {
  description = ""
  type        = number
}
