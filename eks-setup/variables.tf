variable "cluster-name" {
  description = "Enter eks cluster name - example like eks-demo, eks-dev etc"
  type        = string
  default     = "demo"
}

variable "name_prefix" {
  description = ""
  type        = string
  default     = "argocdprj-"
}

