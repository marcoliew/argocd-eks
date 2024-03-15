resource "aws_iam_role" "eks-role" {
  name = "${var.name_prefix}eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# resource "aws_iam_role_policy_attachment" "eks-AmazonEKSClusterPolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.argocdprj-eks-role.name
# }

# resource "aws_iam_role" "nodes-role" {
#   name = "${var.name_prefix}eks-nodes-role"

#   assume_role_policy = jsonencode({
#     Statement = [{
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Principal = {
#         Service = "ec2.amazonaws.com"
#       }
#     }]
#     Version = "2012-10-17"
#   })
# }

# resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = aws_iam_role.nodes-role.name
# }

# resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.nodes-role.name
# }

# resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = aws_iam_role.nodes-role.name
# }
# resource "aws_eks_cluster" "argocdprj_eks" {
#   name     = var.cluster-name
#   role_arn = aws_iam_role.eks-role.arn

#   vpc_config {
#     subnet_ids = [
#       aws_subnet.private-ap-southeast-2a.id,
#       aws_subnet.private-ap-southeast-2b.id,
#       aws_subnet.public-ap-southeast-2a.id,
#       aws_subnet.public-ap-southeast-2b.id
#     ]
#     endpoint_private_access = false
#     endpoint_public_access = true
#   }

#   depends_on = [aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy]
# }


# resource "aws_eks_node_group" "private-nodes" {
#   cluster_name    = aws_eks_cluster.argocdprj_eks.name
#   node_group_name = "${var.name_prefix}private-nodes"
#   node_role_arn   = aws_iam_role.nodes-role.arn

#   subnet_ids = [
#     aws_subnet.private-ap-southeast-2a.id,
#     aws_subnet.private-ap-southeast-2b.id
#   ]

#   capacity_type  = "ON_DEMAND"
#   instance_types = ["t3.small"]

#   scaling_config {
#     desired_size = 1
#     max_size     = 5
#     min_size     = 0
#   }

#   update_config {
#     max_unavailable = 1
#   }

#   labels = {
#     role = "general"
#   }


#   depends_on = [
#     aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
#   ]
# }
