# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "agentic-commerce-prod-eks-node-role/arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
	to = aws_iam_role_policy_attachment.attachment_role_agentic-commerce-prod-eks-node-role_AmazonEKSWorkerNodePolicy
}

resource "aws_iam_role_policy_attachment" "attachment_role_agentic-commerce-prod-eks-node-role_AmazonEKSWorkerNodePolicy" {
	role       = "agentic-commerce-prod-eks-node-role"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}
