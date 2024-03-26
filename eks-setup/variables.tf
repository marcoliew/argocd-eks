variable "cluster-name" {
  description = "Enter eks cluster name - example like eks-demo, eks-dev etc"
  type        = string
  default     = "argocdprj-eks"
}

variable "env" {
  description = ""
  type        = string
  default     = "dev"
}

variable "vpc_cidr_block" {
  default     = "172.16.0.0/16"
  type        = string
  description = "CIDR"

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