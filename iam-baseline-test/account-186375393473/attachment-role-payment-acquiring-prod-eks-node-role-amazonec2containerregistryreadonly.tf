# First-time adoption: import the pre-existing attachment into
# Terraform state, then declare it (Terraform >= 1.5).
import {
	id = "payment-acquiring-prod-eks-node-role/arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
	to = aws_iam_role_policy_attachment.attachment_role_payment-acquiring-prod-eks-node-role_AmazonEC2ContainerRegistryReadOnly
}

resource "aws_iam_role_policy_attachment" "attachment_role_payment-acquiring-prod-eks-node-role_AmazonEC2ContainerRegistryReadOnly" {
	role       = "payment-acquiring-prod-eks-node-role"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
