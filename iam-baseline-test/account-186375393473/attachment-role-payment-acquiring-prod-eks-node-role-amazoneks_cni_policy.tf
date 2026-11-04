# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-eks-node-role/arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
	to = aws_iam_role_policy_attachment.attachment_role_payment-acquiring-prod-eks-node-role_AmazonEKS_CNI_Policy
}

resource "aws_iam_role_policy_attachment" "attachment_role_payment-acquiring-prod-eks-node-role_AmazonEKS_CNI_Policy" {
	role       = "payment-acquiring-prod-eks-node-role"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
