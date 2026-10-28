# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-eks-cluster-role/arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
	to = aws_iam_role_policy_attachment.attachment_role_agentic-commerce-prod-eks-cluster-role_AmazonEKSClusterPolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_agentic-commerce-prod-eks-cluster-role_AmazonEKSClusterPolicy" {
	role       = "agentic-commerce-prod-eks-cluster-role"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
