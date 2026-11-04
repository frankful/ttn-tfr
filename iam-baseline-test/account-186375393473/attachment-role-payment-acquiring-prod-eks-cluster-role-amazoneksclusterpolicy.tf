# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-eks-cluster-role/arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_payment-acquiring-prod-eks-cluster-role_AmazonEKSClusterPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_payment-acquiring-prod-eks-cluster-role_AmazonEKSClusterPolicy" {
	role       = "payment-acquiring-prod-eks-cluster-role"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
