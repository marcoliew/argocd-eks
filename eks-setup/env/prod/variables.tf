variable "cluster-name" {
  description = "Enter eks cluster name - example like eks-demo, eks-dev etc"
  type        = string
  default     = "argocdprj-eks"
}

variable "env" {
  description = ""
  type        = string
  default     = "prod"
}

variable "vpc_cidr_block" {
  default     = "172.26.0.0/16"
  type        = string
  description = "CIDR"

}

variable "app_name" {
  description = ""
  type        = string
  default     = "argocdprj-"
}

variable "region" {
  description = ""
  type        = string
  default     = "ap-southeast-2"
}