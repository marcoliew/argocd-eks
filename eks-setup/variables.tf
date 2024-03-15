variable "cluster-name" {
  description = "Enter eks cluster name - example like eks-demo, eks-dev etc"
  type        = string
  default     = "argocdprj-eks"
}

variable "name_prefix" {
  description = ""
  type        = string
  default     = "argocdprj-"
}

variable "region" {
  description = ""
  type        = string
  default     = "ap-southeast-2"
}